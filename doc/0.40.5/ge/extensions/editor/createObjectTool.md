# `editor_createObjectTool`

*File: `lua/ge/extensions/editor/createObjectTool.lua` · VM: Game Engine (GE) · 1147 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_createObjectTool`: `extensions.load("editor_createObjectTool")`, then the global `editor_createObjectTool`

World Editor "Create Object(s)" tool: toolbar for creating level objects (SimObjects). It defines the button groups (Environment, Level, BeamNG, Other Classes), the editor.editModes.createObject edit mode (placement on click in the 3D view, preview by raycast, rotation around the vertical axis with Ctrl+wheel, grid snapping), a selector of all SimObject classes with filter and usage frequency, and the undo history of each creation. An editor modder uses it to add their own creation groups or create an object by script via the functions injected into editor.

## Example

```lua
local items = {
  editor.makeCreateObjectItem(editor.icons.add_circle, "BeamNGTrigger", "My trigger", function(obj) obj:setField("triggerType", 0, "Box") end)
}
editor.addObjectCreateGroup("My group", editor.icons.folder, items)
```

## Notes

- The functions editor.addObjectCreateGroup, getObjectCreateGroup, getAllObjectCreateGroups, makeCreateObjectItem, getObjectCreateItem, createObjectInstance, getCurrentSelectedParent and createCustomClassObject are only attached to editor after a call to initGroups() (done by onEditorInitialized).
- initGroups() resets the groups table: groups previously added by addObjectCreateGroup are lost.
- The MeshRoad, DecalRoad and River classes are hidden from the "Other Classes" selector (they have their own dedicated editor).
- The default creation parent is the group locked in focus, otherwise the SimSet or group of the selected object (except MissionCleanup), otherwise scenetree.MissionGroup.
- Created object names are <Class>_<n> with the smallest free n.
- A TSStatic created without a mesh receives the placeholder shape /core/art/shapes/no_mesh.dae to avoid the "No shape set" error on save.
- The creation of a BeamNGVehicle is commented out in the code ("crashes").
- Preferences registered in the createObjectTool.general category: infiniteCreateByClick (true), verticalToolbar (false), classFrecency (hidden).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_createObjectTool.initGroups()` | Recreates the four standard groups (Environment, Level, BeamNG, Other Classes) with their buttons and attaches the creation functions to editor (addObjectCreateGroup, makeCreateObjectItem, createObjectInstance...). Can be called even if the editor is not active. | 1001 |
| `editor_createObjectTool.navigateList(up)` | Moves the selection in the class search list (up if up is true, otherwise down), clamped to the list. | 350 |
| `editor_createObjectTool.onEditorDeactivated()` | Hook called when the World Editor closes; removes the "CreateObjectTool" action map. *(internal)* *(hook)* | 1129 |
| `editor_createObjectTool.onEditorGui()` | Hook called every editor frame; removes the "CreateObjectTool" action map as long as no class selection popup is open. *(internal)* *(hook)* | 1133 |
| `editor_createObjectTool.onEditorInitialized()` | Hook called at editor initialization: declares the "Create Object(s)" edit mode, the auxiliary shortcuts (Ctrl+wheel to rotate, Alt for snapping), editor.stopCreatingObjects, editor.togglePlaceNewObjectAtCamera, calls initGroups() and loads the list of SimObject classes (Sim.getSimObjectDerivedClassNames). *(internal)* *(hook)* | 1073 |
| `editor_createObjectTool.onEditorRegisterPreferences(prefsRegistry)` | Hook called to register the preferences of the createObjectTool category. *(internal)* *(hook)* | 1118 |
| `editor_createObjectTool.selectClass()` | Validates the class currently highlighted in the class selector (equivalent to Enter, triggered by the action map). | 345 |

### Parameter details

#### `editor_createObjectTool.navigateList(up)`

Moves the selection in the class search list (up if up is true, otherwise down), clamped to the list.

- `up` (*boolean*) : true to go up, false to go down

#### `editor_createObjectTool.onEditorRegisterPreferences(prefsRegistry)`

Hook called to register the preferences of the createObjectTool category.

- `prefsRegistry` (*table*) : editor preferences registry

## Class `editor`

Functions added to the global editor table by initGroups().

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.addObjectCreateGroup(name, icon, objectClasses)` | Adds a creation group button to the toolbar. | 979 |
| `editor.createCustomClassObject(clsName, parentNode)` | Creates an object of the given class under a scene tree node. Emits the hook onEditorCustomClassBuildFunc(obj) before registration, gives a placeholder shapeName to TSStatics without a shape, registers the object with a numbered name and adds it to the parent. | 288 |
| `editor.createObjectInstance(classname, createObjectItem)` | Creates an instance via worldEditorCppApi.createObject, names it (<Class>_<n>), runs the item's buildFunc, then registers it (triggers onAdd). Does not add it to a group. | 113 |
| `editor.getAllObjectCreateGroups()` | Returns the complete table of creation groups. | 996 |
| `editor.getCurrentSelectedParent()` | Returns the default parent for new objects (focused group, selection's group, or MissionGroup). | 61 |
| `editor.getObjectCreateGroup(name)` | Returns a creation group by its name. | 988 |
| `editor.getObjectCreateItem(classname)` | Searches all groups for the item whose classname matches (the first found). | 103 |
| `editor.makeCreateObjectItem(icon, classname, title, buildFunc, singleInstance)` | Builds a creation item {icon, classname, title, buildFunc, singleInstance}. title defaults to classname. | 965 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorCustomClassBuildFunc`

## Calls into the engine (C++)

- `Sim.` `getSimObjectDerivedClassNames`, `upcast`
- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`
- `obj:` `getClassName`, `getField`, `getGroup`, `getId`, `getPosition`, `getScale`, `isSubClassOf`, `registerObject`, `reloadTextures`, `setEmitterDataBlock`, `setField`, `setName`, `setPosition`, `setTerrFileLvlFolder`, `setTransform`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`, `setAxisGizmoSelectedElement`, `snapPositionToGrid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/createObjectTool.lua`.*
