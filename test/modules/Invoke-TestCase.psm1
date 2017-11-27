function Invoke-TestCase($testCase) {
    Clear-Sandbox
    Write-Host "Testing: $testCase" -Foreground "Gray"
    
    Initialize-Sandbox $testCase
    & "$global:SandboxDir\arrange.ps1"            
    & "$global:SandboxDir\act.ps1"
    & "$global:SandboxDir\assert.ps1"
    
    Write-Host "Passed: $testCase" -Foreground "Green"
}
