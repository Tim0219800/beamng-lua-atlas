---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/decal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_decal` : `extensions.load("editor_api_decal")`, puis la globale `editor_api_decal`
---@class editor_api_decal
editor_api_decal = {}

---Source : lua/ge/extensions/editor/api/decal.lua:133
---@param editorInstance any
function editor_api_decal.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/decal.lua
---@class editor_api_decal_editor
local editor_api_decal_editor = {}

---Source : lua/ge/extensions/editor/api/decal.lua:55
---@param pos any
---@param normal any
---@param rotAroundNormal any
---@param template any
---@param decalScale any
---@param decalTexIndex any
---@param flags any
---@param initialAlpha any
function editor_api_decal_editor.addDecalInstance(pos, normal, rotAroundNormal, template, decalScale, decalTexIndex, flags, initialAlpha) end

---Source : lua/ge/extensions/editor/api/decal.lua:62
---@param pos any
---@param normal any
---@param tangent any
---@param template any
---@param decalScale any
---@param decalTexIndex any
---@param flags any
---@param initialAlpha any
function editor_api_decal_editor.addDecalInstanceWithTan(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha) end

---Source : lua/ge/extensions/editor/api/decal.lua:69
---@param pos any
---@param normal any
---@param tangent any
---@param template any
---@param decalScale any
---@param decalTexIndex any
---@param flags any
---@param initialAlpha any
---@param index any
function editor_api_decal_editor.addDecalInstanceWithTanForceId(pos, normal, tangent, template, decalScale, decalTexIndex, flags, initialAlpha, index) end

---Source : lua/ge/extensions/editor/api/decal.lua:18
function editor_api_decal_editor.createDecalTemplate() end

---Source : lua/ge/extensions/editor/api/decal.lua:94
---@param instance any
function editor_api_decal_editor.deleteDecalInstance(instance) end

---Source : lua/ge/extensions/editor/api/decal.lua:34
---@param template any
function editor_api_decal_editor.deleteDecalTemplate(template) end

---Source : lua/ge/extensions/editor/api/decal.lua:99
---@param pos any
function editor_api_decal_editor.getClosestDecal(pos) end

---Source : lua/ge/extensions/editor/api/decal.lua:10
function editor_api_decal_editor.getDecalDataFilePath() end

---Source : lua/ge/extensions/editor/api/decal.lua:76
---@param index any
function editor_api_decal_editor.getDecalInstance(index) end

---Source : lua/ge/extensions/editor/api/decal.lua:83
---@param uid any
function editor_api_decal_editor.getDecalInstanceByUid(uid) end

---Source : lua/ge/extensions/editor/api/decal.lua:90
function editor_api_decal_editor.getDecalInstanceVecSize() end

---Source : lua/ge/extensions/editor/api/decal.lua:47
function editor_api_decal_editor.getDecalTemplates() end

---Source : lua/ge/extensions/editor/api/decal.lua:51
function editor_api_decal_editor.hasDirtyDecalTemplates() end

---Source : lua/ge/extensions/editor/api/decal.lua:108
---@param decal any
function editor_api_decal_editor.isDecalDirty(decal) end

---Source : lua/ge/extensions/editor/api/decal.lua:103
---@param instance any
function editor_api_decal_editor.notifyDecalModified(instance) end

---Source : lua/ge/extensions/editor/api/decal.lua:112
---@param template any
function editor_api_decal_editor.saveDecal(template) end

---Source : lua/ge/extensions/editor/api/decal.lua:116
function editor_api_decal_editor.saveDecals() end

