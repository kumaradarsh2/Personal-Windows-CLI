@echo off
setlocal

set "incognito=0"
set "site="

REM ============================================
REM PARSE ARGUMENTS
REM ============================================

if /I "%~1"=="i" (
set "incognito=1"
set "site=%~2"
) else (
set "site=%~1"
)

if "%site%"=="" goto help

REM ============================================
REM WEBSITES
REM ============================================

if /I "%site%"=="youtube" set "url=https://youtube.com"
if /I "%site%"=="yt" set "url=https://youtube.com"

if /I "%site%"=="github" set "url=https://github.com"
if /I "%site%"=="gh" set "url=https://github.com"

if /I "%site%"=="chatgpt" set "url=https://chatgpt.com"

if /I "%site%"=="reddit" set "url=https://reddit.com"

if /I "%site%"=="google" set "url=https://google.com"

if /I "%site%"=="gmail" set "url=https://mail.google.com"

if /I "%site%"=="calendar" set "url=https://calendar.google.com"

REM ============================================
REM UNKNOWN WEBSITE
REM ============================================

if not defined url (
echo.
echo Unknown website: %site%
echo.
goto help
)

REM ============================================
REM OPEN CHROME
REM ============================================

if "%incognito%"=="1" (

start "" /B "C:\Program Files\Google\Chrome\Application\chrome.exe" --incognito "%url%"


) else (

start "" /B "C:\Program Files\Google\Chrome\Application\chrome.exe" "%url%"


)

exit /b 0

REM ============================================
REM HELP
REM ============================================

:help

echo.
echo ============================================
echo PERSONAL OPEN CLI
echo ============================================
echo.
echo Usage:
echo open ^<website^>
echo open i ^<website^>
echo.
echo WEBSITES
echo.
echo youtube / yt
echo github / gh
echo chatgpt
echo reddit
echo google
echo gmail
echo calendar
echo.
echo INCOGNITO
echo.
echo open i youtube
echo open i github
echo open i chatgpt
echo open i gmail
echo.
echo EXAMPLES
echo.
echo open youtube
echo open yt
echo open github
echo open chatgpt
echo.
echo open i youtube
echo open i gh
echo open i chatgpt
echo.
exit /b 1