@ECHO OFF

ECHO Building application using CircleCI...
PUSHD %~dp0..
circleci build
POPD
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%