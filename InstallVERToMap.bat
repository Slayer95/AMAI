@ECHO OFF

SET VER=%~1
SET RESULTMAKEVER=0

if not exist "%~2" (
	ECHO %2 Map cannot be found
	exit /b 1
)
MPQEditor htsize "%~2" 64
if "%errorlevel%"=="5" SET RESULTMAKEVER=%errorlevel%
MPQEditor a "%~2" "%~dp0Scripts\%VER%\common.ai" "Scripts\common.ai"
if "%errorlevel%"=="5" SET RESULTMAKEVER=%errorlevel%
MPQEditor a "%~2" "%~dp0Scripts\%VER%\human.ai" "Scripts\human.ai"
if "%errorlevel%"=="5" SET RESULTMAKEVER=%errorlevel%
MPQEditor a "%~2" "%~dp0Scripts\%VER%\orc.ai" "Scripts\orc.ai"
if "%errorlevel%"=="5" SET RESULTMAKEVER=%errorlevel%
MPQEditor a "%~2" "%~dp0Scripts\%VER%\undead.ai" "Scripts\undead.ai"
if "%errorlevel%"=="5" SET RESULTMAKEVER=%errorlevel%
MPQEditor a "%~2" "%~dp0Scripts\%VER%\elf.ai" "Scripts\elf.ai"
if "%errorlevel%"=="5" SET RESULTMAKEVER=%errorlevel%
if "%~3" == "1" (
  ECHO Installed Commander to Map
  MPQEditor a "%~2" "%~dp0Scripts\Blizzard_%VER%.j" Scripts\Blizzard.j
  if not "%errorlevel%"=="0" SET RESULTMAKEVER=%errorlevel%
)
MPQEditor f "%~2"
if not "%errorlevel%"=="0" SET RESULTMAKEVER=%errorlevel%
if "%RESULTMAKEVER%"=="5" (
  ECHO Failed to install to map %2, you may not have valid permissions or are blocked by windows UAC. Ensure map files are not in a UAC protected location
  exit /b %RESULTMAKEVER%
) else (
  if not "%RESULTMAKEVER%"=="0" (
    ECHO Possibly failed to install to map %2, an unknown error occured %RESULTMAKEVER%
  )
  ECHO Installed %VER% AMAI to Map %2
)
