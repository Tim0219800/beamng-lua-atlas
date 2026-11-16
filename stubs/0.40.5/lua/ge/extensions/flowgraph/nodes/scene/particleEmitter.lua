---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_particleEmitter_C
local flowgraph_nodes_scene_particleEmitter_C = {}

--- After the trigger: if the input flow is false and the emitter is shown, tries to hide it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:77
function flowgraph_nodes_scene_particleEmitter_C:_afterTrigger() end

--- On stop: removes the object from the editor tree if possible, deletes it and resets the state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:83
function flowgraph_nodes_scene_particleEmitter_C:_executionStopped() end

--- Creates the ParticleEmitterNode (canSave = false) and registers it under the given name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:33
---@param objectName any name of the object in the scene
function flowgraph_nodes_scene_particleEmitter_C:createObject(objectName) end

--- Called when the node is destroyed: deletes the emitter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:147
function flowgraph_nodes_scene_particleEmitter_C:destroy() end

--- Reads position/radius/color from the pins with default values (radius 2, color {1,0,0,0.8}).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:96
function flowgraph_nodes_scene_particleEmitter_C:fillFields() end

--- Hides the object (hidden = true) and sets shown to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:69
function flowgraph_nodes_scene_particleEmitter_C:hideObject() end

--- Initializes position, radius, clr, object and shown.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:24
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_scene_particleEmitter_C:init(mgr, ...) end

--- End-of-mission hook: deletes the emitter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:142
function flowgraph_nodes_scene_particleEmitter_C:onClientEndMission() end

--- Positions and scales (radius, radius, 50) the object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:109
function flowgraph_nodes_scene_particleEmitter_C:setPosition() end

--- Shows the existing object or creates it (name particles__<time>_<id>) and adds it to scenetree.MissionGroup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:49
function flowgraph_nodes_scene_particleEmitter_C:showObject() end

--- Creates/shows the emitter; on flow, shows and positions it (flow output true); on clear, hides it (flow output false).
---Source: lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:122
function flowgraph_nodes_scene_particleEmitter_C:work() end

