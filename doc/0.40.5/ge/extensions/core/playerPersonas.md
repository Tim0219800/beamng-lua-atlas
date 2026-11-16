# `core_playerPersonas`

*File: `lua/ge/extensions/core/playerPersonas.lua` · VM: Game Engine (GE) · 244 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_playerPersonas`: `extensions.load("core_playerPersonas")`, then the global `core_playerPersonas`

GE extension `core_playerPersonas`: visual identity of local players in multiplayer (multiseat). A 'persona' groups a displayed name, an icon, a color and optionally a favorite vehicle, numbered from 1 (player 0 = persona 1). Default values are generated: translated name 'ui.multiseat.playerTag', icon drawn from a pool (random offset per session), color from a palette of 8 hues (computed in OKLCH). A modder uses it to get the name, color and icon of a local player.

## Example

```lua
local n = core_playerPersonas.getNumberForPlayer(0) -- 1
local p = core_playerPersonas.get(n)
log('I','', p.displayName .. ' ' .. p.colorHex .. ' ' .. p.icon)
```

## Notes

- get(number) returns a table built on the fly: { id ('local-persona:N' by default), number, displayName, icon, color = {r,g,b} (0..1), colorHex ('#rrggbb'), vehicleFallbackPaint (paint from /vehicles/common/paintLibraries/common.paintLibrary.json closest to the color, by squared RGB distance), vehicle }. Modifying the returned table does not change the stored persona.
- set(number, data) stores id, displayName, icon, color, vehicle; a displayName equal to the default name is not stored (to follow language changes). Each modification increments the revision (getRevision), which lets UIs detect a change.
- 'Solo' color: applySoloColor replaces a persona's color with a gray (0.37, 0.37, 0.39) and recomputes colorHex and vehicleFallbackPaint; useful when there is only one player.
- Allowed icons (pool of 19): explosion, hingeBroken, drag01, trafficCone, engine, mirrorInteriorMiddle, doorFrontDetached, vehicleTrunk, carCrash, barrelKnocker01, bollard, drift01, hazardLights, N2OHoriz, rangeboxHi, rallyHelmet, road, tire3Fourth, tireDeflated. Default icons advance one step per persona number, so there are no duplicates as long as there are fewer than 19 players.
- The module is a simple module of functions (no hooks).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_playerPersonas.applySoloColor(persona)` | Replaces in place a persona's color with the 'solo' gray and recomputes colorHex and vehicleFallbackPaint. | 140 |
| `core_playerPersonas.clear(personaNumber)` | Clears a persona's stored data (back to default values). | 171 |
| `core_playerPersonas.clearAll()` | Clears all stored personas. | 179 |
| `core_playerPersonas.get(personaNumber)` | Builds and returns the persona of the given number (stored values + default values). | 134 |
| `core_playerPersonas.getDefaultDisplayName(personaNumber)` | Default name: translation of 'ui.multiseat.playerTag' with { number }, otherwise 'Player N' if core_locales is not loaded. | 106 |
| `core_playerPersonas.getDefaultIcon(personaNumber)` | Default icon of a persona, taken from the pool with a random offset fixed for the session. | 114 |
| `core_playerPersonas.getIconPool()` | Returns a copy of the list of available persona icons. | 232 |
| `core_playerPersonas.getNumberForPlayer(player)` | Converts a local player index (0, 1, 2...) to a persona number (index + 1). | 148 |
| `core_playerPersonas.getRevision()` | Returns the revision counter, incremented on every persona change. | 237 |
| `core_playerPersonas.invalidate()` | Increments the revision without changing anything, to force UIs to refresh. | 186 |
| `core_playerPersonas.isPersonaIcon(icon)` | Indicates whether an icon is part of the persona icon pool. | 233 |
| `core_playerPersonas.preview(personaNumber)` | Builds a purely default persona (without the stored values) for a number (1 if invalid). | 230 |
| `core_playerPersonas.replaceAll(values)` | Replaces all personas with those of a table (keys = numbers, or the number field of each element) then increments the revision. | 197 |
| `core_playerPersonas.restoreSnapshot(value)` | Restores the state from a snapshot() snapshot and increments the revision. | 219 |
| `core_playerPersonas.set(personaNumber, data)` | Stores a persona's data (id, displayName, icon, color, vehicle) and increments the revision. | 154 |
| `core_playerPersonas.snapshot()` | Deep copy of the state: { personas, revision }. | 190 |

### Parameter details

#### `core_playerPersonas.applySoloColor(persona)`

Replaces in place a persona's color with the 'solo' gray and recomputes colorHex and vehicleFallbackPaint.

- `persona` (*table*) : Persona returned by get/preview.
- **returns**: table The same table (or the received value if it is not a table).

#### `core_playerPersonas.clear(personaNumber)`

Clears a persona's stored data (back to default values).

- `personaNumber` (*integer*) : Persona number.
- **returns**: boolean true if something was cleared.

#### `core_playerPersonas.clearAll()`

Clears all stored personas.

- **returns**: boolean true if something was cleared.

#### `core_playerPersonas.get(personaNumber)`

Builds and returns the persona of the given number (stored values + default values).

- `personaNumber` (*integer*) : Persona number >= 1.
- **returns**: table|nil Persona, or nil if the number is not valid.

#### `core_playerPersonas.getDefaultDisplayName(personaNumber)`

Default name: translation of 'ui.multiseat.playerTag' with { number }, otherwise 'Player N' if core_locales is not loaded.

- `personaNumber` (*integer*) : Persona number.
- **returns**: string Default name.

#### `core_playerPersonas.getDefaultIcon(personaNumber)`

Default icon of a persona, taken from the pool with a random offset fixed for the session.

- `personaNumber` (*integer*) : Persona number.
- **returns**: string Icon name.

#### `core_playerPersonas.getIconPool()`

Returns a copy of the list of available persona icons.

- **returns**: string[] Icon names.

#### `core_playerPersonas.getNumberForPlayer(player)`

Converts a local player index (0, 1, 2...) to a persona number (index + 1).

- `player` (*integer*) : Player index >= 0.
- **returns**: integer|nil Number, or nil if invalid.

#### `core_playerPersonas.getRevision()`

Returns the revision counter, incremented on every persona change.

- **returns**: integer Current revision.

#### `core_playerPersonas.isPersonaIcon(icon)`

Indicates whether an icon is part of the persona icon pool.

- `icon` (*string*) : Icon name.
- **returns**: boolean true if valid.

#### `core_playerPersonas.preview(personaNumber)`

Builds a purely default persona (without the stored values) for a number (1 if invalid).

- `personaNumber` (*integer|nil*) : Persona number.
- **returns**: table Default persona.

#### `core_playerPersonas.replaceAll(values)`

Replaces all personas with those of a table (keys = numbers, or the number field of each element) then increments the revision.

- `values` (*table*) : Table of personas { id, displayName, icon, color, vehicle }.
- **returns**: boolean false if values is not a table.

#### `core_playerPersonas.restoreSnapshot(value)`

Restores the state from a snapshot() snapshot and increments the revision.

- `value` (*table*) : Snapshot with a personas field.
- **returns**: boolean false if the snapshot is invalid.

#### `core_playerPersonas.set(personaNumber, data)`

Stores a persona's data (id, displayName, icon, color, vehicle) and increments the revision.

- `personaNumber` (*integer*) : Number >= 1.
- `data` (*table*) : { id, displayName, icon, color = {r,g,b}, vehicle }
- **returns**: boolean true if stored, false if the arguments are invalid.

#### `core_playerPersonas.snapshot()`

Deep copy of the state: { personas, revision }.

- **returns**: table Snapshot.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/playerPersonas.lua`.*
