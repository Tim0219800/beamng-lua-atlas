# `editor_crawlEditor_trails`

*File: `lua/ge/extensions/editor/crawlEditor/trails.lua` · VM: Game Engine (GE) · 603 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/crawlEditor/trails")` (file under extensions/ but not a regular extension)

"Trails" subtool of the Crawl editor. The module returns a class constructor C. A trail links a path (pathId), a boundary (boundaryId) and starting positions (startingPositionId, startingPositionIdReversed) with prefabs, a thumbnail, a preview and rules. The tool shows the list and detail in ImGui (name, file, description, mission properties, missing references in color, prefabs, rules) and draws the referenced starting position in the 3D view.

## Notes

- A trail's Delete context menu also deletes its file on disk (trail._filePath) via FS:removeFile.
- The "Test From Start" button launches gameplay_crawl_general.startCrawlFreeroam(trail, player vehicle); without a player vehicle, a warning is logged.
- Prefabs are searched in /levels/<level>/crawls/*.prefab.json (current level only, non-recursive).
- Modifications mark the trail as modified via editor_crawlEditor.markAsDirty("trail", index).

## Class `C`

Tool instance. Fields: currentTab ("paths" by default), trail (edited trail), snapToTerrain (true), ImGui buffers (name, fileName, description, rules, thumbnail, preview, missionName, pathReversed, isFromMission).

The module returns a constructor: `local obj = require("editor_crawlEditor_trails")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearSelection()` | Does nothing (no selection to clear for trails). | 563 |
| `C:draw(mouseInfo)` | Draws the zone sphere (translucent green) and the icon (red) of the starting position referenced by the trail, with labels. | 577 |
| `C:drawTrailDetail(trail)` | Draws the trail detail panel: Goto buttons (camera to the starting position or the first node of the path) and Test From Start, fields, thumbnail/preview selectors, path/boundary/position references, prefabs, rules. | 150 |
| `C:drawTrailsList(allTrails, selection)` | Draws the "Add Trail" button and the selectable list; right click offers Delete (also deletes the trail's file). | 95 |
| `C:getNewTrail()` | Creates a default trail (name "New Trail", empty references, pathReversed false, empty prefabs, default rules, metadata version "1.0"). | 534 |
| `C:getPrefabFiles()` | Lists the *.prefab.json files of the /levels/<level>/crawls/ folder of the current level. | 77 |
| `C:init()` | Initializes the current tab to "paths", no trail selected, snapToTerrain = true. | 71 |
| `C:input(mouseInfo)` | Mouse handling: empty for trails. | 571 |
| `C:setCurrentTab(tab)` | Stores the editor's current tab. | 567 |
| `C:setFields(trail)` | Fills the ImGui buffers from the trail. | 138 |
| `C:setTrail(trailParam)` | Sets the trail being edited. | 559 |

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`
- `be:` `getPlayerVehicle`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/crawlEditor/trails.lua`.*
