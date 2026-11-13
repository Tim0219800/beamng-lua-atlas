---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_appSelector_general` : `extensions.load("ui_appSelector_general")`, puis la globale `ui_appSelector_general`
---@class ui_appSelector_general
---@field backendName string
---@field dependencies table
ui_appSelector_general = {}

---Source : lua/ge/extensions/ui/appSelector/general.lua:487
---@param requestId any
function ui_appSelector_general.clearAllFilters(requestId) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:756
function ui_appSelector_general.closedFromUI() end

---Source : lua/ge/extensions/ui/appSelector/general.lua:736
---@param requestId any
function ui_appSelector_general.emitDisplayDataSnapshot(requestId) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:665
---@param buttonId any
---@param data any
function ui_appSelector_general.executeButton(buttonId, data) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:690
---@param details any
function ui_appSelector_general.executeDoubleClick(details) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:680
---@param path any
function ui_appSelector_general.exploreFolder(path) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:446
function ui_appSelector_general.getActiveFilters() end

--- Getter for appData that initializes if needed
---Source : lua/ge/extensions/ui/appSelector/general.lua:287
function ui_appSelector_general.getAppData() end

--- Details
---Source : lua/ge/extensions/ui/appSelector/general.lua:565
---@param details any
function ui_appSelector_general.getDetails(details) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:496
function ui_appSelector_general.getDisplayDataOptions() end

---Source : lua/ge/extensions/ui/appSelector/general.lua:441
function ui_appSelector_general.getFilters() end

--- No-op / optional API
---Source : lua/ge/extensions/ui/appSelector/general.lua:671
function ui_appSelector_general.getManagementDetails() end

---Source : lua/ge/extensions/ui/appSelector/general.lua:530
---@param path any
function ui_appSelector_general.getScreenHeaderTitleAndPath(path) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:516
function ui_appSelector_general.getSearchText() end

---Source : lua/ge/extensions/ui/appSelector/general.lua:354
---@param path any
function ui_appSelector_general.getTiles(path) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:685
---@param modId any
function ui_appSelector_general.goToMod(modId) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:301
function ui_appSelector_general.onModActivated() end

--- Mark data as changed when apps are updated
---Source : lua/ge/extensions/ui/appSelector/general.lua:300
function ui_appSelector_general.onModDeactivated() end

---Source : lua/ge/extensions/ui/appSelector/general.lua:302
function ui_appSelector_general.onModManagerReady() end

---Source : lua/ge/extensions/ui/appSelector/general.lua:751
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function ui_appSelector_general.onRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:755
function ui_appSelector_general.profilerFinish() end

---Source : lua/ge/extensions/ui/appSelector/general.lua:653
---@param item any
---@param requestId any
function ui_appSelector_general.requestDetails(item, requestId) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:508
---@param requestId any
function ui_appSelector_general.resetDisplayDataToDefaults(requestId) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:469
---@param filterKey any
---@param requestId any
function ui_appSelector_general.resetRangeFilter(filterKey, requestId) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:478
---@param filterKey any
---@param requestId any
function ui_appSelector_general.resetSetFilter(filterKey, requestId) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:732
function ui_appSelector_general.resolveCurrentSelectorPath() end

---Source : lua/ge/extensions/ui/appSelector/general.lua:500
---@param key any
---@param value any
---@param requestId any
function ui_appSelector_general.setDisplayDataOption(key, value, requestId) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:521
---@param val any
---@param requestId any
function ui_appSelector_general.setSearchText(val, requestId) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:675
---@param itemDetails any
function ui_appSelector_general.toggleFavourite(itemDetails) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:451
---@param filterKey any
---@param value any
---@param requestId any
function ui_appSelector_general.toggleFilter(filterKey, value, requestId) end

---Source : lua/ge/extensions/ui/appSelector/general.lua:460
---@param filterKey any
---@param min any
---@param max any
---@param requestId any
function ui_appSelector_general.updateRangeFilter(filterKey, min, max, requestId) end

