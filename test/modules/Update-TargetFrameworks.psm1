function Update-TargetFrameworks($projectFile) {
    Write-Host "Updating project '$projectFile' to target platforms: $global:Platforms" -Foreground "DarkGray"
    $xml = [xml](Get-Content $projectFile)
    $xml.Project.PropertyGroup.TargetFrameworks = $global:Platforms -Join ';'
    $xml.Save($projectFile)
}
