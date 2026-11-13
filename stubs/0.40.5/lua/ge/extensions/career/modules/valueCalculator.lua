---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/valueCalculator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcul de la valeur et de l'état de réparation des véhicules et pièces de la carrière : dépréciation par année d'âge (table depreciationByYear), perte liée au kilométrage (odomètre), valeur de ferraille (5 % de la valeur), valeur d'un véhicule d'inventaire en tenant compte des pièces ajoutées/retirées et des dégâts, coût et durée de réparation (pièces à intégrité 0).
--- Accès : extension `career_modules_valueCalculator` : `extensions.load("career_modules_valueCalculator")`, puis la globale `career_modules_valueCalculator`
---@class career_modules_valueCalculator
---@field dependencies string[] {'career_career'}.
career_modules_valueCalculator = {}

--- Valeur ajustée d'un objet selon son âge et son kilométrage : dépréciation annuelle, perte par kilométrage, plus la valeur de ferraille.
---Source : lua/ge/extensions/career/modules/valueCalculator.lua:47
---@param value number Valeur de base.
---@param vehicleCondition table {age = années, mileage = odomètre}.
---@return number  Valeur ajustée.
function career_modules_valueCalculator.getAdjustedVehicleBaseValue(value, vehicleCondition) end

--- Retourne le seuil de pièces cassées (3).
---Source : lua/ge/extensions/career/modules/valueCalculator.lua:229
---@return integer  Seuil.
function career_modules_valueCalculator.getBrokenPartsThreshold() end

--- Valeur actuelle d'un véhicule d'inventaire (base ajustée + pièces - réparations, plancher à la valeur minimale).
---Source : lua/ge/extensions/career/modules/valueCalculator.lua:194
---@param inventoryId integer Id d'inventaire.
---@param ignoreDamage boolean|nil Si vrai, ne déduit pas le coût de réparation.
---@return number|nil  Valeur, ou nil si le véhicule n'existe pas.
function career_modules_valueCalculator.getInventoryVehicleValue(inventoryId, ignoreDamage) end

--- Compte les pièces dont integrityValue vaut 0.
---Source : lua/ge/extensions/career/modules/valueCalculator.lua:200
---@param partConditions table|nil Conditions par chemin de pièce.
---@return integer  Nombre de pièces cassées (0 si l'argument n'est pas une table).
function career_modules_valueCalculator.getNumberOfBrokenParts(partConditions) end

--- Compare les pièces d'origine d'un véhicule aux pièces actuelles et retourne les pièces ajoutées et retirées par emplacement.
---Source : lua/ge/extensions/career/modules/valueCalculator.lua:55
---@param originalParts table<string, table> Pièces d'origine par slot (avec .name).
---@param newParts table<string, string> Noms des pièces actuelles par slot.
---@param changedSlots table<string, boolean> Slots modifiés (pour détecter une pièce identique remplacée).
---@return table<string, string>  addedParts (slot -> nom).
---@return table  removedParts.
function career_modules_valueCalculator.getPartDifference(originalParts, newParts, changedSlots) end

--- Valeur d'une pièce : valeur ajustée par âge et kilométrage, -5 % si apprêtée (primered), réduite selon le nombre de réparations.
---Source : lua/ge/extensions/career/modules/valueCalculator.lua:91
---@param part table Pièce avec value, year, partCondition.odometer, primered, repairCount.
---@return number  Valeur de la pièce.
function career_modules_valueCalculator.getPartValue(part) end

--- API dégâts : calcule prix, durée et nombre de pièces à remplacer pour un véhicule d'inventaire.
---Source : lua/ge/extensions/career/modules/valueCalculator.lua:133
---@param invVehInfo table Véhicule d'inventaire (id, partConditions, config.partsTree).
---@return table  {price, repairTime, partsCountToBeReplaced}.
function career_modules_valueCalculator.getRepairDetails(invVehInfo) end

--- Retourne le kilométrage (odomètre de la pièce principale) d'un véhicule d'inventaire. 0 si introuvable.
---Source : lua/ge/extensions/career/modules/valueCalculator.lua:33
---@param inventoryId integer Id d'inventaire.
---@return number  Odomètre (unité du jeu pour partCondition.odometer, déduit du code).
function career_modules_valueCalculator.getVehicleMileageById(inventoryId) end

--- Indique si le nombre de pièces cassées atteint le seuil (3).
---Source : lua/ge/extensions/career/modules/valueCalculator.lua:219
---@param partConditions table|nil Conditions par chemin de pièce.
---@return boolean  true si le véhicule doit être réparé.
function career_modules_valueCalculator.partConditionsNeedRepair(partConditions) end

