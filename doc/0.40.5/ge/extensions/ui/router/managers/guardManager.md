# `ui_router_managers_guardManager`

*File: `lua/ge/extensions/ui/router/managers/guardManager.lua` · VM: Game Engine (GE) · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_managers_guardManager`: `extensions.load("ui_router_managers_guardManager")`, then the global `ui_router_managers_guardManager`

Registry of the router's navigation guards. reloadGuards scans the lua/ge/extensions/ui/router/guards/ folder, loads each file and registers the functions of its M.guards table under their key. Routes reference these keys in their guard lists (enterGuards, exitGuards); executeGuards runs them in order. A modder can add their own guards with addGuard.

## Example

```lua
extensions.ui_router_managers_guardManager.addGuard("myGuard", function(route, params, context)
  return true -- false blocks the navigation
end)
```

## Notes

- A guard is called with (route, params, context); only the exact value false blocks (result.failedGuard = guard key): a nil return lets it through. Unknown guard keys are ignored with a warning.
- addGuard does not overwrite an existing key (warning); updateGuard requires it to exist.
- Guards are loaded with require("ge/extensions/ui/router/guards/<file>") after FS:findFiles("/lua/ge/extensions/ui/router/guards/", "*.lua"): a file in this folder without an M.guards table is loaded but provides nothing (case of guards/default.lua).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_managers_guardManager.addGuard(key, fn)` | Adds a guard under the given key; does nothing (warning) if the key already exists. | 26 |
| `ui_router_managers_guardManager.executeGuards(specifiedGuards, route, params, context)` | Runs the listed guards in order; stops at the first one that returns false. | 46 |
| `ui_router_managers_guardManager.reloadGuards()` | Empties the registry then reloads all guards from the files of the guards/ folder. Called when ui_router loads. | 9 |
| `ui_router_managers_guardManager.removeGuard(key)` | Removes the guard with the given key. | 42 |
| `ui_router_managers_guardManager.updateGuard(key, fn)` | Replaces an existing guard; does nothing (warning) if the key is unknown. | 34 |

### Parameter details

#### `ui_router_managers_guardManager.addGuard(key, fn)`

Adds a guard under the given key; does nothing (warning) if the key already exists.

- `key` (*string*) : Guard key.
- `fn` (*function*) : Function (route, params, context) -> boolean.

#### `ui_router_managers_guardManager.executeGuards(specifiedGuards, route, params, context)`

Runs the listed guards in order; stops at the first one that returns false.

- `specifiedGuards` (*string[]*) : Keys of the guards to run.
- `route` (*table*) : Target route (or the current route for exit guards).
- `params` (*table|nil*) : Route parameters.
- `context` (*table|nil*) : Context (for example {routeName, options} for exit guards).
- **returns**: table {result = value of the last guard run (true by default), failedGuard = key of the blocking guard}.

#### `ui_router_managers_guardManager.removeGuard(key)`

Removes the guard with the given key.

- `key` (*string*) : Guard key.

#### `ui_router_managers_guardManager.updateGuard(key, fn)`

Replaces an existing guard; does nothing (warning) if the key is unknown.

- `key` (*string*) : Guard key.
- `fn` (*function*) : New function.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/managers/guardManager.lua`.*
