@echo off
#goto A

setlocal enabledelayedexpansion enableextensions
set "cmd.con=HKCU\Console\%%SystemRoot%%_system32_cmd.exe /v"
set "ram=!tmp!\WRAM.tmp"
del "%tmp%\_$xy.bat">nul 2>&1
if [%1]==[ok] goto:A
for %%a in (
"FaceName /t REG_SZ /d "Terminal" /f"
"FontFamily /t REG_DWORD /d 48 /f"
"FontSize /t REG_DWORD /d 1024294 /f"
"FontWeight /t REG_DWORD /d 700 /f"
"ScreenBufferSize /t REG_DWORD /d 13107280 /f"
"CursorSize /t REG_DWORD /d 0 /f"
) do (
set "param=%%a"
set "param=!param:~1!"
set "param=%cmd.con% !param:~0,-1!"
Reg Add !param! >nul
)
start /high cmd /q /k "%~0" ok
for %%a in (
"FaceName /f"
"FontFamily /f"
"FontSize /f"
"FontWeight /f"
"CursorSize /f"
) do (
set "param=%%a"
set "param=!param:~1!"
set "param=%cmd.con% !param:~0,-1!"
Reg Delete !param! >nul
)
exit
:A
cls
set TTJ_GAMESERVER=174.105.247.146
title ToonTown Journey Launcher
color 0E
echo ---------------------------------------------------------
echo      Welcome to Toontown Journey's Temp launcher!
echo ---------------------------------------------------------
color 0E
echo              Would you like to...
color 0E
echo              1. Connect to Toontown Journey's Test server?
echo              2. Connect to a custom ip?
echo              3. Connect to Toontown Jourey's Test server With injector?


set A=-1
set /P A=:
if %A%==1 (
goto B
)
if %A%==2 (
set /P TTJ_GAMESERVER=Gameserver IP:
goto B
)
if %A%==3 (
goto B
)
if else (
echo Hey I see you picked %A%
echo but I really need you to pick 1 or 2 try again please!
pause
goto A
)

:B
set /P TTJ_PLAYCOOKIE=Username:
cls
echo ===============================
echo Starting Toontown Journey...

if %A%==1 (
    echo Starting Up Toontown Journey Test Launcher
    echo.
)

if %A%==2 (
    echo Starting launcher
    echo Joining Game IP:
    echo %TTJ_GAMESERVER%
)
    echo Username: %TTJ_PLAYCOOKIE%
echo ===============================

cd ../../

:main
if %A%==1 (
"C:\Panda3D-1.10.0\python\ppython.exe" -m toontown.toonbase.ToontownStartBatFile
)
If %A%==2 (
"C:\Panda3D-1.10.0\python\ppython.exe" -m toontown.toonbase.ToontownStart
)
if %A%==3 (
"C:\Panda3D-1.10.0\python\ppython.exe" -m toontown.toonbase.ToontownStartInjector
)
pause
exit