# `editor_rallyEditor_pacenotes_pacenoteForm`

*File: `lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua` · VM: Game Engine (GE) · 457 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/pacenotes/pacenoteForm")` (file under extensions/ but not a regular extension)

Main pacenote editing form in the rally editor. It displays the name, the actions (Place Vehicle, TODO, Done, Delete..., merge with previous/next), the status, then the sub-form depending on the audio mode (structured via structuredForm, custom via customForm, or freeform with a text field, audio playback and "Generate from Structured"), the calibration metadata, the measurements, and the options (audio mode override, trigger type). A modal confirmation precedes deletion. The module returns a class C constructor.

## Notes

- No exported function: you get an instance with require(...)(pacenoteToolsWindow).
- A "Playback Rules" help is defined (variables currLap and maxLap, free evaluated Lua code); the corresponding input field is commented out in this file.

## Class `C`

Pacenote form instance.

The module returns a constructor: `local obj = require("editor_rallyEditor_pacenotes_pacenoteForm")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearState()` | Resets the editing state (ongoing edit, deletion confirmation) and removes the pacenote. | 50 |
| `C:draw()` | Draws the form in an imgui child area, or "No pacenote selected". | 440 |
| `C:init(pacenoteToolsWindow)` | Constructor: stores the tools window and its state, with no pacenote. | 37 |
| `C:setPacenote(pacenote)` | Sets the edited pacenote and resets StructuredForm, CustomForm and MeasurementsForm. | 43 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/pacenotes/pacenoteForm.lua`.*
