@echo off
cls
echo -----------------------------------------------------------------
echo  Name: Gem Dash
echo  Version: 1.0.0
echo  By: Jerome Cabugwason
echo  CopyRight: (c) Sept 2022, All Rights Reserved!
echo -----------------------------------------------------------------
echo.
echo Welcome to Gem.  This is the main page.
echo Type in the number to be redirected to your desired location.
echo.
echo 1. se_projects
echo 2. projects
echo 3. dart
echo.
echo [-edit] to edit settings.
echo.

set /p input = Select number / [y] Goto default?: 

if "%input%" == "1" goto se
if "%input%" == "2" goto proj
if "%input%" == "3" goto dart

if "%input%" == "-edit" goto edit
goto se

:edit
cd C:\Users\jerom\Documents\dev_custom && code .

:proj
cd C:\Users\jerom\Documents\projects

:dart
cd C:\Users\jerom\Documents\se_projects\dart

:se
cd C:\Users\jerom\Documents\se_projects
