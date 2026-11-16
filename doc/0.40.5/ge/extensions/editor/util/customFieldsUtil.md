# `editor_util_customFieldsUtil`

*File: `lua/ge/extensions/editor/util/customFieldsUtil.lua` · VM: Game Engine (GE) · 200 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/util/customFieldsUtil")` (file under extensions/ but not a regular extension)

Editor helper: imgui widget to edit tags and custom fields (name, value, type) of a gameplay/util/customFields object. The module returns a constructor: require('/lua/ge/extensions/editor/util/customFieldsUtil')(name, fields, options). Useful to an editor tool modder who wants to display the list of tags and the table of fields, with add and remove.

## Example

```lua
local cf = require('/lua/ge/extensions/editor/util/customFieldsUtil')('monOutil', monObjetCustomFields, {presetTags = {'a','b'}})
-- every frame, in an imgui window:
cf:widget()
```

## Notes

- Options only override attributes that already exist (if self[k]): enableTags, enableFields, tagsText, fieldsText, presetTags, allowedTypes.
- Default allowed types: string and number (the code also mentions boolean, vec3, quat).
- If fields is nil, a new gameplay/util/customFields object is created.

## Class `C`

Instance of the custom fields widget.

The module returns a constructor: `local obj = require("editor_util_customFieldsUtil")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addTag()` | Adds the entered tag to the fields (ignored if empty) then empties the input area. | 168 |
| `C:drawCustomFields()` | Draws the table of fields (Name, Value, Type, Remove button) and the add row with type choice and Add button. | 38 |
| `C:drawTags()` | Draws the list of tags (click: "Remove Tag" popup), the tag input, the presetTags combo and the Add Tag button. | 105 |
| `C:init(name, fields, options)` | Initializes the widget: unique name (used in imgui identifiers), texts, enableTags/enableFields flags, presetTags list, allowed types; applies the options then setFields and refresh. | 9 |
| `C:onActivate()` | Callback for the edit mode; empty. | 188 |
| `C:onDeactivate()` | Callback for the edit mode; empty. | 191 |
| `C:refresh()` | Resets the input areas (name, value, tag) and the current type to "string". | 27 |
| `C:setFields(fields)` | Sets the customFields object being edited (creates an empty one if nil). | 34 |
| `C:widget()` | Draws the tags then the fields, according to enableTags and enableFields. | 178 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/util/customFieldsUtil.lua`.*
