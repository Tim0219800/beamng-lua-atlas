---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/cameraModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder -500, so one of the first) that manages camera paths (camPath) during a project. It loads a <name>/<name>.camPath.json file relative to the project via core_paths.loadPath, or stores a path provided in memory, then plays it with core_paths.playPath. It tracks the active path, the number of path completions and the loop mode.
--- Access: `require("extensions/flowgraph/modules/cameraModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_cameraModule
flowgraph_modules_cameraModule = {}

--- Registers an already built path under a name. Without force, returns the existing id if the name is already known. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param name string name
---@param path table camera path (with markers)
---@param force boolean|nil replace the existing name
---@return integer  path id
function flowgraph_modules_cameraModule.addCustomPath(name, path, force) end

--- Called after the graph tick: finalizes the variables. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.afterTrigger() end

--- Stops the current camera path (core_paths.stopCurrentPath). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.cancelPathCam() end

--- Resets the active path, the completions and the stored path tables. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.clear() end

--- Stops the active path (if id is nil or equal to the active one) and clears the state. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer|nil expected id
function flowgraph_modules_cameraModule.endActivePath(id) end

--- Called when the project stops: stops the path camera if active then calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.executionStopped() end

--- Returns the id of the path with this name, loading it if needed from <name>/<name>.camPath.json (resolved by mgr:getRelativeAbsolutePath). Logs an error if the file is not found. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param name string path / folder name
---@return integer  path id
function flowgraph_modules_cameraModule.findPath(name) end

--- Callback called by core_paths at the end of a path: without loop, stops the camera; in all cases increments completions. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.finishedPath() end

--- Builds a Lua command for the 'button' module (see notes: probable copy-paste). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer id
---@return string  Lua code
function flowgraph_modules_cameraModule.getCmd(id) end

--- Increments and returns an id. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@return integer  id
function flowgraph_modules_cameraModule.getFreeId() end

--- Returns the stored path's table. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer path id
---@return table|nil  path
function flowgraph_modules_cameraModule.getPath(id) end

--- Path duration = time of the last marker, 0 if the path is unknown. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer path id
---@return number  duration (s)
function flowgraph_modules_cameraModule.getPathDuration(id) end

--- Returns a unique prefix..'-'..id. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param prefix string prefix
---@return string  unique name
function flowgraph_modules_cameraModule.getUniqueName(prefix) end

--- Creates the variableStorage and calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
function flowgraph_modules_cameraModule.init() end

--- True if this path is the active path and has been completed at least once. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer path id
---@return boolean  completed
function flowgraph_modules_cameraModule.isPathComplete(id) end

--- Restarts the active path with the same loop setting (if id is nil or equal to the active one). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer|nil expected id
function flowgraph_modules_cameraModule.restartActivePath(id) end

--- Switches to the game camera if the free camera is active, then plays the path with core_paths.playPath (useDtReal = true) and stores the id, the loop and completions = 0. Does nothing if the id is unknown. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:dyn
---@param id integer path id
---@param loop boolean|nil replay in a loop
function flowgraph_modules_cameraModule.startPath(id, loop) end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/cameraModule.lua
---@class flowgraph_modules_cameraModule_C
local flowgraph_modules_cameraModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:48
---@param name any
---@param path any
---@param force any
function flowgraph_modules_cameraModule_C:addCustomPath(name, path, force) end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:127
function flowgraph_modules_cameraModule_C:afterTrigger() end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:92
function flowgraph_modules_cameraModule_C:cancelPathCam() end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:25
function flowgraph_modules_cameraModule_C:clear() end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:104
---@param id any
function flowgraph_modules_cameraModule_C:endActivePath(id) end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:134
function flowgraph_modules_cameraModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:34
---@param name any
function flowgraph_modules_cameraModule_C:findPath(name) end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:96
function flowgraph_modules_cameraModule_C:finishedPath() end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:122
---@param id any
function flowgraph_modules_cameraModule_C:getCmd(id) end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:11
function flowgraph_modules_cameraModule_C:getFreeId() end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:57
---@param id any
function flowgraph_modules_cameraModule_C:getPath(id) end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:61
---@param id any
function flowgraph_modules_cameraModule_C:getPathDuration(id) end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:16
---@param prefix any
function flowgraph_modules_cameraModule_C:getUniqueName(prefix) end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:20
function flowgraph_modules_cameraModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:65
---@param id any
function flowgraph_modules_cameraModule_C:isPathComplete(id) end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:114
---@param id any
function flowgraph_modules_cameraModule_C:restartActivePath(id) end

---Source: lua/ge/extensions/flowgraph/modules/cameraModule.lua:69
---@param id any
---@param loop any
function flowgraph_modules_cameraModule_C:startPath(id, loop) end

