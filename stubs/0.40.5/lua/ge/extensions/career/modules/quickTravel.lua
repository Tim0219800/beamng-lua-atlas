---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/quickTravel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Paid quick travel in career: computes a price based on the road distance between the player and a destination, then teleports the player (in walking mode) and debits them. Used to reach a garage.
--- Access: extension `career_modules_quickTravel`: `extensions.load("career_modules_quickTravel")`, then the global `career_modules_quickTravel`
---@class career_modules_quickTravel
---@field dependencies table<integer, string> Extensions loaded before: career_career.
career_modules_quickTravel = {}

--- Computes the price and road distance to pos.
---Source: lua/ge/extensions/career/modules/quickTravel.lua:19
---@param pos vec3 Destination.
---@return number  Price in money.
---@return number  Road distance in meters.
function career_modules_quickTravel.getPriceForQuickTravel(pos) end

--- Travel price to the garage position given by freeroam_facilities.getGaragePosRot.
---Source: lua/ge/extensions/career/modules/quickTravel.lua:54
---@param garage table Garage.
---@return number  Price.
---@return number  Distance in meters.
function career_modules_quickTravel.getPriceForQuickTravelToGarage(garage) end

--- Quick travel to the garage's first parking spot (in walking mode, label quickTravelGarageTaxi).
---Source: lua/ge/extensions/career/modules/quickTravel.lua:45
---@param garagePoi table Garage POI (id field).
function career_modules_quickTravel.quickTravelToGarage(garagePoi) end

--- If the player can pay, enables walking mode, safely teleports the vehicle to pos and orients the player toward pos, then debits the price (tags quickTravel, buying).
---Source: lua/ge/extensions/career/modules/quickTravel.lua:33
---@param pos vec3 Destination.
---@param useWalkingMode boolean|nil If true, performs the teleport in walking mode.
---@param reasonString string|nil Translation key of the label, ui.career.attributeLog.quickTravelPaid by default.
function career_modules_quickTravel.quickTravelToPos(pos, useWalkingMode, reasonString) end

