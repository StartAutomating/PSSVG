@{
    "runs-on" = "ubuntu-latest"    
    if = '${{ success() }}'
    steps = @(
        @{
            name = 'Check out repository'
            uses = 'actions/checkout@v2'
        },
        @{
            name = 'GitLogger'
            uses = 'GitLogging/GitLoggerAction@main'
            id = 'GitLogger'
        },
        @{    
            name = 'PipeScript'
            uses = 'StartAutomating/PipeScript@main'
            id = 'PipeScript'
        },@{
            name = 'Use PSSVG (from main)'
            if   = '${{github.ref_name == ''main''}}'
            uses = 'StartAutomating/PSSVG@main'
            id = 'PSSVGMain'
        },
        @{
            name = 'Use PSSVG (on branch)'
            if   = '${{github.ref_name != ''main''}}'
            uses = './'
            id = 'PSSVGBranch'
        },        
        'RunEZOut',       
        'RunHelpOut'
    )
}