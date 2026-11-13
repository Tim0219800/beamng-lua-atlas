# `editor_flowgraph_references`

*Fichier : `lua/ge/extensions/editor/flowgraph/references.lua` · VM : Game Engine (GE) · 615 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/references")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:addPinsAndBehavioursForCategory(nodeName, category)` | because some pins are only created during runtime, we need to make mockups for the nodeTable (Same logic as in basenode) | 232 |
| `C:checkFilesForNodes(initialCheck)` |  | 82 |
| `C:createNodeTable()` |  | 35 |
| `C:draw()` |  | 343 |
| `C:drawViewMode1()` |  | 376 |
| `C:drawViewMode2()` |  | 497 |
| `C:fillNodeTable(flowgraphDirectory)` | goes through all flowgraphs in directory | 131 |
| `C:filterNodes()` |  | 179 |
| `C:findNodesRecursive(nodeDirectory)` | recursively goes through node directories | 47 |
| `C:highlightText(label, highlightText)` | this is copied almost completely from nodeLibrary | 294 |
| `C:init()` |  | 21 |
| `C:pinExists(nodeName, direction, pinName)` |  | 278 |
| `C:sortCategories()` |  | 116 |
| `C:sortProjects()` | sorts projects for most occurrences | 326 |
| `C:updateNodeOccurrence(nodeName, fileName)` | updates nodeTable for occurence of node in project | 146 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/references.lua`.*
