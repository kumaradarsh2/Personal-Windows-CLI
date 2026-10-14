@echo off
set "CHROME=C:\Program Files\Google\Chrome\Application\chrome.exe"

if /i "%~1"=="i" (
    if "%~2"=="" (
        start "" /B "%CHROME%" --incognito
    ) else (
        start "" /B "%CHROME%" --incognito "%~2"
    )
) else (
    start "" /B "%CHROME%" %*
)
