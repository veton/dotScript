$converterScript = "$PsScriptRoot\..\..\src\index.ps1"

# Runs converter in isolated scope
function Invoke-Converter() {
    $args = $args | % { $_ -Join ',' }
    $expression = "$converterScript $args"
    Write-Host $expression -Foreground "DarkBlue"
    Start-Job `
        { Invoke-Expression $input } `
        -Input $expression | `
        Receive-Job -Wait -AutoRemoveJob
}
