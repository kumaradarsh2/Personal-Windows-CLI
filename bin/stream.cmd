@echo off
if "%~1"=="" (
    echo Usage: stream search terms
    exit /b 1
)

set "VIDEO_ID="
yt-dlp --no-warnings --cookies "E:\Cookies\cookies.txt" "ytsearch1:%*" --get-id > "%TEMP%\stream_video_id.txt"

if errorlevel 1 (
    del "%TEMP%\stream_video_id.txt" 2>nul
    echo YouTube search failed.
    exit /b 1
)

set /p VIDEO_ID=<"%TEMP%\stream_video_id.txt"
del "%TEMP%\stream_video_id.txt" 2>nul

if not defined VIDEO_ID (
    echo No video found.
    exit /b 1
)

mpv --vo=gpu --autofit=50%% --ontop --ytdl-raw-options=cookies="E:\Cookies\cookies.txt" "https://www.youtube.com/watch?v=%VIDEO_ID%"
