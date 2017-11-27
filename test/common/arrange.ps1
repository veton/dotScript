Write-Host "Building assemblies..." -Foreground "DarkGray"

Get-Item "$PSScriptRoot\*\*.csproj" | ForEach-Object {
    Update-TargetFrameworks $_
    Write-Host "Building project '$_'..." -Foreground "DarkGray"
    Invoke-Shell dotnet build $_
}
