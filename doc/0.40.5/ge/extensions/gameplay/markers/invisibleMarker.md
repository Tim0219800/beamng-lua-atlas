# `gameplay_markers_invisibleMarker`

*File: `lua/ge/extensions/gameplay/markers/invisibleMarker.lua` · VM: Game Engine (GE) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/markers/invisibleMarker")` (file under extensions/ but not a regular extension)

"Null" marker: implements the entire play mode marker interface (init, setup, update, show, hide, clearObjects, interactInPlayMode...) with empty methods, except setup which stores the cluster. Serves as the default marker for POIs that have no visible representation or interaction. The module directly returns a constructor: require(...)(options) returns the instance.

## Notes

- This module does not provide a cluster function: it groups no POIs.
- All methods are empty shells, except setup (self.cluster = cluster).

## Class `C`

No-op marker, instance returned by the module's constructor.

The module returns a constructor: `local obj = require("gameplay_markers_invisibleMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Does nothing. | 38 |
| `C:createObjects()` | Does nothing. | 23 |
| `C:hide()` | Does nothing. | 30 |
| `C:init()` | Does nothing. | 8 |
| `C:instantFade(visible)` | Does nothing. | 42 |
| `C:interactInPlayMode(interactData, interactableElements)` | Does nothing: adds no interactive element. | 47 |
| `C:setHidden(value)` | Does nothing. | 27 |
| `C:setup(cluster)` | Stores the cluster in self.cluster. | 18 |
| `C:show()` | Does nothing. | 33 |
| `C:update(data)` | Does nothing (called every frame by the marker manager). | 13 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/invisibleMarker.lua`.*
