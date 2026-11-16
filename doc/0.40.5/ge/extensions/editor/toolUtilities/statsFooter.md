# `editor_toolUtilities_statsFooter`

*File: `lua/ge/extensions/editor/toolUtilities/statsFooter.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_statsFooter`: `extensions.load("editor_toolUtilities_statsFooter")`, then the global `editor_toolUtilities_statsFooter`

Statistics footer shared by the editor's "kit" tools: displays "Label N" stats in ImGui and the dynamic row of drawn triangles, distance and number of displayed pieces (computed by triLive). Uses the 'crystal' palette from style.lua.

## Notes

- To be called inside an ImGui window; the functions draw directly with im.TextColored and im.SameLine.
- As long as triLive has shapes to measure (toScan > 0), liveRow only displays "Drawn tris : scanning N shapes".

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_statsFooter.item(label, val, col, lead, tip)` | Draws a "Label N" stat: dim label, colored number, dimmed "\|" bar in front (except at the start of a line). | 16 |
| `editor_toolUtilities_statsFooter.liveRow(instances, unique, fresh)` | Displays drawn triangles ("Drawn tris"), range ("Range", in meters) and drawn pieces out of placed ones ("Drawing"). `unique` is added as is to the triangles because it has no LOD. Updates triLive (note if fresh, scanStep, update). | 26 |

### Parameter details

#### `editor_toolUtilities_statsFooter.item(label, val, col, lead, tip)`

Draws a "Label N" stat: dim label, colored number, dimmed "|" bar in front (except at the start of a line).

- `label` (*string*) : Label.
- `val` (*any*) : Value displayed via tostring; 0 if nil/false.
- `col` (*ImVec4*) : Number color.
- `lead` (*boolean|nil*) : True: start of line, no bar.
- `tip` (*string|nil*) : Tooltip.

#### `editor_toolUtilities_statsFooter.liveRow(instances, unique, fresh)`

Displays drawn triangles ("Drawn tris"), range ("Range", in meters) and drawn pieces out of placed ones ("Drawing"). `unique` is added as is to the triangles because it has no LOD. Updates triLive (note if fresh, scanStep, update).

- `instances` (*table*) : triLive entries.
- `unique` (*number*) : Triangles of the unique geometry, added in full.
- `fresh` (*boolean|nil*) : The list has changed since last time (may contain a shape never measured).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/statsFooter.lua`.*
