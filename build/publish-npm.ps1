Import-Module "$PSScriptRoot/publish-common.psm1"
$PackageName = "dotscript"
$SpecPath = "$global:BuildDir/package.json"
$PackageFile = "$PackageName-$global:PackageVersion.tgz"
$PackagePath = "$global:ArtifactsDir/$PackageFile"

if (-not $Env:NpmToken) {
    Write-Host "Environment variable NpmToken is not defined"
    exit 1
}

Copy-Artifacts $SpecPath

Write-Host "Creating npm package $PackageName@$global:PackageVersion..."
Push-Location $global:TempDir
& npm version $global:PackageVersion --allow-same-version
& npm pack
Pop-Location
if ($global:LastExitCode) { exit $global:LastExitCode }

Move-Item "$global:TempDir/$PackageFile" $global:ArtifactsDir -Force
Remove-Item $global:TempDir -Recurse -Force

Write-Host "Pushing package to npmjs.com..."
& npm config set "//registry.npmjs.org/:_authToken" $Env:NpmToken
& npm publish $PackagePath
if ($global:LastExitCode) { exit $global:LastExitCode }
