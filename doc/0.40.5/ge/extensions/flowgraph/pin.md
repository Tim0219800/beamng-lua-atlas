# `flowgraph_pin`

*Fichier : `lua/ge/extensions/flowgraph/pin.lua` · VM : Game Engine (GE) · 398 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/pin")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("flowgraph_pin")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_draw_in(builder, style, alpha, simpleDraw, constValue, outWidth)` |  | 99 |
| `C:_draw_out(builder, style, alpha, simpleDraw, const, outWidth)` |  | 132 |
| `C:_getCalculatedWidth(simpleDraw)` |  | 164 |
| `C:_onLink(link)` |  | 347 |
| `C:_onUnlink(link)` |  | 356 |
| `C:draw(builder, style, isHeader, constValue, outWidth)` |  | 262 |
| `C:drawTooltip(mgr)` |  | 188 |
| `C:getFirstConnectedLink()` |  | 79 |
| `C:getTableType()` |  | 156 |
| `C:getTypeWithImpulseAndChain()` | getter for type with inclusion of impulse (mostly for drawing icons) | 152 |
| `C:highlightLinks()` |  | 256 |
| `C:hoverDraw(mgr)` |  | 299 |
| `C:init(graph, node, direction, type, name, default, description)` |  | 13 |
| `C:isActive()` | checks if the pin is usable when creating new links. Active = pin usable, drawn / inactive = in background and unusable | 180 |
| `C:isUsed()` |  | 369 |
| `C:showContextMenu(menuPos, main)` |  | 306 |
| `C:valueSetQuat(v)` |  | 383 |
| `C:valueSetVec3(v)` |  | 373 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/pin.lua`.*
