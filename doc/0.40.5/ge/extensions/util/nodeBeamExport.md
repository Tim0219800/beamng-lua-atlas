# `util_nodeBeamExport`

*File: `lua/ge/extensions/util/nodeBeamExport.lua` · VM: Game Engine (GE) · 125 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_nodeBeamExport`: `extensions.load("util_nodeBeamExport")`, then the global `util_nodeBeamExport`

Minimal export of the player's vehicle: writes to a JSON file (.nbexport.json) the list of nodes (position and optional name) and beams (node ids) of the active vehicle, as a point/edge graph. Useful to visualize or analyze a vehicle's physical structure in an external tool. File names are numbered automatically (export_<N>.nbexport.json) in the vehicle folder.

## Example

```lua
extensions.util_nodeBeamExport.exportFile()
```

## Notes

- Positions come from veh:getNodePosition(id) (coordinates relative to the vehicle's reference node) and are converted to {x, z, -y} before writing (code comment: "Z-up").
- Beams are read from vdata.vdata.beams (fields id1, id2, cid); the id is -1 if cid is missing.
- The file also contains vehicle = {id, jbeam, name}; exportFile returns false if there is no player vehicle or no data available.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_nodeBeamExport.exportFile(filename)` | Builds the graph of the active vehicle and writes it as JSON. Without a file name, uses suggestFilename(). Creates the destination folder if needed and logs the result. | 97 |
| `util_nodeBeamExport.suggestFilename()` | Suggests the next free name export_<N>.nbexport.json in the active vehicle's folder (looks up existing files to increment N); creates the folder if needed. | 70 |

### Parameter details

#### `util_nodeBeamExport.exportFile(filename)`

Builds the graph of the active vehicle and writes it as JSON. Without a file name, uses suggestFilename(). Creates the destination folder if needed and logs the result.

- `filename` (*string|nil*) : Output file path (default: export_<N>.nbexport.json in the vehicle folder)
- **returns**: boolean true if the write succeeded, false otherwise

#### `util_nodeBeamExport.suggestFilename()`

Suggests the next free name export_<N>.nbexport.json in the active vehicle's folder (looks up existing files to increment N); creates the folder if needed.

- **returns**: string|nil Suggested path, or nil (error logged) if no vehicle folder is available

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/nodeBeamExport.lua`.*
