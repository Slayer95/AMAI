@ECHO OFF

SET VER=%1
SET MAP=%~2
if not exist "%MAP%" (
	ECHO %MAP% cannot be found
	exit /b 1
)

MPQEditor htsize "%MAP%" 64
MPQEditor a "%MAP%" "%~dp0Scripts\Blizzard_%VER%.j" Scripts\Blizzard.j
MPQEditor f "%MAP%"
ECHO Installed AMAI Commander to Map "%MAP%"
