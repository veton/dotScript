$global:BindingFlags = `
    [Reflection.BindingFlags]::Public -bor `
    [Reflection.BindingFlags]::DeclaredOnly -bor `
    [Reflection.BindingFlags]::Static -bor `
    [Reflection.BindingFlags]::Instance

$global:SupportedIndexTypes = @(
    "string",
    "number")