---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/payment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Paiement générique en carrière : vérifie qu'un prix (table de devises) est payable avec les attributs du joueur et le débite via career_modules_playerAttributes.
--- Accès : extension `career_modules_payment` : `extensions.load("career_modules_payment")`, puis la globale `career_modules_payment`
---@class career_modules_payment
---@field dependencies table<integer, string> Extensions chargées avant : career_career.
career_modules_payment = {}

--- Teste si le joueur possède assez de chaque devise du prix (sauf devises canBeNegative ou montant <= 0).
---Source : lua/ge/extensions/career/modules/payment.lua:9
---@param price table<string, {amount: number, canBeNegative: boolean|nil}> Prix par devise.
---@return boolean  true si payable.
function career_modules_payment.canPay(price) end

--- Débite le prix (montants négatifs) via playerAttributes.addAttributes si canPay.
---Source : lua/ge/extensions/career/modules/payment.lua:18
---@param price table Prix par devise, comme pour canPay.
---@param reason table|nil Raison passée au journal des attributs (tags, label).
---@return boolean  true si le paiement a eu lieu.
function career_modules_payment.pay(price, reason) end

