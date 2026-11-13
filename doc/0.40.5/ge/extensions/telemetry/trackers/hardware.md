# `telemetry_trackers_hardware`

*Fichier : `lua/ge/extensions/telemetry/trackers/hardware.lua` · VM : Game Engine (GE) · 315 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_hardware` : `extensions.load("telemetry_trackers_hardware")`, puis la globale `telemetry_trackers_hardware`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_hardware.onAudioOutputDeviceChanged()` | *(hook)* | 197 |
| `telemetry_trackers_hardware.onDeviceChanged()` | *(hook)* | 185 |
| `telemetry_trackers_hardware.onDisplayModeChanged(from, to)` | *(hook)* | 208 |
| `telemetry_trackers_hardware.onExtensionLoaded()` | *(hook)* | 278 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `getUserPath`, `isGamePathCaseSensitive`, `isUserPathCaseSensitive`, `stat`
- `Lua:` `getOSLanguage`, `getSelectedLanguage`, `getSteamLanguage`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/hardware.lua`.*
