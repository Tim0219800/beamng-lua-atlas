# `gameplay_drag_timeslip`

*Fichier : `lua/ge/extensions/gameplay/drag/timeslip.lua` · VM : Game Engine (GE) · 347 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_timeslip` : `extensions.load("gameplay_drag_timeslip")`, puis la globale `gameplay_drag_timeslip`

**Dépendances (chargées avant) :** `gameplay_drag_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_timeslip.createTimeslipData()` |  | 63 |
| `gameplay_drag_timeslip.createTimeslipPanelData()` |  | 304 |
| `gameplay_drag_timeslip.screenshotTimeslip()` |  | 336 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `core_environment.` `getGravity`, `getTemperatureK`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/timeslip.lua`.*
