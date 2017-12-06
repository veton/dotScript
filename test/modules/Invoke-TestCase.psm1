function Invoke-TestCase($testCase) {
    Clear-Sandbox
    
    Write-Host "Testing: $testCase" -Foreground "Gray"
    Initialize-Sandbox $testCase

    & "$global:SandboxDir\arrange.ps1"
    if ($global:LastExitCode) { throw "Command failed with code $global:LastExitCode" }

    & "$global:SandboxDir\act.ps1"
    if ($global:LastExitCode) { throw "Command failed with code $global:LastExitCode" }

    & "$global:SandboxDir\assert.ps1"
    if ($global:LastExitCode) { throw "Command failed with code $global:LastExitCode" }
    
    Write-Host "Passed: $testCase" -Foreground "Green"
}
