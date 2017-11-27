function Get-MemberName([string] $memberName) {
    return $memberName.Substring(0, 1).ToLower() + $memberName.Substring(1);
}
