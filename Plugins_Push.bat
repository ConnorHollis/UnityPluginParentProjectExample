@echo off
setlocal

echo Checking for files ready to push
git submodule foreach git status

set /P CONFIRMCHECKIN=Would you like to push your changes (Y/[N])? 
IF /I "%CONFIRMCHECKIN%" EQU "Y" GOTO CONFIRM
IF /I "%CONFIRMCHECKIN%" EQU "y" GOTO CONFIRM

GOTO END

:CONFIRM
git submodule foreach git push

endlocal
:END