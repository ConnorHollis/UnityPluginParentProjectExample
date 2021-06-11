@echo off
setlocal

echo Checking for changes to files in the subrepository
git submodule foreach git status

set /P CONFIRMCHECKIN=Would you like to automatically check in the detected changes in each submodule (Y/[N])? 
IF /I "%CONFIRMCHECKIN%" EQU "Y" GOTO CONFIRM
IF /I "%CONFIRMCHECKIN%" EQU "y" GOTO CONFIRM

GOTO END

set /P COMMITMESSAGE=Enter commit message: 

:CONFIRM
git submodule foreach git add -A
git submodule foreach git commit -m %COMMITMESSAGE%

endlocal
:END