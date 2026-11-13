# `ui_arrowGPS`

*Fichier : `lua/ge/extensions/ui/arrowGPS.lua` · VM : Game Engine (GE) · 196 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_arrowGPS` : `extensions.load("ui_arrowGPS")`, puis la globale `ui_arrowGPS`

**Dépendances (chargées avant) :** `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_arrowGPS.onExtensionUnloaded()` | *(hook)* | 179 |
| `ui_arrowGPS.onPreRender(dt)` | *(hook)* | 144 |
| `ui_arrowGPS.removeTarget(key)` |  | 68 |
| `ui_arrowGPS.setAppScreenPos(sx, sy)` |  | 128 |
| `ui_arrowGPS.setDepth(depth)` |  | 140 |
| `ui_arrowGPS.setScale(scale)` |  | 133 |
| `ui_arrowGPS.setTarget(key, priority, data)` |  | 54 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/arrowGPS.lua`.*
