function Test-BodyIndexerSupported([System.Reflection.PropertyInfo] $property) {
    $params = $property.GetIndexParameters()
    if ($params.Count -ne 1) { return $false }

    $propertyType = (Get-TypeName $params[0].ParameterType)
    return $global:SupportedIndexTypes -contains $propertyType
}
