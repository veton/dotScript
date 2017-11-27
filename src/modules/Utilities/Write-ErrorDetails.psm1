function Write-ErrorDetails($error) {
    Write-Host $error -Foreground "Red"
    Write-Host $error.ScriptStackTrace -Foreground "DarkGray"
}