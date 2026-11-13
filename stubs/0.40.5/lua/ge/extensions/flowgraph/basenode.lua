---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/basenode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `flowgraph_basenode` : `extensions.load("flowgraph_basenode")`, puis la globale `flowgraph_basenode`
---@class flowgraph_basenode
flowgraph_basenode = {}

---Source : lua/ge/extensions/flowgraph/basenode.lua:1533
---@param ... any
function flowgraph_basenode.createBase(...) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1541
---@param mgr any
---@param graph any
---@param forceId any
---@param derivedClass any
function flowgraph_basenode.use(mgr, graph, forceId, derivedClass) end

--- Classe locale `C` de lua/ge/extensions/flowgraph/basenode.lua
---@class flowgraph_basenode_C
local flowgraph_basenode_C = {}

---Source : lua/ge/extensions/flowgraph/basenode.lua:647
---@param h any
---@param s any
---@param v any
function flowgraph_basenode_C:HSVtoRGB(h, s, v) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:622
function flowgraph_basenode_C:__executionStarted() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:615
function flowgraph_basenode_C:__executionStopped() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1509
---@param category any
function flowgraph_basenode_C:__getNodeError(category) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1381
---@param nodeData any
function flowgraph_basenode_C:__onDeserialized(nodeData) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1298
function flowgraph_basenode_C:__onSerialize() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1497
---@param category any
---@param err any
function flowgraph_basenode_C:__setNodeError(category, err) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:105
function flowgraph_basenode_C:_destroy() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:574
function flowgraph_basenode_C:_doubleClicked() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:824
---@param builder any
---@param style any
---@param drawType any
function flowgraph_basenode_C:_drawMiddle(builder, style, drawType) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:620
function flowgraph_basenode_C:_executionStarted() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:613
function flowgraph_basenode_C:_executionStopped() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:609
function flowgraph_basenode_C:_onClear() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1378
---@param nodeData any
function flowgraph_basenode_C:_onDeserialized(nodeData) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:584
---@param link any
function flowgraph_basenode_C:_onLink(link) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:336
function flowgraph_basenode_C:_onNodeReset() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1295
---@param res any
function flowgraph_basenode_C:_onSerialize(res) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:598
---@param pin any
---@param value any
---@param forceType any
function flowgraph_basenode_C:_onSetHardcode(pin, value, forceType) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:591
---@param link any
function flowgraph_basenode_C:_onUnlink(link) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:605
---@param pin any
function flowgraph_basenode_C:_onUnsetHardcode(pin) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1515
function flowgraph_basenode_C:_postDeserialize() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:135
function flowgraph_basenode_C:_postInit() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:113
function flowgraph_basenode_C:_preInit() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1251
---@param pin any
---@param val any
---@param forceType any
function flowgraph_basenode_C:_setHardcodedDummyInputPin(pin, val, forceType) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1283
---@param beginTime any
---@param endTime any
function flowgraph_basenode_C:_setupTimeline(beginTime, endTime) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:351
function flowgraph_basenode_C:_workDynamicOnce() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:321
function flowgraph_basenode_C:_workDynamicRepeat() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:234
---@param behaviour any
function flowgraph_basenode_C:addBehaviour(behaviour) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:109
---@param graph any
function flowgraph_basenode_C:addedToGraph(graph) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1520
---@param x any
---@param y any
function flowgraph_basenode_C:alignToGrid(x, y) end

--- used for automatically created
---Source : lua/ge/extensions/flowgraph/basenode.lua:251
---@param direction any
---@param type any
---@param name any
---@param default any
---@param description any
---@param extra any
---@param fixed any
function flowgraph_basenode_C:autoCreatePin(direction, type, name, default, description, extra, fixed) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:397
function flowgraph_basenode_C:checkAutomatedFlow() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:465
---@param direction any
---@param type any
---@param name any
---@param default any
---@param description any
---@param autoNumber any
---@param extra any
---@param fixed any
function flowgraph_basenode_C:createPin(direction, type, name, default, description, autoNumber, extra, fixed) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:301
function flowgraph_basenode_C:createResetPin() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1096
function flowgraph_basenode_C:customContextMenu() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:102
function flowgraph_basenode_C:destroy() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:892
---@param builder any
---@param style any
function flowgraph_basenode_C:draw(builder, style) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:653
---@param builder any
---@param style any
function flowgraph_basenode_C:drawHeader(builder, style) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:888
---@param builder any
---@param style any
function flowgraph_basenode_C:drawMiddle(builder, style) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:710
function flowgraph_basenode_C:drawTooltip() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:86
function flowgraph_basenode_C:getData() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:634
function flowgraph_basenode_C:getLinks() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:94
function flowgraph_basenode_C:getPinIn() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1086
---@param pinName any
function flowgraph_basenode_C:getPinInConstValue(pinName) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:169
function flowgraph_basenode_C:handleNodeCategories() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:279
function flowgraph_basenode_C:hasFlowPins() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:290
function flowgraph_basenode_C:hasInputPins() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:572
function flowgraph_basenode_C:hideProperties() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:36
---@param mgr any
---@param graph any
---@param forceId any
function flowgraph_basenode_C:init(mgr, graph, forceId) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:562
function flowgraph_basenode_C:isFlowActive() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:439
function flowgraph_basenode_C:onDurationFinished() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:435
function flowgraph_basenode_C:onDurationInactive() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:437
function flowgraph_basenode_C:onDurationStarted() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:581
---@param link any
function flowgraph_basenode_C:onLink(link) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:334
function flowgraph_basenode_C:onNodeReset() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:595
---@param pin any
---@param value any
---@param forceType any
function flowgraph_basenode_C:onSetHardcode(pin, value, forceType) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:588
---@param link any
function flowgraph_basenode_C:onUnlink(link) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:602
---@param pin any
function flowgraph_basenode_C:onUnsetHardcode(pin) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:800
function flowgraph_basenode_C:overDraw() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:316
function flowgraph_basenode_C:postInit() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:243
---@param behaviour any
function flowgraph_basenode_C:removeBehaviour(behaviour) end

--- TODO: care about links, some other stuff i might have missed?
---Source : lua/ge/extensions/flowgraph/basenode.lua:503
---@param pin any
function flowgraph_basenode_C:removePin(pin) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:309
function flowgraph_basenode_C:removeResetPin() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:528
---@param pin any
---@param newName any
function flowgraph_basenode_C:renamePin(pin, newName) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:110
function flowgraph_basenode_C:representsGraph() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:90
---@param data any
function flowgraph_basenode_C:setData(data) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:389
---@param state any
function flowgraph_basenode_C:setDurationState(state) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:453
---@param mode any
function flowgraph_basenode_C:setDynamicMode(mode) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:98
---@param data any
function flowgraph_basenode_C:setPinIn(data) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:540
---@param idInList any
---@param direction any
function flowgraph_basenode_C:shiftPin(idInList, direction) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1097
---@param menuPos any
function flowgraph_basenode_C:showContextMenu(menuPos) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:571
function flowgraph_basenode_C:showProperties() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1513
function flowgraph_basenode_C:toString() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:442
function flowgraph_basenode_C:toggleDynamicMode() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:549
function flowgraph_basenode_C:trigger() end

--- updating the node position should only happen when you open the manager in the editor.
---Source : lua/ge/extensions/flowgraph/basenode.lua:1366
function flowgraph_basenode_C:updateEditorPosition() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:1355
function flowgraph_basenode_C:updateNodePosition() end

---Source : lua/ge/extensions/flowgraph/basenode.lua:318
---@param args any
function flowgraph_basenode_C:work(args) end

---Source : lua/ge/extensions/flowgraph/basenode.lua:349
function flowgraph_basenode_C:workOnce() end

