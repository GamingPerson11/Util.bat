@echo off
if exist custmcolor.txt (
	:: Credits to ChatGPT for making this one line of code
	for /f "delims=" %%A in ('type custmcolor.txt') do set custmclrfile=%%A
)

color 9
if "%custmclrfile%"=="? " (
	del custmcolor.txt
) else (
	color %custmclrfile%
)

title Util.bat
set startpath=%cd%
:begin
cls
echo                         ##     ## ######## #### ##           ########     ###    ######## 
echo                         ##     ##    ##     ##  ##           ##     ##   ## ##      ##    
echo                         ##     ##    ##     ##  ##           ##     ##  ##   ##     ##    
echo                         ##     ##    ##     ##  ##           ########  ##     ##    ##    
echo                         ##     ##    ##     ##  ##           ##     ## #########    ##    
echo                         ##     ##    ##     ##  ##       ### ##     ## ##     ##    ##    
echo                          #######     ##    #### ######## ### ########  ##     ##    ##    
echo:   
echo:   

echo 1) Shutdown
echo 2) Reboot
echo 3) Start Discord
echo 4) Date And Time
echo 5) Start Chrome
echo 6) Exit
echo:
echo enter "custom" for customization
echo:

:selection
set /p op=Type your selection here!: 
if "%op%"=="1" goto shutdown
if "%op%"=="2" goto reboot
if "%op%"=="3" goto dscstart
if "%op%"=="4" goto timeanddate
if "%op%"=="5" goto chrome
if "%op%"=="6" exit
if "%op%"=="custom" goto custm

goto begin
:shutdown
shutdown /p /f
cls
goto selection

:reboot
shutdown /r /t 0
cls
goto selection

:dscstart
cls
cd %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc
start Discord.lnk
if "%errorlevel%"=="0" (
	goto finish
) else (
	start https://discord.com/channels/@me
)
:finish
cd %startpath%
echo complete!
timeout /t 3 /nobreak>nul
goto begin

:timeanddate
cls
echo Your current time is: %time%
echo:
echo Your current date is: %date%
pause /nobreak>nul
cls
goto begin

:chrome
cls
start C:\ProgramData\Microsoft\Windows\"Start Menu"\Programs\"Google Chrome.lnk"
echo complete!
timeout /t 3 /nobreak>nul
goto begin

:custm
cls
echo Hello, %USERNAME%! you have entered customization mode, what would you like to do?
echo "back" to return.
echo:
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
echo:
set /p colorop=Type your color here: 
if "%colorop%"=="1" color 1
if "%colorop%"=="2" color 2
if "%colorop%"=="3" color 3
if "%colorop%"=="4" color 4
if "%colorop%"=="5" color 5
if "%colorop%"=="6" color 7
if "%colorop%"=="7" color 8

if "%colorop%"=="7" set colorop=8
if "%colorop%"=="6" set colorop=7
echo %colorop% >custmcolor.txt

cls
goto custm

:custmclr
cls
echo Hello, %USERNAME%, this is custom color selection, it uses the command version of colors.
echo:
echo For example, it is "a" for bright green or "f" for white.
echo Enter "?" for help.
echo:
echo "back" to return
set /p custmclrop=Enter custom color here (command version): 
if "%custmclrop%"=="back" goto custm
color %custmclrop%
echo %custmclrop% >%startpath%\custmcolor.txt
goto custmclr
