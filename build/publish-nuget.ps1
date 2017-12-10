Import-Module "$PSScriptRoot/publish-common.psm1"
$PackageName = "dotScript"
$SpecPath = "$global:BuildDir/package.nuspec"
$PackagePath = "$global:ArtifactsDir/$PackageName.$global:PackageVersion.nupkg"
$RepoUrl = "https://www.nuget.org/api/v2/package"

if (-not $Env:NugetKey) {
    Write-Host "Environment variable NugetKey is not defined"
    exit 1
}

Copy-Artifacts $SpecPath

Write-Host "Creating NuGet package $PackageName@$global:PackageVersion..."
& nuget pack `
    "$global:TempDir/package.nuspec" `
    -Version $global:PackageVersion `
    -OutputDirectory $global:ArtifactsDir `
    -NoPackageAnalysis
if ($global:LastExitCode) { exit $global:LastExitCode }

Write-Host "Pushing package to nuget.org..."
$PackagePath = Get-Item $PackagePath | Resolve-Path -Relative
& dotnet nuget push `
    $PackagePath `
    --source $RepoUrl `
    --api-key $Env:NugetKey
if ($global:LastExitCode) { exit $global:LastExitCode }

Remove-Item $global:TempDir -Recurse -Force
Write-Host Done
