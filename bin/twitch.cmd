@echo off
setlocal
if "%~1"=="" (
    echo Usage: twitch channel_name quality
    echo Example: twitch Caedrel best
    exit /b
)
set CHANNEL=%~1
set QUALITY=%~2
if "%QUALITY%"=="" set QUALITY=best

streamlink --player mpv --player-args="--profile=gpu-hq {filename}" twitch.tv/%CHANNEL% %QUALITY%
endlocal
