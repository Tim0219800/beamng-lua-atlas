# `jbeam_jbeamMod`

*File: `lua/common/extensions/jbeam/jbeamMod.lua` · VM: Common (GE + vehicle) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `jbeam_jbeamMod`: `extensions.load("jbeam_jbeamMod")`, then the global `jbeam_jbeamMod`

Example extension (file comment: "an example of how you could add things into jbeam loading") showing how to hook into the two JBeam loading phases. Both hooks just write a level I log line ("onJbeamLoadingPhase1/2 called :)"). It is not loaded by default: an extensions.load('jbeam_jbeamMod') is needed (commented-out line in the file).

## Example

```lua
extensions.load('jbeam_jbeamMod')
-- then copy the module and replace the log() calls with your own JBeam data processing
```

## Notes

- None of the hook arguments are used in the code; their exact meaning comes from the calling code (not read here).
- The log names use the tag 'extensions.jbeam.jbeamMod'.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_jbeamMod.onJbeamLoadingPhase1(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars)` | Hook called during phase 1 of a vehicle's JBeam loading. Here: only writes a log "onJbeamLoadingPhase1 called :)". *(internal)* *(hook)* | 14 |
| `jbeam_jbeamMod.onJbeamLoadingPhase2(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars)` | Hook called during phase 2 of a vehicle's JBeam loading. Here: only writes a log "onJbeamLoadingPhase2 called :)". *(internal)* *(hook)* | 18 |

### Parameter details

#### `jbeam_jbeamMod.onJbeamLoadingPhase1(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars)`

Hook called during phase 1 of a vehicle's JBeam loading. Here: only writes a log "onJbeamLoadingPhase1 called :)".

- `loadingProgress` (*any*) : Not used in this file.
- `objID` (*integer*) : Not used (inferred from the name: vehicle object id).
- `vehicle` (*any*) : Not used.
- `unifyJournal` (*any*) : Not used.
- `vehicleConfig` (*table*) : Not used (inferred from the name: vehicle configuration).
- `vars` (*any*) : Not used.

#### `jbeam_jbeamMod.onJbeamLoadingPhase2(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars)`

Hook called during phase 2 of a vehicle's JBeam loading. Here: only writes a log "onJbeamLoadingPhase2 called :)".

- `loadingProgress` (*any*) : Not used in this file.
- `objID` (*integer*) : Not used (inferred from the name: vehicle object id).
- `vehicle` (*any*) : Not used.
- `unifyJournal` (*any*) : Not used.
- `vehicleConfig` (*table*) : Not used (inferred from the name: vehicle configuration).
- `vars` (*any*) : Not used.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/jbeam/jbeamMod.lua`.*
