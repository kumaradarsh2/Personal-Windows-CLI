
# Personal Windows CLI

A collection of lightweight Windows command-line utilities built with batch scripts (`.cmd`) to simplify everyday tasks.

Instead of opening multiple applications and navigating through GUIs, I use short terminal commands to search the web, stream music and videos, manage software, and launch applications.

## Features

- **Web Search** ¿ Search Google, YouTube, YouTube Music, GitHub, Reddit, Bing, Google Images, Google Maps, and Wikipedia.
- **Website Launcher** ¿ Open frequently used websites with short commands, including support for Incognito mode.
- **Media Streaming** ¿ Stream YouTube videos directly through MPV without intentionally downloading the entire video.
- **Music Playback** ¿ Search and play YouTube audio directly from the terminal.
- **Video Downloads** ¿ Download videos using `yt-dlp`, with options for controlling format and quality.
- **Media Playback** ¿ Play local media using MPV or VLC, including fullscreen and floating-window playback.
- **Media Inspection** ¿ Inspect video metadata and available download formats.
- **Package Management** ¿ Install applications and upgrade packages using `winget`.
- **Quick Launchers** ¿ Open Chrome, Telegram, YouTube, and other frequently used applications.

## Requirements

- Windows
- Command Prompt (`cmd.exe`)
- [MPV](https://mpv.io/)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [FFmpeg](https://ffmpeg.org/) (for supported media processing and format merging)
- [Windows Package Manager (`winget`)](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
- Google Chrome and VLC for the corresponding commands

Some commands require only a subset of these tools.

## Commands

### Search

Search the web directly from the terminal.

```bat
search google how to learn Python
search yt lofi music
search ytm lofi music
search github awesome projects
search reddit mechanical keyboards
search images red ferrari
search maps coffee shops
search wiki Alan Turing
```

Incognito search is supported:

```bat
search yt i lofi music
search google i Python tutorials
search wiki i Alan Turing
```

Use `search help` to view available commands and aliases.

### Website Launcher

Open frequently used websites directly:

```bat
open youtube
open github
open chatgpt
open gmail
open calendar
```

Incognito mode:

```bat
open i youtube
open i github
open i chatgpt
```

### Media Streaming

Search YouTube and play a video directly through MPV:

```bat
stream dhurandar trailer 
```

Play audio without opening a video window:

```bat
music kalyani
```

These commands use `yt-dlp` integration with MPV to resolve and play online media streams.

### Downloads and Media Utilities

The toolkit also includes commands for downloading media, selecting video quality, inspecting available formats, and playing local files.

Refer to the individual scripts for their exact arguments and options.

### Software Management

Install a package using its exact `winget` package ID:

```bat
install Git.Git
```

Upgrade installed packages:

```bat
update
```

Check each script's help text or source for additional supported options.

## Project Structure

```text
bin/
¿¿¿ chrome.cmd
¿¿¿ download-bypass.cmd
¿¿¿ download.cmd
¿¿¿ install.cmd
¿¿¿ music.cmd
¿¿¿ open.cmd
¿¿¿ play.cmd
¿¿¿ quality.cmd
¿¿¿ search.cmd
¿¿¿ stream.cmd
¿¿¿ telegram.cmd
¿¿¿ update.cmd
¿¿¿ vlc.cmd
¿¿¿ youtube.cmd
¿¿¿ ytquality.cmd
```

## Setup

1. Install the required applications and command-line utilities.
2. Place the `.cmd` scripts in a directory such as `C:\Users\<username>\bin`.
3. Add that directory to your Windows `PATH`.
4. Open a new Command Prompt window.
5. Run the commands from any working directory.

## Philosophy

Keep things simple. Prefer fast commands and small utilities over repetitive GUI workflows.

This is a personal collection of scripts built around the tools I actually use.

## License
This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute these scripts in accordance with its terms.
