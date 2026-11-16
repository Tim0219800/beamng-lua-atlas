# `extensions`

*File: `lua/common/extensions.lua` · VM: Common (GE + vehicle) · 1247 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `extensions`

Extension manager (global `extensions`, present in the GE VM and in the vehicle VM). It loads/unloads Lua modules as extensions, resolves their dependencies (field M.dependencies), exposes them as globals and under extensions.<name>, and broadcasts hooks (extensions.hook('onXxx', ...)) to all modules that define that function. It also handles serialization/deserialization during a Lua VM reload (Ctrl+L). A modder uses it to load their extension, trigger hooks or access an extension by name.

## Example

```lua
extensions.load('myMod_main')        -- loads lua/ge/extensions/myMod/main.lua (name with _ = path with /)
extensions.myMod_main.doSomething() -- access (loads automatically if absent)
extensions.hook('onMyEvent', 42)    -- calls onMyEvent(42) in all modules that define it
extensions.unload('myMod_main')
```

## Notes

- Naming: the extension name is the path with '/' replaced by '_' and '_' doubled to '__' (luaPathToExtName); extNameToLuaPath does the reverse. Example: 'ui_missionInfo' <-> 'ui/missionInfo'.
- Accessing extensions.<name> for a module that is not loaded loads it automatically (via the metatable's __index), the lookup being case-insensitive for modules already resolved.
- A module must return its table M, otherwise it is rejected (error message). Lifecycle: onPreLoad before dependencies are loaded; onExtensionLoaded(deserializedData) after loading (returning false unloads the module); onInit(data) next, only in the GE VM (vmType == 'game'); onExtensionUnloaded on unload.
- Deprecated functions detected on a module: onLoad and init (replace with onExtensionLoaded), onRaceWaypoint (-> onRaceWaypointReached), onScenarioRaceCountingDone (-> onCountdownEnded), activated (-> onPlayersChanged), onUnload (-> onExtensionUnloaded). They are renamed automatically with a warning in the log.
- Fields set on every loaded module: __extensionName__, __extensionPath__, __manuallyLoaded__ (true if loaded via load/loadAtRoot), __originalExtPath__ (loadAtRoot), __virtual__ (proxy).
- Hooks are called in dependency resolution order (modules sorted by name then dependencies first). Function lists are cached by hook name; the cache is cleared on load/unload.
- extensions.hook is hookProfiled outside the shipping_build version (with profiler events), otherwise hookFast. setProfiler temporarily replaces it.
- Probable bug: hookExcept compares m.__extensionsModulePath__, a field that is never defined (the field set is __extensionPath__); the exception list therefore excludes nothing.
- The fields M.onSerialize, M.onDeserialize and M.onDeserialized are nop (empty function); automatic extraction wrongly reports them as nil, likewise for M.hook.
- A warning is logged if the loading, onExtensionLoaded, onInit or deserialization of an extension takes longer than 50 ms.

## Functions

| Function | Description | Line |
|---|---|---|
| `extensions.addModulePath(directory)` | Prepends directory/?.lua to package.path. | 701 |
| `extensions.deserialize(data, filter)` | Reloads the extensions listed in data then restores their data via onDeserialize(data) or by merging M.state/M (then onDeserialized). The data is also passed to onExtensionLoaded/onInit. *(internal)* | 1015 |
| `extensions.disableSerialization(...)` | Excludes extensions from serialization during the Lua VM reload. | 947 |
| `extensions.extNameToLuaPath(extName)` | Converts an extension name to a path ('a_b__c' -> 'a/b_c'). | 64 |
| `extensions.getLoadedExtensionsNames(excludeVirtual)` | Returns the sorted list of loaded extension names. | 1201 |
| `extensions.getSerializationData(reason)` | Builds the data table to keep across a reload: the list of loaded extensions (paths) and, for each module with onSerialize/onDeserialize(d), the return value of onSerialize(reason), otherwise M.state, otherwise the whole module. If reason == 'reload', then unloads all extensions. *(internal)* | 965 |
| `extensions.hookExcept(exceptionList, func, ...)` | Calls the function func of all resolved modules except those listed. See notes: the comparison uses a field that is never defined. | 884 |
| `extensions.hookNotify(func, ...)` | Calls M.hook(func, ...) then runs and removes the callbacks registered with setCompletedCallback for this hook. | 899 |
| `extensions.hookUpdate(funcName)` | Invalidates a hook's function cache so it is rebuilt on the next call (use when a module dynamically adds or removes a hook function). | 94 |
| `extensions.isExtensionLoaded(extName)` | Tells whether an extension is loaded (test: _G[extName] ~= nil). | 280 |
| `extensions.load(...)` | Loads one or more extensions (names in ext_name format or paths containing '/'), marks them as manually loaded, resolves dependencies, then calls onExtensionLoaded (and onInit on the GE side) of the freshly loaded modules. | 648 |
| `extensions.loadAtRoot(extPath, rootName)` | Loads a Lua file as an extension by choosing a naming root: the name becomes rootName..'_'..fileName (or just the file name if rootName is ''). | 658 |
| `extensions.loadModule(extName)` | Deprecated: calls load with a warning. | 1189 |
| `extensions.loadModulesInDirectory(directory, excludeSubdirectories)` | Loads at the global root all the .lua files found (recursively) in a folder, with the file name as the extension name (compatibility with old mods). | 708 |
| `extensions.luaPathToExtName(filepath)` | Converts a path ('a/b_c') to an extension name ('a_b__c'). | 55 |
| `extensions.printExtensions()` | Logs the list of loaded extensions with their dependencies. | 860 |
| `extensions.printHooks(funcName)` | Prints (print) the extensions that define the function funcName. | 867 |
| `extensions.refresh(extName)` | Reapplies the loading processing to an already loaded extension, without rereading the disk (dependencies, deprecated hooks, etc.). | 928 |
| `extensions.reload(extPath)` | Unloads then reloads an extension from disk (clears the package.loaded cache). | 922 |
| `extensions.reloadModule(modulePath)` | Deprecated: calls reload with a warning. | 942 |
| `extensions.restoreModulePath()` | Restores the package.path remembered by saveModulePath. | 917 |
| `extensions.saveModulePath()` | Remembers the current package.path. | 913 |
| `extensions.setCompletedCallback(funcName, callback)` | Registers a callback run (once) at the end of the next hookNotify for this hook. | 757 |
| `extensions.setProfiler(p)` | Enables a profiler (M.hook becomes hookSingleFrameProfiled) or, with nil, goes back to the normal hook. | 851 |
| `extensions.unload(extName)` | Unloads an extension and all those that depend on it (and that nothing else requires), calling onExtensionUnloaded. Does nothing if it is not loaded. Virtual extensions are not unloaded unless they are children of an unloaded module. | 284 |
| `extensions.unloadExcept(...)` | Unloads all extensions except those listed and their dependencies. Accepts either a single list as argument or several lists. | 337 |
| `extensions.unloadModule(extName)` | Deprecated: calls unload with a warning. | 332 |
| `extensions.use(key)` | Loads the extension then returns it (old syntax; direct access extensions.name already loads automatically). | 1194 |
| `extensions.wrapAllExtensionsForProfiler()` | Wraps all functions of all extensions with profilerPushEvent/PopEvent. Extensions loaded afterwards are also wrapped. | 479 |

### Parameter details

#### `extensions.addModulePath(directory)`

Prepends directory/?.lua to package.path.

- `directory` (*string*) : Lua modules folder.

#### `extensions.deserialize(data, filter)`

Reloads the extensions listed in data then restores their data via onDeserialize(data) or by merging M.state/M (then onDeserialized). The data is also passed to onExtensionLoaded/onInit.

- `data` (*table|nil*) : Data produced by getSerializationData.
- `filter` (*string|nil*) : Extension name: restore only this one.

#### `extensions.disableSerialization(...)`

Excludes extensions from serialization during the Lua VM reload.

- `...` (*string|string[]*) : Extension names.

#### `extensions.extNameToLuaPath(extName)`

Converts an extension name to a path ('a_b__c' -> 'a/b_c').

- `extName` (*string|nil*) : Extension name.
- **returns**: string|nil Path.

#### `extensions.getLoadedExtensionsNames(excludeVirtual)`

Returns the sorted list of loaded extension names.

- `excludeVirtual` (*boolean|nil*) : true to omit virtual extensions (proxies).
- **returns**: string[] Sorted names.

#### `extensions.getSerializationData(reason)`

Builds the data table to keep across a reload: the list of loaded extensions (paths) and, for each module with onSerialize/onDeserialize(d), the return value of onSerialize(reason), otherwise M.state, otherwise the whole module. If reason == 'reload', then unloads all extensions.

- `reason` (*string|nil*) : Reason (default 'reload').
- **returns**: table Serialization data.

#### `extensions.hookExcept(exceptionList, func, ...)`

Calls the function func of all resolved modules except those listed. See notes: the comparison uses a field that is never defined.

- `exceptionList` (*string[]*) : Module paths to exclude.
- `func` (*string*) : Name of the hook function.
- `...` (*any*) : Arguments passed to each module.

#### `extensions.hookNotify(func, ...)`

Calls M.hook(func, ...) then runs and removes the callbacks registered with setCompletedCallback for this hook.

- `func` (*string*) : Hook name.
- `...` (*any*) : Arguments.

#### `extensions.hookUpdate(funcName)`

Invalidates a hook's function cache so it is rebuilt on the next call (use when a module dynamically adds or removes a hook function).

- `funcName` (*string*) : Hook name.

#### `extensions.isExtensionLoaded(extName)`

Tells whether an extension is loaded (test: _G[extName] ~= nil).

- `extName` (*string*) : Extension name.
- **returns**: boolean true if present as a global.

#### `extensions.load(...)`

Loads one or more extensions (names in ext_name format or paths containing '/'), marks them as manually loaded, resolves dependencies, then calls onExtensionLoaded (and onInit on the GE side) of the freshly loaded modules.

- `...` (*string|string[]*) : Extension names or paths, or arrays of these strings.

#### `extensions.loadAtRoot(extPath, rootName)`

Loads a Lua file as an extension by choosing a naming root: the name becomes rootName..'_'..fileName (or just the file name if rootName is '').

- `extPath` (*string*) : File path without .lua, containing at least one '/'.
- `rootName` (*string*) : Name prefix; must not contain '_' ('' for the global space).
- **returns**: string|nil Extension name, nil on error.
- **returns**: table|nil Loaded module.

#### `extensions.loadModule(extName)`

Deprecated: calls load with a warning.

- `extName` (*string*) : Extension name.

#### `extensions.loadModulesInDirectory(directory, excludeSubdirectories)`

Loads at the global root all the .lua files found (recursively) in a folder, with the file name as the extension name (compatibility with old mods).

- `directory` (*string*) : Folder to walk (FS:findFiles).
- `excludeSubdirectories` (*string[]|nil*) : Sub-path patterns to exclude.

#### `extensions.luaPathToExtName(filepath)`

Converts a path ('a/b_c') to an extension name ('a_b__c').

- `filepath` (*string|nil*) : Path without .lua.
- **returns**: string|nil Extension name.

#### `extensions.printHooks(funcName)`

Prints (print) the extensions that define the function funcName.

- `funcName` (*string*) : Hook name.

#### `extensions.refresh(extName)`

Reapplies the loading processing to an already loaded extension, without rereading the disk (dependencies, deprecated hooks, etc.).

- `extName` (*string*) : Name of an already loaded extension.
- **returns**: table|false|nil Module, or false if the extension is not loaded.

#### `extensions.reload(extPath)`

Unloads then reloads an extension from disk (clears the package.loaded cache).

- `extPath` (*string*) : Extension name or path.

#### `extensions.reloadModule(modulePath)`

Deprecated: calls reload with a warning.

- `modulePath` (*string*) : Name or path.

#### `extensions.setCompletedCallback(funcName, callback)`

Registers a callback run (once) at the end of the next hookNotify for this hook.

- `funcName` (*string*) : Hook name.
- `callback` (*function*) : Function called with the hook arguments.

#### `extensions.setProfiler(p)`

Enables a profiler (M.hook becomes hookSingleFrameProfiled) or, with nil, goes back to the normal hook.

- `p` (*table|nil*) : Profiler object with methods start and add.

#### `extensions.unload(extName)`

Unloads an extension and all those that depend on it (and that nothing else requires), calling onExtensionUnloaded. Does nothing if it is not loaded. Virtual extensions are not unloaded unless they are children of an unloaded module.

- `extName` (*string*) : Extension name.

#### `extensions.unloadExcept(...)`

Unloads all extensions except those listed and their dependencies. Accepts either a single list as argument or several lists.

- `...` (*string[]*) : List(s) of extension names to keep.

#### `extensions.unloadModule(extName)`

Deprecated: calls unload with a warning.

- `extName` (*string*) : Extension name.

#### `extensions.use(key)`

Loads the extension then returns it (old syntax; direct access extensions.name already loads automatically).

- `key` (*string*) : Extension name.
- **returns**: table|nil Loaded module.

## Fields

| Field | Type | Description |
|---|---|---|
| `hook` | function | Hook broadcast function: hook(funcName, ...). Profiled variant (hookProfiled) outside the shipping build, fast (hookFast) otherwise, or hookSingleFrameProfiled if a profiler is provided to setProfiler. |
| `onDeserialize` | function | nop. |
| `onDeserialized` | function | nop. |
| `onSerialize` | function | nop: the `extensions` extension itself serializes nothing. |

## Class `ExtensionProxy`

Object returned by newExtensionProxy. Fields: extName, extPath, __virtual__, __manuallyLoaded__, hookProxies.

| Method | Description | Line |
|---|---|---|
| `ExtensionProxy:_updateHooks()` | Re-registers the proxy as a virtual extension (refreshInternal) and clears the hook cache. | 1153 |
| `ExtensionProxy:destroy()` | Removes the proxy's hooks and unloads it. | 1162 |
| `ExtensionProxy:submitEventSinks(hookableTablesInstances, dependencies)` | Registers instances (with their metatables) as recipients: every function whose name starts with 'on' is exposed as a hook that calls m[k](m, ...) on each instance. Updates the proxy's hooks and dependencies. | 1114 |

## Class `MT`

Metatable of the `extensions` module.

| Method | Description | Line |
|---|---|---|
| `MT.__index(tbl, key)` | Resolves extensions.<name>: returns the resolved module (case-insensitive lookup) or loads it with load then returns _G[name]. | 1169 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `newExtensionProxy(parentExtension, identifierPrefix)` | GLOBAL function. Creates a virtual extension (ExtensionProxy) that redirects hooks to object instances (OOP); name 'prefix_virtual_N'. If parentExtension is given, the proxy is unloaded along with it. | 1089 |

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions.lua`.*
