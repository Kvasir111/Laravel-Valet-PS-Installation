[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$phpPath = c:\PHP\
cd $HOME
cd .\Downloads\
wget -UseBasicParsing https://windows.php.net/downloads/releases/php-7.3.3-nts-Win32-VC15-x64.zip -OutFile PHP.zip
wget -UseBasicParsing https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe -OutFile VS2015.exe
mkdir $phpPath
Expand-Archive PHP.zip -DestinationPath $phpPath
.\VS2015.exe /s
cd $phpPath
del C:\PHP\php.ini
wget -UseBasicParsing https://hastebin.com/raw/ukejavikad -OutFile .\"php.ini"
$oldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
$newPath=$oldPath+’;C:\PHP\’
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath
mkdir 'C:\Program Files\composer'
cd 'C:\Program Files\composer'
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
$compBS = '@php "%~dp0composer.phar" %*'
Out-File -FilePath .\composer.bat
$compBS | Set-Content .\composer.bat -Encoding Ascii
$oldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
$newPath=$oldPath+’;C:\Program Files\composer’
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath
php composer.phar global require laravel/installer
$oldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
$newPath=$oldPath+’;$HOME\AppData\Roaming\Composer\vendor\bin’
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath

