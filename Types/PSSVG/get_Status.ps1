<#
.SYNOPSIS
    Gets the status
.DESCRIPTION
    Gets the cached status.    
#>
if ($this.'.LastStatus') {
    return $this.'.LastStatus'
} else {
    return $null
}
