---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/testExtensionProxies.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Test extension of the ExtensionProxy system. On load, it creates 11 ExtensionProxyTester objects (id 0 to 10) and submits them as "event sinks" to a proxy created by newExtensionProxy(M), so that the extension's hooks (such as onUpdate) are redistributed to each instance. Only useful to understand or debug this mechanism.
--- Access: extension `util_testExtensionProxies`: `extensions.load("util_testExtensionProxies")`, then the global `util_testExtensionProxies`
---@class util_testExtensionProxies
util_testExtensionProxies = {}

--- Called on extension load. Creates 11 testers, an extension proxy, and submits the testers to it with submitEventSinks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/testExtensionProxies.lua:27
function util_testExtensionProxies.onExtensionLoaded() end

--- Called on extension unload. Destroys the extension proxy.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/testExtensionProxies.lua:22
function util_testExtensionProxies.onExtensionUnloaded() end

--- Test object with an id field; receives the hooks redistributed by the proxy.
---@class util_testExtensionProxies_ExtensionProxyTester
local util_testExtensionProxies_ExtensionProxyTester = {}

--- Update hook: prints the tester's id and dtReal to the console.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/testExtensionProxies.lua:16
---@param dtReal number Elapsed real time (s).
---@param dtSim number Simulation elapsed time (s).
---@param dtRaw number Raw elapsed time (s).
function util_testExtensionProxies_ExtensionProxyTester:onUpdate(dtReal, dtSim, dtRaw) end

