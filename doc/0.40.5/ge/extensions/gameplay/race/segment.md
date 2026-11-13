# `gameplay_race_segment`

*Fichier : `lua/ge/extensions/gameplay/race/segment.lua` · VM : Game Engine (GE) · 250 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/segment")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_race_segment")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addCapsule(pos, radius, name, index)` |  | 78 |
| `C:capsuleContains(point, id)` |  | 96 |
| `C:checkMode()` |  | 43 |
| `C:contains(point, state)` |  | 107 |
| `C:drawDebug(drawMode)` |  | 176 |
| `C:fillNavpath()` |  | 67 |
| `C:finished(point, state)` |  | 139 |
| `C:getBeNavpath()` |  | 23 |
| `C:getCapsuleCount()` |  | 86 |
| `C:getCapsuleNode(i)` |  | 87 |
| `C:getFrom()` |  | 32 |
| `C:getTo()` |  | 33 |
| `C:init(path, name, forceId)` |  | 11 |
| `C:isValid()` |  | 240 |
| `C:onDeserialized(data, oldIdMap)` |  | 160 |
| `C:onSerialize()` |  | 144 |
| `C:removeCapsule(index)` |  | 82 |
| `C:setFrom(from)` |  | 34 |
| `C:setMode(mode)` |  | 55 |
| `C:setTo(to)` |  | 38 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/segment.lua`.*
