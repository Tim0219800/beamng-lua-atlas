---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/partShopping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_partShopping` : `extensions.load("career_modules_partShopping")`, puis la globale `career_modules_partShopping`
---@class career_modules_partShopping
---@field dependencies table
career_modules_partShopping = {}

---Source : lua/ge/extensions/career/modules/partShopping.lua:972
function career_modules_partShopping.applyShopping() end

---Source : lua/ge/extensions/career/modules/partShopping.lua:910
function career_modules_partShopping.cancelShopping() end

--- Breadcrumb title resolver for the part-shopping category route. Receives the
---  "category" route param and returns a localized label.
---Source : lua/ge/extensions/career/modules/partShopping.lua:1000
---@param category any
function career_modules_partShopping.getCategoryBreadcrumbTitle(category) end

---Source : lua/ge/extensions/career/modules/partShopping.lua:1020
function career_modules_partShopping.getPartsInShop() end

---Source : lua/ge/extensions/career/modules/partShopping.lua:1024
function career_modules_partShopping.getShoppingCart() end

--- Breadcrumb title resolver for the part-shopping slot route. Receives the
---  "slotPath" route param and returns the slot's nice name when known.
---Source : lua/ge/extensions/career/modules/partShopping.lua:1010
---@param slotPath any
function career_modules_partShopping.getSlotBreadcrumbTitle(slotPath) end

---Source : lua/ge/extensions/career/modules/partShopping.lua:855
---@param part any
function career_modules_partShopping.installPart(part) end

---Source : lua/ge/extensions/career/modules/partShopping.lua:870
---@param partShopId any
function career_modules_partShopping.installPartByPartShopId(partShopId) end

---Source : lua/ge/extensions/career/modules/partShopping.lua:994
function career_modules_partShopping.isShoppingSessionActive() end

---Source : lua/ge/extensions/career/modules/partShopping.lua:1028
---@param menuData any
---@param computerFunctions any
function career_modules_partShopping.onComputerAddFunctions(menuData, computerFunctions) end

--- Router lifecycle: store the normalized selection on enter so any emission
---  between enter and mount uses the correct route state.
---Source : lua/ge/extensions/career/modules/partShopping.lua:445
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_partShopping.onRouteEnter(context, toRoute, fromRoute, data) end

--- Router lifecycle: re-normalize and emit the route-aware shopping data once the
---  destination view has mounted.
---Source : lua/ge/extensions/career/modules/partShopping.lua:451
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_partShopping.onRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/career/modules/partShopping.lua:922
function career_modules_partShopping.onVehicleSaveFinished() end

---Source : lua/ge/extensions/career/modules/partShopping.lua:879
---@param slot any
function career_modules_partShopping.removePartBySlot(slot) end

---Source : lua/ge/extensions/career/modules/partShopping.lua:918
function career_modules_partShopping.requestExit() end

---Source : lua/ge/extensions/career/modules/partShopping.lua:414
function career_modules_partShopping.sendShoppingDataToUI() end

---Source : lua/ge/extensions/career/modules/partShopping.lua:516
function career_modules_partShopping.setupTether() end

---Source : lua/ge/extensions/career/modules/partShopping.lua:531
---@param inventoryId any
---@param _originComputerId any
function career_modules_partShopping.startShopping(inventoryId, _originComputerId) end

---Source : lua/ge/extensions/career/modules/partShopping.lua:456
---@param currentPartConditions any
function career_modules_partShopping.updatePreviewVehicle(currentPartConditions) end

