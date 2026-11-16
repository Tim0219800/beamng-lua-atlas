# `editor_sitesEditor_sortedListDisplay`

*File: `lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua` · VM: Game Engine (GE) · 320 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/sitesEditor/sortedListDisplay")` (file under extensions/ but not a regular extension)

Generic display of a sorted list of sites elements (locations, zones, parking spots), used as a tab by the sites editor. The module returns a class constructor C that receives an 'elementEditor' (locations, zones or parkingSpots) to which it delegates click test, creation, deletion, gizmo and element drawing. It handles search by name, multiple selection, renaming, color, custom fields (copy/paste) and undoable changes.

## Notes

- Procedural elements (isProcedural) are not listed.
- In drawList, Ctrl or Shift gives the 'toggle' mode; the following branch (Shift alone would give 'add') is unreachable.
- createByShift (default true): Shift+click creates an element; otherwise a 'Create...' button is displayed. selectByClick (default true): the click selects via elementEditor:hitTest; otherwise the click is delegated to elementEditor:input.
- If several elements are selected, the name and color fields are disabled.

## Class `C`

Object returned by the constructor. Fields: key, index (last selected id), selections (list of ids), objects, sorted, elementEditor, activeTags, createByShift, selectByClick, windowDescription.

The module returns a constructor: `local obj = require("editor_sitesEditor_sortedListDisplay")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:adoptElement(id)` | Changes the list selection without calling elementEditor:select, to keep a gizmo drag in progress (used after the Shift duplication). | 112 |
| `C:draw(mouseInfo)` | Draws the tab; handles mouse input if the gizmo is allowed. | 139 |
| `C:drawCustomFields(fields)` | Draws the custom fields widget and the Copy Fields / Paste Fields buttons. | 288 |
| `C:drawList()` | Draws the filterable list on the left and the element edit panel on the right. | 194 |
| `C:getCurrentSelected()` | Returns the currently selected element. | 308 |
| `C:init(sitesEditor, key, elementEditor)` | Constructor: prepares the selection (editor.selection[key]), the custom fields and the search box. | 9 |
| `C:input()` | Handles clicks in the world: creation by Shift+click, selection by hitTest or delegation to elementEditor:input. | 147 |
| `C:selectElement(id, mode)` | Selects the element with the given id (nil to deselect), updates highlight, element editor, tags and edit fields. | 66 |
| `C:selected()` | Called when the tab becomes active: clears the selection and sets the objects to 'normal' drawing. | 45 |
| `C:setField(name, value)` | Changes a field (name, color...) of all the selected elements via an undoable action. | 187 |
| `C:setSites(sites)` | Sets the edited sites, keeps objects and sorted, passes them to the element editor and recomputes the active tags. | 24 |
| `C:unselect()` | Called when the tab is left: clears the selection and sets the objects to 'faded' drawing. | 57 |
| `C:updateActiveTags()` | Recounts the tags used by the elements (table tag to count). | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua`.*
