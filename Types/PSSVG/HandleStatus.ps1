param($statusValue)

$StatusHandler = $this."$statusValue"
if ($StatusHandler -is [ScriptBlock]) {
    & $StatusHandler
} 
elseif ($statusHandler -is [Management.Automation.PSMethodInfo]) {
    $statusHandler.Invoke()
}
elseif ($StatusHandler.OuterXml) {
    $StatusHandler.OuterXml
} else {
    $StatusHandler
}



