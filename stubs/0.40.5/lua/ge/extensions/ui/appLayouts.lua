---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appLayouts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_appLayouts` : `extensions.load("ui_appLayouts")`, puis la globale `ui_appLayouts`
---@class ui_appLayouts
---@field dependencies table
ui_appLayouts = {}

---Source : lua/ge/extensions/ui/appLayouts.lua:528
---@param layoutId any
---@param appName any
---@param placement any
function ui_appLayouts.addApp(layoutId, appName, placement) end

---Source : lua/ge/extensions/ui/appLayouts.lua:573
---@param layoutId any
---@param appInstanceIdOrIndex any
---@param placement any
function ui_appLayouts.applyPlacementPatch(layoutId, appInstanceIdOrIndex, placement) end

---Source : lua/ge/extensions/ui/appLayouts.lua:600
---@param layoutId any
---@param appInstanceIdOrIndex any
---@param settings any
function ui_appLayouts.applySettingsPatch(layoutId, appInstanceIdOrIndex, settings) end

---Source : lua/ge/extensions/ui/appLayouts.lua:678
---@param layoutType any
function ui_appLayouts.clearLayoutForType(layoutType) end

---Source : lua/ge/extensions/ui/appLayouts.lua:455
---@param data any
function ui_appLayouts.createLayout(data) end

---Source : lua/ge/extensions/ui/appLayouts.lua:267
---@param filenameToDelete any
function ui_appLayouts.deleteLayout(filenameToDelete) end

---Source : lua/ge/extensions/ui/appLayouts.lua:497
---@param filename any
---@param newTitle any
function ui_appLayouts.duplicateLayout(filename, newTitle) end

---Source : lua/ge/extensions/ui/appLayouts.lua:101
function ui_appLayouts.getAvailableLayouts() end

---Source : lua/ge/extensions/ui/appLayouts.lua:355
function ui_appLayouts.getCurrentLayout() end

---Source : lua/ge/extensions/ui/appLayouts.lua:687
---@param layoutType any
function ui_appLayouts.getLayoutForType(layoutType) end

---Source : lua/ge/extensions/ui/appLayouts.lua:643
function ui_appLayouts.getPlayerCameraModes() end

---Source : lua/ge/extensions/ui/appLayouts.lua:692
function ui_appLayouts.getTypeLayoutMap() end

---Source : lua/ge/extensions/ui/appLayouts.lua:634
function ui_appLayouts.isEditing() end

---Source : lua/ge/extensions/ui/appLayouts.lua:657
---@param player any
---@param camName any
function ui_appLayouts.onCameraChanged(player, camName) end

---Source : lua/ge/extensions/ui/appLayouts.lua:548
---@param layoutId any
---@param appInstanceIdOrIndex any
function ui_appLayouts.removeApp(layoutId, appInstanceIdOrIndex) end

---Source : lua/ge/extensions/ui/appLayouts.lua:482
---@param filename any
---@param title any
function ui_appLayouts.renameLayout(filename, title) end

---Source : lua/ge/extensions/ui/appLayouts.lua:299
---@param filenameToReset any
---@param layoutType any
function ui_appLayouts.resetLayout(filenameToReset, layoutType) end

---Source : lua/ge/extensions/ui/appLayouts.lua:443
function ui_appLayouts.resetUsedLayout() end

---Source : lua/ge/extensions/ui/appLayouts.lua:261
---@param data any
function ui_appLayouts.saveLayout(data) end

---Source : lua/ge/extensions/ui/appLayouts.lua:360
---@param layoutOrFilename any
function ui_appLayouts.setCurrentLayout(layoutOrFilename) end

---Source : lua/ge/extensions/ui/appLayouts.lua:629
---@param enabled any
function ui_appLayouts.setEditing(enabled) end

---Source : lua/ge/extensions/ui/appLayouts.lua:665
---@param layoutType any
---@param filename any
function ui_appLayouts.setLayoutForType(layoutType, filename) end

---Source : lua/ge/extensions/ui/appLayouts.lua:415
---@param idOrType any
function ui_appLayouts.setUsedLayout(idOrType) end

