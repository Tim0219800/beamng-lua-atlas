---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehiclePerformance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Certification de performance (« indice de performance ») des véhicules de la carrière, depuis l'ordinateur du garage. startDragTest enchaîne, avec util_stepHandler, un test de drag sur la piste alderStrip (west_coast_usa) enregistré (puissance, temps 0-60, 60 ft, 330 ft, 1/8, 1000 ft, 1/4 de mile, vitesses, freinage), puis un test de skidpad de 10 tours piloté par l'IA (accélération latérale). Les données sont stockées dans vehicle.certificationData, l'historique (10 entrées max) dans performanceHistory, puis converties en scores et classe par gameplay_vehiclePerformance. Gère aussi les caméras de test, le blocage d'actions pendant le test et l'annulation (utilisateur, véhicule bloqué, moteur cassé).
--- Accès : extension `career_modules_vehiclePerformance` : `extensions.load("career_modules_vehiclePerformance")`, puis la globale `career_modules_vehiclePerformance`
---@class career_modules_vehiclePerformance
---@field dependencies string[] {"ui_vehicleSelector_vehicleSpecifications"}.
career_modules_vehiclePerformance = {}

--- Ajoute à un bloc de données les champs performanceAggregateScores et vehicleClass et débloque les succès associés.
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:537
---@param performanceData table Données de performance (modifiées en place).
function career_modules_vehiclePerformance.addScoresToPerformanceData(performanceData) end

--- Demande l'annulation du test en cours et arrête le zoom caméra et le test de skidpad.
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:546
---@param delay number|nil Délai en secondes avant l'arrêt effectif, 0 par défaut.
---@param userAborted boolean|nil false si l'annulation est automatique (pas de hook onGameplayActivityAborted).
function career_modules_vehiclePerformance.cancelTest(delay, userAborted) end

--- Données UI du véhicule actif (career_modules_inventory.getVehicleUiData).
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:616
---@return table|nil  Données UI, nil si aucun véhicule actif.
function career_modules_vehiclePerformance.getActiveVehicleUiData() end

--- Retourne les scores agrégés (gameplay_vehiclePerformance.getAggregateScores) d'après la certification d'un véhicule.
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:509
---@param inventoryId integer Id d'inventaire.
---@return table|nil  Scores, ou nil sans certification.
function career_modules_vehiclePerformance.getAggregateScoresFromVehId(inventoryId) end

--- Retourne la classe de performance d'un véhicule (gameplay_vehiclePerformance.getClassFromData).
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:516
---@param inventoryId integer Id d'inventaire.
---@return table|nil  Classe, ou nil sans certification.
function career_modules_vehiclePerformance.getVehicleClass(inventoryId) end

--- Archive la certification actuelle d'un véhicule dans son historique puis la supprime (appelée après un changement de pièces ou de tuning).
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:56
---@param inventoryId integer Id d'inventaire.
function career_modules_vehiclePerformance.invalidateCertification(inventoryId) end

--- Indique si un test de certification est en cours.
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:637
---@return boolean|nil  true pendant le test, nil sinon.
function career_modules_vehiclePerformance.isTestInProgress() end

--- Hook de triggers : change la trajectoire de caméra (drag_pi_2 à 5) à l'entrée des triggers dragStageTrigger, drag60ftTrigger, dragTestTrigger2/3, et passe à la caméra externe à la sortie de dragEndCamTrigger. Ne traite que le véhicule du test.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:555
---@param data table {triggerName, event ("enter"|"exit"), subjectID}.
function career_modules_vehiclePerformance.onBeamNGTrigger(data) end

--- Hook de l'ordinateur du garage : ajoute le bouton « indice de performance » pour chaque véhicule du garage (désactivé tant que le véhicule de départ n'est pas acheté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:588
---@param menuData table Données du menu.
---@param computerFunctions table Table à remplir.
function career_modules_vehiclePerformance.onComputerAddFunctions(menuData, computerFunctions) end

--- Hook de drag : 1 s après le début du compte à rebours, passe à la caméra de départ (derrière le véhicule).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:580
---@param vehId integer Id du véhicule.
---@param dial any Valeur de dial (non utilisée).
function career_modules_vehiclePerformance.onDragCountdownStarted(vehId, dial) end

--- Hook du routeur d'UI : attache les données du véhicule actif à data.vehicleData lors du montage de la route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:623
---@param context any Contexte du routeur.
---@param toRoute any Route cible.
---@param fromRoute any Route d'origine.
---@param data table Table de données de la route (reçoit vehicleData).
function career_modules_vehiclePerformance.onRouteMount(context, toRoute, fromRoute, data) end

--- Hook de mise à jour : met à jour le zoom de la caméra de freinage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:75
---@param dtReal number Delta temps réel (s).
function career_modules_vehiclePerformance.onUpdate(dtReal) end

--- Appelé depuis le véhicule via un callback de damageTracker : annule le test après 3 s en cas de sur-couple catastrophique ou de moteur bloqué.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:627
---@param damageData table Données de dégâts.
---@param damageDataDelta table Variation des dégâts (champ engine).
function career_modules_vehiclePerformance.onVehicleDamaged(damageData, damageDataDelta) end

--- Définit le véhicule actif et navigue vers l'écran career.computer.vehiclePerformance.
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:611
---@param options table {inventoryId = integer}.
function career_modules_vehiclePerformance.openMenu(options) end

--- Lance le test de certification complet sur le véhicule actif (activeInventoryId) : fondu au noir, apparition du véhicule, test de drag enregistré, puis skidpad (10 tours), sauvegarde des résultats, remise en garage et retour à l'écran de performance. Si la sauvegarde automatique est active, sauvegarde la carrière à la fin.
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:116
function career_modules_vehiclePerformance.startDragTest() end

--- Traduit en place les champs drivetrain, fuelType, inductionType d'un bloc de données de performance pour l'affichage.
---Source : lua/ge/extensions/career/modules/vehiclePerformance.lua:523
---@param performanceData table|nil Données de performance (modifiées en place).
function career_modules_vehiclePerformance.translatePerformanceDataForUi(performanceData) end

