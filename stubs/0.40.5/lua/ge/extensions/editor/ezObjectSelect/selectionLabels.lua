---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionLabels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small utility of the Easy Select tool: computes the text displayed to name a scene object. Priority: object name, internal name, asset file name (field shapeName or getModelFile), otherwise "Class #id". A prefix indicates the type: [p] Prefab/PrefabInstance, [s] TSStatic, [v] BeamNGVehicle.
--- Access: extension `editor_ezObjectSelect_selectionLabels`: `extensions.load("editor_ezObjectSelect_selectionLabels")`, then the global `editor_ezObjectSelect_selectionLabels`
---@class editor_ezObjectSelect_selectionLabels
editor_ezObjectSelect_selectionLabels = {}

--- Returns an object's label. If objectId is provided, the object is retrieved via scenetree.findObjectById; if it no longer exists, returns "deleted #id" (or "missing" if no id).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionLabels.lua:29
---@param obj userdata|nil Scene object (ignored if objectId is given)
---@param objectId integer|nil Id of the object to retrieve in scenetree
---@return string  Label, possibly prefixed by [p], [s] or [v]
function editor_ezObjectSelect_selectionLabels.objectName(obj, objectId) end

