# `gameplay_drift_stuntZones`

*Fichier : `lua/ge/extensions/gameplay/drift/stuntZones.lua` · VM : Game Engine (GE) · 394 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_stuntZones` : `extensions.load("gameplay_drift_stuntZones")`, puis la globale `gameplay_drift_stuntZones`

**Dépendances (chargées avant) :** `gameplay_drift_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_stuntZones.clear()` |  | 215 |
| `gameplay_drift_stuntZones.clearStuntZone(id)` | INTERNAL | 299 |
| `gameplay_drift_stuntZones.getDecalColor(cooldownPerc, filledPerc, t)` |  | 63 |
| `gameplay_drift_stuntZones.getDrawLines()` | TEST | 333 |
| `gameplay_drift_stuntZones.getDriftDebugInfo()` |  | 349 |
| `gameplay_drift_stuntZones.getGreenColor()` |  | 337 |
| `gameplay_drift_stuntZones.getLineThickness(linePos)` |  | 353 |
| `gameplay_drift_stuntZones.getRedColor()` |  | 345 |
| `gameplay_drift_stuntZones.getStuntZones()` |  | 312 |
| `gameplay_drift_stuntZones.getWhiteColor()` |  | 341 |
| `gameplay_drift_stuntZones.increaseDecalPool(max)` |  | 48 |
| `gameplay_drift_stuntZones.onAnyStuntZoneAccomplished(data)` | *(hook)* | 361 |
| `gameplay_drift_stuntZones.onDriftDebugChanged()` | *(hook)* | 357 |
| `gameplay_drift_stuntZones.onDriftStatusChanged(isDrifting)` | *(hook)* | 289 |
| `gameplay_drift_stuntZones.onExtensionUnloaded()` | *(hook)* | 316 |
| `gameplay_drift_stuntZones.onSerialize()` | *(hook)* | 320 |
| `gameplay_drift_stuntZones.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 167 |
| `gameplay_drift_stuntZones.onVehicleDestroyed(vehId)` | *(hook)* | 325 |
| `gameplay_drift_stuntZones.reset()` |  | 209 |
| `gameplay_drift_stuntZones.setStuntZones(zones)` |  | 224 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onNearStuntZoneFirst`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/stuntZones.lua`.*
