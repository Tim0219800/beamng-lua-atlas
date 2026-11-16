---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/import.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Import for the Assembly Spline tool: converts TSStatic objects already placed in the level (compatible with the assembly kit, i.e. having anchors named 'nail.*') into an assembly spline. It rebuilds the assembly kit and the molecule from the meshes, fits a polyline on the root components (fitPoly), creates the spline, deletes the original TSStatics (and empty groups) and records the action in the undo history (undo/redo restores the saved TSStatics). Used by the scene tree right-click menu and by the tool's selection polygon.
--- Access: extension `editor_assemblySpline_import`: `extensions.load("editor_assemblySpline_import")`, then the global `editor_assemblySpline_import`
---@class editor_assemblySpline_import
editor_assemblySpline_import = {}

--- Converts a selection of TSStatics into an assembly spline: filters the compatible ones, rebuilds the kit and the molecule, fits the polyline, creates the spline, deletes the original objects, reloads collision (be:reloadCollision) and records the action "Convert TSStatics to Assembly Spline" in editor.history.
---Source: lua/ge/extensions/editor/assemblySpline/import.lua:566
---@param collection integer[]|nil Ids of the selected TSStatic objects.
function editor_assemblySpline_import.convertTSStatics2AssemblySpline(collection) end

--- Deferred update after an import: after 2 calls, marks the last assembly spline as dirty to rebuild it once the collision is updated. Called every frame by onEditorGui of assemblySpline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assemblySpline/import.lua:42
function editor_assemblySpline_import.handleDelayedSplineUpdates() end

--- Finds all TSStatics in the level whose position is inside the polygon and converts them via convertTSStatics2AssemblySpline.
---Source: lua/ge/extensions/editor/assemblySpline/import.lua:651
---@param polygon table Selection polygon (list of points).
function editor_assemblySpline_import.importFromPolygon(polygon) end

--- Indicates whether the object is a TSStatic with at least one anchor whose name starts with "nail.".
---Source: lua/ge/extensions/editor/assemblySpline/import.lua:145
---@param obj table|nil Scene object.
---@return boolean  true if compatible.
function editor_assemblySpline_import.validateToolCompatibleTSStatic(obj) end

