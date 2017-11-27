function Get-MemberModifiers([System.Reflection.MemberInfo] $memberInfo) {
    $modifiers = "";

    $isInClass = $memberInfo.DeclaringType.IsClass -or $memberInfo.DeclaringType.IsValueType
    $isProperty = $memberInfo.MemberType -eq [System.Reflection.MemberTypes]::Property
    $isIndexer = $memberInfo.GetIndexParameters -and $memberInfo.GetIndexParameters()
    if ($memberInfo.GetGetMethod) { $propertyGetter = $memberInfo.GetGetMethod()}

    if ($isInClass -and (-not $isIndexer)) {
        $modifiers += "public "
    }
    
    $isReadonlyProperty = $propertyGetter -and $propertyGetter.IsStatic
    if ($memberInfo.IsStatic -or $isReadonlyProperty) {
        $modifiers += "static "
    }
    
    $isAbstractMethod = $isInClass -and $memberInfo.IsAbstract
    $isAbstractProperty = $isInClass -and $propertyGetter -and $propertyGetter.IsAbstract
    if ($isAbstractMethod -or $isAbstractProperty) {
        $modifiers += "abstract "
    }

    $isReadonlyField = $memberInfo.IsInitOnly 
    $isReadonlyProperty = $isProperty -and (-not $memberInfo.CanWrite)
    if ($isReadonlyField -or $isReadonlyProperty) {
        $modifiers += "readonly "
    }

    return $modifiers
}