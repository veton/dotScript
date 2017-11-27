function Convert-Interface([Type] $type) {
    $interfaceNames = (Get-OwnInterfaceNames $type)
    if ($interfaceNames) {
        $extends = "extends $($interfaceNames -join ', ') "
    }
    else {
        $extends = ""
    }

    "export interface $(Get-TypeName $type) $extends{
$((Get-BodyProperties $type) -Join "`n")
$((Get-BodyIndexers $type) -Join "`n")
$((Get-BodyMethods $type) -Join "`n")
}"
}