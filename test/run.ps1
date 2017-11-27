$global:TestCasesDir = "$PsScriptRoot\test-cases"
$global:CommonDir = "$PsScriptRoot\common"
$global:SandboxDir = "$PsScriptRoot\sandbox"
$global:Platforms = @(
    "netstandard2.0"
    "net47"
)

$ErrorActionPreference = "Stop"
Get-ChildItem "$PSScriptRoot\modules\*.psm1" -Recurse | Import-Module
Get-ChildItem "$PSScriptRoot\..\src\modules\Utilities\*.psm1" -Recurse | Import-Module

if ($args) {
    $TestCases = $args
}
else {
    $TestCases = Get-TestCases
}

$failedTestsCount = 0
foreach ($global:Platform in $global:Platforms) {    
    $global:TargetDir = "$global:SandboxDir\TestAssembly\bin\Debug\$global:Platform"
    $global:TargetAssembly = "$global:TargetDir\TestSolution.TestAssembly.dll"
    $global:TargetScript = "$global:TargetDir\TestSolution.TestAssembly.ts"

    Write-Host "Testing platform '$global:Platform'" -Foreground "Yellow"
    Write-Host
    
    foreach ($testCase in $testCases) {
        try {
            Invoke-TestCase $testCase
        }
        catch {
            Write-ErrorDetails $_
            Write-Host "Failed: $testCase" -Foreground "Red"
            $failedTestsCount++
        }
        Write-Host
    }
}

Clear-Sandbox
exit $failedTestsCount
