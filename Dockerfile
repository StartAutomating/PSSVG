# Thank you Microsoft!  Thank you PowerShell!  Thank you Docker!
FROM mcr.microsoft.com/powershell

# InstallAptPackages determines additional packages to install
ARG InstallAptPackages=git curl ca-certificates libc6 libgcc1

# Install additional packages
RUN apt-get update && apt-get install -y $InstallAptPackages && apt-get clean

# Set the module name to the name of the module we are building
ARG ModuleName=PSSVG
# Copy the module into the container
COPY . ./usr/local/share/powershell/Modules/$ModuleName
# Create a profile that imports the module, so it is available when the container starts.
RUN pwsh -c "New-Item -Path \$Profile -ItemType File -Force | Out-Null"
# Add the module to the profile
RUN pwsh -c "Add-Content -Path \$Profile -Value 'Import-Module $ModuleName' -Force"

# InstallModules determines additional modules to install
ARG InstallModules=PipeScript,PSSVG,ugit

# Install additional modules
RUN pwsh -c "Install-Module -Name $InstallModules -Force -AcceptLicense -Scope CurrentUser"
# Add the modules to the profile
RUN pwsh -c "Add-Content -Path \$Profile -Value 'Import-Module $InstallModules' -Force"

