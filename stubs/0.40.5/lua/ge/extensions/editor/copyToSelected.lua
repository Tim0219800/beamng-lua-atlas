---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/copyToSelected.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor tool "Copy To Selected": chooses a base object and a list of target objects (current selection, same class or same TSStatic mesh), then creates a copy of the base object at the position of each target (via editor.saveSimObjectMemento / restoreSimObjectMemento). Options: apply the target's rotation or scale, compose rotations (target * base), local offset in meters in the target's frame, copies stored in a new SimGroup "CopiedObjects", selection of the created copies. The action goes through editor.history (undoable/redoable with forced ids).
--- Access: extension `editor_copyToSelected`: `extensions.load("editor_copyToSelected")`, then the global `editor_copyToSelected`
---@class editor_copyToSelected
editor_copyToSelected = {}

--- Draws the "Copy To Selected" window (base object, targets, options, local offsets, "Create Copies" button, error messages) and the preview of the target positions. Called every frame by the editor. After creation, emits extensions.hook('onEditorObjectSelectionChanged') if "Select Created" is checked.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/copyToSelected.lua:376
function editor_copyToSelected.onEditorGui() end

--- Adds the "Copy To Selected" menu entry and registers the window (560x520). Called once at editor initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/copyToSelected.lua:491
function editor_copyToSelected.onEditorInitialized() end

