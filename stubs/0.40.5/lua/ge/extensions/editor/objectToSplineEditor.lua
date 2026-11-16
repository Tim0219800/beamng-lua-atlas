---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/objectToSplineEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Object To Spline Editor" tool of the World Editor: copies an object (TSStatic or BeamNGVehicle) along a guide spline (DecalRoad or MeshRoad). You choose the object and the spline from the selection, then set the gap, the start and end offsets, the object's axis, the maximum number of copies (500 by default), the orientation along the terrain normal, an alternate mode, placement in a SimGroup and random variations (gap, position, rotation, Gaussian). The spline is drawn in green and the planned positions in yellow with debugDrawer.
--- Access: extension `editor_objectToSplineEditor`: `extensions.load("editor_objectToSplineEditor")`, then the global `editor_objectToSplineEditor`
---@class editor_objectToSplineEditor
editor_objectToSplineEditor = {}

--- Editor hook called every frame: draws the "Object To Spline Editor" window (object and spline selection, parameters, creation) and the guide spline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectToSplineEditor.lua:254
function editor_objectToSplineEditor.onEditorGui() end

--- Hook called at editor initialization: registers the window (420x500) and the "Object To Spline Editor" menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectToSplineEditor.lua:490
function editor_objectToSplineEditor.onEditorInitialized() end

