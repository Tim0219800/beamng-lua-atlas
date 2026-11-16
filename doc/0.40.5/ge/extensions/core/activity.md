# `core_activity`

*File: `lua/ge/extensions/core/activity.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_activity`: `extensions.load("core_activity")`, then the global `core_activity`

Tiny GE extension (core_activity): starts a named 'activity'. Today the only known activity is 'ContinueFreeroam', which launches extensions.freeroam_continueFreeroam.start() then signals the loading screen (core_gamestate.loadingScreenActive()). A modder can call it from the UI or a script.

## Example

```lua
core_activity.startActivity('ContinueFreeroam')
```

## Notes

- An unknown activity name is only logged (level I): no error is raised.
- The code comment says the call to core_gamestate.loadingScreenActive() is to be removed once the UI is added.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_activity.startActivity(name)` | Launches the activity with this name if it exists in the internal table, otherwise logs 'Unknown activity'. | 16 |

### Parameter details

#### `core_activity.startActivity(name)`

Launches the activity with this name if it exists in the internal table, otherwise logs 'Unknown activity'.

- `name` (*string*) : Activity name, currently 'ContinueFreeroam'

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/activity.lua`.*
