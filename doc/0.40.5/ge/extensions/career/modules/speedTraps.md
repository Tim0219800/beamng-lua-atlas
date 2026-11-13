# `career_modules_speedTraps`

*Fichier : `lua/ge/extensions/career/modules/speedTraps.lua` · VM : Game Engine (GE) · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_speedTraps` : `extensions.load("career_modules_speedTraps")`, puis la globale `career_modules_speedTraps`

**Dépendances (chargées avant) :** `career_career`, `gameplay_speedTraps`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_speedTraps.onExtensionLoaded()` | *(hook)* | 122 |
| `career_modules_speedTraps.onRedLightCamTriggered(speedTrapData, playerSpeed)` | *(hook)* | 97 |
| `career_modules_speedTraps.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 129 |
| `career_modules_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)` | *(hook)* | 35 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/speedTraps.lua`.*
