# `editor_sitesEditor_tags`

*File: `lua/ge/extensions/editor/sitesEditor/tags.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/sitesEditor/tags")` (file under extensions/ but not a regular extension)

'Tags' tab of the sites editor (Location Tags, Zone Tags, Parking Spot Tags depending on the key). The module returns a class constructor C. It lists all the tags present in sites[key] and, for the chosen tag, displays two columns (elements that have it / that do not) with buttons to move one or all elements from one side to the other, which calls customFields:addTag / removeTag. Elements are highlighted in the world on hover.

## Notes

- The '>' button removes the tag from all the elements that have it; '<' adds it to all the others.

## Class `C`

Object returned by the constructor. Fields: sitesEditor, key, sites, tag, tags, sortedTags, hasTag, noTag.

The module returns a constructor: `local obj = require("editor_sitesEditor_tags")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw()` | Draws the tab (calls drawGeneralInfo). Called with mouseInfo by sitesEditor but the method ignores it. | 35 |
| `C:drawGeneralInfo()` | Draws the tag list and the two management columns of the chosen tag. | 52 |
| `C:init(sitesEditor, key)` | Constructor (called by the module). | 9 |
| `C:selectTag(tag)` | Chooses a tag and splits the elements into hasTag and noTag. | 39 |
| `C:selected()` | Called when the tab becomes active: rereads and sorts all the tags of the elements. | 18 |
| `C:setSites(sites)` | Sets the edited sites. | 14 |
| `C:unselect()` | Called when the tab is left; does nothing. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/sitesEditor/tags.lua`.*
