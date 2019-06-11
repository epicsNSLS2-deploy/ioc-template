:: Batch file for cleaning up the IOC directory.

cd /D "%~dp0"

rmdir /s /q dependancyScripts\
rmdir /s /q startupScripts\
rmdir /s /q autosaveFiles\
rmdir /s /q logs\

mkdir autosave
rm *OLD*
rm cleanup.sh
rm cleanup.bat
