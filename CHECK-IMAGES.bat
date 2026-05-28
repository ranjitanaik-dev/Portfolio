@echo off
cd /d "%~dp0"
echo Checking project images in: %cd%\assets\projects
echo.
set OK=0
set MISSING=0

for %%f in (dhwani-ai grievance thailavardhana heart-disease tele-seva crime-investigation cricket-pro) do (
  if exist "assets\projects\%%f.png" (
    echo [OK]    %%f.png
    set /a OK+=1
  ) else (
    echo [MISSING] %%f.png
    set /a MISSING+=1
  )
)

echo.
if %MISSING% GTR 0 (
  echo Some images are missing. Copy your .png files into:
  echo %cd%\assets\projects
) else (
  echo All 7 images found. Double-click OPEN-PORTFOLIO.bat to view the site.
)
echo.
pause
