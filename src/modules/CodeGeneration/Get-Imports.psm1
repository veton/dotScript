function Get-Imports([Type[]] $types) {
    if (-not $types) { return @() }

    # TODO: Import namespaces
    return $types | ForEach-Object {
        $typeName = (Get-TypeName $_) -Replace '<.*>', ''
        
        if ([System.Threading.Tasks.Task].IsAssignableFrom($_)) {
            $moduleName = 'rxjs';
        }
        else {
            $moduleName = (Get-ModuleName $_)
        }

        return "import { $typeName } from '$moduleName';"
    }
}
