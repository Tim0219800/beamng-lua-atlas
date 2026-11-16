# `util_testExtensionProxies`

*File: `lua/ge/extensions/util/testExtensionProxies.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_testExtensionProxies`: `extensions.load("util_testExtensionProxies")`, then the global `util_testExtensionProxies`

Test extension of the ExtensionProxy system. On load, it creates 11 ExtensionProxyTester objects (id 0 to 10) and submits them as "event sinks" to a proxy created by newExtensionProxy(M), so that the extension's hooks (such as onUpdate) are redistributed to each instance. Only useful to understand or debug this mechanism.

## Notes

- onExtensionUnloaded calls extProxy:destroy(); the comment states that the extension system cleans up anyway.
- In onExtensionLoaded, newExtensionProxyTester(id) receives a global variable id (nil) that the function ignores: the id is then set by hand (e.id = i).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_testExtensionProxies.onExtensionLoaded()` | Called on extension load. Creates 11 testers, an extension proxy, and submits the testers to it with submitEventSinks. *(internal)* *(hook)* | 27 |
| `util_testExtensionProxies.onExtensionUnloaded()` | Called on extension unload. Destroys the extension proxy. *(internal)* *(hook)* | 22 |

## Class `ExtensionProxyTester`

Test object with an id field; receives the hooks redistributed by the proxy.

| Method | Description | Line |
|---|---|---|
| `ExtensionProxyTester:onUpdate(dtReal, dtSim, dtRaw)` | Update hook: prints the tester's id and dtReal to the console. | 16 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/testExtensionProxies.lua`.*
