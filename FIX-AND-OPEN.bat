@echo off
cd /d "%~dp0"
title Portfolio Fix
echo ========================================
echo   Portfolio - Fix project images
echo ========================================
echo.
echo Working folder: %cd%
echo.

if not exist "index.html" (
  echo ERROR: index.html is NOT in this folder.
  echo Run this file from the folder that contains index.html
  pause
  exit /b 1
)

if not exist "images" mkdir images

echo Copying PNG files into images folder...
copy /Y "assets\projects\*.png" "images\" >nul 2>&1

echo.
echo Checking images...
set MISSING=0
for %%f in (dhwani-ai grievance thailavardhana heart-disease tele-seva crime-investigation cricket-pro) do (
  if exist "images\%%f.png" (
    echo   [OK] images\%%f.png
  ) else if exist "assets\projects\%%f.png" (
    copy /Y "assets\projects\%%f.png" "images\" >nul
    echo   [OK] assets\projects\%%f.png
  ) else if exist "assets\projects\%%f.png.png" (
    copy /Y "assets\projects\%%f.png.png" "images\%%f.png" >nul
    echo   [FIXED] renamed %%f.png.png
  ) else (
    echo   [MISSING] %%f.png
    set MISSING=1
  )
)

echo.
if %MISSING%==1 (
  echo Put your 7 PNG files in:
  echo   %cd%\assets\projects
  echo OR
  echo   %cd%\images
  echo.
  pause
  exit /b 1
)

echo.
echo Starting website at http://localhost:8765 ...
echo Do NOT close this window while viewing the site.
echo.
start "" "http://localhost:8765/index.html#projects"
python -m http.server 8765
