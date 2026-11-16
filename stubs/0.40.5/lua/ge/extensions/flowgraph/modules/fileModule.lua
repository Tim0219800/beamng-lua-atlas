---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/fileModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 0) that reads and writes small JSON save files specific to flowgraph projects. The files are stored under 'settings/cloud/flowgraphSaveData' + name + '.save.json' with the structure {lastModified, data}. The files are loaded on demand, cached, and rewritten to disk at the end of the tick (afterTrigger) if they were modified.
--- Access: `require("extensions/flowgraph/modules/fileModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_fileModule
flowgraph_modules_fileModule = {}

--- Called after the graph tick: writes each modified file to disk (jsonWriteFile) and clears the modification list. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
function flowgraph_modules_fileModule.afterTrigger() end

--- Clears the file cache and the list of modified files. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
function flowgraph_modules_fileModule.clear() end

--- Called when the project starts: calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
function flowgraph_modules_fileModule.executionStarted() end

--- Called when the project stops: calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
function flowgraph_modules_fileModule.executionStopped() end

--- Forgets the cached file; it will be re-read on next access. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
---@param file string file name (without folder prefix or extension)
function flowgraph_modules_fileModule.forceReload(file) end

--- Returns the file's {lastModified, data} table, loading it from disk (or creating an empty table) on the first request. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
---@param file string file name
---@return table  {lastModified = number, data = table}
function flowgraph_modules_fileModule.getFile(file) end

--- Called when the module is created: calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
function flowgraph_modules_fileModule.init() end

--- Reads data[field] from the file. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
---@param file string file name
---@param field string key
---@return any  value or nil
function flowgraph_modules_fileModule.read(file, field) end

--- Writes a value into data[field], updates lastModified (os.time()) and marks the file to be saved. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:dyn
---@param file string file name
---@param field string key
---@param value any JSON-serializable value
function flowgraph_modules_fileModule.write(file, field, value) end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/fileModule.lua
---@class flowgraph_modules_fileModule_C
local flowgraph_modules_fileModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:51
function flowgraph_modules_fileModule_C:afterTrigger() end

---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:14
function flowgraph_modules_fileModule_C:clear() end

---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:64
function flowgraph_modules_fileModule_C:executionStarted() end

---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:60
function flowgraph_modules_fileModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:19
---@param file any
function flowgraph_modules_fileModule_C:forceReload(file) end

---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:23
---@param file any
function flowgraph_modules_fileModule_C:getFile(file) end

---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:10
function flowgraph_modules_fileModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:47
---@param file any
---@param field any
function flowgraph_modules_fileModule_C:read(file, field) end

---Source: lua/ge/extensions/flowgraph/modules/fileModule.lua:40
---@param file any
---@param field any
---@param value any
function flowgraph_modules_fileModule_C:write(file, field, value) end

