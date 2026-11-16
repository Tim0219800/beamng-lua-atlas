# `editor_api_guiTheme`

*File: `lua/ge/extensions/editor/api/guiTheme.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/api/guiTheme")` (file under extensions/ but not a regular extension)

Editor file: defines the ImGui color palette shared by the editor tools. It does not export a table: it only adds `editor.setupEditorGuiTheme` to the `editor` global. Calling this function fills `editor.color` (beamng, black, buttonInactive, darkgrey, error, gold, green, grey, lightblue, lightgrey, transparent, warning, white) with ImColors.

## Notes

- The file returns nothing (no `return M`): it acts by side effect on `editor` at load time.
- `buttonInactive` takes the Col_Button color of the current ImGui style with the alpha divided by 2.
- `transparent` is defined with RGB (255,0,0) and alpha 0: fully transparent despite the red component.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/guiTheme.lua`.*
