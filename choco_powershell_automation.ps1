$Packages = 'libreoffice', '7zip', 'battle.net', 'ditto', 'Firefox', 'keepass', 'keepass-rpc', 'mobaxterm', 'msiafterburner', 'seafile-client', 'signal', 'steam', 'WhatsApp' # List of packages that will be installed

Function InstallPackages { # Function for installing choco packages

ForEach ($Package in $Packages)
{
    choco install $Package -y
}


}

if (Get-Command choco.exe -ErrorAction SilentlyContinue) { # If choco is already installed, just install the packages from the $Packages variable
    InstallPackages
}

else { # If choco is not already installed run the choco install routine and after that install the packages
    Set-ExecutionPolicy Bypass -Scope Process -Force 
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    InstallPackages
}