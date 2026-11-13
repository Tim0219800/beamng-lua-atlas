# `editor_drivePathEditor_playback`

*Fichier : `lua/ge/extensions/editor/drivePathEditor/playback.lua` · VM : Game Engine (GE) · 205 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_drivePathEditor_playback` : `extensions.load("editor_drivePathEditor_playback")`, puis la globale `editor_drivePathEditor_playback`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_drivePathEditor_playback.getPlaybackTime()` | Gets the current playback time. | 25 |
| `editor_drivePathEditor_playback.handlePlayback()` | Handles playback of all the active drive path splines/vehicles. | 77 |
| `editor_drivePathEditor_playback.startPlayback(splines, vehicles)` | Starts playback of all linked drive path splines/vehicles.<br> [Adds all vehicles to the playing table if they have a valid link to a spline.]<br> [Note: Execution wont start until the update function is called, where delayTime is used to start the playback.] | 30 |
| `editor_drivePathEditor_playback.stopPlayback()` | Stops playback of all linked drive path splines/vehicles, and resets the vehicles to their starting positions. | 58 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/drivePathEditor/playback.lua`.*
