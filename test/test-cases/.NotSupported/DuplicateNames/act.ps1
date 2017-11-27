Write-Host "Converting to TypeScript..." -Foreground "DarkGray"

$referencedAssembly = "$global:TargetDir\TestSolution.ReferencedAssembly.dll"
$referencedScript = "$global:TargetDir\TestSolution.ReferencedAssembly.ts"

Invoke-Converter `
    $referencedAssembly `
    $referencedScript

Invoke-Converter `
    $global:TargetAssembly  `
    $global:TargetScript `
    -KnownAssemblies "TestSolution.ReferencedAssembly"
