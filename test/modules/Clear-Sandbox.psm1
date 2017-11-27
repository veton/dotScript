function Clear-Sandbox() {
    if (Test-Path $global:SandboxDir) {
        Remove-Item $global:SandboxDir -Recurse -Force
    }
}
