---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/reputation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcul de la réputation du joueur auprès des organisations de la carrière. Valeur comprise entre -50 et 700, convertie en niveau (-1 à 3 par défaut : questionable, neutral, reliable, preferred, partner) avec, par niveau, la part retenue sur les véhicules prêtés (loanerCut) et le bonus de livraison (deliveryBonus). La valeur brute est l'attribut <orgId>Reputation de playerAttributes.
--- Accès : extension `career_modules_reputation` : `extensions.load("career_modules_reputation")`, puis la globale `career_modules_reputation`
---@class career_modules_reputation
career_modules_reputation = {}

--- Calcule la réputation de l'organisation et l'attache dans organization.reputation = {value, level, curLvlProgress, neededForNext, prevThreshold, nextThreshold} ; complète aussi les niveaux avec les valeurs par défaut.
---Source : lua/ge/extensions/career/modules/reputation.lua:101
---@param organization table|nil Organisation (id, reputationLevels). Ne fait rien si nil.
function career_modules_reputation.addReputationToOrg(organization) end

--- Libellé traduit du niveau de réputation par défaut.
---Source : lua/ge/extensions/career/modules/reputation.lua:139
---@param lvl integer Niveau de -1 à 3.
---@return string  Libellé, ou chaîne vide si inconnu.
function career_modules_reputation.getLabel(lvl) end

--- Valeur maximale de réputation.
---Source : lua/ge/extensions/career/modules/reputation.lua:149
---@return number  700.
function career_modules_reputation.getMaximumValue() end

--- Valeur minimale de réputation.
---Source : lua/ge/extensions/career/modules/reputation.lua:145
---@return number  -50.
function career_modules_reputation.getMinimumValue() end

--- Variation de réputation associée à un événement.
---Source : lua/ge/extensions/career/modules/reputation.lua:78
---@param eventId string returnLoanerDamaged ou discardDeliveryVehicle.
---@return number|nil  Variation (négative), nil si inconnu.
function career_modules_reputation.getValueForEvent(eventId) end

