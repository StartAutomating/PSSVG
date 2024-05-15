param($statusValue)

$StatusHandler = $this."$statusValue"
if ($StatusHandler -is [ScriptBlock]) {
    & $StatusHandler
} elseif ($StatusHandler -is [xml]) {
    $StatusCodeHandler.OuterXml
}



