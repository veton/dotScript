function Invoke-Shell($command) {
    $args = $args | %{ $_ }

    Write-Host "$command $args" -Foreground "DarkBlue"
    & $command $args
    if ($global:LastExitCode) { throw "Command failed with code $global:LastExitCode" }
}