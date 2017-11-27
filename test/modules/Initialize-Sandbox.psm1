
function Initialize-Sandbox($testCase) {
    Write-Host "Initializing sandbox..." -Foreground "DarkGray"
    New-Item $global:SandboxDir -ItemType Directory | Out-Null
    Copy-Item "$global:CommonDir\*" $global:SandboxDir -Recurse -Force
    Copy-Item "$global:TestCasesDir\$testCase\*" $global:SandboxDir -Recurse -Force
}
