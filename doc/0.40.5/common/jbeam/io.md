# `jbeam_io`

*File: `lua/common/jbeam/io.lua` · VM: Common (GE + vehicle) · 503 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/io")`

Reading and caching of vehicles' .jbeam files. For each requested folder, parses each *.jbeam (JSON), normalizes the slots/slots2 sections to the slots2 format (name, allowTypes, denyTypes, default, description), stores each encoded part in a cache and builds indexes (part -> file, slotType -> parts, part -> description). It then allows retrieving a part (getPart), listing the available parts and those compatible with a slot. A modder uses it to query a vehicle's parts/slots from a GE extension.

## Example

```lua
local io = require('jbeam/io')
local ioCtx = io.startLoading({'/vehicles/pickup/', '/vehicles/common/'})
local mainName = io.getMainPartName(ioCtx)
local part, filename = io.getPart(ioCtx, mainName)
```

## Notes

- ioCtx is the context returned by startLoading: {preloadedDirs = list of folders}. Folders have the form '/vehicles/<name>/' (with trailing slash, without leading slash in the internal pattern).
- The cache is global to the module: each file is parsed only once. onFileChanged invalidates it for a modified .jbeam and forces a new scan of the folders at the next startLoading; the indexes stay stale until that reload (intended according to the comment).
- Parts are stored encoded (stringBufferEncode): getPart returns a fresh decoded copy on each call, which can be modified without affecting the cache.
- A part without slotType (string or table) is ignored with a log error. A part with the same name present twice in the same slotType triggers the error 'Duplicate part found'.
- The slots (v1) format is converted to slots2 (name = type, allowTypes = {type}, denyTypes = {}); the missing header array is added with a warning. On output, part.slots is nil and part.slots2 exists.
- getAvailableSlotNameMap is marked DEPRECATED in the code (incompatible with slots2); use getCompatiblePartNamesForSlot.
- The local function updateAllVehiclesCompatibleParts is not exported.
- The file is marked "do not change this file without speaking to tdev" in the code.
- The modules core_modmanager (onExtensionLoaded) and FS are only available on the GE side.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_io.finishLoading()` | Does nothing (the body is commented out); exists for symmetry with startLoading. | 297 |
| `jbeam_io.getAvailablePartNamesForSlot(ioCtx, slotType)` | Lists the part names whose slotType is slotType (does not handle slots2). | 351 |
| `jbeam_io.getAvailableParts(ioCtx)` | Lists all the parts of the context's folders with their description (description, authors, isAuxiliary, slotInfoUi, modName if any). Reloads if the indexes are missing; logs an error in case of duplicate names. | 301 |
| `jbeam_io.getAvailableSlotNameMap(ioCtx)` | Obsolete. Returns for each slotType the list of parts that fit it (according to the part's slotType). | 324 |
| `jbeam_io.getCompatiblePartNamesForSlot(ioCtx, slotDef, slotMap)` | Parts compatible with a slot. For a v1 slot (field type) returns the parts of that type. For a v2 slot, keeps the parts with a slotType in allowTypes and none of whose types is in denyTypes; the others are returned with the reason 'Part type is in deny list'. | 361 |
| `jbeam_io.getLastStartLoadingStats()` | Statistics of the last startLoading: total number of files and number served by the cache. | 480 |
| `jbeam_io.getMainPartName(ioCtx)` | Name of the first part declared with the slotType 'main' in the context's folders. | 288 |
| `jbeam_io.getPart(ioCtx, partName)` | Returns the full definition of a part (decoded jbeam table, with partName) and the source file. | 267 |
| `jbeam_io.onExtensionLoaded()` | Hook called when the extension loads: gets extensions.core_modmanager to associate parts with their mod. *(internal)* *(hook)* | 484 |
| `jbeam_io.onFileChanged(filename, type)` | Hook called when a file changes on disk: for a .jbeam, deletes its cache and forces a new scan of the folders. *(internal)* *(hook)* | 466 |
| `jbeam_io.startLoading(directories)` | Parses (or fetches from cache) all the *.jbeam of the given folders, rebuilds the global indexes if a file changed and records statistics (total/cachedHits). | 230 |

### Parameter details

#### `jbeam_io.getAvailablePartNamesForSlot(ioCtx, slotType)`

Lists the part names whose slotType is slotType (does not handle slots2).

- `ioCtx` (*table*) : Context returned by startLoading.
- `slotType` (*string*) : Slot type.
- **returns**: string[] Part names ({} if none).

#### `jbeam_io.getAvailableParts(ioCtx)`

Lists all the parts of the context's folders with their description (description, authors, isAuxiliary, slotInfoUi, modName if any). Reloads if the indexes are missing; logs an error in case of duplicate names.

- `ioCtx` (*table*) : Context returned by startLoading.
- **returns**: table<string, table>|nil Table partName -> description; nil if the context is invalid.

#### `jbeam_io.getAvailableSlotNameMap(ioCtx)`

Obsolete. Returns for each slotType the list of parts that fit it (according to the part's slotType).

- `ioCtx` (*table*) : Context returned by startLoading.
- **returns**: table<string, string[]>|nil slotType -> part names; nil if invalid context.

#### `jbeam_io.getCompatiblePartNamesForSlot(ioCtx, slotDef, slotMap)`

Parts compatible with a slot. For a v1 slot (field type) returns the parts of that type. For a v2 slot, keeps the parts with a slotType in allowTypes and none of whose types is in denyTypes; the others are returned with the reason 'Part type is in deny list'.

- `ioCtx` (*table*) : Context returned by startLoading.
- `slotDef` (*table*) : Slot definition (element of part.slots2 or part.slots).
- `slotMap` (*table|nil*) : Result of getAvailableSlotNameMap, to provide if calling several times (optimization).
- **returns**: string[] Compatible part names.
- **returns**: table[] Rejected parts: {partName, reason}.

#### `jbeam_io.getLastStartLoadingStats()`

Statistics of the last startLoading: total number of files and number served by the cache.

- **returns**: table {total = integer, cachedHits = integer}.

#### `jbeam_io.getMainPartName(ioCtx)`

Name of the first part declared with the slotType 'main' in the context's folders.

- `ioCtx` (*table*) : Context returned by startLoading.
- **returns**: string|nil Name of the main part.

#### `jbeam_io.getPart(ioCtx, partName)`

Returns the full definition of a part (decoded jbeam table, with partName) and the source file.

- `ioCtx` (*table*) : Context returned by startLoading.
- `partName` (*string|nil*) : Part name.
- **returns**: table|nil Decoded part; nil if not found or name is nil.
- **returns**: string|nil .jbeam file name.

#### `jbeam_io.onFileChanged(filename, type)`

Hook called when a file changes on disk: for a .jbeam, deletes its cache and forces a new scan of the folders.

- `filename` (*string*) : Modified file.
- `type` (*string*) : Change type (used in the log).

#### `jbeam_io.startLoading(directories)`

Parses (or fetches from cache) all the *.jbeam of the given folders, rebuilds the global indexes if a file changed and records statistics (total/cachedHits).

- `directories` (*string[]*) : List of jbeam folders (e.g. '/vehicles/pickup/').
- **returns**: table Context ioCtx {preloadedDirs = directories}.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/io.lua`.*
