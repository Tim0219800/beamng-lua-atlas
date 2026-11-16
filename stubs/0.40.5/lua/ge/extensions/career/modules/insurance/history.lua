---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/insurance/history.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- History of the player's insurance events in career (claims, private repairs, renewals, contract changes…). Each entry has a type, a title, effects (for example {type='money', changedBy=-amount}), the name of the insurance concerned, an optional text, free data (other) and the os.time() time. The module also provides totals used for the insurance statistics. The data is saved by the insurance module via getPlHistory/setPlHistory.
--- Access: extension `career_modules_insurance_history`: `extensions.load("career_modules_insurance_history")`, then the global `career_modules_insurance_history`
---@class career_modules_insurance_history
career_modules_insurance_history = {}

--- Adds an entry to the history with the current time (os.time()).
---Source: lua/ge/extensions/career/modules/insurance/history.lua:10
---@param data table Table with type, title, effects, concernedInsuranceName, overrideText, other.
function career_modules_insurance_history.addToPlHistory(data) end

--- Builds the history list for the UI: deep copy sorted from most recent to oldest, with a readable date.
---Source: lua/ge/extensions/career/modules/insurance/history.lua:23
---@return table  List of entries with an extra date field.
function career_modules_insurance_history.buildPlHistory() end

--- Sum of the damage costs (vehDamagePrice) of the repair claims, i.e. the value of the damage covered.
---Source: lua/ge/extensions/career/modules/insurance/history.lua:75
---@return number  Amount.
function career_modules_insurance_history.getDamageCostCoveredByInsurance() end

--- Number of repairs covered by an insurance (money effects of the 'insuranceRepairClaim' entries).
---Source: lua/ge/extensions/career/modules/insurance/history.lua:85
---@return integer  Number of claims.
function career_modules_insurance_history.getInsuranceClaimsCount() end

--- Number of repairs paid without insurance ('privateRepair' entries).
---Source: lua/ge/extensions/career/modules/insurance/history.lua:89
---@return integer  Number of private repairs.
function career_modules_insurance_history.getNonInsuranceRepairsCount() end

--- Returns the raw history table (for saving).
---Source: lua/ge/extensions/career/modules/insurance/history.lua:53
---@return table  List of entries.
function career_modules_insurance_history.getPlHistory() end

--- Sum of the deductibles paid on repair claims.
---Source: lua/ge/extensions/career/modules/insurance/history.lua:65
---@return number  Amount.
function career_modules_insurance_history.getTotalInsuranceRepairDeductiblesPaid() end

--- Total premiums paid: renewals ('insuranceRenewed') plus contract changes ('insuranceChanged').
---Source: lua/ge/extensions/career/modules/insurance/history.lua:93
---@return number  Amount in game money.
function career_modules_insurance_history.getTotalPremiumPaid() end

--- Total spent on repairs without insurance.
---Source: lua/ge/extensions/career/modules/insurance/history.lua:99
---@return number  Amount.
function career_modules_insurance_history.getTotalPrivateRepairsPaid() end

--- Clears the history (new game).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/insurance/history.lua:61
function career_modules_insurance_history.initPlHistory() end

--- Replaces the history (save loading); a nil value clears it.
---Source: lua/ge/extensions/career/modules/insurance/history.lua:57
---@param history table|nil Saved history.
function career_modules_insurance_history.setPlHistory(history) end

