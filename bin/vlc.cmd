@echo off

if /I "%~1"=="f" (
    start "" "C:\Program Files\VideoLAN\VLC\vlc.exe" --fullscreen "%~2"
) else (
    start "" "C:\Program Files\VideoLAN\VLC\vlc.exe" "%~1"
)