---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial step 9 and last ("spmSignup"): the player accesses the garage computer, signs the hiring contract (contract popup, starting bonus of 10,000), opens the vehicle shop, chooses a seller, opens the purchase screen and buys their first vehicle. When it is added to the inventory, the v2/careerUnlocked popup is displayed, then career_modules_tutorial.endTutorial() is called. The tutorial vehicle is deleted when the purchase screen opens.
--- Access: extension `career_modules_tutorial_step09spmSignup`: `extensions.load("career_modules_tutorial_step09spmSignup")`, then the global `career_modules_tutorial_step09spmSignup`
---@class career_modules_tutorial_step09spmSignup
career_modules_tutorial_step09spmSignup = {}

--- Removes the marker and money sound, clears zones, reset and task list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:291
function career_modules_tutorial_step09spmSignup.cleanup() end

--- Hook emitted when the contract voucher is used: credits the starting bonus.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:202
function career_modules_tutorial_step09spmSignup.onCareerTutorialRedeemedContractVoucher() end

--- Hook emitted when the computer menu opens: validates the objective and opens the contract signing popup (user = current profile).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:171
function career_modules_tutorial_step09spmSignup.onComputerMenuOpened() end

--- Displays the phase and a "Skip Step 9" button (validates all objectives and opens the careerUnlocked popup).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:305
---@param im table ui_imgui table.
function career_modules_tutorial_step09spmSignup.onDebugMenu(im) end

--- Adds the garage computer (servicestationGarageComputer facility) to the POI list during step 09spmSignup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:283
---@param elements table POI list to complete.
function career_modules_tutorial_step09spmSignup.onGetRawPoiListForTutorial(elements) end

--- Popup close hook: contractSign (bonus + achievement), v2/apmOnboarding (marketplace opening objective) and v2/careerUnlocked (achievement then end of the tutorial).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:207
---@param id string Popup id.
function career_modules_tutorial_step09spmSignup.onIntroPopupCareerClosed(id) end

--- Called every frame (waitComputer phase): hides the entrance marker within 3 m and clears the guidance path within 1 m of the walking start point.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:186
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial_step09spmSignup.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook emitted when a vehicle is added to the inventory: deactivates zones and reset, validates the final objective and displays the v2/careerUnlocked popup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:266
---@param data any Data of the added vehicle (unused).
function career_modules_tutorial_step09spmSignup.onVehicleAddedToInventory(data) end

--- Hook emitted when the vehicle shop opens: validates the objective and asks to choose a seller.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:235
---@param data any Menu data (unused).
function career_modules_tutorial_step09spmSignup.onVehicleShoppingMenuOpened(data) end

--- Hook emitted when the purchase screen opens: deletes the tutorial vehicle and displays the v2/vehiclePurchaseAndInsurance popup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:253
---@param data any Menu data (unused).
function career_modules_tutorial_step09spmSignup.onVehicleShoppingPurchaseMenuOpened(data) end

--- Hook emitted when the selected seller changes: validates the objective and asks to open the purchase.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:244
---@param payload any Change data (unused).
function career_modules_tutorial_step09spmSignup.onVehicleShoppingSelectedSellerIdChanged(payload) end

--- Called on activation: resets the objectives, activates the garageBounds zone, gets the garageInteriorWalkStart and garageEntranceMarker spots, displays the "access the computer" objective and the entrance marker.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua:146
---@param stepData any Step data (unused).
function career_modules_tutorial_step09spmSignup.setup(stepData) end

