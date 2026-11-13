# `editor_toolUtilities_roadPlaceables`

*Fichier : `lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua` · VM : Game Engine (GE) · 345 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_roadPlaceables` : `extensions.load("editor_toolUtilities_roadPlaceables")`, puis la globale `editor_toolUtilities_roadPlaceables`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_roadPlaceables.clickHandle(groups, gi, ci, ctrlDown, kind)` | Route a click on a handle. CTRL deletes it; a plain click selects it and starts the along-road drag (so one<br> click-drag moves it). Returns 'deleted' \| 'selected' \| 'none'. kind optional -> the hovered / sole kind. | 127 |
| `editor_toolUtilities_roadPlaceables.drawEditor()` | Compact editor for the selected crossing (depth, lateral extent, remove). Only meaningful for a crossing-shaped host<br> (depthM + lateral); roadNetwork uses it. Returns false when the selection is gone (host resets its sel kind). | 268 |
| `editor_toolUtilities_roadPlaceables.drawHandles(groups, selGroup, showSelected)` | Handles/highlight for existing items across every kind (only for the selected road, or the road owning the selected<br> item). showSelected = the host's global selection currently IS one of these items (drives the selected-vs-hover style). | 222 |
| `editor_toolUtilities_roadPlaceables.drawHover(groups, gi, ci, kind)` | Hover glow + prompt for the item under the cursor this frame. kind optional -> the hovered / sole kind. | 251 |
| `editor_toolUtilities_roadPlaceables.getSelection()` |  | 83 |
| `editor_toolUtilities_roadPlaceables.handlePlacement(groups)` | Ghost preview + click-to-add while placement mode is active (the armed kind). Roads only. Returns true when an item<br> was added (and selects it). | 147 |
| `editor_toolUtilities_roadPlaceables.handleSelectDrag(groups)` | Along-road drag of the selected handle. Returns true while it owns the frame (so the host skips the stock<br> node/aux drag). Selection begins the drag so one click-drag moves it. | 194 |
| `editor_toolUtilities_roadPlaceables.hasSelection(kind)` |  | 79 |
| `editor_toolUtilities_roadPlaceables.isDragging()` |  | 78 |
| `editor_toolUtilities_roadPlaceables.isPlaceMode(kind)` | Placement-mode accessors (the host tool owns the Add button; it drives these). kind optional -> any / sole kind. | 76 |
| `editor_toolUtilities_roadPlaceables.reset()` | Clear everything (host onActivate / onDeactivate): registry + placement mode + selection + drag. | 86 |
| `editor_toolUtilities_roadPlaceables.select(kind, gi, ci)` | Selection accessors so a host listbox can select an item (and highlight the active row). | 82 |
| `editor_toolUtilities_roadPlaceables.setHost(host)` | Register a placeable kind's host (call from the tool's onActivate, after reset()). The host carries its own kind. | 58 |
| `editor_toolUtilities_roadPlaceables.setPlaceMode(on, kind)` |  | 77 |
| `editor_toolUtilities_roadPlaceables.underMouse()` | Nearest item handle under the cursor across all kinds (adaptive radius = splineInput node hits). Returns gi, ci, kind<br> (gi/ci first so a plain `g, c = underMouse()` still works for a single-kind tool). Also stashes hoverKind. | 95 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua`.*
