# Personal Windows CLI

A collection of lightweight Windows command-line utilities built with batch scripts (`.cmd` and `.bat`) to simplify everyday tasks.

Search the web, launch applications, stream media, download videos, manage software, and track live Twitch streams — all through short terminal commands.

Built around a simple philosophy: **keep things minimal, practical, and fast.**

## Features

- **Web Search** — Search Google, YouTube, YouTube Music, GitHub, Reddit, Bing, Google Images, Google Maps, and Wikipedia.
- **Website Launcher** — Open frequently used websites with short commands, including Incognito mode.
- **Media Streaming** — Stream online videos through MPV using `yt-dlp`.
- **Music Playback** — Search for and play YouTube audio directly from the terminal.
- **Video Downloads** — Download media with options for selecting formats and quality.
- **Media Playback** — Play local media using MPV or VLC, including fullscreen and floating-window playback.
- **Media Inspection** — Inspect available formats and media information.
- **Twitch Utilities** — Launch Twitch streams and track the 20 most-watched live streams worldwide.
- **Package Management** — Install and upgrade applications using `winget`.
- **Quick Launchers** — Open frequently used applications and websites through short commands.

## Requirements

- Windows
- Command Prompt (`cmd.exe`) and Windows PowerShell
- [MPV](https://mpv.io/)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [FFmpeg](https://ffmpeg.org/) for supported media processing and format merging
- [Windows Package Manager (`winget`)](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
- Google Chrome and VLC for their respective commands
- Twitch CLI for Twitch stream playback
- Twitch Developer API credentials for the live-stream tracker

Individual commands require only the tools relevant to their functionality.

## Commands

### Web Search

Search different platforms directly from the terminal.

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

Incognito search is also supported:

```bat
search yt i lofi music
search google i Python tutorials
search wiki i Alan Turing
```

Run `search help` to view available commands and aliases.

### Website Launcher

Open frequently used websites:

```bat
open youtube
open github
open chatgpt
open gmail
open calendar
```

Open websites in Incognito mode:

```bat
open i youtube
open i github
open i chatgpt
```

## YouTube Streaming

Search YouTube by keywords and play the first matching result directly through MPV without opening a browser or manually copying video URLs.

```bat
stream interstellar trailer
stream lofi hip hop
stream the boy next door
```

The `stream` command uses `yt-dlp` to search YouTube, extract the selected video's ID, and launch MPV for playback.

To play a specific YouTube video by URL instead, use `play`:

```bat
play "https://www.youtube.com/watch?v=VIDEO_ID"
```

For age-restricted videos, `yt-dlp` and MPV can use an exported YouTube cookies file to authenticate playback, provided the signed-in account is authorized to watch the video. Cookie configuration is optional and must be set up locally.

Keep cookies outside the repository. Never commit cookies or other authentication credentials.

### Play YouTube audio without opening a video window:

```bat
music lofi music
```

### Downloads and Media Utilities

The toolkit includes commands for downloading media, selecting quality, inspecting formats, and playing local files.

| Command | Purpose |
|---|---|
| `download` | Download media |
| `download-bypass` | Alternative download workflow |
| `quality` | Media quality and format selection |
| `play` | Media playback |
| `music` | Audio playback |
| `stream` | Online video streaming |
| `vlc` | Launch VLC |
| `youtube` | YouTube shortcut |
| `ytquality` | YouTube quality utility |

Refer to the individual scripts for supported arguments and options.

### Twitch Utilities

The toolkit includes utilities for Twitch stream playback and live-stream discovery.

| Command | Purpose |
|---|---|
| `twitch` | Launch Twitch streams through the Twitch CLI |
| `twitch-vod` | Twitch VOD utility |
| `twitch-live` | Display the top 20 live Twitch streams worldwide |

The live tracker displays streamer names, viewer counts, and categories. It refreshes every 30 seconds using the Twitch Helix API.

The live tracker requires Twitch Developer API credentials. Keep client secrets and access tokens private; never commit them to the repository.

### Software Management

Install applications using their `winget` package IDs:

```bat
install Git.Git
```

Upgrade installed packages:

```bat
update
```

### Quick Launchers

Launch frequently used applications:

```bat
chrome
telegram
```

Check the individual scripts for additional functionality.

## Project Structure

```text
bin/
├── chrome.cmd
├── download-bypass.cmd
├── download.cmd
├── install.cmd
├── music.cmd
├── open.cmd
├── play.cmd
├── quality.cmd
├── search.cmd
├── stream.cmd
├── telegram.cmd
├── twitch-live.cmd
├── twitch-vod.cmd
├── twitch.cmd
├── update.cmd
├── vlc.cmd
├── youtube.cmd
└── ytquality.cmd
```

## Setup

1. Install the required applications and command-line utilities.
2. Place the scripts in a directory such as `C:\Users\<username>\bin`.
3. Add that directory to your Windows `PATH`.
4. Open a new terminal window.
5. Run the commands from any working directory.

Some utilities may require additional configuration, credentials, or environment variables.

## Philosophy

Keep things simple.

Prefer short commands and small utilities over repetitive GUI workflows. Use the tools that work, avoid unnecessary complexity, and keep everyday tasks accessible from the terminal.

This is a personal collection of scripts built around the tools I actually use.

## License

This project is licensed under the [MIT License](LICENSE).