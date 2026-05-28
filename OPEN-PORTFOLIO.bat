@echo off
cd /d "%~dp0"
echo Starting portfolio at http://localhost:8765
echo Keep this window open while viewing the site.
echo.
start "" "http://localhost:8765/index.html#projects"
python -m http.server 8765
