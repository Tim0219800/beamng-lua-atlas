# `core_audioRibbon`

*File: `lua/ge/extensions/core/audioRibbon.lua` · VM: Game Engine (GE) · 846 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_audioRibbon`: `extensions.load("core_audioRibbon")`, then the global `core_audioRibbon`

GE extension (core_audioRibbon): dynamic audio for 'ribbons' (rivers, waterfalls, etc.) defined in the editor. A ribbon is a strip of quadrilaterals (nodes in left/right pairs, with depth). Every frame, for the listener (SFXSystem), the module tracks the closest point on each nearby ribbon and drives up to 5 SFX emitters per event (1 central/ambient 'A', then 4 around the listener: F front, B back, R right, L left), setting volume, pitch, color and texture (RTPC) from the ribbon's width, depth and speed. Ribbons are loaded from levels/<level>/dynamicAudioEmitters/ribbonData.audioSFX.json (JSON lines format, one ribbon per line), written by the editor on save. Many exported functions are mainly for the editor.

## Example

```lua
local rib = core_audioRibbon.getRibbons()
for i, r in ipairs(rib or {}) do print(r.name, r.numSegs) end
```

## Notes

- Ribbon structure: {persistantId, name, isEnabled, isAmbient, isUpRibbon, isTopActive, isQuadAndVolume, isMuteA..D, speed, nodes (vec3 in pairs), depths (per node), widths (per pair, computed), numSegs (computed), emitters[1..5]}.
- A ribbon's emitters (emitters) are 'hosts': {bestSeg, dir, vol, pos, bN, eventNameStr}. emitters[1] = event A (center/ambient), 2 = F (front), 3 = B (back), 4 = R (right), 5 = L (left).
- Distance management: 'near' list (at most the 2 closest ribbons, all emitters active), 'mid' (internal point only) and 'far' (one ribbon per frame in round robin). Near/far limit: 400 m (nearFarLimitSq = 400²).
- Closest-point tracking uses a directional walk (1 segment per frame) and a random probe (blue noise) every 3 frames to escape local minima.
- Provisional weighting coefficients in the code (comment 'TODO - REMOVE LATER WHEN SYSTEM IS TUNED'): width 100, depth 100, speed 100, exponential offset 800.
- Inconsistency: readRibbonsFromFile does not re-read isMuteA..D (the file does not contain them): after a level loads they are nil (so not muted); only onSerialize/onDeserialized keeps them across a Lua reload.
- Side effect: onSerialize deletes all ribbons and emitters after copying them (removeRibbon for each ribbon).
- Inconsistency: createSfxEmitter uses ffi.string(eventName) although eventName is a Lua string (accepted by LuaJIT); the event name is therefore converted needlessly.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_audioRibbon.clearAllSFXEmitters()` | Removes all dynamic SFXEmitter objects (5 axes) and empties their table. | 494 |
| `core_audioRibbon.clearNearFarLists()` | Empties the near, mid and far lists (they will be rebuilt next frame). | 802 |
| `core_audioRibbon.clearRibbonNames()` | Empties the ribbon names table. | 809 |
| `core_audioRibbon.createEmitterHost(eventName)` | Creates the record of a dynamic emitter host (initial position at infinity, bestSeg 0, direction 1). | 535 |
| `core_audioRibbon.getFarList()` | Returns the far list (distant ribbons, only one visited per frame). | 817 |
| `core_audioRibbon.getMidList()` | Returns the mid list (ribbons within 400 m, only the internal point updated). | 816 |
| `core_audioRibbon.getNearList()` | Returns the near list (persistantId -> ribbon index), at most 2 ribbons. | 815 |
| `core_audioRibbon.getRibbonNames()` | Returns the table of known ribbon identifiers (persistantId -> true). | 814 |
| `core_audioRibbon.getRibbons()` | Returns the list of ribbons (nil before the first load). | 812 |
| `core_audioRibbon.getSfxEmitters()` | Returns the 5 per-axis SFX emitter tables, keyed by event name ({emitter, vol, pitch, color, texture, pos}). | 818 |
| `core_audioRibbon.onClientCustomObjectSpawning()` | Hook called when the level objects are created: resets the ribbons then re-reads the level's ribbonData.audioSFX.json file. *(internal)* *(hook)* | 792 |
| `core_audioRibbon.onClientEndMission()` | Hook called at the end of the level: removes the emitters and empties the ribbons (resetRibbons). *(internal)* *(hook)* | 778 |
| `core_audioRibbon.onDeserialized(data)` | Restore hook after Lua reload: rebuilds the ribbons (nodes as vec3, emitter hosts, widths, numSegs) and the names table. *(internal)* *(hook)* | 721 |
| `core_audioRibbon.onEditorBeforeSaveLevel()` | Hook called before the level is saved in the editor: writes the ribbons to levels/<level>/dynamicAudioEmitters/ribbonData.audioSFX.json (sorted by name). *(internal)* *(hook)* | 769 |
| `core_audioRibbon.onExit()` | Hook called when the game closes: removes all dynamic SFX emitters. *(internal)* *(hook)* | 494 |
| `core_audioRibbon.onSerialize()` | Serialization hook before Lua reload: returns a full copy of the ribbons then DELETES all ribbons and emitters. Returns nil if there are no ribbons. *(internal)* *(hook)* | 708 |
| `core_audioRibbon.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: reads the listener pose, updates the near/mid/far lists, computes the closest points and RTPCs for each nearby ribbon, then creates/drives the SFXEmitter emitters (positions and setVolumePitchCT). Does nothing if there are no ribbons. *(internal)* *(hook)* | 311 |
| `core_audioRibbon.recomputeMap()` | Rebuilds the names table (persistantId -> true) from the ribbons. | 486 |
| `core_audioRibbon.removeRibbon(idx)` | Removes all SFX emitters, removes the ribbon at index idx from the list and from the names table, and empties the near/mid/far lists. | 506 |
| `core_audioRibbon.setRibbons(val)` | Replaces the list of ribbons (used by the editor). | 813 |
| `core_audioRibbon.updateRibbonData(ribbon)` | To call after any change to a ribbon's nodes: resets bestSeg=1 and dir=1 for the 5 hosts, recomputes ribbon.numSegs = max(0, (#nodes - 4)/2 + 1) and ribbon.widths (distance between the two nodes of each pair). | 517 |

### Parameter details

#### `core_audioRibbon.createEmitterHost(eventName)`

Creates the record of a dynamic emitter host (initial position at infinity, bestSeg 0, direction 1).

- `eventName` (*string*) : FMOD event name
- **returns**: table {bestSeg, dir, vol, pos, bN, eventNameStr}

#### `core_audioRibbon.getFarList()`

Returns the far list (distant ribbons, only one visited per frame).

- **returns**: table<string, integer> Far list

#### `core_audioRibbon.getMidList()`

Returns the mid list (ribbons within 400 m, only the internal point updated).

- **returns**: table<string, integer> Mid list

#### `core_audioRibbon.getNearList()`

Returns the near list (persistantId -> ribbon index), at most 2 ribbons.

- **returns**: table<string, integer> Near list

#### `core_audioRibbon.getRibbonNames()`

Returns the table of known ribbon identifiers (persistantId -> true).

- **returns**: table<string, boolean> Table of identifiers

#### `core_audioRibbon.getRibbons()`

Returns the list of ribbons (nil before the first load).

- **returns**: table|nil List of ribbons

#### `core_audioRibbon.getSfxEmitters()`

Returns the 5 per-axis SFX emitter tables, keyed by event name ({emitter, vol, pitch, color, texture, pos}).

- **returns**: table Array of 5 tables

#### `core_audioRibbon.onDeserialized(data)`

Restore hook after Lua reload: rebuilds the ribbons (nodes as vec3, emitter hosts, widths, numSegs) and the names table.

- `data` (*table|nil*) : Data from onSerialize

#### `core_audioRibbon.onSerialize()`

Serialization hook before Lua reload: returns a full copy of the ribbons then DELETES all ribbons and emitters. Returns nil if there are no ribbons.

- **returns**: table|nil List of serialized ribbons

#### `core_audioRibbon.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: reads the listener pose, updates the near/mid/far lists, computes the closest points and RTPCs for each nearby ribbon, then creates/drives the SFXEmitter emitters (positions and setVolumePitchCT). Does nothing if there are no ribbons.

- `dtReal` (*number*) : Real time step (s)
- `dtSim` (*number*) : Simulation time step (s)
- `dtRaw` (*number*) : Raw time step (s)

#### `core_audioRibbon.removeRibbon(idx)`

Removes all SFX emitters, removes the ribbon at index idx from the list and from the names table, and empties the near/mid/far lists.

- `idx` (*integer*) : Ribbon index in getRibbons()

#### `core_audioRibbon.setRibbons(val)`

Replaces the list of ribbons (used by the editor).

- `val` (*table*) : New list

#### `core_audioRibbon.updateRibbonData(ribbon)`

To call after any change to a ribbon's nodes: resets bestSeg=1 and dir=1 for the 5 hosts, recomputes ribbon.numSegs = max(0, (#nodes - 4)/2 + 1) and ribbon.widths (distance between the two nodes of each pair).

- `ribbon` (*table*) : Ribbon (nodes, emitters) modified in place

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `Sim.` `upcast`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/audioRibbon.lua`.*
