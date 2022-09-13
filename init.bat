@echo off
echo -----------------------------------------------------------------
echo  Name: Project Initializer
echo  Version: 1.0.0
echo  By: Jerome Cabugwason
echo  CopyRight: (c) Sept 2022, All Rights Reserved!
echo -----------------------------------------------------------------
echo.

:init
IF "%~1"=="" GOTO endinit
IF "%~1"=="ts" npm init -y && npx tsc --init
SHIFT
GOTO init

:endinit
echo [WARN] Please enter a Parameter!
echo.
echo            Available Parameters
echo ts   Initialize a typscript project with node in the current path.