# `flowgraph_pin`

*File: `lua/ge/extensions/flowgraph/pin.lua` · VM: Game Engine (GE) · 398 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/pin")` (file under extensions/ but not a regular extension)

Flowgraph `pin` class: represents an input or output pin of a node (name, type, direction, value, links). The module returns a constructor: `require('flowgraph_pin')(graph, node, direction, type, name, default, description)`. Node modders manipulate it through `self.pinIn.<name>` / `self.pinOut.<name>` (`.value` field, `:isUsed()`, `:valueSetVec3/Quat`). The rest (drawing, tooltip, menu) serves the ImGui editor.

## Notes

- Usage tracking (`enableUsageTracking = true`) replaces the `__index`/`__newindex` of the class table: reading or writing `pin.value` actually accesses `_value` and updates `_frameLastUsed` with the manager's frame counter.
- Since the modified metatables are those of the shared class (`getmetatable(self)`), this behavior applies to all pins.
- `valueSetVec3` and `valueSetQuat` reuse the same `valueHelperTable` table (no allocation): do not keep the returned table between frames; vec3 sets `[4] = nil`.
- For a non-flow `in` pin, only one link is kept (`links[1]`); for flows or outputs, several links stack up.
- `pinMode` is 'normal' by default; 'hardcoded' means the value is fixed in the editor (the pin then counts as used).
- In `_draw_in`, `constValue` is checked with `~= nil` to display a padlock.

## Class `C`

Flowgraph pin. Notable fields: graph, id, name, type (string or list of types), direction ('in'/'out'), node, default, defaultValue, description, hidden, links, hardTemplates, impulse, chainFlow, tableType, pinMode, quickAccess.

The module returns a constructor: `local obj = require("flowgraph_pin")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_draw_in(builder, style, alpha, simpleDraw, constValue, outWidth)` | Draws an input pin in the editor (type icon, name, optional constant value with a padlock). | 99 |
| `C:_draw_out(builder, style, alpha, simpleDraw, const, outWidth)` | Draws an output pin in the editor (right-aligned name then icon). | 132 |
| `C:_getCalculatedWidth(simpleDraw)` | Computes the pin's display width (icon + text + margin). | 164 |
| `C:_onLink(link)` | Called when a link is created: replaces `links[1]` (non-flow input) or adds the link; makes the pin visible. | 347 |
| `C:_onUnlink(link)` | Called when a link is deleted: removes it from the list. | 356 |
| `C:draw(builder, style, isHeader, constValue, outWidth)` | Draws the pin (according to `direction`) with the right opacity, handles the click (node selection) and remembers the hover. | 262 |
| `C:drawTooltip(mgr)` | Displays the pin's ImGui tooltip: name, valid or connected type, table type and description. | 188 |
| `C:getFirstConnectedLink()` | Returns the pin's first link (`links[1]`), or nil. | 79 |
| `C:getTableType()` | If the pin is of type table (or includes table), returns `tableType` (or 'generic'); otherwise an empty string. | 156 |
| `C:getTypeWithImpulseAndChain()` | Returns 'impulse' if the pin is an impulse, 'chainFlow' if it is a chained flow, otherwise its type (used to choose the icon). | 152 |
| `C:highlightLinks()` | Marks all of the pin's links as highlighted (`_highlight = true`). | 256 |
| `C:hoverDraw(mgr)` | If the pin is hovered, highlights its links and displays its tooltip. | 299 |
| `C:init(graph, node, direction, type, name, default, description)` | Constructor: records the graph, gets a unique id from the manager (`getNextFreePinLinkId`), stores name/type/direction/default value and enables usage tracking of `value`. An output pin of type `delegate` gets `hasOutputDelegates = true`. | 13 |
| `C:isActive()` | While a link is being created, tells whether this pin can be a target (active) or should be grayed out. | 180 |
| `C:isUsed()` | Returns true if the pin has at least one link or if its value is hardcoded (`pinMode == 'hardcoded'`). Used by some nodes to skip unnecessary computations. | 369 |
| `C:showContextMenu(menuPos, main)` | Pin context menu in the editor: quick access, hide the pin (if it has no links), show/hide its links, debug. | 306 |
| `C:valueSetQuat(v)` | Writes a quaternion into `value` as a reused {x, y, z, w} table. | 383 |
| `C:valueSetVec3(v)` | Writes a vector into `value` as a reused {x, y, z} table (no allocation). | 373 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/pin.lua`.*
