:: Batch file for cleaning up the IOC directory.

cd /D "%~dp0"

rmdir /s /q dependancyFiles\
rmdir /s /q startupScripts\
rmdir /s /q autosaveFiles\
rmdir /s /q logs\

mkdir autosave
del README*
del *OLD*
del cleanup.sh
del cleanup.bat
