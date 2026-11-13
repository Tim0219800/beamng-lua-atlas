# `gameplay_race_pacenote`

*Fichier : `lua/ge/extensions/gameplay/race/pacenote.lua` · VM : Game Engine (GE) · 168 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/pacenote")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_race_pacenote")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawDebug(drawMode, clr, extraText)` |  | 116 |
| `C:init(path, name, forceId)` |  | 8 |
| `C:inside(pos)` |  | 59 |
| `C:intersectCorners(fromCorners, toCorners)` |  | 69 |
| `C:onDeserialized(data, oldIdMap)` |  | 108 |
| `C:onSerialize()` |  | 95 |
| `C:setManual(pos, radius, normal)` |  | 34 |
| `C:setNavgraph(navgraphName, fallback)` |  | 42 |
| `C:setNormal(normal)` |  | 25 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/pacenote.lua`.*
