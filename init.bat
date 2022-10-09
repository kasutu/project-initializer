@echo off
echo -----------------------------------------------------------------
echo  Name: Project Initializer
echo  Version: 1.0.1
echo  By: Jerome Cabugwason
echo  CopyRight: (c) Sept 2022, All Rights Reserved!
echo -----------------------------------------------------------------
echo.

:init
IF "%~1"=="ts" GOTO tsinit
IF "%~1"=="ts-express" GOTO expinit
SHIFT
GOTO endinit
GOTO init
EXIT /B 0

:tsinit
CALL npm init -y
CALL npm i -D typescript ts-node @types/node
CALL tsc --init
echo [INFO] ts project created!
EXIT /B 0

:expinit
CALL npm init -y 
CALL npm pkg set scripts.dev="nodemon src/app.ts"
CALL npm i express -y
CALL npm i -D typescript ts-node @types/node @types/express nodemon
CALL tsc --init --outDir ./dist
CALL mkdir src dist
echo. 
echo [INFO] ts-express project created!
echo [INFO] type "npm run dev" to get started!
EXIT /B 0

:endinit
echo [WARN] Please enter a Parameter!
echo.
echo Available Parameters
echo.
echo ts               Initialize a typescript project with node in the current path.
echo ts-express       Initialize a typescript-express project with node in the current path.
EXIT /B 0