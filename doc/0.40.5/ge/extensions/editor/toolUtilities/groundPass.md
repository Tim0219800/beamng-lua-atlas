# `editor_toolUtilities_groundPass`

*File: `lua/ge/extensions/editor/toolUtilities/groundPass.lua` · VM: Game Engine (GE) · 230 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_groundPass`: `extensions.load("editor_toolUtilities_groundPass")`, then the global `editor_toolUtilities_groundPass`

The single terraforming of the terrain on which the editor tools place their objects. The road and rail networks are carved together in a single pass, with a single blend (rail has priority, PRIO.RAIL). City Builder's site grade is laid on top as a second pass: lifted before the network pass and laid back after. Each Build button calls run(), each Restore calls restore().

## Example

```lua
local gp = require('editor/toolUtilities/groundPass')
gp.run({doi = 30})   -- terraform the networks with a 30 m blend
gp.restore()         -- put the original terrain back
```

## Notes

- A network registers with register(id, source); source.features(out, p) adds its terraforming elements. Optional hooks: lift(), finish(), after(), records(), hasCarve().
- The carving record (owner.terraBaseline) is tied to the terrain block and the level; checkOwner drops it if the block changed.
- pass() refuses to work (log W 'held: the road network is still rebuilding') while the sites are busy; run() then returns 0.
- Each pass is a history transaction ('Build Ground', 'Restore Ground', 'Grade Sites') and calls be:reloadCollision() if a terrain exists.
- Defaults: doi 40 m, margin 10 m, falloff 2, smooth 5, roughness 0, scale 0.5, abutLen and abutShoulder taken from roadNetwork/bridges (embankLenM, abutShoulderM).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_groundPass.applyParams(t)` | Applies saved settings: only existing keys whose type matches are taken. Ignores a non-table argument. | 189 |
| `editor_toolUtilities_groundPass.features(out, p)` | Adds to out the terraforming elements of each registered network, according to the settings p (the shared ones by default). An unchecked network (p[id] == false) is ignored. | 51 |
| `editor_toolUtilities_groundPass.getParams()` | Copy of the settings, to keep in each tool's session file. | 183 |
| `editor_toolUtilities_groundPass.getRecord()` | Returns the carving record (keep it across Lua reloads and in sessions). | 197 |
| `editor_toolUtilities_groundPass.hasCarve()` | True if a carving is stored (shared record or something the sources would have to put back). | 150 |
| `editor_toolUtilities_groundPass.laySites()` | Lays back the site grade kept lifted by the holdSites passes, on the terrain of the last pass, in one 'Grade Sites' transaction. No effect (0) if nothing is pending. | 129 |
| `editor_toolUtilities_groundPass.naturalGround()` | Returns the function height(x, y) of the terrain before all the carvings (terraform.groundBefore). Rebuilt only if the records changed; without a record it reads the live terrain. | 162 |
| `editor_toolUtilities_groundPass.register(id, s)` | Registers (or replaces, if the id already exists) the terraforming source of a network. | 40 |
| `editor_toolUtilities_groundPass.reset()` | New level: forgets the carving record, since the terrain is no longer the one where it was made. | 209 |
| `editor_toolUtilities_groundPass.restore()` | Puts the original terrain back under the networks and the site grade on top (transaction 'Restore Ground'). | 146 |
| `editor_toolUtilities_groundPass.run(p, laySites, holdSites)` | Terraforms the networks (if Terraform is active) then lays the site grade back, in one 'Build Ground' transaction. | 121 |
| `editor_toolUtilities_groundPass.setRecord(bl)` | Restores a carving record (must be a table with gx a table and n > 0, otherwise it is cleared). The block id is set back to nil: checkOwner attaches the record via the level. | 202 |
| `editor_toolUtilities_groundPass.setSites(s)` | Plugs in City Builder's site grade (lift, lay, busy, record). | 48 |

### Parameter details

#### `editor_toolUtilities_groundPass.applyParams(t)`

Applies saved settings: only existing keys whose type matches are taken. Ignores a non-table argument.

- `t` (*table*) : Saved settings.

#### `editor_toolUtilities_groundPass.features(out, p)`

Adds to out the terraforming elements of each registered network, according to the settings p (the shared ones by default). An unchecked network (p[id] == false) is ignored.

- `out` (*table*) : Output list.
- `p` (*table|nil*) : Settings; default params.
- **returns**: table The out list.

#### `editor_toolUtilities_groundPass.getParams()`

Copy of the settings, to keep in each tool's session file.

- **returns**: table Copy of params.

#### `editor_toolUtilities_groundPass.getRecord()`

Returns the carving record (keep it across Lua reloads and in sessions).

- **returns**: table|nil owner.terraBaseline.

#### `editor_toolUtilities_groundPass.hasCarve()`

True if a carving is stored (shared record or something the sources would have to put back).

- **returns**: boolean A carving exists.

#### `editor_toolUtilities_groundPass.laySites()`

Lays back the site grade kept lifted by the holdSites passes, on the terrain of the last pass, in one 'Grade Sites' transaction. No effect (0) if nothing is pending.

- **returns**: integer Result of sites.lay(), 0 if nothing or if the network is still rebuilding.

#### `editor_toolUtilities_groundPass.naturalGround()`

Returns the function height(x, y) of the terrain before all the carvings (terraform.groundBefore). Rebuilt only if the records changed; without a record it reads the live terrain.

- **returns**: function height(x, y).

#### `editor_toolUtilities_groundPass.register(id, s)`

Registers (or replaces, if the id already exists) the terraforming source of a network.

- `id` (*string*) : Network id, also the key of params (e.g. 'roads', 'rail').
- `s` (*table*) : Source with features(out, p) and optionally lift, finish, after, records, hasCarve.

#### `editor_toolUtilities_groundPass.restore()`

Puts the original terrain back under the networks and the site grade on top (transaction 'Restore Ground').

- **returns**: integer Number of elements (0 in practice).

#### `editor_toolUtilities_groundPass.run(p, laySites, holdSites)`

Terraforms the networks (if Terraform is active) then lays the site grade back, in one 'Build Ground' transaction.

- `p` (*table|nil*) : Settings that replace the shared settings for this run.
- `laySites` (*boolean|nil*) : Grades the sites even if they were not.
- `holdSites` (*boolean|nil*) : Leaves the grade lifted; laySites() must be called later.
- **returns**: integer Number of terraforming elements applied (0 if blocked).

#### `editor_toolUtilities_groundPass.setRecord(bl)`

Restores a carving record (must be a table with gx a table and n > 0, otherwise it is cleared). The block id is set back to nil: checkOwner attaches the record via the level.

- `bl` (*table|nil*) : Record.

#### `editor_toolUtilities_groundPass.setSites(s)`

Plugs in City Builder's site grade (lift, lay, busy, record).

- `s` (*table|nil*) : Sites object.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaults` | table | Default values of the numeric settings. |
| `params` | table | Current settings: on, roads, rail (booleans) and doi, margin, falloff, smooth, roughness, scale, abutLen, abutShoulder. |

## Calls into the engine (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/groundPass.lua`.*
