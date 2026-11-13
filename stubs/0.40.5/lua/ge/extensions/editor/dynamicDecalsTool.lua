---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecalsTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_dynamicDecalsTool` : `extensions.load("editor_dynamicDecalsTool")`, puis la globale `editor_dynamicDecalsTool`
---@class editor_dynamicDecalsTool
---@field dependencies table
---@field directoryPath string
---@field doApiUpdate boolean
---@field toolMode any
---@field toolModes table
---@field version table
editor_dynamicDecalsTool = {}

--- public interface for dynamic decals tool
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:883
---@param value any
function editor_dynamicDecalsTool.applyDecal(value) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:910
---@param clockwise any
---@param mod any
function editor_dynamicDecalsTool.changeDecalRotation(clockwise, mod) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:909
---@param increase any
---@param mod any
function editor_dynamicDecalsTool.changeDecalSize(increase, mod) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:939
---@param from any
---@param fromParentUid any
---@param to any
---@param toParentUid any
function editor_dynamicDecalsTool.dynamicDecals_moveLayer(from, fromParentUid, to, toParentUid) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:930
---@param layerUid any
function editor_dynamicDecalsTool.dynamicDecals_onLayerUpdated(layerUid) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:955
---@param value any
function editor_dynamicDecalsTool.enableBrushStroke(value) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:963
---@param value any
function editor_dynamicDecalsTool.enablePathLayer(value) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:967
function editor_dynamicDecalsTool.finishPathLayer() end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:997
function editor_dynamicDecalsTool.getCurrentMaskEditingLayerUid() end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:981
function editor_dynamicDecalsTool.getIconSize() end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:985
function editor_dynamicDecalsTool.getIconSizeVec2() end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:989
function editor_dynamicDecalsTool.getMainScrollY() end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:827
---@param name any
function editor_dynamicDecalsTool.getSectionOpenState(name) end

--- ##### GUI Start #####
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:146
---@param section any
function editor_dynamicDecalsTool.getSectionWindowName(section) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:947
---@param value any
function editor_dynamicDecalsTool.lockDepth(value) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:951
---@param value any
function editor_dynamicDecalsTool.lockSurfaceNormal(value) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:864
---@param data any
function editor_dynamicDecalsTool.onDeserialized(data) end

--- serialization
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:859
function editor_dynamicDecalsTool.onSerialize() end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:975
function editor_dynamicDecalsTool.onVehicleSwitched() end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:921
function editor_dynamicDecalsTool.redo() end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:780
---@param name any
---@param onUpdateFn any
function editor_dynamicDecalsTool.registerEditorOnUpdateFn(name, onUpdateFn) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:848
---@param name any
---@param guiFn any
function editor_dynamicDecalsTool.registerOnEditorGuiFn(name, guiFn) end

--- summary:
---   params
---   * name; string; Name of section
---   * guiFn; function; Function being called in the section as well as within the window
---   * order [optional]; number; At which position the section appears compared to all other sections.
---     The lower the number the further up the section appears.
---   * defaultOpen [optional]; bool; Whether the section is opened by default or not
---   * window [optional]; table {windowSize[ImVec2]}; Whether a dedicated window will be registered or not.
---     If a window was registered a button will be displayed in the section to open the window. Window size can be set in table object.
---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:801
---@param name any
---@param guiFn any
---@param order any
---@param defaultOpen any
---@param window any
---@param buttons any
function editor_dynamicDecalsTool.registerSection(name, guiFn, order, defaultOpen, window, buttons) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:843
---@param name any
---@param guiFn any
---@param order any
function editor_dynamicDecalsTool.registerToolbarActionItem(name, guiFn, order) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:838
---@param name any
---@param guiFn any
---@param order any
function editor_dynamicDecalsTool.registerToolbarToolItem(name, guiFn, order) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:971
function editor_dynamicDecalsTool.removeLastPathLayerPoint() end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:993
---@param uid any
function editor_dynamicDecalsTool.setCurrentMaskEditingLayerUid(uid) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:805
---@param name any
---@param newState any
---@param setScroll any
function editor_dynamicDecalsTool.setSectionOpenState(name, newState, setScroll) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:912
function editor_dynamicDecalsTool.undo() end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:784
---@param name any
function editor_dynamicDecalsTool.unregisterEditorOnUpdateFn(name) end

---Source : lua/ge/extensions/editor/dynamicDecalsTool.lua:852
---@param name any
function editor_dynamicDecalsTool.unregisterOnEditorGuiFn(name) end

