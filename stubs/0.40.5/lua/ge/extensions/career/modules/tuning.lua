---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tuning.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Menu de réglage (tuning) d'un véhicule d'inventaire en carrière, depuis l'ordinateur du garage. Il lit les variables de tuning du véhicule, applique les changements en réapparaissant le véhicule, construit un panier d'achat (catégories, sous-catégories, prix, taxes de 7 %) envoyé à l'UI, et débite l'argent à la validation. Une laisse (tether) capsule annule les achats si le joueur s'éloigne du garage.
--- Accès : extension `career_modules_tuning` : `extensions.load("career_modules_tuning")`, puis la globale `career_modules_tuning`
---@class career_modules_tuning
---@field dependencies string[] {"career_career", "gameplay_achievement"}.
career_modules_tuning = {}

--- Fusionne de nouvelles valeurs de tuning dans la config du véhicule, le refait apparaître à la même position et rotation, le gèle, déclenche le hook onCareerTuningApplied, met à jour les variables modifiées et recalcule le panier.
---Source : lua/ge/extensions/career/modules/tuning.lua:310
---@param tuningValues table<string, number> Variables de tuning (ex. "$gear_1") et leur valeur.
---@param callback function|nil Passé à career_modules_inventory.spawnVehicle.
function career_modules_tuning.apply(tuningValues, callback) end

--- Valide l'achat : invalide la certification, marque le véhicule modifié, débite le total, débloque le succès, joue le son, puis sauvegarde (si autosave) avant de fermer, sinon ferme directement.
---Source : lua/ge/extensions/career/modules/tuning.lua:152
function career_modules_tuning.applyShopping() end

--- Annule : réapplique les variables d'origine puis ferme le menu. Appelé aussi par la laisse quand le joueur s'éloigne.
---Source : lua/ge/extensions/career/modules/tuning.lua:346
function career_modules_tuning.cancelShopping() end

--- Ferme le menu : retourne au menu de l'ordinateur (ou ferme tous les menus de carrière), dégèle le véhicule et retire la laisse.
---Source : lua/ge/extensions/career/modules/tuning.lua:350
function career_modules_tuning.close() end

--- Retourne les données de tuning du véhicule courant (variables traduites par core_vehicle_partmgmt), sans les variables masquées en carrière.
---Source : lua/ge/extensions/career/modules/tuning.lua:183
---@return table|nil  Variables de tuning, ou nil si le véhicule n'est pas trouvé.
function career_modules_tuning.getTuningData() end

--- Hook de l'ordinateur du garage : ajoute le bouton « tuning » pour chaque véhicule du garage. Désactivé si le véhicule doit être réparé, si le véhicule de départ n'est pas acheté ou si les permissions refusent les tags tuning/vehicleModification.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tuning.lua:364
---@param menuData table Données du menu (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
---@param computerFunctions table Table à remplir (vehicleSpecific[inventoryId][id]).
function career_modules_tuning.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook appelé à la fin de la sauvegarde d'un véhicule ; ferme le menu si la fermeture attendait la sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tuning.lua:168
function career_modules_tuning.onVehicleSaveFinished() end

--- Remet une variable à sa valeur d'origine, la retire du panier et envoie l'UI (updateTuningVariable).
---Source : lua/ge/extensions/career/modules/tuning.lua:333
---@param varName string Nom de la variable de tuning.
function career_modules_tuning.removeVarFromShoppingCart(varName) end

--- Ouvre le tuning pour un véhicule d'inventaire. Mémorise les variables d'origine, complète les valeurs par défaut manquantes, propose une réparation si peu de pièces sont cassées (sous le seuil de valueCalculator), puis navigue vers career.computer.tuning, crée le panier et la laisse. Ne fait rien si le véhicule n'est pas apparu dans la carte.
---Source : lua/ge/extensions/career/modules/tuning.lua:289
---@param _inventoryId integer|nil Id d'inventaire ; par défaut, le premier du garage le plus proche.
---@param _originComputerId any Id de l'ordinateur du garage d'origine (sinon pas d'UI ni de laisse).
function career_modules_tuning.start(_inventoryId, _originComputerId) end

