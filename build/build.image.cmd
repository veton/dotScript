@ECHO OFF

SET ImageName=veton/dotscript

ECHO Building docker image...
docker build %~dp0 -t %ImageName%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

ECHO Pushing image to Docker Hub...
docker push %ImageName%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
