# `gameplay_util_customFields`

*File: `lua/ge/extensions/gameplay/util/customFields.lua` · VM: Game Engine (GE) · 174 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/util/customFields")` (file under extensions/ but not a regular extension)

Small container of typed "custom fields" (string, number, boolean, vec3, quat) and sorted tags, with serialization. The module returns a constructor: each call creates an independent object. Useful for attaching free-form data to a gameplay object while saving it as JSON.

## Example

```lua
local cf = require("gameplay/util/customFields")()
cf:add("difficulte", "number", 3)
cf:addTag("ville")
local valeur, type, existe = cf:get("difficulte")
```

## Notes

- Types handled on deserialization: string, number, boolean, vec3, quat; a field of any other type is ignored.
- validate() converts strings: '', '0', 0 and 'false' give false for a boolean; vec3 and quat accept 'x,y,z' / 'x,y,z,w' (comma-separated), otherwise a null value.
- add(), set(), remove() and has() test `self.values[name]`: a boolean field equal to false is therefore considered nonexistent (set() refuses to modify it, add() accepts re-adding it and then duplicates its name in names).
- A special field named "tags" triggers updateTags() on add or modification.
- get() returns (value, type, true) or (nil, nil, false).
- addTag() returns false if the tag already exists but returns nothing (nil) on success.

## Class `C`

Object returned by the module constructor. Fields: names (field order), types, values, tags (set) and sortedTags (sorted list).

The module returns a constructor: `local obj = require("gameplay_util_customFields")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:add(name, datatype, value)` | Adds a typed field; the value is validated according to the type. | 137 |
| `C:addTag(tag)` | Adds a tag and re-sorts the list. | 103 |
| `C:get(name)` | Reads a field. | 152 |
| `C:has(name)` | Tests whether a field exists. | 151 |
| `C:init()` | Initializes the names, types, values, tags and sortedTags tables. | 10 |
| `C:onDeserialized(data)` | Recreates all fields and tags from the serialized data (clears the existing state). | 37 |
| `C:onSerialize()` | Returns {names, types, values, tags}; vec3 and quat are converted to tables. | 18 |
| `C:remove(name)` | Deletes a field. | 125 |
| `C:removeTag(tag)` | Removes a tag, designated by its name or its index in sortedTags. | 112 |
| `C:set(name, value)` | Changes the value of an existing field (without type validation). | 91 |
| `C:updateTags()` | Rebuilds sortedTags (tags sorted alphabetically) from tags. | 160 |
| `C:validate(value, datatype)` | Converts a value to the requested type (string, number, boolean, vec3, quat). | 62 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/util/customFields.lua`.*
