---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/createObjectTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_createObjectTool` : `extensions.load("editor_createObjectTool")`, puis la globale `editor_createObjectTool`
---@class editor_createObjectTool
editor_createObjectTool = {}

--- Initializes all groups; this exists so it can be called even if the editor is not active
---Source : lua/ge/extensions/editor/createObjectTool.lua:1001
function editor_createObjectTool.initGroups() end

---Source : lua/ge/extensions/editor/createObjectTool.lua:350
---@param up any
function editor_createObjectTool.navigateList(up) end

---Source : lua/ge/extensions/editor/createObjectTool.lua:1129
function editor_createObjectTool.onEditorDeactivated() end

---Source : lua/ge/extensions/editor/createObjectTool.lua:1133
function editor_createObjectTool.onEditorGui() end

---Source : lua/ge/extensions/editor/createObjectTool.lua:1073
function editor_createObjectTool.onEditorInitialized() end

---Source : lua/ge/extensions/editor/createObjectTool.lua:1118
---@param prefsRegistry any
function editor_createObjectTool.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/createObjectTool.lua:345
function editor_createObjectTool.selectClass() end

--- Classe locale `editor` de lua/ge/extensions/editor/createObjectTool.lua
---@class editor_createObjectTool_editor
local editor_createObjectTool_editor = {}

--- Add a new create objects group button to the create toolbar.
---  @param name the name of the custom create group
---  @param icon the icon for this group's button (in the form of: ``editor.icons.some_icon_name_here``)
---  @param objectClasses an array of object class info tables to create the buttons in this group, the info table for a class can be created with the `editor.makeCreateObjectItem` function
---Source : lua/ge/extensions/editor/createObjectTool.lua:979
---@param name any
---@param icon any
---@param objectClasses any
function editor_createObjectTool_editor.addObjectCreateGroup(name, icon, objectClasses) end

--- Create a class object under selected scene tree node.
---  @param clsName object class name
---  @param parentNode scene tree parent node (optional, defaults to current selected node)
---  @returns created object instance
---Source : lua/ge/extensions/editor/createObjectTool.lua:288
---@param clsName any
---@param parentNode any
function editor_createObjectTool_editor.createCustomClassObject(clsName, parentNode) end

---Source : lua/ge/extensions/editor/createObjectTool.lua:113
---@param classname any
---@param createObjectItem any
function editor_createObjectTool_editor.createObjectInstance(classname, createObjectItem) end

--- Return all create groups.
---  @returns the entire create group table
---Source : lua/ge/extensions/editor/createObjectTool.lua:996
function editor_createObjectTool_editor.getAllObjectCreateGroups() end

---Source : lua/ge/extensions/editor/createObjectTool.lua:61
function editor_createObjectTool_editor.getCurrentSelectedParent() end

--- Return a create group info table by group name.
---  @param name the name of the create group
---  @returns the create group
---Source : lua/ge/extensions/editor/createObjectTool.lua:988
---@param name any
function editor_createObjectTool_editor.getObjectCreateGroup(name) end

---Source : lua/ge/extensions/editor/createObjectTool.lua:103
---@param classname any
function editor_createObjectTool_editor.getObjectCreateItem(classname) end

--- Prepare a create object item for the toolbar. Used as a helper when creating the array for the new group.
---  @param icon the icon for the create object button
---  @param classname the C++ classname for the create object button, to create the instance for
---  @param title the display name for the class
---  @param buildFunc the function to be called right before the instance is created, so you can setup the object
---  @param singleInstance true if this button will create a single instance on click, otherwise if false, you create instances by clicking in the 3D viewport until ESCAPE is pressed
---Source : lua/ge/extensions/editor/createObjectTool.lua:965
---@param icon any
---@param classname any
---@param title any
---@param buildFunc any
---@param singleInstance any
function editor_createObjectTool_editor.makeCreateObjectItem(icon, classname, title, buildFunc, singleInstance) end

