---@meta
-- tim19Atlas stub generated from lua/common/extensions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension manager (global `extensions`, present in the GE VM and in the vehicle VM). It loads/unloads Lua modules as extensions, resolves their dependencies (field M.dependencies), exposes them as globals and under extensions.<name>, and broadcasts hooks (extensions.hook('onXxx', ...)) to all modules that define that function. It also handles serialization/deserialization during a Lua VM reload (Ctrl+L). A modder uses it to load their extension, trigger hooks or access an extension by name.
--- Access: global `extensions`
---@class extensions
---@field hook function Hook broadcast function: hook(funcName, ...). Profiled variant (hookProfiled) outside the shipping build, fast (hookFast) otherwise, or hookSingleFrameProfiled if a profiler is provided to setProfiler.
---@field onDeserialize function nop.
---@field onDeserialized function nop.
---@field onSerialize function nop: the `extensions` extension itself serializes nothing.
extensions = {}

--- Prepends directory/?.lua to package.path.
---Source: lua/common/extensions.lua:701
---@param directory string Lua modules folder.
function extensions.addModulePath(directory) end

--- Reloads the extensions listed in data then restores their data via onDeserialize(data) or by merging M.state/M (then onDeserialized). The data is also passed to onExtensionLoaded/onInit.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions.lua:1015
---@param data table|nil Data produced by getSerializationData.
---@param filter string|nil Extension name: restore only this one.
function extensions.deserialize(data, filter) end

--- Excludes extensions from serialization during the Lua VM reload.
---Source: lua/common/extensions.lua:947
---@param ... string|string[] Extension names.
function extensions.disableSerialization(...) end

--- Converts an extension name to a path ('a_b__c' -> 'a/b_c').
---Source: lua/common/extensions.lua:64
---@param extName string|nil Extension name.
---@return string|nil  Path.
function extensions.extNameToLuaPath(extName) end

--- Returns the sorted list of loaded extension names.
---Source: lua/common/extensions.lua:1201
---@param excludeVirtual boolean|nil true to omit virtual extensions (proxies).
---@return string[]  Sorted names.
function extensions.getLoadedExtensionsNames(excludeVirtual) end

--- Builds the data table to keep across a reload: the list of loaded extensions (paths) and, for each module with onSerialize/onDeserialize(d), the return value of onSerialize(reason), otherwise M.state, otherwise the whole module. If reason == 'reload', then unloads all extensions.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions.lua:965
---@param reason string|nil Reason (default 'reload').
---@return table  Serialization data.
function extensions.getSerializationData(reason) end

--- Calls the function func of all resolved modules except those listed. See notes: the comparison uses a field that is never defined.
---Source: lua/common/extensions.lua:884
---@param exceptionList string[] Module paths to exclude.
---@param func string Name of the hook function.
---@param ... any Arguments passed to each module.
function extensions.hookExcept(exceptionList, func, ...) end

--- Calls M.hook(func, ...) then runs and removes the callbacks registered with setCompletedCallback for this hook.
---Source: lua/common/extensions.lua:899
---@param func string Hook name.
---@param ... any Arguments.
function extensions.hookNotify(func, ...) end

--- Invalidates a hook's function cache so it is rebuilt on the next call (use when a module dynamically adds or removes a hook function).
---Source: lua/common/extensions.lua:94
---@param funcName string Hook name.
function extensions.hookUpdate(funcName) end

--- Tells whether an extension is loaded (test: _G[extName] ~= nil).
---Source: lua/common/extensions.lua:280
---@param extName string Extension name.
---@return boolean  true if present as a global.
function extensions.isExtensionLoaded(extName) end

--- Loads one or more extensions (names in ext_name format or paths containing '/'), marks them as manually loaded, resolves dependencies, then calls onExtensionLoaded (and onInit on the GE side) of the freshly loaded modules.
---Source: lua/common/extensions.lua:648
---@param ... string|string[] Extension names or paths, or arrays of these strings.
function extensions.load(...) end

--- Loads a Lua file as an extension by choosing a naming root: the name becomes rootName..'_'..fileName (or just the file name if rootName is '').
---Source: lua/common/extensions.lua:658
---@param extPath string File path without .lua, containing at least one '/'.
---@param rootName string Name prefix; must not contain '_' ('' for the global space).
---@return string|nil  Extension name, nil on error.
---@return table|nil  Loaded module.
function extensions.loadAtRoot(extPath, rootName) end

--- Deprecated: calls load with a warning.
---Source: lua/common/extensions.lua:1189
---@param extName string Extension name.
function extensions.loadModule(extName) end

--- Loads at the global root all the .lua files found (recursively) in a folder, with the file name as the extension name (compatibility with old mods).
---Source: lua/common/extensions.lua:708
---@param directory string Folder to walk (FS:findFiles).
---@param excludeSubdirectories string[]|nil Sub-path patterns to exclude.
function extensions.loadModulesInDirectory(directory, excludeSubdirectories) end

--- Converts a path ('a/b_c') to an extension name ('a_b__c').
---Source: lua/common/extensions.lua:55
---@param filepath string|nil Path without .lua.
---@return string|nil  Extension name.
function extensions.luaPathToExtName(filepath) end

--- Logs the list of loaded extensions with their dependencies.
---Source: lua/common/extensions.lua:860
function extensions.printExtensions() end

--- Prints (print) the extensions that define the function funcName.
---Source: lua/common/extensions.lua:867
---@param funcName string Hook name.
function extensions.printHooks(funcName) end

--- Reapplies the loading processing to an already loaded extension, without rereading the disk (dependencies, deprecated hooks, etc.).
---Source: lua/common/extensions.lua:928
---@param extName string Name of an already loaded extension.
---@return table|false|nil  Module, or false if the extension is not loaded.
function extensions.refresh(extName) end

--- Unloads then reloads an extension from disk (clears the package.loaded cache).
---Source: lua/common/extensions.lua:922
---@param extPath string Extension name or path.
function extensions.reload(extPath) end

--- Deprecated: calls reload with a warning.
---Source: lua/common/extensions.lua:942
---@param modulePath string Name or path.
function extensions.reloadModule(modulePath) end

--- Restores the package.path remembered by saveModulePath.
---Source: lua/common/extensions.lua:917
function extensions.restoreModulePath() end

--- Remembers the current package.path.
---Source: lua/common/extensions.lua:913
function extensions.saveModulePath() end

--- Registers a callback run (once) at the end of the next hookNotify for this hook.
---Source: lua/common/extensions.lua:757
---@param funcName string Hook name.
---@param callback function Function called with the hook arguments.
function extensions.setCompletedCallback(funcName, callback) end

--- Enables a profiler (M.hook becomes hookSingleFrameProfiled) or, with nil, goes back to the normal hook.
---Source: lua/common/extensions.lua:851
---@param p table|nil Profiler object with methods start and add.
function extensions.setProfiler(p) end

--- Unloads an extension and all those that depend on it (and that nothing else requires), calling onExtensionUnloaded. Does nothing if it is not loaded. Virtual extensions are not unloaded unless they are children of an unloaded module.
---Source: lua/common/extensions.lua:284
---@param extName string Extension name.
function extensions.unload(extName) end

--- Unloads all extensions except those listed and their dependencies. Accepts either a single list as argument or several lists.
---Source: lua/common/extensions.lua:337
---@param ... string[] List(s) of extension names to keep.
function extensions.unloadExcept(...) end

--- Deprecated: calls unload with a warning.
---Source: lua/common/extensions.lua:332
---@param extName string Extension name.
function extensions.unloadModule(extName) end

--- Loads the extension then returns it (old syntax; direct access extensions.name already loads automatically).
---Source: lua/common/extensions.lua:1194
---@param key string Extension name.
---@return table|nil  Loaded module.
function extensions.use(key) end

--- Wraps all functions of all extensions with profilerPushEvent/PopEvent. Extensions loaded afterwards are also wrapped.
---Source: lua/common/extensions.lua:479
function extensions.wrapAllExtensionsForProfiler() end

--- Object returned by newExtensionProxy. Fields: extName, extPath, __virtual__, __manuallyLoaded__, hookProxies.
---@class extensions_ExtensionProxy
local extensions_ExtensionProxy = {}

--- Re-registers the proxy as a virtual extension (refreshInternal) and clears the hook cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions.lua:1153
---@return table  Module (hookProxies).
function extensions_ExtensionProxy:_updateHooks() end

--- Removes the proxy's hooks and unloads it.
---Source: lua/common/extensions.lua:1162
function extensions_ExtensionProxy:destroy() end

--- Registers instances (with their metatables) as recipients: every function whose name starts with 'on' is exposed as a hook that calls m[k](m, ...) on each instance. Updates the proxy's hooks and dependencies.
---Source: lua/common/extensions.lua:1114
---@param hookableTablesInstances table Object instances receiving the hooks.
---@param dependencies string[]|nil Proxy dependencies (default {}).
function extensions_ExtensionProxy:submitEventSinks(hookableTablesInstances, dependencies) end

--- Metatable of the `extensions` module.
---@class extensions_MT
local extensions_MT = {}

--- Resolves extensions.<name>: returns the resolved module (case-insensitive lookup) or loads it with load then returns _G[name].
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions.lua:1169
---@param tbl table extensions table.
---@param key string Extension name.
---@return table|nil  Module.
function extensions_MT.__index(tbl, key) end

--- GLOBAL function. Creates a virtual extension (ExtensionProxy) that redirects hooks to object instances (OOP); name 'prefix_virtual_N'. If parentExtension is given, the proxy is unloaded along with it.
---Source: lua/common/extensions.lua:1089
---@param parentExtension table|nil Parent extension (must have __extensionName__).
---@param identifierPrefix string|nil Name prefix (default: parent's name or '').
---@return table|nil  ExtensionProxy object.
function newExtensionProxy(parentExtension, identifierPrefix) end

