---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/tutorial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Determines whether the delivery tutorials (parcels, vehicles, materials) are still active and provides the tutorial task lists for the career progress page. A tutorial is active as long as the XP of the corresponding branch (logistics-delivery, logistics-vehicleDelivery, logistics-materials) is 0; the result is cached and invalidated when this XP changes, which also unlocks an achievement.
--- Access: extension `career_modules_delivery_tutorial`: `extensions.load("career_modules_delivery_tutorial")`, then the global `career_modules_delivery_tutorial`
---@class career_modules_delivery_tutorial
career_modules_delivery_tutorial = {}

--- Returns the state of the parcel and vehicle tutorials: unlocked, isActive and the task list, for the UI.
---Source: lua/ge/extensions/career/modules/delivery/tutorial.lua:114
---@return table  {parcel = {unlocked, isActive, tasks, headerLabel}, vehicle = {…}}.
function career_modules_delivery_tutorial.getTutorialInfo() end

--- True as long as the logistics-delivery XP is 0 (result cached).
---Source: lua/ge/extensions/career/modules/delivery/tutorial.lua:25
---@return boolean  Parcel tutorial active.
function career_modules_delivery_tutorial.isCargoDeliveryTutorialActive() end

--- True as long as the logistics-materials XP is 0 (cached).
---Source: lua/ge/extensions/career/modules/delivery/tutorial.lua:39
---@return boolean  Materials tutorial active.
function career_modules_delivery_tutorial.isMaterialsDeliveryTutorialActive() end

--- True as long as the logistics-vehicleDelivery XP is 0 (cached).
---Source: lua/ge/extensions/career/modules/delivery/tutorial.lua:32
---@return boolean  Vehicle delivery tutorial active.
function career_modules_delivery_tutorial.isVehicleDeliveryTutorialActive() end

--- Hook called on career activation: stores the delivery extensions used.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/tutorial.lua:8
function career_modules_delivery_tutorial.onCareerActivated() end

--- Progress page hook: fills tasklistData.headerLabel and tasklistData.tasks ({label, description, done}) for 'delivery-introduction' (install a container, load a tutorial parcel, deliver), 'vehicle-delivery-introduction' (pick up the vehicle, deliver) or 'materials-introduction'. If the tutorial is finished, a single "finished" task is returned.
---Source: lua/ge/extensions/career/modules/delivery/tutorial.lua:132
---@param tasklistData table Table to fill.
---@param tasklistId string 'delivery-introduction', 'vehicle-delivery-introduction' or 'materials-introduction'.
function career_modules_delivery_tutorial.onCareerProgressPageGetTasklistData(tasklistData, tasklistId) end

--- Hook called when player attributes change: invalidates the cache of the tutorial concerned and unlocks the associated achievement.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/tutorial.lua:46
---@param change table<string, number> Modified attributes (keys logistics-delivery, logistics-vehicleDelivery, logistics-materials).
---@param reason any Reason for the change (unused).
function career_modules_delivery_tutorial.onPlayerAttributesChanged(change, reason) end

