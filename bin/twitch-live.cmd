@echo off
setlocal
title Twitch Live Tracker
color 07

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$content=Get-Content -Raw -LiteralPath '%~f0'; $payload=[regex]::Split($content,'(?m)^# POWERSHELL-CODE #\r?$\r?\n',2)[1]; Invoke-Expression $payload"

echo.
echo Tracker stopped.
pause
exit /b

# POWERSHELL-CODE #

# ==========================================
# TWITCH LIVE TRACKER
# ==========================================

$ClientId = 'Your Client ID Here' 
$ClientSecret = 'Your Client Secret Here'

$RefreshSeconds = 30
$ApiUrl = 'https://api.twitch.tv/helix/streams?first=20'

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

function Get-TwitchToken {
    $body = @{
        client_id     = $ClientId
        client_secret = $ClientSecret
        grant_type    = 'client_credentials'
    }

    $result = Invoke-RestMethod `
        -Uri 'https://id.twitch.tv/oauth2/token' `
        -Method Post `
        -Body $body `
        -ErrorAction Stop

    return $result.access_token
}

function Limit-Text([string]$Text, [int]$Length) {
    if ([string]::IsNullOrWhiteSpace($Text)) {
        return 'Unknown'
    }

    if ($Text.Length -gt $Length) {
        return $Text.Substring(0, $Length - 3) + '...'
    }

    return $Text
}

if ($ClientId -eq 'YOUR_NEW_CLIENT_ID' -or
    $ClientSecret -eq 'YOUR_NEW_CLIENT_SECRET') {
    Write-Host 'ERROR: Add your Twitch credentials to the file.' -ForegroundColor Red
    exit
}

try {
    Write-Host 'Connecting to Twitch...'
    $Token = Get-TwitchToken
}
catch {
    Write-Host "Authentication failed: $($_.Exception.Message)" -ForegroundColor Red
    exit
}

while ($true) {
    try {
        $Headers = @{
            'Client-Id'     = $ClientId
            'Authorization' = "Bearer $Token"
        }

        try {
            $Response = Invoke-RestMethod `
                -Uri $ApiUrl `
                -Headers $Headers `
                -Method Get `
                -ErrorAction Stop
        }
        catch {
            if ($_.Exception.Response.StatusCode.value__ -ne 401) {
                throw
            }

            $Token = Get-TwitchToken
            $Headers['Authorization'] = "Bearer $Token"

            $Response = Invoke-RestMethod `
                -Uri $ApiUrl `
                -Headers $Headers `
                -Method Get `
                -ErrorAction Stop
        }

        Clear-Host

        Write-Host '==============================================================='
        Write-Host '                 TOP 20 TWITCH LIVE STREAMS'
        Write-Host '==============================================================='
        Write-Host "Updated: $(Get-Date -Format 'dd MMM yyyy HH:mm:ss')"
        Write-Host "Refresh: every $RefreshSeconds seconds"
        Write-Host ''

        Write-Host ('{0,-4} {1,-25} {2,10}  {3,-25}' -f '#', 'STREAMER', 'VIEWERS', 'CATEGORY')
        Write-Host ('-' * 69)

        $Rank = 1

        foreach ($Stream in $Response.data) {
            $Name = Limit-Text $Stream.user_name 25
            $Game = Limit-Text $Stream.game_name 25
            $Viewers = $Stream.viewer_count.ToString('N0')

            Write-Host ('{0,-4} {1,-25} {2,10}  {3,-25}' -f $Rank, $Name, $Viewers, $Game)
            $Rank++
        }

        if ($Rank -eq 1) {
            Write-Host 'No live streams found.'
        }

        Write-Host ''
        Write-Host 'Press Ctrl+C to exit.'

        Start-Sleep -Seconds $RefreshSeconds
    }
    catch {
        Write-Host ''
        Write-Host "Request failed: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "Retrying in $RefreshSeconds seconds..."
        Start-Sleep -Seconds $RefreshSeconds
    }
}
