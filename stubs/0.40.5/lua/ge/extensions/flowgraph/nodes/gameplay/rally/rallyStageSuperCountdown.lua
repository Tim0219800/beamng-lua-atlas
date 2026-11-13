---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua
---@class flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C
local flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:114
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:_executionStarted() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:124
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:_executionStopped() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:279
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:calculateScheduledEventTime() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:270
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:configureCountdownSettings() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:260
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:drawDebugVisualization() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:572
---@param builder any
---@param style any
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:drawMiddle(builder, style) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:389
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:enableRallyManagerPacenoteProcessing() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:379
---@param pacenoteName any
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:enqueueSystemPacenote(pacenoteName) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:415
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:finishCountdown() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:292
---@param showingGo any
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getCountdownPhase(showingGo) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:331
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getRallyClockData() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:288
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getTimeUntilLaunch() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:327
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getWallClockTime() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:249
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:hasCrossedStartLine() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:67
---@param mgr any
---@param ... any
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:init(mgr, ...) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:128
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:reset() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:530
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:sendRallyDataUpdate() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:256
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldDrawDebug() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:375
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldPlaySoundEffects() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:371
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldPlayVoiceCountdown() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:367
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldShowVisualCountdown() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:399
---@param msg any
---@param big any
---@param duration any
---@param luaCall any
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:show(msg, big, duration, luaCall) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:352
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:startTimer() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:137
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:stopTimer() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:442
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:triggerFalseStart() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:335
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:unfreezeVehicle() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:319
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateClock() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:459
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateCountdown() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:519
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateGoDisplay() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:204
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateProximityState() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:156
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateStartPosition() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:184
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateVehicleData() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:579
---@param args any
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:work(args) end

