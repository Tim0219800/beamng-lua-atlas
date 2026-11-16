---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/guiInstancer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the module constructor. Fields: `instances` (table index -> {locked}), `nextInstanceIndex` (integer).
---@class editor_api_guiInstancer
local editor_api_guiInstancer = {}

--- Adds an instance `{ locked = false }` and returns its index. Restarts at 1 if no instance exists.
---Source: lua/ge/extensions/editor/api/guiInstancer.lua:12
---@return integer  index of the new instance
function editor_api_guiInstancer:addInstance() end

--- Restores `instances` and `nextInstanceIndex` from `state[name]` if it exists (defaults `{}` and 1).
---Source: lua/ge/extensions/editor/api/guiInstancer.lua:29
---@param name string key of the saved state
---@param state table saved state table
function editor_api_guiInstancer:deserialize(name, state) end

--- Initializes `instances` to empty and `nextInstanceIndex` to 1. Called by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/guiInstancer.lua:7
function editor_api_guiInstancer:init() end

--- Removes the instance at the given index (sets the slot to nil).
---Source: lua/ge/extensions/editor/api/guiInstancer.lua:21
---@param instanceIndex integer index returned by addInstance
function editor_api_guiInstancer:removeInstance(instanceIndex) end

--- Writes `{ instances, nextInstanceIndex }` into `state[name]` for saving the editor state.
---Source: lua/ge/extensions/editor/api/guiInstancer.lua:25
---@param name string key under which to store the state
---@param state table state table to fill
function editor_api_guiInstancer:serialize(name, state) end

