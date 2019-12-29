#As described here: http://boxstarter.org/Learn/WebLauncher

#The command to run, built from the raw link of this gist

#START http://boxstarter.org/package/nr/url?https://gist.github.com/automatonic/7771dfd7015a72453091/raw/4cbbf4811d11929ebe0f98c51f04e7476179c13f/example.boxstarter

#Special windowsy stuff. see http://boxstarter.org/WinConfig

#Set-ExecutionPolicy RemoteSigned
#Set-ExecutionPolicy AllSigned 
#Set-ExecutionPolicy Unrestricted -Force

# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$true # Is this a machine with no login password?
# $Boxstarter.AutoLogin=$true Save my password securely and auto-login after a reboot

# Basic setup
Update-ExecutionPolicy Unrestricted
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
#Enable-RemoteDesktop
Disable-InternetExplorerESC
#Disable-UAC
#Set-TaskbarSmall

# disable defrag because I have an SSD 
Get-ScheduledTask -TaskName *defrag* | Disable-ScheduledTask 

#install some applications

#See: https://chocolatey.org/packages for what you can install

#Browsers
cinst googlechrome -y
cinst firefox -y
cinst 7zip.install -y
cinst spotify -y
cinst vlc cmder -y
choco install visualstudio2019professional -y
cinst qbittorrent -y
cinst everything -y
cinst telegram -y
cinst vscode -y

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
if (Test-PendingReboot) { Invoke-Reboot }
