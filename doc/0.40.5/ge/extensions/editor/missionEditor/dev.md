# `editor_missionEditor_dev`

*File: `lua/ge/extensions/editor/missionEditor/dev.lua` · VM: Game Engine (GE) · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/missionEditor/dev")` (file under extensions/ but not a regular extension)

"Dev Notes" section of the Mission Editor: edits mission.devNotes (free text, silent/info/warning/error mode, "Dev Mission" checkbox that hides the mission outside developer mode). The module returns a constructor. Each modification sets mission._dirty = true.

## Notes

- In missionEditor.lua the line that creates this window is commented out: the module is currently not instantiated.
- mission.devNotes must exist (setMission reads devNotes.text and devNotes.devMission without a test) otherwise error.
- Modes: silent, info, warning, error (icons visibility_off, info, warning, error, declared but not displayed here).

## Class `C`

Dev notes sub-window.

The module returns a constructor: `local obj = require("editor_missionEditor_dev")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the multiline text, the mode selector and the "Dev Mission" checkbox (tooltip: the mission only appears if dev mode is enabled). | 20 |
| `C:init(missionEditor)` | Constructor: remembers the reference to the missionEditor. | 9 |
| `C:setMission(mission)` | Selects the mission: creates the text buffer (2048 characters) and the devMission checkbox from mission.devNotes. | 14 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionEditor/dev.lua`.*
