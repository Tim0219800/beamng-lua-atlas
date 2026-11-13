---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_groundmodel` : `extensions.load("editor_heroRoadEditor_groundmodel")`, puis la globale `editor_heroRoadEditor_groundmodel`
---@class editor_heroRoadEditor_groundmodel
editor_heroRoadEditor_groundmodel = {}

--- Remove ALL paint from the group (caller wraps the undo commit). Physics rebuild is deferred like a normal stroke.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:78
---@param group any
function editor_heroRoadEditor_groundmodel.clearAll(group) end

--- Editor overlay: tint every deck cell (carriageway + shoulders) of the (post-decimation) grid so the whole drivable surface
---  reads as covered -- base/Dry faint, painted patches stronger -- plus an optional deck wireframe. Only the selected road (bounds cost).
---  Reads the SAME stamps + grid the mesh rasterises from, so it can't disagree with the physics.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:146
---@param group any
function editor_heroRoadEditor_groundmodel.drawOverlay(group) end

--- Rebuild the physics mesh of every road painted since the last Apply, then clear the queue. Runs the light surface-only path
---  (mesh + collision, no decals/furniture/terrain-paint). Called every frame from onEditorGui; a no-op unless Apply was clicked.
---  Bake / save read the stamps directly, so they're correct even if Apply was never pressed.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:71
function editor_heroRoadEditor_groundmodel.flushPending() end

---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:55
function editor_heroRoadEditor_groundmodel.getBrushDefault() end

---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:53
function editor_heroRoadEditor_groundmodel.getBrushRadius() end

---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:51
function editor_heroRoadEditor_groundmodel.getMatIndex() end

---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:56
function editor_heroRoadEditor_groundmodel.getShowWire() end

--- Accessors.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:50
function editor_heroRoadEditor_groundmodel.isActive() end

--- Ask for the painted roads' physics to be rebuilt (Apply button). Consumed by flushPending on the next frame -- painting
---  itself only touches the overlay, so nothing rebuilds until the artist explicitly asks for it.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:66
function editor_heroRoadEditor_groundmodel.requestApply() end

---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:59
---@param b any
function editor_heroRoadEditor_groundmodel.setActive(b) end

---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:54
---@param r any
function editor_heroRoadEditor_groundmodel.setBrushRadius(r) end

---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:52
---@param i any
function editor_heroRoadEditor_groundmodel.setMatIndex(i) end

---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:57
---@param b any
function editor_heroRoadEditor_groundmodel.setShowWire(b) end

--- Per-frame while the mode is on: draw the brush cursor and, on LMB drag, drop evenly-spaced world-space stamps. No mesh
---  rebuild here -- the overlay shows the change instantly; the physics rebuild is queued (pending) and applied on the next Apply.
---  One undo entry per stroke. Returns true (the mode owns the mouse) whenever active.
---Source : lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:101
---@param group any
function editor_heroRoadEditor_groundmodel.updateAndPaint(group) end

