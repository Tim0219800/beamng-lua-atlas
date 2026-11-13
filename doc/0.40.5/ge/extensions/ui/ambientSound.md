# `ui_ambientSound`

*Fichier : `lua/ge/extensions/ui/ambientSound.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_ambientSound` : `extensions.load("ui_ambientSound")`, puis la globale `ui_ambientSound`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_ambientSound.deleteSoundSFX(ID)` | this function remove stream object from sounstream table<br>@param ID is number represent streamID | 90 |
| `ui_ambientSound.init(json)` | set soundStreams table that contains number of streams to be played<br>call getrandomSound to set currentSoundData and returns stream ID<br>@param json string | 69 |
| `ui_ambientSound.setStreamState(streamID, volume, pitch, fadeInTime)` | setStreamState to set volume ,pitch..etc of each stream | 33 |
| `ui_ambientSound.update(dt)` | this function update the sounds in currentSoundData | 44 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/ambientSound.lua`.*
