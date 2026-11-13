---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/bake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_bake` : `extensions.load("editor_toolUtilities_bake")`, puis la globale `editor_toolUtilities_bake`
---@class editor_toolUtilities_bake
editor_toolUtilities_bake = {}

--- Master-Spline propagation: bake the spline with `id` (typically a LINKED child) WITHOUT opening its own history
---  transaction -- the Master Spline wraps the whole multi-tool burn in one action. Returns { manifest, folderId } so the
---  Master's undo can delete exactly these objects and reset the folder. Returns nil when the id isn't found.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:166
---@param spec any
---@param id any
function editor_toolUtilities_bake.burnById(spec, id) end

--- Column variant: draws the Bake button as ONE column cell (call after the tool's other top-row column cells; the caller
---  must widen its im.Columns count by 1). When there is no bakeable spline selected the cell is a blank Dummy, matching
---  how these tools blank other unavailable buttons.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:142
---@param spec any
function editor_toolUtilities_bake.renderButton(spec) end

--- Inline variant: draws the Bake button (or a blank Dummy) with NO column handling, for tools whose top row is a plain
---  im.SameLine sequence. The caller adds its own im.SameLine() beforehand to keep it on the same row.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:151
---@param spec any
function editor_toolUtilities_bake.renderButtonInline(spec) end

--- Row variant: draws the Bake button for ONE list row's spline (small icon, spec's red colour), or a blank Dummy when that
---  spline isn't bakeable. A click bakes it immediately and returns true -- the caller MUST then editor.endWindow() + return,
---  exactly like its delete button does, because the bake mutated the tool's item list mid-iteration. Draw this as its own
---  column cell (widen the row's im.Columns count by 1) and follow it with im.NextColumn() like the other row buttons.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:178
---@param spec any
---@param spline any
function editor_toolUtilities_bake.rowButton(spec, spline) end

--- Locks/unlocks `spline` as one undoable history transaction. Used by both the flame button and the tool's lock toggle.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:114
---@param spec any
---@param spline any
---@param isLocked any
function editor_toolUtilities_bake.setLocked(spec, spline, isLocked) end

--- Take one bake back out of the level: delete the burned objects and planted items, and reset their folder to transient.
---  `data` is what doBake (or burnById) recorded.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:72
---@param data any
function editor_toolUtilities_bake.unburn(data) end

