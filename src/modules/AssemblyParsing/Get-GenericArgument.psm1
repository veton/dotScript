function Get-GenericArgument([Type] $type) {
    if ($type.IsGenericType) {
        return $type.GenericTypeArguments[0];
    }
    else {
        return [Object]
    }
}
