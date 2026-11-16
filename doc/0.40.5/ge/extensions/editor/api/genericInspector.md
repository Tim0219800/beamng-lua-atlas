# `editor_api_genericInspector`

*File: `lua/ge/extensions/editor/api/genericInspector.lua` · VM: Game Engine (GE) · 254 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/api/genericInspector")` (file under extensions/ but not a regular extension)

Generic editor ImGui inspector: displays a list of fields (name, type, value, group, id) as collapsible groups with a search filter, expandable arrays and value editors (via editor/api/valueInspector). An editor tool modder uses it to expose arbitrary fields; each modification is passed back to the `fieldSetter` function given to `initialize`. The module returns a constructor with no arguments.

## Example

```lua
local gi = require("editor/api/genericInspector")()
gi:initialize(function(fieldName, fieldValue, arrayIndex, customData, editEnded) end)
-- in the window rendering:
gi:inspectorGui(fields)
```

## Notes

- The constructor does NOT call `init`/`initialize`: `initialize(fieldSetter)` must be called before any use, otherwise valueInspector, fieldNameFilter, etc. are nil.
- Fields are sorted by `id` (C++ declaration order), grouped by `groupName` (the last group name encountered is propagated, default "General"), and fields with `hideInInspector` are ignored.
- In `inspectorGuiWithFieldCallback`, the test `if #fields then` is always true in Lua (0 is truthy): `inspectorGui` is called even with no fields.
- In `inspectorGuiWithFieldCallback`, the loop reads at most 1000 fields; a warning is logged if the 1000th exists (it uses self.valueInspector.inspectorName, so initialize must have been called).

## Class `C`

Inspector object. After `initialize` it contains valueInspector, fieldSetter, fieldNameFilter (ImGuiTextFilter), inspectorFieldModifiers, etc.

The module returns a constructor: `local obj = require("editor_api_genericInspector")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:initialize(fieldSetter)` | Prepares the inspector: creates a valueInspector (unique name "genericInspectorN"), the search filter and the ImGui buffers, and hooks `fieldSetter` as the value modification callback. | 214 |
| `C:inspectorGui(fields)` | Draws the inspector for the given field list: search bar, groups, simple fields, value arrays and field arrays (beginArray type). Shows "<No search matches>" if the filter matches nothing. To be called every frame in the ImGui window. | 37 |
| `C:inspectorGuiWithFieldCallback(fieldCallback)` | Builds the field list by calling `fieldCallback(i)` for i = 1, 2, ... until it returns nil (maximum 1000), then calls `inspectorGui`. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/genericInspector.lua`.*
