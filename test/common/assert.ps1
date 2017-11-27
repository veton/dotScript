Write-Host "Verifying syntax..." -Foreground "DarkGray"
Invoke-Shell tsc $global:TargetScript --noEmit --moduleResolution Classic

Write-Host "Verifying expected fragments..." -Foreground "DarkGray"
$generatedFile = Get-Content $global:TargetScript -Raw
Get-Content "$PsScriptRoot\expected.txt" | % {
    if ($_.StartsWith('!')) {
        $regex = $_.Substring(1)
        if ($generatedFile -Match $regex) {
            throw "Fragment expected to be missing: $regex"
        }
    }
    else {
        if ($generatedFile -NotMatch $_) {
            throw "Expected fragment missing: $_"
        }

    }
}
