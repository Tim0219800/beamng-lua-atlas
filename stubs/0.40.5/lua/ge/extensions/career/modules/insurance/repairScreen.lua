---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/insurance/repairScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prépare les données et gère l'ouverture/fermeture de l'écran de réparation (route UI career.computer.repair) accessible depuis l'ordinateur du garage en carrière. Il construit les options de réparation avec ou sans assurance (coût des dégâts, délais de réparation de instantané à 10 minutes, franchise, prime actuelle et future après réclamation, score de conducteur), ajoute la fonction « Réparer » aux fonctions de l'ordinateur et applique une laisse (tether) de 7 m autour de l'ordinateur.
--- Accès : extension `career_modules_insurance_repairScreen` : `extensions.load("career_modules_insurance_repairScreen")`, puis la globale `career_modules_insurance_repairScreen`
---@class career_modules_insurance_repairScreen
---@field dependencies table<integer, string> Extensions chargées avant : valueCalculator, inventory, playerAttributes, payment, insurance_insurance, tether, etc.
career_modules_insurance_repairScreen = {}

--- Appelé par l'UI pour fermer l'écran ; ignoré tant qu'une sauvegarde de véhicule après réparation est en cours.
---Source : lua/ge/extensions/career/modules/insurance/repairScreen.lua:196
function career_modules_insurance_repairScreen.closeMenu() end

--- Ferme l'écran : revient au menu de l'ordinateur d'origine, ou ferme tous les menus carrière.
---Source : lua/ge/extensions/career/modules/insurance/repairScreen.lua:34
function career_modules_insurance_repairScreen.closeRepairMenu() end

--- Construit les données de l'écran : repairOptions (noInsuranceRepairData, insuranceRepairData avec prime, franchise, renouvellement, tolérances), vehicleData (coût des dégâts, nom, valeur initiale, vignette, assuré), attributs du joueur, paliers et score de conducteur actuel et futur.
---Source : lua/ge/extensions/career/modules/insurance/repairScreen.lua:96
---@return table  Données pour l'UI.
function career_modules_insurance_repairScreen.getRepairData() end

--- Hook de l'ordinateur du garage : ajoute la fonction « repair » pour chaque véhicule du garage (désactivée avant l'achat du véhicule de départ ou si les permissions 'vehicleRepair' l'interdisent).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/repairScreen.lua:43
---@param menuData table Données du menu (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
---@param computerFunctions table Fonctions à compléter (vehicleSpecific[inventoryId][id]).
function career_modules_insurance_repairScreen.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook de fermeture de menu : retire la laisse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/repairScreen.lua:188
function career_modules_insurance_repairScreen.onMenuClosed() end

--- Hook de fin de sauvegarde du véhicule : si une réparation attendait cette fin, referme l'écran.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/insurance/repairScreen.lua:207
function career_modules_insurance_repairScreen.onVehicleSaveFinished() end

--- Ouvre l'écran de réparation d'un véhicule. Si un ordinateur d'origine est donné, démarre une laisse (porte ou sphère, 7 m) qui ferme les menus si le joueur s'éloigne.
---Source : lua/ge/extensions/career/modules/insurance/repairScreen.lua:13
---@param vehicle table Données du véhicule d'inventaire à réparer.
---@param _originComputerId string|nil Identifiant de l'ordinateur du garage qui a ouvert l'écran.
function career_modules_insurance_repairScreen.openRepairMenu(vehicle, _originComputerId) end

--- Lance la réparation via career_modules_insurance_insurance.startRepairInGarage et attend la fin de la sauvegarde du véhicule avant de refermer l'écran.
---Source : lua/ge/extensions/career/modules/insurance/repairScreen.lua:201
---@param invVehId integer Identifiant du véhicule d'inventaire.
---@param repairOptionData table Option de réparation choisie (assurance ou non, délai).
function career_modules_insurance_repairScreen.startRepairInGarage(invVehId, repairOptionData) end

