---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/dragAi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mini drag-racing AI: full throttle, proportional steering toward a target point, then braking and handbrake on arrival. The state goes from 'ready' (throttle engaged, handbrake applied) to 'go' (handbrake released, drives to the target), 'stopping', 'finished'. It drives the vehicle by sending input events (input.event).
--- Access: extension `dragAi`: `extensions.load (vehicle VM)("dragAi")`, then the global `dragAi`
---@class dragAi
dragAi = {}

--- Switches to the 'ready' state: applies full throttle.
---Source: lua/vehicle/extensions/dragAi.lua:10
function dragAi.getReady() end

--- Switches to the 'go' state: releases the handbrake, the loop drives toward the target.
---Source: lua/vehicle/extensions/dragAi.lua:14
function dragAi.go() end

--- Vehicle reset hook: 'idle' state, throttle at zero, handbrake applied.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/dragAi.lua:61
function dragAi.reset() end

--- Sets the target point to reach.
---Source: lua/vehicle/extensions/dragAi.lua:19
---@param targetPos vec3 World position of the target (x,y used).
function dragAi.setTarget(targetPos) end

--- Called every frame: runs the driving state machine.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/dragAi.lua:23
---@param dt number Time step in seconds (unused).
function dragAi.updateGFX(dt) end

