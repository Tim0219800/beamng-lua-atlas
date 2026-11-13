# `flowgraph_nodes_string_stringconcat`

*Fichier : `lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua` · VM : Game Engine (GE) · 123 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/string/stringconcat")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 30 |
| `C:cleanupPins()` | make sure we have one (and only one) empty pin available at the end of our inPins<br> also make sure we preserve pins that have become empty inbetween the rest of pins (don't remove those) | 85 |
| `C:drawMiddle(builder, style)` |  | 119 |
| `C:init()` |  | 23 |
| `C:onLink(link)` |  | 72 |
| `C:onUnlink(link)` |  | 77 |
| `C:updateCache()` | compare the list of concat inputs, return false if they're the same as last time, return true if any input has changed<br> also make sure to update the inputCache (which will be used for the comparison next time) | 36 |
| `C:work()` |  | 65 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua`.*
