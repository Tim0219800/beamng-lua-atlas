# `editor_flowgraph_welcome`

*File: `lua/ge/extensions/editor/flowgraph/welcome.lua` · VM: Game Engine (GE) · 245 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/welcome")` (file under extensions/ but not a regular extension)

"Welcome" window (fg_welcome) of the Flowgraph editor. Displays a header image (welcomeHeader.png), a side image (welcomeSide.png), a left column (new project, open a project, last 10 recent files) and a right introduction column. A "Simple Race" demo project is loaded from flowgraph/examples/scenarios/simpleRace/race.flow.json.

## Notes

- Recent files come from the flowgraph.general.recentFiles preference; only those that still exist (FS:fileExists) are listed.
- The window takes focus only once at opening (self.focus).

## Class `C`

Window class (windowName 'fg_welcome', windowDescription 'Welcome').

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Deserialization hook: empty. | 240 |
| `C:_onSerialize(data)` | Serialization hook: empty. | 236 |
| `C:attach(mgr)` | Stores the current manager. | 15 |
| `C:draw()` | Draws the "Welcome" window if it is visible. Called every frame. | 183 |
| `C:drawContent()` | Assembles the images and the two columns of the window. | 192 |
| `C:drawLeftColumn()` | Draws "Projects" (New Project via core_flowgraphManager.addManager, Open Project... via the file dialog) and "Recent Files". | 96 |
| `C:drawRightColumn()` | Draws the editor's introduction text. | 126 |
| `C:init()` | Registers the window (150x300, visible by default), loads the header and side textures, prepares the list of demo projects. | 19 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/welcome.lua`.*
