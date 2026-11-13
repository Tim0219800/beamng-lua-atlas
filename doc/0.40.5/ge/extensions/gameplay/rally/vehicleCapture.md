# `gameplay_rally_vehicleCapture`

*Fichier : `lua/ge/extensions/gameplay/rally/vehicleCapture.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/vehicleCapture")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_vehicleCapture")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:capture()` |  | 52 |
| `C:drawDebug()` |  | 83 |
| `C:init(vehicle, missionDir)` |  | 12 |
| `C:truncateCapturesFile()` |  | 23 |
| `C:writeCaptures(force)` |  | 32 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/vehicleCapture.lua`.*
