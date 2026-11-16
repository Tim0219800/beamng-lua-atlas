---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/payment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generic career payment: checks that a price (currency table) is payable with the player's attributes and debits it via career_modules_playerAttributes.
--- Access: extension `career_modules_payment`: `extensions.load("career_modules_payment")`, then the global `career_modules_payment`
---@class career_modules_payment
---@field dependencies table<integer, string> Extensions loaded before: career_career.
career_modules_payment = {}

--- Tests whether the player has enough of each currency of the price (except canBeNegative currencies or amount <= 0).
---Source: lua/ge/extensions/career/modules/payment.lua:9
---@param price table<string, {amount: number, canBeNegative: boolean|nil}> Price per currency.
---@return boolean  true if payable.
function career_modules_payment.canPay(price) end

--- Debits the price (negative amounts) via playerAttributes.addAttributes if canPay.
---Source: lua/ge/extensions/career/modules/payment.lua:18
---@param price table Price per currency, as for canPay.
---@param reason table|nil Reason passed to the attributes log (tags, label).
---@return boolean  true if the payment took place.
function career_modules_payment.pay(price, reason) end

