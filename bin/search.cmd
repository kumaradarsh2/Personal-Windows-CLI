@echo off
setlocal EnableDelayedExpansion

set "VERSION=5.2"

set "command=%~1"

if "%command%"=="" goto help

REM ============================================
REM SPECIAL COMMANDS
REM ============================================

if /I "%command%"=="help" goto help
if /I "%command%"=="--help" goto help
if /I "%command%"=="-h" goto help

if /I "%command%"=="version" goto version
if /I "%command%"=="--version" goto version
if /I "%command%"=="-v" goto version

REM ============================================
REM SEARCH ENGINES
REM ============================================

if /I "%command%"=="google" goto search
if /I "%command%"=="g" goto search

if /I "%command%"=="youtube" goto search
if /I "%command%"=="yt" goto search

if /I "%command%"=="ytm" goto search

if /I "%command%"=="github" goto search
if /I "%command%"=="gh" goto search

if /I "%command%"=="reddit" goto search
if /I "%command%"=="r" goto search

if /I "%command%"=="bing" goto search

REM ============================================
REM SPECIAL SEARCH TYPES
REM ============================================

if /I "%command%"=="images" goto images
if /I "%command%"=="image" goto images
if /I "%command%"=="img" goto images

if /I "%command%"=="maps" goto maps
if /I "%command%"=="map" goto maps

if /I "%command%"=="wikipedia" goto wiki
if /I "%command%"=="wiki" goto wiki
if /I "%command%"=="w" goto wiki

REM ============================================
REM UNKNOWN COMMAND
REM ============================================

echo.
echo Unknown command: %command%
echo.
goto help

REM ============================================
REM NORMAL SEARCH
REM ============================================

:search

set "engine=%command%"
shift

set "incognito=0"

REM Check for Incognito
if /I "%~1"=="i" (
set "incognito=1"
shift
)

if /I "%~1"=="-i" (
set "incognito=1"
shift
)

if /I "%~1"=="--incognito" (
set "incognito=1"
shift
)

REM Collect entire query
set "query=%~1"
shift

:search_loop

if "%~1"=="" goto search_done

set "query=!query! %~1"
shift

goto search_loop

:search_done

if not defined query (
echo.
echo Missing search query.
echo Example: search yt cats
exit /b 1
)

REM Select search URL

if /I "%engine%"=="google" set "url=https://www.google.com/search?q="
if /I "%engine%"=="g" set "url=https://www.google.com/search?q="

if /I "%engine%"=="youtube" set "url=https://www.youtube.com/results?search_query="
if /I "%engine%"=="yt" set "url=https://www.youtube.com/results?search_query="

if /I "%engine%"=="ytm" set "url=https://music.youtube.com/search?q="

if /I "%engine%"=="github" set "url=https://github.com/search?q="
if /I "%engine%"=="gh" set "url=https://github.com/search?q="

if /I "%engine%"=="reddit" set "url=https://www.reddit.com/search/?q="
if /I "%engine%"=="r" set "url=https://www.reddit.com/search/?q="

if /I "%engine%"=="bing" set "url=https://www.bing.com/search?q="

goto launch

REM ============================================
REM IMAGE SEARCH
REM ============================================

:images

shift

set "incognito=0"

if /I "%~1"=="i" (
set "incognito=1"
shift
)

if /I "%~1"=="-i" (
set "incognito=1"
shift
)

if /I "%~1"=="--incognito" (
set "incognito=1"
shift
)

set "query=%~1"
shift

:images_loop

if "%~1"=="" goto images_done

set "query=!query! %~1"
shift

goto images_loop

:images_done

if not defined query (
echo.
echo Missing image search query.
echo Example: search img airplanes
exit /b 1
)

set "url=https://www.google.com/search?tbm=isch&q="

goto launch

REM ============================================
REM MAP SEARCH
REM ============================================

:maps

shift

set "incognito=0"

if /I "%~1"=="i" (
set "incognito=1"
shift
)

if /I "%~1"=="-i" (
set "incognito=1"
shift
)

if /I "%~1"=="--incognito" (
set "incognito=1"
shift
)

set "query=%~1"
shift

:maps_loop

if "%~1"=="" goto maps_done

set "query=!query! %~1"
shift

goto maps_loop

:maps_done

if not defined query (
echo.
echo Missing map search query.
echo Example: search maps coffee shops
exit /b 1
)

set "url=https://www.google.com/maps/search/"

goto launch

REM ============================================
REM WIKIPEDIA SEARCH
REM ============================================

:wiki

shift

set "incognito=0"

if /I "%~1"=="i" (
set "incognito=1"
shift
)

if /I "%~1"=="-i" (
set "incognito=1"
shift
)

if /I "%~1"=="--incognito" (
set "incognito=1"
shift
)

set "query=%~1"
shift

:wiki_loop

if "%~1"=="" goto wiki_done

set "query=!query! %~1"
shift

goto wiki_loop

:wiki_done

if not defined query (
echo.
echo Missing Wikipedia search query.
echo Example: search wiki Alan Turing
exit /b 1
)

set "url=https://en.wikipedia.org/w/index.php?search="

goto launch

REM ============================================
REM LAUNCH
REM ============================================

:launch

if "%incognito%"=="1" (

powershell -NoProfile -Command "$q=[uri]::EscapeDataString($env:query); Start-Process 'C:\Program Files\Google\Chrome\Application\chrome.exe' -ArgumentList '--incognito', ('%url%' + $q)"

) else (

powershell -NoProfile -Command "$q=[uri]::EscapeDataString($env:query); Start-Process 'C:\Program Files\Google\Chrome\Application\chrome.exe' -ArgumentList ('%url%' + $q)"

)

exit /b 0

REM ============================================
REM VERSION
REM ============================================

:version

echo.
echo Personal Search CLI v%VERSION%
echo.
exit /b 0

REM ============================================
REM HELP
REM ============================================

:help

echo.
echo ============================================
echo PERSONAL SEARCH CLI v%VERSION%
echo ============================================
echo ============================================
echo.
echo SEARCH
echo.
echo search google how to learn python
echo search g how to learn python
echo.
echo search youtube lofi music
echo search yt lofi music
echo.
echo search ytm lofi music
echo.
echo search github awesome rust projects
echo search gh awesome rust projects
echo.
echo search reddit mechanical keyboards
echo search r mechanical keyboards
echo.
echo.
echo INCOGNITO
echo.
echo search yt i lofi music
echo search ytm i lofi music
echo search g i how to learn python
echo search gh i rust projects
echo search wiki i Alan Turing
echo.
echo.
echo IMAGE SEARCH
echo.
echo search images airplanes
echo search img red ferrari
echo search img i red ferrari
echo.
echo.
echo MAPS
echo.
echo search maps coffee shops
echo search map taj mahal
echo search maps i restaurants
echo.
echo.
echo WIKIPEDIA
echo.
echo search wiki Alan Turing
echo search w artificial intelligence
echo search wikipedia Indian independence
echo search wiki i Alan Turing
echo.
echo.
echo OTHER
echo.
echo search help
echo search version
echo.
exit /b 1