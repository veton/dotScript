function Invoke-Shell($command) {
    $args = $args | %{ $_ }

    Write-Host "$command $args" -Foreground "DarkBlue"
    & $command $args
    if ($LastExitCode) { throw "Command failed with code $LastExitCode" }
}