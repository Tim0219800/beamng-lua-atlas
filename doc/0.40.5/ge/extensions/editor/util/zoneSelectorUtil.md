# `editor_util_zoneSelectorUtil`

*File: `lua/ge/extensions/editor/util/zoneSelectorUtil.lua` · VM: Game Engine (GE) · 304 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/util/zoneSelectorUtil")` (file under extensions/ but not a regular extension)

Mission editor UI element (via editorElementHelper) to choose garage zones: "Initial Zones" (where the player can spawn) and "Destination Zones" (where they can get destinations). The zone names are read from `<globalInfoFolder>/garages.sites.json` via gameplay_sites_sitesManager.loadSites. The module returns a constructor: `require('editor/util/zoneSelectorUtil')(element)`.

## Notes

- The `element` is a shared configuration table (fields read: fieldName, globalInfoFolderFieldName, _id; fields written: initialZones, destinationZones, loadedZones, sitesFile, zonesLoaded, caches).
- The chosen lists are written into the data container ctd under the keys `<fieldName>_initialZones` and `<fieldName>_destinationZones`.
- If the folder is empty, the garages.sites.json file is missing or sitesManager is unavailable, the zone list stays empty and a yellow message is displayed.
- The sites file is always named garages.sites.json; the zones are sorted alphabetically.
- The quick-lookup sets are cached and rebuilt only when the array size changes.

## Class `C`

Instance bound to an editor `element`.

The module returns a constructor: `local obj = require("editor_util_zoneSelectorUtil")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw(ctd, container, labelFn)` | Draws the interface: add combos, Select All / Remove All buttons, lists with Remove button, summary. Writes the lists into ctd. | 93 |
| `C:init(element)` | Constructor: remembers the element. | 11 |
| `C:loadZonesFromSitesFile(ctd)` | Loads the zone names from `<global folder>/garages.sites.json` (only once per file) into element.loadedZones. | 15 |
| `C:setContainer(ctd)` | Reads initialZones/destinationZones from ctd and resets the loading state to force a reload. | 82 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/util/zoneSelectorUtil.lua`.*
