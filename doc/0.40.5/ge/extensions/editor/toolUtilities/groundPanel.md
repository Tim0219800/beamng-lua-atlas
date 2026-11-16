# `editor_toolUtilities_groundPanel`

*File: `lua/ge/extensions/editor/toolUtilities/groundPanel.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_groundPanel`: `extensions.load("editor_toolUtilities_groundPanel")`, then the global `editor_toolUtilities_groundPanel`

imgui panel of the shared terraforming settings (groundPass), drawn identically in the Terrain tab of each editor tool. It reads and writes groundPass.params (sliders with a reset-to-default button, checkboxes).

## Notes

- Settings exposed when Terraform is checked: blend distance (5 to 100 m), margin (0 to 20 m), blend slope (1 to 8), smoothing step (0 to 15), roughness (0 to 1), noise scale (0 to 1), bridge abutment length and shoulder (0 to 40 m, 0 to 5 m).
- The Roads and Rail checkboxes choose the networks covered by Build.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_groundPanel.draw()` | Draws the Terraform checkbox (unchecked: restores the terrain) and, if checked, the sliders for blend, margin, falloff, smoothing, roughness, scale and bridge abutments. | 49 |
| `editor_toolUtilities_groundPanel.drawNetworks()` | Draws the 'Networks:' row with the Roads and Rail checkboxes (networks covered by Build). | 41 |
| `editor_toolUtilities_groundPanel.rowLabel(text, tip)` | Draws a row label (green text with tooltip) and places the imgui cursor at 90 px so that the following checkboxes sit on the same line. | 28 |

### Parameter details

#### `editor_toolUtilities_groundPanel.rowLabel(text, tip)`

Draws a row label (green text with tooltip) and places the imgui cursor at 90 px so that the following checkboxes sit on the same line.

- `text` (*string*) : Label text.
- `tip` (*string*) : Tooltip.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/groundPanel.lua`.*
