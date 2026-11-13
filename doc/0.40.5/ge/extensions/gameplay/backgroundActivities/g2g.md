# `gameplay_backgroundActivities_g2g`

*Fichier : `lua/ge/extensions/gameplay/backgroundActivities/g2g.lua` · VM : Game Engine (GE) · 146 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_backgroundActivities_g2g` : `extensions.load("gameplay_backgroundActivities_g2g")`, puis la globale `gameplay_backgroundActivities_g2g`

**Dépendances (chargées avant) :** `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_backgroundActivities_g2g.activate()` |  | 13 |
| `gameplay_backgroundActivities_g2g.activateFinished()` |  | 30 |
| `gameplay_backgroundActivities_g2g.deactivate()` |  | 35 |
| `gameplay_backgroundActivities_g2g.getVehicleOptions()` |  | 89 |
| `gameplay_backgroundActivities_g2g.isActive()` |  | 70 |
| `gameplay_backgroundActivities_g2g.onCareerActive(enabled)` | *(hook)* | 81 |
| `gameplay_backgroundActivities_g2g.onClientEndMission()` | *(hook)* | 62 |
| `gameplay_backgroundActivities_g2g.onDeserialized()` | *(hook)* | 78 |
| `gameplay_backgroundActivities_g2g.onSerialize()` | *(hook)* | 74 |
| `gameplay_backgroundActivities_g2g.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 59 |
| `gameplay_backgroundActivities_g2g.onVehicleSwitched()` | *(hook)* | 66 |
| `gameplay_backgroundActivities_g2g.toggleActive()` |  | 50 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/backgroundActivities/g2g.lua`.*
