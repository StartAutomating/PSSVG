return @(
    "-OutputPath"
    if ($this.ExportedCommands) {
        $this.ExportedCommands['Write-SVG']
    }
)