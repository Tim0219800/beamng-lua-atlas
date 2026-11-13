# `flowgraph_basenode`

*Fichier : `lua/ge/extensions/flowgraph/basenode.lua` · VM : Game Engine (GE) · 1557 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `flowgraph_basenode` : `extensions.load("flowgraph_basenode")`, puis la globale `flowgraph_basenode`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_basenode.createBase(...)` |  | 1533 |
| `flowgraph_basenode.use(mgr, graph, forceId, derivedClass)` |  | 1541 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:HSVtoRGB(h, s, v)` |  | 647 |
| `C:__executionStarted()` |  | 622 |
| `C:__executionStopped()` |  | 615 |
| `C:__getNodeError(category)` |  | 1509 |
| `C:__onDeserialized(nodeData)` |  | 1381 |
| `C:__onSerialize()` |  | 1298 |
| `C:__setNodeError(category, err)` |  | 1497 |
| `C:_destroy()` |  | 105 |
| `C:_doubleClicked()` |  | 574 |
| `C:_drawMiddle(builder, style, drawType)` |  | 824 |
| `C:_executionStarted()` |  | 620 |
| `C:_executionStopped()` |  | 613 |
| `C:_onClear()` |  | 609 |
| `C:_onDeserialized(nodeData)` |  | 1378 |
| `C:_onLink(link)` |  | 584 |
| `C:_onNodeReset()` |  | 336 |
| `C:_onSerialize(res)` |  | 1295 |
| `C:_onSetHardcode(pin, value, forceType)` |  | 598 |
| `C:_onUnlink(link)` |  | 591 |
| `C:_onUnsetHardcode(pin)` |  | 605 |
| `C:_postDeserialize()` |  | 1515 |
| `C:_postInit()` |  | 135 |
| `C:_preInit()` |  | 113 |
| `C:_setHardcodedDummyInputPin(pin, val, forceType)` |  | 1251 |
| `C:_setupTimeline(beginTime, endTime)` |  | 1283 |
| `C:_workDynamicOnce()` |  | 351 |
| `C:_workDynamicRepeat()` |  | 321 |
| `C:addBehaviour(behaviour)` |  | 234 |
| `C:addedToGraph(graph)` |  | 109 |
| `C:alignToGrid(x, y)` |  | 1520 |
| `C:autoCreatePin(direction, type, name, default, description, extra, fixed)` | used for automatically created | 251 |
| `C:checkAutomatedFlow()` |  | 397 |
| `C:createPin(direction, type, name, default, description, autoNumber, extra, fixed)` |  | 465 |
| `C:createResetPin()` |  | 301 |
| `C:customContextMenu()` |  | 1096 |
| `C:destroy()` |  | 102 |
| `C:draw(builder, style)` |  | 892 |
| `C:drawHeader(builder, style)` |  | 653 |
| `C:drawMiddle(builder, style)` |  | 888 |
| `C:drawTooltip()` |  | 710 |
| `C:getData()` |  | 86 |
| `C:getLinks()` |  | 634 |
| `C:getPinIn()` |  | 94 |
| `C:getPinInConstValue(pinName)` |  | 1086 |
| `C:handleNodeCategories()` |  | 169 |
| `C:hasFlowPins()` |  | 279 |
| `C:hasInputPins()` |  | 290 |
| `C:hideProperties()` |  | 572 |
| `C:init(mgr, graph, forceId)` |  | 36 |
| `C:isFlowActive()` |  | 562 |
| `C:onDurationFinished()` |  | 439 |
| `C:onDurationInactive()` |  | 435 |
| `C:onDurationStarted()` |  | 437 |
| `C:onLink(link)` |  | 581 |
| `C:onNodeReset()` |  | 334 |
| `C:onSetHardcode(pin, value, forceType)` |  | 595 |
| `C:onUnlink(link)` |  | 588 |
| `C:onUnsetHardcode(pin)` |  | 602 |
| `C:overDraw()` |  | 800 |
| `C:postInit()` |  | 316 |
| `C:removeBehaviour(behaviour)` |  | 243 |
| `C:removePin(pin)` | TODO: care about links, some other stuff i might have missed? | 503 |
| `C:removeResetPin()` |  | 309 |
| `C:renamePin(pin, newName)` |  | 528 |
| `C:representsGraph()` |  | 110 |
| `C:setData(data)` |  | 90 |
| `C:setDurationState(state)` |  | 389 |
| `C:setDynamicMode(mode)` |  | 453 |
| `C:setPinIn(data)` |  | 98 |
| `C:shiftPin(idInList, direction)` |  | 540 |
| `C:showContextMenu(menuPos)` |  | 1097 |
| `C:showProperties()` |  | 571 |
| `C:toString()` |  | 1513 |
| `C:toggleDynamicMode()` |  | 442 |
| `C:trigger()` |  | 549 |
| `C:updateEditorPosition()` | updating the node position should only happen when you open the manager in the editor. | 1366 |
| `C:updateNodePosition()` |  | 1355 |
| `C:work(args)` |  | 318 |
| `C:workOnce()` |  | 349 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/basenode.lua`.*
