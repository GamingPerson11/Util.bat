@echo off
color 9
title Util.bat
set startpath=%cd%
:begin
cls
echo .                  ##     ## ######## #### ##           ########     ###    ######## 
echo .                  ##     ##    ##     ##  ##           ##     ##   ## ##      ##    
echo .                  ##     ##    ##     ##  ##           ##     ##  ##   ##     ##    
echo .                  ##     ##    ##     ##  ##           ########  ##     ##    ##    
echo .                  ##     ##    ##     ##  ##           ##     ## #########    ##    
echo .                  ##     ##    ##     ##  ##       ### ##     ## ##     ##    ##    
echo .                   #######     ##    #### ######## ### ########  ##     ##    ##    
echo .
echo .

echo test
echo 1) Shutdown
echo 2) Reboot
echo 3) Start Discord
echo 4) Date And Time
echo -
echo enter "custom" for customization
echo -

:selection
set /p op=Type your selection here!: 
if "%op%"=="1" goto shutdown
if "%op%"=="2" goto reboot
if "%op%"=="3" goto dscstart
if "%op%"=="4" goto timeanddate
if "%op%"=="custom" goto custm

goto begin
:shutdown
shutdown /p /f
goto selection

:reboot
shutdown /r /t 0
goto selection

:dscstart
cls
cd %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc
start Discord.lnk
cd %startpath%
echo complete!
timeout /t 3 /nobreak>nul
goto begin

:timeanddate
cls
echo Your current time is: %time%
echo -
echo Your current date is: %date%
pause /nobreak>nul
cls
goto begin

:custm
cls
echo Hello, %USERNAME%! you have entered customization mode, what would you like to do?
echo "back" to return.
echo -
echo 1) Color selection
echo 2) Custom color

set /p custmop=Type your selection here!: 
if "%custmop%"=="1" goto coloropts
if "%custmop%"=="back" goto begin
if "%custmop%"=="2" goto custmclr
goto custm
:coloropts
cls
echo 1) Blue
echo 2) Green
echo 3) Light Blue
echo 4) Red
echo 5) Purple
echo 6) White
echo 7) Gray
echo -
set /p colorop=Type your color here: 
if "%colorop%"=="1" color 1
if "%colorop%"=="2" color 2
if "%colorop%"=="3" color 3
if "%colorop%"=="4" color 4
if "%colorop%"=="5" color 5
if "%colorop%"=="6" color 7
if "%colorop%"=="7" color 8
cls
goto custm

:custmclr
cls
echo Hello, %USERNAME%, this is custom color selection, it uses the command version of colors.
echo -
echo For example, it is "a" for bright green or "f" for white.
echo You can open a cmd window and do "color ?" to see the commands that you can do.
echo -
echo "back" to return
set /p custmclrop=Enter custom color here (command version): 
if "%custmclrop%"=="back" goto custm
color %custmclrop%
goto custmclr
