# `editor_toolUtilities_splineLock`

*File: `lua/ge/extensions/editor/toolUtilities/splineLock.lua` · VM: Game Engine (GE) · 150 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_splineLock`: `extensions.load("editor_toolUtilities_splineLock")`, then the global `editor_toolUtilities_splineLock`

Lock state shared by the editor's custom spline tools. A locked spline (isEnabled == false) stays in its tool, but the generated objects belong to the level: they are saved (canSave = true) and collide. An unlocked spline produces transient preview objects (canSave = false, no collision). Each tool calls sync() from its rebuild, and provides an iterator `each(fn)` that calls fn(obj, collides, isParked) for each object it owns. While locked, the tool neither moves nor redoes the existing objects: manual touch-ups are kept.

## Example

```lua
local lock = require('editor/toolUtilities/splineLock')
local applied = {}
local function each(fn) for _, o in ipairs(myObjs) do fn(o, true, false) end end
lock.sync(applied, spline, 'myTool', each)
```

## Notes

- `each` receives fn(obj, collides, isParked); isParked = object owned but outside the result (hidden for reuse), left as is.
- capture/restore ignore DecalRoad, MeshRoad and River (placed by their nodes, not by a transform).
- All objects tagged with the dynamic fields sourceTool, sourceSplineId and sourceSplineName.
- sync does nothing if the lock state has not changed since the last applied one; a new unlocked spline is considered already in the "live" state.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_splineLock.applyObject(obj, isLocked, collides)` | Puts a generated object in the lock state: canSave = isLocked, and collisionType = 'Collision Mesh' if locked and `collides`, otherwise 'None'. | 38 |
| `editor_toolUtilities_splineLock.capture(each)` | Records the hand-editable state of a spline's objects (transform, scale, shape for TSStatic, folder), keyed by object id. To be taken before an unlock that resets them, so it can be undone. | 100 |
| `editor_toolUtilities_splineLock.dropDeleted(list)` | Removes from a list the references to objects that no longer exist (e.g. deleted by hand in the scene tree). Compacts the list in place. | 18 |
| `editor_toolUtilities_splineLock.hasAny(each)` | True if the tool still owns at least one live (non-parked) object for the spline. | 46 |
| `editor_toolUtilities_splineLock.restore(rec, each)` | Puts a capture back in place after the re-lock that undoes an unlock: shape (shapeName + postApply), transform, scale, folder. Objects created in the meantime and absent from the capture are deleted. Calls be:reloadCollision(). | 118 |
| `editor_toolUtilities_splineLock.sync(applied, spline, toolName, each)` | Aligns the generated objects of a spline with its lock state. Only acts if the state differs from the last applied one (`applied` table id -> isLocked). Updates the scene folder (canSave, tag), the objects (applyObject, tag, put back in the folder if moved by hand). On unlock, deletes the objects in the folder carrying the spline's tag but not owned by the tool. Calls be:reloadCollision(). | 62 |
| `editor_toolUtilities_splineLock.tag(obj, toolName, spline)` | Marks a generated object with the source spline (dynamic fields sourceTool, sourceSplineId, sourceSplineName) to find it in the scene tree or the inspector. | 31 |

### Parameter details

#### `editor_toolUtilities_splineLock.applyObject(obj, isLocked, collides)`

Puts a generated object in the lock state: canSave = isLocked, and collisionType = 'Collision Mesh' if locked and `collides`, otherwise 'None'.

- `obj` (*userdata*) : Scene object.
- `isLocked` (*boolean*) : Spline locked.
- `collides` (*boolean|nil*) : Collision once locked; nil leaves the collision unchanged.

#### `editor_toolUtilities_splineLock.capture(each)`

Records the hand-editable state of a spline's objects (transform, scale, shape for TSStatic, folder), keyed by object id. To be taken before an unlock that resets them, so it can be undone.

- `each` (*function*) : Tool iterator.
- **returns**: table id -> { xf, scale, shape, groupId }.

#### `editor_toolUtilities_splineLock.dropDeleted(list)`

Removes from a list the references to objects that no longer exist (e.g. deleted by hand in the scene tree). Compacts the list in place.

- `list` (*table*) : Array of scene objects, modified in place.

#### `editor_toolUtilities_splineLock.hasAny(each)`

True if the tool still owns at least one live (non-parked) object for the spline.

- `each` (*function*) : Tool iterator.
- **returns**: boolean A live object exists.

#### `editor_toolUtilities_splineLock.restore(rec, each)`

Puts a capture back in place after the re-lock that undoes an unlock: shape (shapeName + postApply), transform, scale, folder. Objects created in the meantime and absent from the capture are deleted. Calls be:reloadCollision().

- `rec` (*table*) : Capture result.
- `each` (*function*) : Tool iterator.

#### `editor_toolUtilities_splineLock.sync(applied, spline, toolName, each)`

Aligns the generated objects of a spline with its lock state. Only acts if the state differs from the last applied one (`applied` table id -> isLocked). Updates the scene folder (canSave, tag), the objects (applyObject, tag, put back in the folder if moved by hand). On unlock, deletes the objects in the folder carrying the spline's tag but not owned by the tool. Calls be:reloadCollision().

- `applied` (*table<any, boolean>*) : Table spline id -> last applied state; modified.
- `spline` (*table*) : Spline (id, name, isEnabled, sceneTreeFolderId).
- `toolName` (*string*) : Tool name, used for the tag.
- `each` (*function*) : Tool iterator.
- **returns**: boolean True if an action was taken.

#### `editor_toolUtilities_splineLock.tag(obj, toolName, spline)`

Marks a generated object with the source spline (dynamic fields sourceTool, sourceSplineId, sourceSplineName) to find it in the scene tree or the inspector.

- `obj` (*userdata*) : Scene object.
- `toolName` (*string*) : Tool name.
- `spline` (*table*) : Spline with .id and .name.

## Calls into the engine (C++)

- `be:` `reloadCollision`
- `obj:` `getClassName`, `getField`, `getGroup`, `getId`, `getScale`, `getTransform`, `postApply`, `setDynDataFieldbyName`, `setField`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/splineLock.lua`.*
