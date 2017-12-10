Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not $Env:CIRCLE_BUILD_NUM) { $Env:CIRCLE_BUILD_NUM = "0" }
if (-not $Env:CIRCLE_BRANCH -or ($Env:CIRCLE_BRANCH -eq "master")) {
    $VersionSuffix = ""
}
else {
    $VersionSuffix = "-$Env:CIRCLE_BRANCH"
}

$global:RootDir = Resolve-Path "$PSScriptRoot/.."
$global:DistDir = "$global:RootDir/src"
$global:BuildDir = "$global:RootDir/build"
$global:ArtifactsDir = "$global:RootDir/artifacts"
$global:TempDir = "$global:ArtifactsDir/temp"
$global:PackageVersion = "1.0.$($Env:CIRCLE_BUILD_NUM)$VersionSuffix"

function Copy-Artifacts($SpecPath) {
    Write-Host "Collecting artifacts..."
    (Test-Path $global:TempDir) -and (Remove-Item $global:TempDir -Recurse -Force) | Out-Null
    Copy-Item $global:DistDir $global:TempDir -Recurse
    Copy-Item $SpecPath $global:TempDir
}
