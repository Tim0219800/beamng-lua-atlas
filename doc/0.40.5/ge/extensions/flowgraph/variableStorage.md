# `flowgraph_variableStorage`

*Fichier : `lua/ge/extensions/flowgraph/variableStorage.lua` · VM : Game Engine (GE) · 407 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/variableStorage")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("flowgraph_variableStorage")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` |  | 340 |
| `C:_onClear()` |  | 336 |
| `C:_onDeserialized(data)` |  | 372 |
| `C:_onSerialize()` |  | 351 |
| `C:addVariable(name, value, type, mergeStrat, fixedType, undeletable)` | returns false if variable already exists, otherwise true | 119 |
| `C:change(name, value)` | returns false if variable nonexistent or value is nil, otherwise true | 314 |
| `C:changeBase(name, value)` | returns false if variable nonexistent or type mismatch, otherwise true | 291 |
| `C:changeCustomVariableOrder(name, newIdx)` | moves the variable with "name" to be after "newIdx" index (relative to original order indexes) | 101 |
| `C:changeInstant(name, value)` | returns false if variable nonexistent, otherwise true | 305 |
| `C:clear()` |  | 82 |
| `C:finalizeChanges()` |  | 328 |
| `C:get(name)` | second return value is false if the variable is nonexistent, otherwise true | 57 |
| `C:getFull(name)` | second return value is false if the variable is nonexistent, otherwise true | 70 |
| `C:getMaxSortIndex()` |  | 111 |
| `C:getMergeStrats(type)` |  | 48 |
| `C:getName()` |  | 40 |
| `C:getTypes()` |  | 44 |
| `C:init(mgr)` |  | 25 |
| `C:refreshSortedVariableNames()` |  | 88 |
| `C:removeVariable(name)` | returns false if variable nonexistent or undeletable, otherwise true | 236 |
| `C:renameVariable(name, newName)` | returns false if already exists, otherwise true | 255 |
| `C:setFixedType(name, fixedType)` | returns false if variable nonexistent, otherwise true | 208 |
| `C:setKeepAfterStop(name, keep)` | returns false if variable nonexistent, otherwise true | 226 |
| `C:setMergeStrat(name, strat)` | returns false if variable nonexistent, otherwise true | 140 |
| `C:setMonitor(name, monitor)` | returns false if variable nonexistent, otherwise true | 217 |
| `C:updateType(name, type)` | returns false if variable nonexistent or has fixed type, otherwise true | 163 |
| `C:variableExists(name)` |  | 52 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/variableStorage.lua`.*
