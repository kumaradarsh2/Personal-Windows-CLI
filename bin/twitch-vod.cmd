@echo off
setlocal
if "%~1"=="" (
    echo Usage: twitch-vod twitch_video_url
    echo Example: twitch-vod https://www.twitch.tv/videos/1234567890
    exit /b
)

mpv --profile=gpu-hq "%~1"
endlocal
