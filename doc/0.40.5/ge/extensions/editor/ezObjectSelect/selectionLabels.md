# `editor_ezObjectSelect_selectionLabels`

*File: `lua/ge/extensions/editor/ezObjectSelect/selectionLabels.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_selectionLabels`: `extensions.load("editor_ezObjectSelect_selectionLabels")`, then the global `editor_ezObjectSelect_selectionLabels`

Small utility of the Easy Select tool: computes the text displayed to name a scene object. Priority: object name, internal name, asset file name (field shapeName or getModelFile), otherwise "Class #id". A prefix indicates the type: [p] Prefab/PrefabInstance, [s] TSStatic, [v] BeamNGVehicle.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_selectionLabels.objectName(obj, objectId)` | Returns an object's label. If objectId is provided, the object is retrieved via scenetree.findObjectById; if it no longer exists, returns "deleted #id" (or "missing" if no id). | 29 |

### Parameter details

#### `editor_ezObjectSelect_selectionLabels.objectName(obj, objectId)`

Returns an object's label. If objectId is provided, the object is retrieved via scenetree.findObjectById; if it no longer exists, returns "deleted #id" (or "missing" if no id).

- `obj` (*userdata|nil*) : Scene object (ignored if objectId is given)
- `objectId` (*integer|nil*) : Id of the object to retrieve in scenetree
- **returns**: string Label, possibly prefixed by [p], [s] or [v]

## Calls into the engine (C++)

- `obj:` `getClassName`, `getField`, `getID`, `getInternalName`, `getModelFile`, `getName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/selectionLabels.lua`.*
