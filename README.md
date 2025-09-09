(arhived)- fixed by pr [here](https://github.com/Rexshack-RedM/rsg-medic/pull/34) and [here](https://github.com/Rexshack-RedM/rsg-appearance/pull/46)

# RSG Health Sync

This script fixes an issue where using `/loadskin` (from **rsg-appearance**) resets the player's health to 100. It also ensures health is properly restored when a player rejoins the server.

## What It Fixes
- Health resetting to 100 after using `/loadskin`
- Health not being saved or restored correctly after disconnecting and reconnecting

## How It Works
- Monitors the player's health every second
- Updates health in LocalPlayer.state and sends it to the server via metadata
- Restores correct health on login using saved metadata

It's a temporary solution and should be removed when issue will be fixed RSG codebase. More details in Discord discussion thread [here](https://discord.com/channels/914413479157448744/1414593626255659101).
