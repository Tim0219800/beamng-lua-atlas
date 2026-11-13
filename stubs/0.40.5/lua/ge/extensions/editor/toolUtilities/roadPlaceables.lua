---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_roadPlaceables` : `extensions.load("editor_toolUtilities_roadPlaceables")`, puis la globale `editor_toolUtilities_roadPlaceables`
---@class editor_toolUtilities_roadPlaceables
editor_toolUtilities_roadPlaceables = {}

--- Route a click on a handle. CTRL deletes it; a plain click selects it and starts the along-road drag (so one
---  click-drag moves it). Returns 'deleted' | 'selected' | 'none'. kind optional -> the hovered / sole kind.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:127
---@param groups any
---@param gi any
---@param ci any
---@param ctrlDown any
---@param kind any
function editor_toolUtilities_roadPlaceables.clickHandle(groups, gi, ci, ctrlDown, kind) end

--- Compact editor for the selected crossing (depth, lateral extent, remove). Only meaningful for a crossing-shaped host
---  (depthM + lateral); roadNetwork uses it. Returns false when the selection is gone (host resets its sel kind).
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:268
function editor_toolUtilities_roadPlaceables.drawEditor() end

--- Handles/highlight for existing items across every kind (only for the selected road, or the road owning the selected
---  item). showSelected = the host's global selection currently IS one of these items (drives the selected-vs-hover style).
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:222
---@param groups any
---@param selGroup any
---@param showSelected any
function editor_toolUtilities_roadPlaceables.drawHandles(groups, selGroup, showSelected) end

--- Hover glow + prompt for the item under the cursor this frame. kind optional -> the hovered / sole kind.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:251
---@param groups any
---@param gi any
---@param ci any
---@param kind any
function editor_toolUtilities_roadPlaceables.drawHover(groups, gi, ci, kind) end

---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:83
function editor_toolUtilities_roadPlaceables.getSelection() end

--- Ghost preview + click-to-add while placement mode is active (the armed kind). Roads only. Returns true when an item
---  was added (and selects it).
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:147
---@param groups any
function editor_toolUtilities_roadPlaceables.handlePlacement(groups) end

--- Along-road drag of the selected handle. Returns true while it owns the frame (so the host skips the stock
---  node/aux drag). Selection begins the drag so one click-drag moves it.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:194
---@param groups any
function editor_toolUtilities_roadPlaceables.handleSelectDrag(groups) end

---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:79
---@param kind any
function editor_toolUtilities_roadPlaceables.hasSelection(kind) end

---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:78
function editor_toolUtilities_roadPlaceables.isDragging() end

--- Placement-mode accessors (the host tool owns the Add button; it drives these). kind optional -> any / sole kind.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:76
---@param kind any
function editor_toolUtilities_roadPlaceables.isPlaceMode(kind) end

--- Clear everything (host onActivate / onDeactivate): registry + placement mode + selection + drag.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:86
function editor_toolUtilities_roadPlaceables.reset() end

--- Selection accessors so a host listbox can select an item (and highlight the active row).
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:82
---@param kind any
---@param gi any
---@param ci any
function editor_toolUtilities_roadPlaceables.select(kind, gi, ci) end

--- Register a placeable kind's host (call from the tool's onActivate, after reset()). The host carries its own kind.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:58
---@param host any
function editor_toolUtilities_roadPlaceables.setHost(host) end

---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:77
---@param on any
---@param kind any
function editor_toolUtilities_roadPlaceables.setPlaceMode(on, kind) end

--- Nearest item handle under the cursor across all kinds (adaptive radius = splineInput node hits). Returns gi, ci, kind
---  (gi/ci first so a plain `g, c = underMouse()` still works for a single-kind tool). Also stashes hoverKind.
---Source : lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua:95
function editor_toolUtilities_roadPlaceables.underMouse() end

