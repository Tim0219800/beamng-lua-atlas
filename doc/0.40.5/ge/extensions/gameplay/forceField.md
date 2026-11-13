# `gameplay_forceField`

*Fichier : `lua/ge/extensions/gameplay/forceField.lua` · VM : Game Engine (GE) · 113 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_forceField` : `extensions.load("gameplay_forceField")`, puis la globale `gameplay_forceField`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_forceField.activate()` |  | 17 |
| `gameplay_forceField.deactivate(silent)` |  | 24 |
| `gameplay_forceField.getForceMultiplier()` |  | 95 |
| `gameplay_forceField.isActive()` |  | 74 |
| `gameplay_forceField.onCareerActive(enabled)` | *(hook)* | 85 |
| `gameplay_forceField.onClientEndMission()` | *(hook)* | 66 |
| `gameplay_forceField.onDeserialized()` | *(hook)* | 82 |
| `gameplay_forceField.onSerialize()` | *(hook)* | 78 |
| `gameplay_forceField.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 45 |
| `gameplay_forceField.onVehicleSwitched()` | *(hook)* | 70 |
| `gameplay_forceField.setForceMultiplier(factor)` |  | 91 |
| `gameplay_forceField.toggleActive()` |  | 36 |

## Appels vers le moteur (C++)

- `be:` `getObject`, `getObjectCount`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/forceField.lua`.*
