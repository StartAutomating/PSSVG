# Thank you Microsoft!  Thank you PowerShell!  Thank you Docker!
FROM mcr.microsoft.com/powershell

# Set the module name to the name of the module we are building
ARG ModuleName=PSSVG
# InstallAptPackages determines additional packages to install
ARG InstallAptPackages=git curl ca-certificates libc6 libgcc1
# InstallModules determines additional modules to install
ARG InstallModules=PipeScript,ugit

# Copy the module into the container
COPY . ./usr/local/share/powershell/Modules/$ModuleName

# Set the shell to PowerShell
SHELL ["/bin/pwsh", "-nologo", "-command"]
# Next we will do the following:
# 1. Update and Install any packages
# 2. Create a profile if it does not exist
# 3. Add the module to the profile
# 4. Install additional modules
# 5. Add the additional modules to the profile
# 6. Add the microservice start to the profile

# We want to do this in one RUN command:
# It keeps the image smaller, and minimizes the number of layers.

RUN @( \    
    apt-get update && apt-get install -y $env:InstallAptPackages && apt-get clean ; \
    New-Item -Path \$Profile -ItemType File -Force | \
    Add-Content -Value \"Import-Module $env:ModuleName\" -Force; \
    Install-Module -Name ($env:InstallModules -split ',') -Force -AcceptLicense -Scope CurrentUser ; \
    Add-Content -Path \$Profile -Value \"Import-Module $env:InstallModules\" -Force; \
    Add-Content -Path \$Profile -Value \"./usr/local/share/powershell/Modules/$env:ModuleName/Microservice.ps1\" -Force; \
) -join ([Environment]::NewLine)