function Convert-Class([Type] $type) {
    $modifiers = "";   
    if ($type.IsAbstract) {
        $modifiers += "abstract "
    }

    $baseType = Get-TypeName $type.BaseType
    if ($baseType) {
        $extends = "extends $baseType "
    }
    else {
        $extends = ""
    }

    $interfaceNames = (Get-OwnInterfaceNames $type)
    if ($interfaceNames) {
        $implements = "implements $($interfaceNames -join ', ') "
    }
    else {
        $implements = ""
    }

    return "export $($modifiers)class $(Get-TypeName $type) $extends$implements{
$((Get-BodyFields $type) -Join "`n")
$((Get-BodyProperties $type) -Join "`n")
$((Get-BodyIndexers $type) -Join "`n")
}";
}
