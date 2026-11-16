---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/createObjectTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World Editor "Create Object(s)" tool: toolbar for creating level objects (SimObjects). It defines the button groups (Environment, Level, BeamNG, Other Classes), the editor.editModes.createObject edit mode (placement on click in the 3D view, preview by raycast, rotation around the vertical axis with Ctrl+wheel, grid snapping), a selector of all SimObject classes with filter and usage frequency, and the undo history of each creation. An editor modder uses it to add their own creation groups or create an object by script via the functions injected into editor.
--- Access: extension `editor_createObjectTool`: `extensions.load("editor_createObjectTool")`, then the global `editor_createObjectTool`
---@class editor_createObjectTool
editor_createObjectTool = {}

--- Recreates the four standard groups (Environment, Level, BeamNG, Other Classes) with their buttons and attaches the creation functions to editor (addObjectCreateGroup, makeCreateObjectItem, createObjectInstance...). Can be called even if the editor is not active.
---Source: lua/ge/extensions/editor/createObjectTool.lua:1001
function editor_createObjectTool.initGroups() end

--- Moves the selection in the class search list (up if up is true, otherwise down), clamped to the list.
---Source: lua/ge/extensions/editor/createObjectTool.lua:350
---@param up boolean true to go up, false to go down
function editor_createObjectTool.navigateList(up) end

--- Hook called when the World Editor closes; removes the "CreateObjectTool" action map.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/createObjectTool.lua:1129
function editor_createObjectTool.onEditorDeactivated() end

--- Hook called every editor frame; removes the "CreateObjectTool" action map as long as no class selection popup is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/createObjectTool.lua:1133
function editor_createObjectTool.onEditorGui() end

--- Hook called at editor initialization: declares the "Create Object(s)" edit mode, the auxiliary shortcuts (Ctrl+wheel to rotate, Alt for snapping), editor.stopCreatingObjects, editor.togglePlaceNewObjectAtCamera, calls initGroups() and loads the list of SimObject classes (Sim.getSimObjectDerivedClassNames).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/createObjectTool.lua:1073
function editor_createObjectTool.onEditorInitialized() end

--- Hook called to register the preferences of the createObjectTool category.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/createObjectTool.lua:1118
---@param prefsRegistry table editor preferences registry
function editor_createObjectTool.onEditorRegisterPreferences(prefsRegistry) end

--- Validates the class currently highlighted in the class selector (equivalent to Enter, triggered by the action map).
---Source: lua/ge/extensions/editor/createObjectTool.lua:345
function editor_createObjectTool.selectClass() end

--- Functions added to the global editor table by initGroups().
---@class editor_createObjectTool_editor
local editor_createObjectTool_editor = {}

--- Adds a creation group button to the toolbar.
---Source: lua/ge/extensions/editor/createObjectTool.lua:979
---@param name string group name
---@param icon any icon (editor.icons.xxx)
---@param objectClasses table[] items created with editor.makeCreateObjectItem
function editor_createObjectTool_editor.addObjectCreateGroup(name, icon, objectClasses) end

--- Creates an object of the given class under a scene tree node. Emits the hook onEditorCustomClassBuildFunc(obj) before registration, gives a placeholder shapeName to TSStatics without a shape, registers the object with a numbered name and adds it to the parent.
---Source: lua/ge/extensions/editor/createObjectTool.lua:288
---@param clsName string C++ class name
---@param parentNode userdata|nil parent (default: current selection)
---@return userdata|nil  created object
function editor_createObjectTool_editor.createCustomClassObject(clsName, parentNode) end

--- Creates an instance via worldEditorCppApi.createObject, names it (<Class>_<n>), runs the item's buildFunc, then registers it (triggers onAdd). Does not add it to a group.
---Source: lua/ge/extensions/editor/createObjectTool.lua:113
---@param classname string C++ class
---@param createObjectItem table|nil creation item (default: looked up by classname)
---@return userdata|nil  instance
function editor_createObjectTool_editor.createObjectInstance(classname, createObjectItem) end

--- Returns the complete table of creation groups.
---Source: lua/ge/extensions/editor/createObjectTool.lua:996
---@return table[]  groups {name, icon, objectClasses}
function editor_createObjectTool_editor.getAllObjectCreateGroups() end

--- Returns the default parent for new objects (focused group, selection's group, or MissionGroup).
---Source: lua/ge/extensions/editor/createObjectTool.lua:61
---@return userdata  SimSet/SimGroup
function editor_createObjectTool_editor.getCurrentSelectedParent() end

--- Returns a creation group by its name.
---Source: lua/ge/extensions/editor/createObjectTool.lua:988
---@param name string group name
---@return table|nil  group
function editor_createObjectTool_editor.getObjectCreateGroup(name) end

--- Searches all groups for the item whose classname matches (the first found).
---Source: lua/ge/extensions/editor/createObjectTool.lua:103
---@param classname string C++ class
---@return table|nil  creation item
function editor_createObjectTool_editor.getObjectCreateItem(classname) end

--- Builds a creation item {icon, classname, title, buildFunc, singleInstance}. title defaults to classname.
---Source: lua/ge/extensions/editor/createObjectTool.lua:965
---@param icon any button icon
---@param classname string C++ class to instantiate
---@param title string|nil displayed name
---@param buildFunc function|nil called with the instance just before its registration
---@param singleInstance boolean|nil true: a single instance created on button click; otherwise creation by clicks in the 3D view until Esc
---@return table  item
function editor_createObjectTool_editor.makeCreateObjectItem(icon, classname, title, buildFunc, singleInstance) end

