---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua
---@class flowgraph_nodes_gameplay_rally_rallySuperCountdown_C
local flowgraph_nodes_gameplay_rally_rallySuperCountdown_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:145
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:_executionStarted() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:169
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:_executionStopped() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1030
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:canSkipCountdown() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:649
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:checkStagingAt10s() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:572
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:configureCountdownSettings() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:980
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:drawDebugVisualization() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:995
---@param builder any
---@param style any
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:drawMiddle(builder, style) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:513
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:enableRallyManagerPacenoteProcessing() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:532
---@param secs any
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:enqueuePauseSecs(secs) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:522
---@param pacenote_name any
---@param audioLenOffset any
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:enqueueSystemPacenote(pacenote_name, audioLenOffset) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:755
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:finishCountdownImmediately() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:217
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:freezeVehicle() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:396
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getCurrentEpochTime() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:385
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getRallyLoopManager() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:408
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getScheduledEventTime() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:942
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getWallClockTime() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:380
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:hasCrossedStartLine() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:81
---@param mgr any
---@param ... any
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:init(mgr, ...) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:767
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isFlowActive() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:375
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isInLaunchZone() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:365
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isNearPlane() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:771
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isOngoing() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:763
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isOriginalSchedule() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:370
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isStaged() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:360
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isStopped() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:775
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isWaiting() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:689
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:monitorCountdown() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1100
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:onGameplayInteract() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:781
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:processWarnings() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:542
---@param min any
---@param max any
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:randomPauseSecs(min, max) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:441
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:requestReschedule() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:174
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:reset() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:975
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldDrawDebug() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:505
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldPlayVoiceCountdown() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:509
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldShowVisualCountdown() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:565
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldStartTimer() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:547
---@param msg any
---@param big any
---@param duration any
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:show(msg, big, duration) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1070
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:skipToCountdown() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:606
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:startTimer() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:191
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:stopTimer() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:225
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:unfreezeVehicle() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:827
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateCountdownStateMachine() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:307
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateProximityState() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:256
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateStartPosition() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:643
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateTimesAfterReschedule() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:233
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateVehicleData() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1106
---@param args any
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:work(args) end

