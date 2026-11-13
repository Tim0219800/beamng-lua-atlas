# `ui_multiseat_freeroam`

*Fichier : `lua/ge/extensions/ui/multiseat/freeroam.lua` · VM : Game Engine (GE) · 353 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_freeroam` : `extensions.load("ui_multiseat_freeroam")`, puis la globale `ui_multiseat_freeroam`

**Dépendances (chargées avant) :** `gameplay_city`, `gameplay_parking`, `gameplay_traffic`, `ui_multiseat_multiseatSettings`, `ui_multiseat_multiseatVehicles`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_freeroam.activate()` |  | 109 |
| `ui_multiseat_freeroam.deactivate()` |  | 114 |
| `ui_multiseat_freeroam.exitMultiseat(options)` | back to regular single player freeroam: keep one vehicle for player 0, remove the rest | 191 |
| `ui_multiseat_freeroam.isActive()` |  | 119 |
| `ui_multiseat_freeroam.onClientEndMission()` | *(hook)* | 343 |
| `ui_multiseat_freeroam.onDeserialized(data)` | *(hook)* | 295 |
| `ui_multiseat_freeroam.onMultiseatSettingsApplied(changeSet, result)` | *(hook)* | 164 |
| `ui_multiseat_freeroam.onMultiseatSettingsClosed()` | *(hook)* | 250 |
| `ui_multiseat_freeroam.onPauseHomeRailBuildMultiseatActions(actions, _context, registerButton)` | *(hook)* | 253 |
| `ui_multiseat_freeroam.onSerialize(reason)` | *(hook)* | 280 |
| `ui_multiseat_freeroam.onUiReady()` | *(hook)* | 304 |
| `ui_multiseat_freeroam.openSettings()` |  | 155 |
| `ui_multiseat_freeroam.restoreAfterReload()` |  | 123 |
| `ui_multiseat_freeroam.startSplitscreenFreeroam(levelName)` |  | 129 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSplitScreenStartRequested` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `onDragRaceTimeslipData`, `onDragReset`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`

**Charge les extensions :** `gameplay_multiseat_gamemodeManager`, `gameplay_traffic_source`, `render_splitScreen`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/freeroam.lua`.*
