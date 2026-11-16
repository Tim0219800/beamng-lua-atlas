# `editor_toolUtilities_matCombo`

*File: `lua/ge/extensions/editor/toolUtilities/matCombo.lua` · VM: Game Engine (GE) · 65 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_matCombo`: `extensions.load("editor_toolUtilities_matCombo")`, then the global `editor_toolUtilities_matCombo`

ImGui terrain material layer selector (dropdown) for editor tools. Layers are 0-based, like the paint index; -1 means "auto", resolved via util.findMaterialIdx. A button resets to the default value.

## Notes

- The names come from util.getMaterialNames() (indices 0..#names).
- The function changes nothing: it returns the newly chosen value, and it is up to the caller to store it.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_matCombo.draw(cur, opts)` | Draws a selector row (reset button, then dropdown). Returns the new value if the user changed the selection or reset the default, otherwise nil. | 28 |

### Parameter details

#### `editor_toolUtilities_matCombo.draw(cur, opts)`

Draws a selector row (reset button, then dropdown). Returns the new value if the user changed the selection or reset the default, otherwise nil.

- `cur` (*integer|string|nil*) : Current value (layer index, -1 = auto); converted by tonumber, otherwise opts.default.
- `opts` (*table*) : id (required, imgui id), label, default (default value), allowAuto (offers the Auto entry), autoNames (names to look up for auto), tooltip.
- **returns**: integer|nil New chosen index, or nil if nothing changed.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/matCombo.lua`.*
