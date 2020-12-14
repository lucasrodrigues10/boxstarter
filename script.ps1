#As described here: http://boxstarter.org/Learn/WebLauncher

#The command to run, built from the raw link of this gist

#START http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/lucasrodrigues10/boxstarter/master/script.ps1

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
Disable-InternetExplorerESC
#Disable-UAC

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
cinst qbittorrent -y
cinst everything -y
cinst telegram -y
cinst notepadplusplus -y
cinst nuget.commandline -y
cinst winscp -y
cinst webex-meetings -y
cinst zoom -y
cinst mremoteng -y
cinst whatsapp -y
cinst nodejs -y
cinst obs-studio -y
cinst psake -y
cinst git -y
cinst tortoisesvn -y
cinst visualstudio2019professional -y

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
if (Test-PendingReboot) { Invoke-Reboot }
