---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/marketplace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_marketplace` : `extensions.load("career_modules_marketplace")`, puis la globale `career_modules_marketplace`
---@class career_modules_marketplace
---@field dealershipBuyerQuotes table
---@field firstNameCount any
---@field firstNames table
---@field initialCount any
---@field initialProbabilities table
---@field initials table
---@field privateSellerQuotes table
career_modules_marketplace = {}

---Source : lua/ge/extensions/career/modules/marketplace.lua:214
---@param inventoryId any
---@param offerId any
function career_modules_marketplace.acceptOffer(inventoryId, offerId) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:506
function career_modules_marketplace.cancelNegotiation() end

---Source : lua/ge/extensions/career/modules/marketplace.lua:225
---@param inventoryId any
---@param offerId any
function career_modules_marketplace.declineOffer(inventoryId, offerId) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:871
function career_modules_marketplace.finalizeNegotiationExit() end

---Source : lua/ge/extensions/career/modules/marketplace.lua:20
---@param inventoryId any
function career_modules_marketplace.findVehicleListing(inventoryId) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:171
---@param inventoryId any
function career_modules_marketplace.generateOffer(inventoryId) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:77
---@param buyer any
---@param _archetypes any
function career_modules_marketplace.generatePersonality(buyer, _archetypes) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:935
function career_modules_marketplace.getListings() end

--- UI bridge helpers for negotiation -----------------------------------------
---Source : lua/ge/extensions/career/modules/marketplace.lua:320
function career_modules_marketplace.getNegotiationState() end

---Source : lua/ge/extensions/career/modules/marketplace.lua:28
---@param vehicles any
function career_modules_marketplace.listVehicles(vehicles) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:849
---@param price any
function career_modules_marketplace.makeNegotiationOffer(price) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:1007
---@param open any
function career_modules_marketplace.menuOpened(open) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:1024
function career_modules_marketplace.onExtensionLoaded() end

---Source : lua/ge/extensions/career/modules/marketplace.lua:1018
---@param currentSavePath any
---@param vehiclesThumbnailUpdate any
function career_modules_marketplace.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:881
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_marketplace.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:931
---@param inventoryId any
function career_modules_marketplace.onVehicleRemoved(inventoryId) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:1014
---@param computerId any
function career_modules_marketplace.openMenu(computerId) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:69
---@param inventoryId any
function career_modules_marketplace.removeVehicleListing(inventoryId) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:387
---@param inventoryId any
---@param offerId any
function career_modules_marketplace.startNegotiateBuyingOffer(inventoryId, offerId) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:439
---@param _shopId any
function career_modules_marketplace.startNegotiateSellingOffer(_shopId) end

---Source : lua/ge/extensions/career/modules/marketplace.lua:853
function career_modules_marketplace.takeTheirOffer() end

