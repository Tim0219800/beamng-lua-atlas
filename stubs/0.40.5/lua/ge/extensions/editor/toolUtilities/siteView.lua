---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_siteView` : `extensions.load("editor_toolUtilities_siteView")`, puis la globale `editor_toolUtilities_siteView`
---@class editor_toolUtilities_siteView
---@field modes table
---@field steps table
editor_toolUtilities_siteView = {}

--- Take the editor camera over and frame the selection.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:65
---@param m any
function editor_toolUtilities_siteView.activate(m) end

--- What a camera button does: switch to that camera, or re-frame it when it is already the one driving. That second press
--- is how the tools go to the site, which is why none of them carries a Go To button of its own. Free is the user's camera,
--- so pressing it again deliberately does nothing.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:104
---@param m any
function editor_toolUtilities_siteView.clickMode(m) end

--- Per-frame drive. `blocked` suppresses movement during the tool's own modal interactions (drawing, dragging a handle).
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:116
---@param blocked any
function editor_toolUtilities_siteView.drive(blocked) end

--- Fly whichever camera is driving onto the selection.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:56
---@param m any
function editor_toolUtilities_siteView.focus(m) end

--- Re-frame when the panel is pointed at something else. Free mode is the user's camera and is left alone.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:109
function editor_toolUtilities_siteView.followSelection() end

---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:133
function editor_toolUtilities_siteView.getMode() end

---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:132
function editor_toolUtilities_siteView.getStep() end

--- Hand the editor camera back, on the way out of the tool.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:121
function editor_toolUtilities_siteView.handBack() end

--- Bind to the host tool. `ring` returns the outline to frame, `terrainZ` the ground under a point, `selIndex` what is
--- selected right now (so a change of selection can re-frame), and `onStep` is told when the step changes.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:32
---@param c any
function editor_toolUtilities_siteView.init(c) end

---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:131
function editor_toolUtilities_siteView.isShaping() end

--- Where the tool opens: design, in orbit. Footprint mode is a deliberate trip.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:126
function editor_toolUtilities_siteView.reset() end

---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:71
---@param m any
function editor_toolUtilities_siteView.setMode(m) end

--- Switch editing step. Footprint mode borrows the pan camera whatever was picked before -- the nodes are drawn flat on the
--- ground and are unusable from an angle -- and gives the choice back on the way out. A camera deliberately handed back
--- stays handed back.
---Source : lua/ge/extensions/editor/toolUtilities/siteView.lua:86
---@param key any
function editor_toolUtilities_siteView.setStep(key) end

