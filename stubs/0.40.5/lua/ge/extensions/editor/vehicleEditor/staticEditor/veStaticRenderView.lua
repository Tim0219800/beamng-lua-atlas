---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_vehicleEditor_staticEditor_veStaticRenderView` : `extensions.load("editor_vehicleEditor_staticEditor_veStaticRenderView")`, puis la globale `editor_vehicleEditor_staticEditor_veStaticRenderView`
---@class editor_vehicleEditor_staticEditor_veStaticRenderView
editor_vehicleEditor_staticEditor_veStaticRenderView = {}

--- Creates a new renderview UI
---  Go through list of renderview datas
---  and if data exists but window for that data is hidden, show it
---  else if data doesn't exist, create new data and register new window
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:191
function editor_vehicleEditor_staticEditor_veStaticRenderView.createRenderViewUI() end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:757
function editor_vehicleEditor_staticEditor_veStaticRenderView.destroyAllRenderViews() end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:748
function editor_vehicleEditor_staticEditor_veStaticRenderView.getMainRenderViewMouseRay() end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:801
---@param val any
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveBackward(val) end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:800
---@param val any
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveForward(val) end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:798
---@param val any
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveLeft(val) end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:799
---@param val any
function editor_vehicleEditor_staticEditor_veStaticRenderView.moveRight(val) end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:793
---@param data any
function editor_vehicleEditor_staticEditor_veStaticRenderView.onDeserialize(data) end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:686
---@param dt any
function editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorGui(dt) end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:765
---@param enabled any
---@param toolName any
function editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorHeadlessChange(enabled, toolName) end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:779
function editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorInitialized() end

--- Do debugDrawer stuff here
---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:434
function editor_vehicleEditor_staticEditor_veStaticRenderView.onPreRender() end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:787
function editor_vehicleEditor_staticEditor_veStaticRenderView.onSerialize() end

---Source : lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua:802
---@param s any
function editor_vehicleEditor_staticEditor_veStaticRenderView.setCameraSpeed(s) end

