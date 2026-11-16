# `jbeam_partpacks`

*File: `lua/common/jbeam/partpacks.lua` · VM: Common (GE + vehicle) · 432 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/partpacks")`

Management of "part packs": predefined sets of parts described in *.partpacks.json files in the vehicle folders (array of objects {path, filters, ...}). The module collects them (cached by folder list), gathers what is installed in the parts tree (slots, empty slots, part names, paths) and keeps only the packs whose filters match the current vehicle. Used by the customization UI to offer only the relevant packs.

## Example

```lua
local pp = require('jbeam/partpacks')
local visible = pp.process({'/vehicles/wl40/', '/vehicles/common/'}, config.partsTree, 'wl40')
-- visible[path] = pack definition (without the path field)
```

## Notes

- Format of a .partpacks.json file: array of objects, each with path (mandatory string, catalog key) and optionally filters. The path field is removed from the object once used as a key; a duplicate path produces a warning and overwrites the previous entry.
- Filters (all optional, tables): slotWhitelist/slotBlacklist (table slotName -> true|'present'|'empty'|'nonempty'), vehicleWhitelist/vehicleBlacklist (list of vehicle names), partNameWhitelist/partNameBlacklist (chosen part names), pathWhitelist/pathBlacklist (part.path values). The wildcard '*' is allowed in keys/entries (converted to a Lua pattern).
- Rules: whitelist = all entries must match; blacklist = a single match hides the pack. An invalid filter format hides the pack (counted as invalid) and is logged.
- Slot states: 'present' (or true) = the slot exists in the tree; 'empty' = exists with no part chosen; 'nonempty' = exists with a part.
- The catalog is cached by concatenation of the folders; invalidateCollectCache() is necessary if the files change.
- process logs the timings (collect, collectInstalled, filter) and the counters at level 'I'.
- Uses FS:findFiles and jsonReadFile: available on the GE side.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_partpacks.collectAllPartPacks(vehicleDirectories)` | Reads all the *.partpacks.json files (recursive search) of the given folders and returns the catalog path -> definition. Result cached by folder list. | 48 |
| `jbeam_partpacks.collectInstalled(partsTree)` | Recursively walks the parts tree (id, chosenPartName, path, children) and gathers what is installed. | 146 |
| `jbeam_partpacks.filter(partPacksCatalog, installedData, vehicleModel)` | Applies the filters of each pack of the catalog to the installed data and to the vehicle model. | 324 |
| `jbeam_partpacks.invalidateCollectCache()` | Empties the pack catalog cache. | 44 |
| `jbeam_partpacks.process(vehicleDirectories, partsTree, vehicleModel)` | Chains collectAllPartPacks, collectInstalled and filter, with timing logs. | 410 |

### Parameter details

#### `jbeam_partpacks.collectAllPartPacks(vehicleDirectories)`

Reads all the *.partpacks.json files (recursive search) of the given folders and returns the catalog path -> definition. Result cached by folder list.

- `vehicleDirectories` (*string[]|nil*) : Vehicle folders (e.g. {'/vehicles/pickup/', '/vehicles/common/'}).
- **returns**: table<string, table> Catalog of packs by path.

#### `jbeam_partpacks.collectInstalled(partsTree)`

Recursively walks the parts tree (id, chosenPartName, path, children) and gathers what is installed.

- `partsTree` (*table*) : Parts tree of the vehicle config (config.partsTree).
- **returns**: table {slots, emptySlots, partNames, partNamesList, paths, pathsList}: sets (name=true) and ordered lists.

#### `jbeam_partpacks.filter(partPacksCatalog, installedData, vehicleModel)`

Applies the filters of each pack of the catalog to the installed data and to the vehicle model.

- `partPacksCatalog` (*table<string, table>*) : Catalog returned by collectAllPartPacks.
- `installedData` (*table*) : Data returned by collectInstalled.
- `vehicleModel` (*string|nil*) : Vehicle model name (for vehicleWhitelist/Blacklist).
- **returns**: table<string, table> Visible packs.
- **returns**: table Statistics {total, shown, hidden, invalid}.

#### `jbeam_partpacks.process(vehicleDirectories, partsTree, vehicleModel)`

Chains collectAllPartPacks, collectInstalled and filter, with timing logs.

- `vehicleDirectories` (*string[]*) : Vehicle folders.
- `partsTree` (*table*) : Installed parts tree.
- `vehicleModel` (*string|nil*) : Model name.
- **returns**: table<string, table> Visible packs.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/partpacks.lua`.*
