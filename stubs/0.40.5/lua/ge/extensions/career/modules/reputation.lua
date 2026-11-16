---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/reputation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computation of the player's reputation with career organizations. Value between -50 and 700, converted to a level (-1 to 3 by default: questionable, neutral, reliable, preferred, partner) with, per level, the share withheld on loaned vehicles (loanerCut) and the delivery bonus (deliveryBonus). The raw value is the <orgId>Reputation attribute of playerAttributes.
--- Access: extension `career_modules_reputation`: `extensions.load("career_modules_reputation")`, then the global `career_modules_reputation`
---@class career_modules_reputation
career_modules_reputation = {}

--- Computes the organization's reputation and attaches it as organization.reputation = {value, level, curLvlProgress, neededForNext, prevThreshold, nextThreshold}; also fills in the levels with the default values.
---Source: lua/ge/extensions/career/modules/reputation.lua:101
---@param organization table|nil Organization (id, reputationLevels). Does nothing if nil.
function career_modules_reputation.addReputationToOrg(organization) end

--- Translated label of the default reputation level.
---Source: lua/ge/extensions/career/modules/reputation.lua:139
---@param lvl integer Level from -1 to 3.
---@return string  Label, or empty string if unknown.
function career_modules_reputation.getLabel(lvl) end

--- Maximum reputation value.
---Source: lua/ge/extensions/career/modules/reputation.lua:149
---@return number  700.
function career_modules_reputation.getMaximumValue() end

--- Minimum reputation value.
---Source: lua/ge/extensions/career/modules/reputation.lua:145
---@return number  -50.
function career_modules_reputation.getMinimumValue() end

--- Reputation change associated with an event.
---Source: lua/ge/extensions/career/modules/reputation.lua:78
---@param eventId string returnLoanerDamaged or discardDeliveryVehicle.
---@return number|nil  Change (negative), nil if unknown.
function career_modules_reputation.getValueForEvent(eventId) end

