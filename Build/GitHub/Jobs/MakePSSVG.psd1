@{
    "runs-on" = "ubuntu-latest"    
    if = '${{ success() }}'
    steps = @(
        @{
            name = 'Check out repository'
            uses = 'actions/checkout@v2'
        },
        @{    
            name = 'PipeScript'
            uses = 'StartAutomating/PipeScript@main'
            id = 'PipeScript'
            with = @{
                serial = $true
            }
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
        @{
            name = 'GitLogger'
            uses = 'GitLogging/GitLoggerAction@main'
            id = 'GitLogger'
        },
        'RunEZOut',       
        'RunHelpOut',
        @{
            'name'='Log in to ghcr.io'
            'uses'='docker/login-action@master'
            'with'=@{
                'registry'='${{ env.REGISTRY }}'
                'username'='${{ github.actor }}'
                'password'='${{ secrets.GITHUB_TOKEN }}'
            }
        },
        @{
            name = 'Extract Docker Metadata (for branch)'
            if   = '${{github.ref_name != ''main'' && github.ref_name != ''master'' && github.ref_name != ''latest''}}'
            id   = 'meta'
            uses = 'docker/metadata-action@master'
            with = @{
                'images'='${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}'                
            }
        },
        @{
            name = 'Extract Docker Metadata (for main)'
            if   = '${{github.ref_name == ''main'' || github.ref_name == ''master'' || github.ref_name == ''latest''}}'
            id   = 'metaMain'
            uses = 'docker/metadata-action@master'
            with = @{
                'images'='${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}'
                'flavor'='latest=true'
            }
        },
        @{
            name = 'Build and push Docker image (from main)'
            if   = '${{github.ref_name == ''main'' || github.ref_name == ''master'' || github.ref_name == ''latest''}}'
            uses = 'docker/build-push-action@master'
            with = @{
                'context'='.'
                'push'='true'
                'tags'='${{ steps.metaMain.outputs.tags }}'
                'labels'='${{ steps.metaMain.outputs.labels }}'
            }
        },
        @{
            name = 'Build and push Docker image (from branch)'
            if   = '${{github.ref_name != ''main'' && github.ref_name != ''master'' && github.ref_name != ''latest''}}'
            uses = 'docker/build-push-action@master'
            with = @{
                'context'='.'
                'push'='true'
                'tags'='${{ steps.meta.outputs.tags }}'
                'labels'='${{ steps.meta.outputs.labels }}'
            }
        }
    )
}