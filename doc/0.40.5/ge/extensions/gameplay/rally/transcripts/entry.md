# `gameplay_rally_transcripts_entry`

*Fichier : `lua/ge/extensions/gameplay/rally/transcripts/entry.lua` · VM : Game Engine (GE) · 534 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/transcripts/entry")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_transcripts_entry")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:capture_data()` |  | 61 |
| `C:debugDrawText(hovered)` |  | 43 |
| `C:drawDebug(is_hovered, is_selected)` |  | 249 |
| `C:drawDebugCaptureData(is_hovered, is_selected)` |  | 331 |
| `C:drawDebugVehicleData(is_hovered, is_selected)` |  | 254 |
| `C:get_grouped_captures()` |  | 95 |
| `C:init(path, name, forceId)` |  | 11 |
| `C:isUsable()` |  | 39 |
| `C:lookAtMe()` |  | 523 |
| `C:onDeserialized(data, oldIdMap)` |  | 233 |
| `C:onSerialize()` |  | 215 |
| `C:playCameraPath()` |  | 517 |
| `C:setShow(val)` |  | 35 |
| `C:toggleShow()` |  | 31 |
| `C:vehiclePos()` |  | 51 |
| `C:vehicleQuat()` |  | 56 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/transcripts/entry.lua`.*
