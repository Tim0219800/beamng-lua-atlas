---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/strips.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_dragRaceEditor_strips` : `extensions.load("editor_dragRaceEditor_strips")`, puis la globale `editor_dragRaceEditor_strips`
---@class editor_dragRaceEditor_strips
editor_dragRaceEditor_strips = {}

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:227
function editor_dragRaceEditor_strips.addStrip() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:945
---@param boundary any
function editor_dragRaceEditor_strips.beginBoundaryDrag(boundary) end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:953
---@param boundary any
function editor_dragRaceEditor_strips.draggingBoundary(boundary) end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:981
---@param corner any
---@param x any
---@param y any
---@param z any
---@param clr any
function editor_dragRaceEditor_strips.drawAxisBox(corner, x, y, z, clr) end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:1031
function editor_dragRaceEditor_strips.drawBoundariesInWorld() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:659
function editor_dragRaceEditor_strips.drawLaneEditor() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:434
function editor_dragRaceEditor_strips.drawStripDetails() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:372
function editor_dragRaceEditor_strips.drawStripsList() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:919
function editor_dragRaceEditor_strips.drawStripsPreview() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:894
function editor_dragRaceEditor_strips.drawZonesInWorld() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:639
---@param stripIndex any
---@param laneIndex any
function editor_dragRaceEditor_strips.editLane(stripIndex, laneIndex) end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:927
---@param boundary any
function editor_dragRaceEditor_strips.enableBoundaryGizmo(boundary) end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:977
---@param boundary any
function editor_dragRaceEditor_strips.endBoundaryDrag(boundary) end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:171
function editor_dragRaceEditor_strips.getAllStrips() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:651
function editor_dragRaceEditor_strips.getSelectedLane() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:192
function editor_dragRaceEditor_strips.getSelectedStrip() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:184
function editor_dragRaceEditor_strips.getSelectedStripIndex() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:175
function editor_dragRaceEditor_strips.hasSavedStrips() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:157
function editor_dragRaceEditor_strips.loadAllStrips() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:313
function editor_dragRaceEditor_strips.removeSelectedStrip() end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:327
---@param strip any
function editor_dragRaceEditor_strips.saveStrip(strip) end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:199
---@param index any
function editor_dragRaceEditor_strips.selectStrip(index) end

---Source : lua/ge/extensions/editor/dragRaceEditor/strips.lua:188
---@param index any
function editor_dragRaceEditor_strips.setSelectedStripIndex(index) end

