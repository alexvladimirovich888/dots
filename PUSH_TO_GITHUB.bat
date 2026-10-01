@echo off
chcp 65001 >nul
cd /d "%~dp0"
where git >nul 2>nul || (echo Git is not installed. Download: https://git-scm.com/download/win & pause & exit /b 1)
if exist "%TEMP%\gs_update" rmdir /s /q "%TEMP%\gs_update"
mkdir "%TEMP%\gs_update"
tar -xf "groksolver-updated.zip" -C "%TEMP%\gs_update" || (echo Unzip failed & pause & exit /b 1)
cd /d "%TEMP%\gs_update\groksolver"
echo Pushing DotsSolver update to GitHub...
git push origin main
echo.
echo Finished. Vercel will redeploy groksolver.vercel.app in 1-2 minutes.
pause
