---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/vehicleController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur principal (type "main", defaultOrder 500) du véhicule. Il lit les entrées du conducteur (input.throttle/brake/clutch, ou les overrides electrics), charge le module de logique de boîte (dossier shiftLogic/, choisi par le type du device « gearbox » ou par la clé jbeam shiftLogicName), gère le mode de boîte arcade/realistic, le calcul d'agressivité de conduite, la prévention de passage de rapport sur glissement/saut, le frein de parking intelligent, la limite de vitesse, et publie plus de 30 valeurs dans electrics.values (throttle, brake, clutch, gear, rpm, fuel, engineRunning…). Un moddeur s'en sert via controller.mainController pour changer de rapport, de mode de boîte, couper l'allumage ou limiter la vitesse.
--- Accès : contrôleur `vehicleController/vehicleController` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_vehicleController_vehicleController
---@field brake number Frein final (0..1) décidé par la logique de boîte (forcé à 1 si le véhicule est gelé).
---@field clutchRatio number Taux d'embrayage (1 = embrayé, 0 = débrayé) fourni par la logique de boîte. electrics.values.clutch vaut 1 - clutchRatio.
---@field defaultOrder number Ordre d'exécution par défaut du contrôleur (500).
---@field drivingAggression number Agressivité de conduite lissée (0..1) qui interpole les points de passage bas/haut ; peut être forcée par setAggressionOverride.
---@field engineInfo table Tableau de 21 valeurs envoyé au stream « engineInfo » : [1] ralenti tr/min, [2] max tr/min, [5] rpm, [6] nom du rapport, [7] maxGearIndex, [8] minGearIndex, [9] couple volant, [10] couple boîte, [11] vitesse sol, [12] volume carburant, [13] capacité, [14] "manual", [15] id objet, [17] gearIndex, [18] moteur tournant, [19] charge, [20] couple roues, [21] puissance roues en ch (x0.001x1.35962), [22] puissance moteur en ch.
---@field fireEngineTemperature number Température d'échappement du moteur (engine.thermals.exhaustTemperature) ou température ambiante si pas de thermique. Mis à jour chaque frame.
---@field gearboxBehavior string|nil Mode de boîte courant, "arcade" ou "realistic" ; nil avant le premier setGearboxBehavior.
---@field isArcadeSwitched boolean Vrai quand le mode arcade a inversé les rôles accélérateur/frein (marche arrière automatique). Reporté depuis la logique de boîte.
---@field setDefaultForwardMode function|nil Délégué vers la fonction du même nom du module de boîte (change le sens par défaut avant). Vaut `nop` ou nil si le module ne la fournit pas.
---@field shiftingAggression number Agressivité de passage de rapport reportée par le module de boîte (0 si absent).
---@field throttle number Accélérateur final (0..1) décidé par la logique de boîte, après limite de vitesse.
---@field type string Toujours "main" : contrôleur principal obligatoire du véhicule.
---@field updateGFX function Boucle graphique, remplacée par updateGFXGeneric(dt) à l'init (nop avant).
local controller_vehicleController_vehicleController = {}

--- Ajoute une valeur à la limite temporaire (nil compte pour 0).
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:163
---@param change number Variation en m/s.
function controller_vehicleController_vehicleController.changeTopSpeedLimitTemporary(change) end

--- Passe au mode de boîte suivant dans la liste {"arcade", "realistic"} (avec bouclage) et affiche un message.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:670
function controller_vehicleController_vehicleController.cycleGearboxModes() end

--- Renvoie l'état compact du contrôleur pour la synchronisation : grb_bhv (mode de boîte), frzn (gelé), fusionné avec getState du module de boîte.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:1202
---@return table|nil  Table d'état, nil si vide.
function controller_vehicleController_vehicleController.getState() end

--- Initialise le contrôleur : lit les clés jbeam, crée les lisseurs, calcule les points de passage, charge et initialise le module shiftLogic, enregistre le menu rapide « mode de boîte » et fixe le mode de boîte initial (précédent, réglage defaultGearboxBehavior, sinon arcade). Appelé par le moteur au chargement du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:957
---@param jbeamData table Données jbeam du contrôleur (voir notes pour les clés).
function controller_vehicleController_vehicleController.init(jbeamData) end

--- Appelé après l'init de tous les contrôleurs : applique le frein de parking au spawn si autorisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:1169
function controller_vehicleController_vehicleController.initLastStage() end

--- Hook de chargement : restaure le mode de boîte, les données du module de boîte, puis réapplique le frein de parking.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:1181
---@param data table Table produite par onSerialize.
function controller_vehicleController_vehicleController.onDeserialize(data) end

--- Hook de sauvegarde : renvoie {previousGearboxBehavior, controlLogicModuleData} (données du module de boîte si elle a onSerialize).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:1191
---@return table  Données à sérialiser.
function controller_vehicleController_vehicleController.onSerialize() end

--- Remet à zéro timers, lisseurs, PID, état de frein de parking et réinitialise le module de boîte ; réapplique le mode de boîte. Appelé au reset du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:863
---@param jbeamData table Données jbeam du contrôleur.
function controller_vehicleController_vehicleController.reset(jbeamData) end

--- Appelé en dernier au reset : réapplique le frein de parking de spawn et annule le démarrage automatique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:951
---@param jbeamData table Données jbeam.
function controller_vehicleController_vehicleController.resetLastStage(jbeamData) end

--- Demande au module de boîte d'envoyer les courbes de couple à l'UI ; ignoré si aucun joueur principal n'est assis.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:719
function controller_vehicleController_vehicleController.sendTorqueData() end

--- Force l'agressivité de conduite (0..1) utilisée par les points de passage ; nil rend la main au calcul automatique.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:175
---@param aggression number|nil Valeur imposée ou nil.
function controller_vehicleController_vehicleController.setAggressionOverride(aggression) end

--- Coupe ou allume l'allumage du moteur (engine:setIgnition 1/0) ou, sans moteur, appelle setIgnition du module de boîte.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:711
---@param enabled boolean Allumage actif ?
function controller_vehicleController_vehicleController.setEngineIgnition(enabled) end

--- Gèle le véhicule : frein forcé à 1 et boîte verrouillée si mode == 1.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:704
---@param mode integer 1 pour geler, autre valeur pour libérer.
function controller_vehicleController_vehicleController.setFreeze(mode) end

--- Définit le mode de boîte. Inconnu : log d'erreur et sans effet. Affiche un message, puis notifie le module (gearboxBehaviorChanged).
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:189
---@param behavior string "arcade" ou "realistic".
function controller_vehicleController_vehicleController.setGearboxMode(behavior) end

--- Actionne ou coupe le démarreur du moteur principal ; ne s'active que si le régime est inférieur à 80% de starterMaxAV.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:694
---@param enabled boolean Démarreur actif ?
function controller_vehicleController_vehicleController.setStarter(enabled) end

--- Applique un état produit par getState (mode de boîte, gel, puis état du module de boîte).
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:1211
---@param data table Table avec grb_bhv, frzn et clés du module de boîte.
function controller_vehicleController_vehicleController.setState(data) end

--- Définit la limite de vitesse temporaire. Elle n'agit que si setTopSpeedLimitTemporaryActive(true).
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:159
---@param speedLimit number|nil Limite en m/s.
function controller_vehicleController_vehicleController.setTopSpeedLimitTemporary(speedLimit) end

--- Active ou désactive la limite de vitesse temporaire (remise à false au reset).
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:167
---@param active boolean Activer ?
function controller_vehicleController_vehicleController.setTopSpeedLimitTemporaryActive(active) end

--- Hook appelé quand les réglages utilisateur changent : relit autoClutch, autoThrottle, gearboxSafety et defaultGearboxBehavior (applique ce dernier au véhicule du joueur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:773
function controller_vehicleController_vehicleController.settingsChanged() end

--- Rétrograde à l'appui de la touche : shiftDownOnDown du module, sinon shiftDown.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:652
function controller_vehicleController_vehicleController.shiftDownOnDown() end

--- Relâchement de la touche de rétrogradage : shiftDownOnUp du module s'il existe. API obligatoire du contrôleur principal.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:660
function controller_vehicleController_vehicleController.shiftDownOnUp() end

--- Passe directement au rapport d'index donné (négatif = marche arrière, 0 = point mort) en déléguant au module de boîte.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:666
---@param index integer Index de rapport.
function controller_vehicleController_vehicleController.shiftToGearIndex(index) end

--- Passe au rapport supérieur à l'appui de la touche : appelle shiftUpOnDown du module de boîte, sinon shiftUp.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:639
function controller_vehicleController_vehicleController.shiftUpOnDown() end

--- Relâchement de la touche de rapport supérieur : appelle shiftUpOnUp du module s'il existe.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:646
function controller_vehicleController_vehicleController.shiftUpOnUp() end

--- Entrée du frein à main « intelligente » : si le véhicule roule (> 2.8 m/s), dérape (glissement cumulé > 10000) ou si l'entrée est un axe, relaie l'événement parkingbrake tel quel (frein temporaire) ; sinon, à l'arrêt, un appui bascule le frein de parking, et un relâchement avec frein serré active le mode smartParkingBrakeActive (relâché dès que l'on accélère).
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:432
---@param ivalue number Valeur de l'entrée (0..1).
---@param filter integer|nil Filtre d'entrée (FILTER_*), FILTER_DIRECT par défaut.
---@param isAxisOverride boolean|nil Force le traitement comme axe (true) ou touche (false), p. ex. pour les freins pneumatiques.
function controller_vehicleController_vehicleController.smartParkingBrake(ivalue, filter, isAxisOverride) end

--- Bascule l'activation de la limite temporaire.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:171
function controller_vehicleController_vehicleController.toggleTopSpeedLimitTemporaryActive() end

--- Hook appelé quand le véhicule devient actif : renvoie à l'UI les données de points de passage (ShiftPointDebugDataChanged) si un joueur est assis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:1173
function controller_vehicleController_vehicleController.vehicleActivated() end

--- Table d'utilitaires passée en second argument à init du module shiftLogic (controlLogicModule.init(jbeamData, sharedFunctions)). Non exposée dans M.
---@class controller_vehicleController_vehicleController_sharedFunctions
local controller_vehicleController_vehicleController_sharedFunctions = {}

--- Liste les noms de réservoirs des moteurs dont le type d'énergie correspond à requiredEnergyType.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:274
---@param engines table Liste de devices moteur.
---@return table<integer, string>  Noms de stockages d'énergie.
function controller_vehicleController_vehicleController_sharedFunctions.getEnergyStorages(engines) end

--- Renvoie la table des points de passage par index de rapport (lowShiftDownAV, highShiftDownAV, lowShiftUpAV, highShiftUpAV en rad/s).
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:225
---@return table  Points de passage.
function controller_vehicleController_vehicleController_sharedFunctions.getShiftPoints() end

--- Choisit les régimes (rad/s) de passage haut/bas du rapport en interpolant entre les valeurs low et high selon le carré de l'agressivité normalisée ; écrit shiftBehavior.shiftUpAV/shiftDownAV et le fournit au module.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:215
---@param gearIndex integer Rapport pour lequel lire shiftPoints.
function controller_vehicleController_vehicleController_sharedFunctions.selectShiftPoints(gearIndex) end

--- Affiche le message « utilisation du levier en H », passe en mode realistic et sélectionne le rapport demandé.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:229
---@param gearIndex integer Rapport à engager.
function controller_vehicleController_vehicleController_sharedFunctions.switchToRealisticBehavior(gearIndex) end

--- Moyenne des outputAV1 de tous les devices d'une catégorie. Même piège de division par zéro.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:264
---@param deviceCategory string Catégorie de device.
---@return number  Vitesse moyenne en rad/s.
function controller_vehicleController_vehicleController_sharedFunctions.updateAvgAVDeviceCategory(deviceCategory) end

--- Moyenne des outputAV1 de tous les devices d'un type. Piège : division par zéro (NaN) s'il n'y a aucun device.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:254
---@param deviceType string Type de device.
---@return number  Vitesse moyenne en rad/s.
function controller_vehicleController_vehicleController_sharedFunctions.updateAvgAVDeviceType(deviceType) end

--- Renvoie une vitesse angulaire d'un device du powertrain (0 si absent).
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:248
---@param deviceName string Nom du device.
---@param deviceProperty string|nil Propriété lue, "outputAV1" par défaut.
---@return number  Vitesse en rad/s.
function controller_vehicleController_vehicleController_sharedFunctions.updateAvgAVSingleDevice(deviceName, deviceProperty) end

--- Envoie à l'UI un message « impossible de passer en séquentiel » avec une action pour basculer le mode de boîte.
---Source : lua/vehicle/controller/vehicleController/vehicleController.lua:235
function controller_vehicleController_vehicleController_sharedFunctions.warnCannotShiftSequential() end

return controller_vehicleController_vehicleController
