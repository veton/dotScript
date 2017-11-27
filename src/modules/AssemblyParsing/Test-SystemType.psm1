function Test-SystemType([Type] $type) {
    $type.Namespace -and $type.Namespace.StartsWith("System")
}