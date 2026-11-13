# `gameplay_rally_recceSettings`

*Fichier : `lua/ge/extensions/gameplay/rally/recceSettings.lua` · VM : Game Engine (GE) · 145 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/recceSettings")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_recceSettings")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_reset()` |  | 23 |
| `C:cornerCallStyleNames()` |  | 90 |
| `C:defaultCornerCallStyleName()` |  | 79 |
| `C:getCornerCallStyle()` |  | 128 |
| `C:getCornerCallStyleName()` |  | 125 |
| `C:getLastLoadState(level)` |  | 117 |
| `C:getLastMissionId(level)` |  | 109 |
| `C:init()` |  | 17 |
| `C:load()` |  | 38 |
| `C:loadCornerAngles()` |  | 29 |
| `C:onDeserialized(data)` |  | 98 |
| `C:onSerialize()` |  | 69 |
| `C:save()` |  | 64 |
| `C:setCornerCallStyleName(style_name)` |  | 121 |
| `C:setLastLoadState(level, state)` |  | 113 |
| `C:setLastMissionId(level, id)` |  | 105 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/recceSettings.lua`.*
