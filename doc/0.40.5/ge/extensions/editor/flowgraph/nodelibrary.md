# `editor_flowgraph_nodelibrary`

*Fichier : `lua/ge/extensions/editor/flowgraph/nodelibrary.lua` · VM : Game Engine (GE) · 1411 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/nodelibrary")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C._sortFunc(a, b)` |  | 796 |
| `C:arrowHelper(cursor, itemSize, doHover, hoverFun)` |  | 1271 |
| `C:checkEmpty(dir, mode)` |  | 837 |
| `C:clear()` |  | 34 |
| `C:createNode()` |  | 127 |
| `C:createNodeFromButon(menuPos, node)` |  | 1214 |
| `C:createStateButton(menuPos, state)` |  | 1177 |
| `C:createVariableButton(var, menuPos, read, fromMgr)` |  | 981 |
| `C:displayDir(dir, menuPos, elementFieldName, elementFunction)` |  | 1054 |
| `C:displayMacro(macroName, macro, menuPos)` |  | 1008 |
| `C:displayNode(dir, menuPos, nodeName, node)` |  | 1194 |
| `C:displayResults(menuPos)` |  | 637 |
| `C:displaySimpleElement(menuPos, text, clickFun, ...)` |  | 1086 |
| `C:displayStateExitButton(menuPos, label)` |  | 1114 |
| `C:displayStateTemplate(dir, menuPos, stateName, state)` |  | 1157 |
| `C:displayVariable(var, menuPos, read, fromMgr)` |  | 934 |
| `C:draw()` |  | 704 |
| `C:drawContent(menuPos, usedForContextMenu)` |  | 563 |
| `C:drawContentAsTreeNodes(menuPos)` | window which shows all available nodes incl drag'n' drop functionality | 185 |
| `C:drawTextFilter(usedForContextMenu)` |  | 66 |
| `C:filterMacroTemplates(filterPins)` |  | 901 |
| `C:filterMacros(dir, filterPins)` |  | 869 |
| `C:filterNodes(dir, filterPins, mode)` |  | 798 |
| `C:filterTemplates(filterPins, mode)` |  | 907 |
| `C:findFlowNodes()` |  | 435 |
| `C:findStateNodes()` |  | 495 |
| `C:findVar(source, sourceName, sourceNameTag)` |  | 456 |
| `C:getFilterType()` |  | 404 |
| `C:hasFoldersOnly(dir)` |  | 46 |
| `C:highlightText(label, highlightText)` |  | 610 |
| `C:init()` |  | 16 |
| `C:linkState(node)` |  | 1139 |
| `C:navigateList(up)` |  | 135 |
| `C:pinsFilter(node)` |  | 720 |
| `C:printDir(dir, name, tagIndex, libtxt)` |  | 1337 |
| `C:printNodesWithTags()` |  | 1308 |
| `C:ratePinSimilarity(a, b)` |  | 1035 |
| `C:recursiveGetTags(dir, list, pins)` |  | 1386 |
| `C:refreshMacro()` |  | 882 |
| `C:refreshStateTemplates()` |  | 889 |
| `C:setNewNodeLinkPin(newNodeLinkPin)` |  | 62 |
| `C:setStatic()` |  | 57 |
| `C:variablePinFilter(var, dir)` |  | 386 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/nodelibrary.lua`.*
