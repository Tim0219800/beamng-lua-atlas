---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/decal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor API for terrain/object decals (Engine.Render.DecalMgr): creation and deletion of templates (DecalData), adding/removing instances, lookup and saving. initialize(editor) creates the decalPersistMan PersistenceManager and adds the functions to editor. Templates are saved in art/decals/managedDecalData.json of the mission folder, instances in main.decals.json.
--- Access: extension `editor_api_decal`: `extensions.load("editor_api_decal")`, then the global `editor_api_decal`
---@class editor_api_decal
editor_api_decal = {}

--- Creates decalPersistMan if it does not exist and installs the functions on the editor object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/decal.lua:133
---@param editorInstance table editor object
function editor_api_decal.initialize(editorInstance) end

--- Functions added to the editor object by initialize.
---@class editor_api_decal_editor
local editor_api_decal_editor = {}

--- Adds a decal instance oriented by a normal and a rotation around it.
---Source: lua/ge/extensions/editor/api/decal.lua:55
---@param pos vec3 Position
---@param normal vec3 Normal
---@param rotAroundNormal number Rotation around the normal
---@param template userdata DecalData template
---@param decalScale number|nil Scale, 1 by default
---@param decalTexIndex integer|nil Texture index, -1 by default
---@param flags integer|nil Flags, 0 by default
---@param initialAlpha number|nil Initial alpha, 1 by default
---@return userdata  Created instance
function editor_api_decal_editor.addDecalInstance(pos, normal, rotAroundNormal, template, decalScale, decalTexIndex, flags, initialAlpha) end

--- Like addDecalInstance but oriented by a tangent vector.
---Source: lua/ge/extensions/editor/api/decal.lua:62
---@param pos vec3 Position
---@param normal vec3 Normal
---@param tangent vec3 Tangent
---@param template userdata DecalData template
---@param decalScale number|nil Scale, 1 by default
---@param decalTexIndex integer|nil Texture index, -1 by default
---@param flags integer|nil Flags, 0 by default
---@param initialAlpha number|nil Initial alpha, 1 by default
---@return userdata  Created instance
function editor_api_decal_editor.addDecalInstanceWithTan(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha) end

--- Like addDecalInstanceWithTan but forcing the instance index.
---Source: lua/ge/extensions/editor/api/decal.lua:69
---@param pos vec3 Position
---@param normal vec3 Normal
---@param tangent vec3 Tangent
---@param template userdata DecalData template
---@param decalScale number|nil Scale, 1 by default
---@param decalTexIndex integer|nil Texture index, -1 by default
---@param flags integer|nil Flags, 0 by default
---@param initialAlpha number|nil Initial alpha, 1 by default
---@param index integer Forced index (inferred from code)
---@return userdata  Created instance
function editor_api_decal_editor.addDecalInstanceWithTanForceId(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha, index) end

--- Creates a DecalData with the unique name NewTemplate (WarningMaterial material) and marks it as modified for the decals file.
---Source: lua/ge/extensions/editor/api/decal.lua:18
---@return integer  Template ID
function editor_api_decal_editor.createDecalTemplate() end

--- Deletes an instance and marks the editor as modified.
---Source: lua/ge/extensions/editor/api/decal.lua:94
---@param instance userdata Instance
function editor_api_decal_editor.deleteDecalInstance(instance) end

--- Deletes all instances using this template, removes the template from the set and queues it for deletion at the next saveDecals.
---Source: lua/ge/extensions/editor/api/decal.lua:34
---@param template userdata DecalData template
function editor_api_decal_editor.deleteDecalTemplate(template) end

--- Returns the decal closest to a position.
---Source: lua/ge/extensions/editor/api/decal.lua:99
---@param pos vec3 Position
---@return userdata|nil  Closest instance
function editor_api_decal_editor.getClosestDecal(pos) end

--- Path of the templates file: mission folder + art/decals/managedDecalData.json.
---Source: lua/ge/extensions/editor/api/decal.lua:10
---@return string  Path
function editor_api_decal_editor.getDecalDataFilePath() end

--- Returns the instance with the given index, or nil if invalid.
---Source: lua/ge/extensions/editor/api/decal.lua:76
---@param index integer Index
---@return userdata|nil  Instance
function editor_api_decal_editor.getDecalInstance(index) end

--- Returns the instance with the given uid, or nil if invalid.
---Source: lua/ge/extensions/editor/api/decal.lua:83
---@param uid integer Uid
---@return userdata|nil  Instance
function editor_api_decal_editor.getDecalInstanceByUid(uid) end

--- Number of slots in the instances array.
---Source: lua/ge/extensions/editor/api/decal.lua:90
---@return integer  Size
function editor_api_decal_editor.getDecalInstanceVecSize() end

--- Returns the set of templates (DecalMgr.getSet()).
---Source: lua/ge/extensions/editor/api/decal.lua:47
---@return userdata  Templates SimSet
function editor_api_decal_editor.getDecalTemplates() end

--- Returns whether any templates have unsaved changes.
---Source: lua/ge/extensions/editor/api/decal.lua:51
---@return boolean  true if modified
function editor_api_decal_editor.hasDirtyDecalTemplates() end

--- Returns whether the decal/template has unsaved changes.
---Source: lua/ge/extensions/editor/api/decal.lua:108
---@param decal userdata Template
---@return boolean  true if modified
function editor_api_decal_editor.isDecalDirty(decal) end

--- Tells the engine that an instance has changed and marks the editor as modified.
---Source: lua/ge/extensions/editor/api/decal.lua:103
---@param instance userdata Instance
function editor_api_decal_editor.notifyDecalModified(instance) end

--- Saves a modified template.
---Source: lua/ge/extensions/editor/api/decal.lua:112
---@param template userdata Template
function editor_api_decal_editor.saveDecal(template) end

--- Purges the templates queued for deletion, saves the modified templates and writes the instances to main.decals.json in the mission folder.
---Source: lua/ge/extensions/editor/api/decal.lua:116
function editor_api_decal_editor.saveDecals() end

