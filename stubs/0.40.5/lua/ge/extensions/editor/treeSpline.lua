---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/treeSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_treeSpline` : `extensions.load("editor_treeSpline")`, puis la globale `editor_treeSpline`
---@class editor_treeSpline
editor_treeSpline = {}

---Source : lua/ge/extensions/editor/treeSpline.lua:592
function editor_treeSpline.onClientEndMission() end

---Source : lua/ge/extensions/editor/treeSpline.lua:556
---@param data any
function editor_treeSpline.onDeserialized(data) end

--- Only locked splines' trees are the level's. The live ones go back on the next frame, after every save hook has run.
---Source : lua/ge/extensions/editor/treeSpline.lua:598
function editor_treeSpline.onEditorBeforeSaveLevel() end

---Source : lua/ge/extensions/editor/treeSpline.lua:504
function editor_treeSpline.onEditorGui() end

---Source : lua/ge/extensions/editor/treeSpline.lua:579
function editor_treeSpline.onEditorInitialized() end

--- Serialise: snapshot the spline definitions, then remove the planted instances so no orphans survive the Lua
---  VM reload; onDeserialized re-plants them. A locked spline's trees (and any hand edits) stay in the forest instead: it carries
---  their keys across and takes them back.
---Source : lua/ge/extensions/editor/treeSpline.lua:546
function editor_treeSpline.onSerialize() end

--- Locks/unlocks the tree spline with this id and re-plants it now (also used by the Master Spline for linked children). A
---  locked spline's trees are left in the forest when the level saves (see onEditorBeforeSaveLevel).
---Source : lua/ge/extensions/editor/treeSpline.lua:118
---@param id any
---@param isLocked any
function editor_treeSpline.setLockedById(id, isLocked) end

---Source : lua/ge/extensions/editor/treeSpline.lua:99
---@param idx any
function editor_treeSpline.setSelectedNodeIdx(idx) end

--- Cross-tool selection setters (invoked by splineInput when a jump into this tool occurs). Both must exist or
---  splineInput skips the selection entirely (it requires the pair).
---Source : lua/ge/extensions/editor/treeSpline.lua:98
---@param idx any
function editor_treeSpline.setSelectedSplineIdx(idx) end

