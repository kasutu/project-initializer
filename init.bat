@echo off
echo -----------------------------------------------------------------
echo  Name: Project Initializer
echo  Version: 1.0.2
echo  By: Jerome Cabugwason
echo  CopyRight: (c) Sept 2022, All Rights Reserved!
echo -----------------------------------------------------------------
echo.

:init
IF "%~1"=="ts" GOTO node_verify
IF "%~1"=="ts-express" GOTO expinit
IF "%~1"=="java-maven" GOTO java_maven_verify
SHIFT
GOTO endinit
GOTO init
EXIT /B 0

:node_verify
SET /A hasErrors=0

where node >nul 2>&1 && SET hasErrors=0 || SET hasErrors=1 && echo [ERROR] Opps! Node is not installed

IF %hasErrors%==0 (GOTO tsinit)
EXIT /B 0

:tsinit
CALL npm init -y
CALL npm i -D typescript ts-node @types/node jest @types/jest ts-jest
CALL tsc --init
CALL npm ts-jest config:init
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

:java_maven_verify
IF [%~2]==[] GOTO endinit
IF [%~3]==[] GOTO endinit

SET /A hasErrors=0

where mvn >nul 2>&1 && SET hasErrors=0 || SET hasErrors=1 && echo [ERROR] Opps! Maven is not installed
where java >nul 2>&1 && SET hasErrors=0 || SET hasErrors=1 && echo [ERROR] Opps! Java is not installed

IF %hasErrors%==0 (GOTO java_maven_init)
EXIT /B 0

:java_maven_init
echo [INFO] Initializing...
CALL mvn archetype:generate -DgroupId=com.%~2.%~3 -DartifactId=%~3 -DarchetypeArtifactId=maven-archetype-simple -DarchetypeVersion=1.4 -DinteractiveMode=false
EXIT /B 0

:endinit
echo [WARN] Please enter a Parameter!
echo.
echo Available Parameters
echo.
echo ts                                           Initialize a typescript project with node and jest in the current path.
echo ts-express                                   Initialize a typescript-express project with node in the current path.
echo java-maven [companyName] [appName]           Initialize a simple java project with maven in the current path.
EXIT /B 0