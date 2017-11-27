function Get-TypeName([Type] $type) {
    switch ($type) {
        ([Byte]) { return "number" }
        ([SByte]) { return "number" }
        ([Int16]) { return "number" }
        ([UInt16]) { return "number" }
        ([Int32]) { return "number" }
        ([UInt32]) { return "number" }
        ([Int64]) { return "number" }
        ([UInt64]) { return "number" }
        ([Decimal]) { return "number" }
        ([Single]) { return "number" }
        ([Double]) { return "number" }
        ([Boolean]) { return "boolean" }
        ([Char]) { return "string" }
        ([String]) { return "string" }
        ([DateTime]) { return "Date" }
        ([void]) { return "void" }
        ([Object]) { return $null }
    }

    Add-ImportedType $type
    
    $nullable = [Nullable]::GetUnderlyingType($type);
    if ($nullable) {
        return Get-TypeName $nullable
    }

    if ([System.Threading.Tasks.Task].IsAssignableFrom($type)) {
        return "Observable<$(Get-MemberTypeName (Get-GenericArgument $type))>"
    }
    
    if (Test-KnownType $type) {
        if ($type.IsGenericType) {
            return Get-GenericTypeName $type
        }

        return $type.Name
    }

    if ([System.Collections.IEnumerable].IsAssignableFrom($type)) {
        return "$(Get-MemberTypeName (Get-GenericArgument $type))[]"
    }

    return $null
}
