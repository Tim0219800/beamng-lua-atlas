# `editor_screenshotCreatorBootstrap`

*File: `lua/ge/extensions/editor/screenshotCreatorBootstrap.lua` · VM: Game Engine (GE) · 20 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_screenshotCreatorBootstrap`: `extensions.load("editor_screenshotCreatorBootstrap")`, then the global `editor_screenshotCreatorBootstrap`

Small editor bootstrap: adds the Window > Vehicles > "Vehicle Screenshot Creator" menu entry that opens the window of the util_screenshotCreator extension (vehicle screenshots).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_screenshotCreatorBootstrap.onEditorInitialized()` | Called when the editor initializes: creates the "Vehicle Screenshot Creator" menu item ("Vehicles" menu group). Its click calls extensions.util_screenshotCreator.openWindow(). *(internal)* *(hook)* | 13 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/screenshotCreatorBootstrap.lua`.*
