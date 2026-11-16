# `editor_api_easeCurveUI`

*File: `lua/ge/extensions/editor/api/easeCurveUI.lua` · VM: Game Engine (GE) · 203 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_easeCurveUI`: `extensions.load("editor_api_easeCurveUI")`, then the global `editor_api_easeCurveUI`

Editor ImGui widget for editing an easing curve (engine EaseF type). The value is a "dir type param0 param1" string. The widget shows two combos (direction InOut/In/Out, type Linear..Bounce), a clickable curve preview opening a thumbnail picker, and parameter sliders for Elastic (Amplitude, Period) and Back (Overshoot).

## Notes

- The direction and type names must stay in sync with engine::Ease::enumDirection and enumType (the index equals the order in the enum).
- A parameter of -1 means "default value of the curve".
- Curves are sampled by worldEditorCppApi.getEaseCurveSamples (64 points for the preview, 32 for the thumbnails).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_easeCurveUI.draw(opts)` | Draws the curve editing widget. Calls opts.setValue(valueString, editEnded) on each change; editEnded is true for combo/picker choices and at the end of a slider drag. | 147 |

### Parameter details

#### `editor_api_easeCurveUI.draw(opts)`

Draws the curve editing widget. Calls opts.setValue(valueString, editEnded) on each change; editEnded is true for combo/picker choices and at the end of a slider drag.

- `opts` (*table*) : id (unique string), value (string "dir type param0 param1"), setValue(valueString, editEnded)

## Calls into the engine (C++)

- `worldEditorCppApi.` `getEaseCurveSamples`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/easeCurveUI.lua`.*
