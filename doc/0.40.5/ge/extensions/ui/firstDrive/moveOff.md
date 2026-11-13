# `ui_firstDrive_moveOff`

*Fichier : `lua/ge/extensions/ui/firstDrive/moveOff.lua` · VM : Game Engine (GE) · 665 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_firstDrive_moveOff` : `extensions.load("ui_firstDrive_moveOff")`, puis la globale `ui_firstDrive_moveOff`

**Dépendances (chargées avant) :** `ui_appContainers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_firstDrive_moveOff.getEnabled()` |  | 654 |
| `ui_firstDrive_moveOff.getState()` |  | 588 |
| `ui_firstDrive_moveOff.onClientEndMission()` | *(hook)* | 649 |
| `ui_firstDrive_moveOff.onExtensionUnloaded()` | *(hook)* | 645 |
| `ui_firstDrive_moveOff.onSettingsChanged()` | *(hook)* | 636 |
| `ui_firstDrive_moveOff.onUpdate(dtReal)` | *(hook)* | 592 |
| `ui_firstDrive_moveOff.onVehicleDestroyed(vehicleId)` | *(hook)* | 632 |
| `ui_firstDrive_moveOff.onVehicleReplaced(vehicleId)` | *(hook)* | 632 |
| `ui_firstDrive_moveOff.onVehicleSwitched(_, newVehicleId, player)` | *(hook)* | 627 |
| `ui_firstDrive_moveOff.setEnabled(value)` |  | 576 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onFirstDriveMoveOffSectionCompleted`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/firstDrive/moveOff.lua`.*
