---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua
---@class flowgraph_nodes_mission_ARunForLife_C
local flowgraph_nodes_mission_ARunForLife_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:380
---@param buff any
---@param pos any
function flowgraph_nodes_mission_ARunForLife_C:activateBuff(buff, pos) end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:458
function flowgraph_nodes_mission_ARunForLife_C:activatePropsAndBuffs() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:732
function flowgraph_nodes_mission_ARunForLife_C:calcMedal() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:326
function flowgraph_nodes_mission_ARunForLife_C:checkBuffAvailabilty() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:355
function flowgraph_nodes_mission_ARunForLife_C:checkCoinForRepair() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:285
function flowgraph_nodes_mission_ARunForLife_C:checkLose() end

--- Check the different triggers (jump, gate, buffs)
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:701
function flowgraph_nodes_mission_ARunForLife_C:checkTriggers() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:692
function flowgraph_nodes_mission_ARunForLife_C:coinBuff() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:609
function flowgraph_nodes_mission_ARunForLife_C:createDecalPool() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:363
---@param buff any
function flowgraph_nodes_mission_ARunForLife_C:deactivateBuff(buff) end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:395
---@param propName any
function flowgraph_nodes_mission_ARunForLife_C:deactivateProp(propName) end

--- Will deactivate props that are out of the camera
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:403
function flowgraph_nodes_mission_ARunForLife_C:deactivatePropsAndBuffs() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:340
function flowgraph_nodes_mission_ARunForLife_C:doBuffsTime() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:278
function flowgraph_nodes_mission_ARunForLife_C:doScore() end

--- Draw arrows and crosses
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:627
function flowgraph_nodes_mission_ARunForLife_C:drawDecals() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:428
---@param name any
function flowgraph_nodes_mission_ARunForLife_C:getBuffByName(name) end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:376
---@param baseTime any
function flowgraph_nodes_mission_ARunForLife_C:getBuffNextTime(baseTime) end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:436
---@param name any
function flowgraph_nodes_mission_ARunForLife_C:getPropByName(name) end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:603
---@param amount any
function flowgraph_nodes_mission_ARunForLife_C:increaseDecalPool(amount) end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:133
---@param mgr any
---@param ... any
function flowgraph_nodes_mission_ARunForLife_C:init(mgr, ...) end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:211
function flowgraph_nodes_mission_ARunForLife_C:linkContainers() end

--- Because every props rotation are different, because some props are special, here i'm defining some of the "corrected properties"
--- or why they're special
---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:138
function flowgraph_nodes_mission_ARunForLife_C:linkProps() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:233
function flowgraph_nodes_mission_ARunForLife_C:moveCamera() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:528
function flowgraph_nodes_mission_ARunForLife_C:moveTriggers() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:304
function flowgraph_nodes_mission_ARunForLife_C:pushBall() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:686
function flowgraph_nodes_mission_ARunForLife_C:repairBuff() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:749
function flowgraph_nodes_mission_ARunForLife_C:resetValues() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:786
function flowgraph_nodes_mission_ARunForLife_C:setParameters() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:571
function flowgraph_nodes_mission_ARunForLife_C:setReferences() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:673
function flowgraph_nodes_mission_ARunForLife_C:slowDownCar() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:264
function flowgraph_nodes_mission_ARunForLife_C:tpContainers() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:546
function flowgraph_nodes_mission_ARunForLife_C:updateValues() end

---Source : lua/ge/extensions/flowgraph/nodes/mission/ARunForLife.lua:807
function flowgraph_nodes_mission_ARunForLife_C:work() end

