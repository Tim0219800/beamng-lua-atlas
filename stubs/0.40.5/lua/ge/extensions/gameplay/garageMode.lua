---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/garageMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode garage : charge le niveau garage_v2 (ou utilise l'emplacement actuel en carrière), gèle le véhicule sur son point d'apparition, passe la caméra en orbite, bloque certaines actions d'entrée (map, menus véhicule, IA, marche, reset...), masque automatiquement plafond et piliers selon la position de la caméra, gère l'éclairage par groupes et permet de tester le véhicule dans le niveau gridmap_v2. Un moddeur s'en sert pour entrer/sortir du garage (start/stop) ou ajuster caméra et éclairage.
--- Accès : extension `gameplay_garageMode` : `extensions.load("gameplay_garageMode")`, puis la globale `gameplay_garageMode`
---@class gameplay_garageMode
---@field dependencies string[] core_jobsystem et core_vehicle_manager.
gameplay_garageMode = {}

--- Étape d'initialisation en chaîne : lance career_saveSystem.saveCurrent() ; la fin de la sauvegarde appelle initStepFinished.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:372
function gameplay_garageMode.garageModeStartStep() end

--- Renvoie le menu de garage mémorisé.
---Source : lua/ge/extensions/gameplay/garageMode.lua:65
---@return string|nil  Nom du menu.
function gameplay_garageMode.getGarageMenuState() end

--- ID du dernier véhicule possédé entré ou courant en carrière.
---Source : lua/ge/extensions/gameplay/garageMode.lua:541
---@return integer|nil  ID de véhicule.
function gameplay_garageMode.getLastOwnedVehicleId() end

--- Renvoie l'état des trois groupes d'éclairage.
---Source : lua/ge/extensions/gameplay/garageMode.lua:450
---@return boolean[]  {ouest, milieu, est}.
function gameplay_garageMode.getLighting() end

--- Passe à l'étape d'initialisation suivante (extension suivante de garageInitModules) ou termine la chaîne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:362
function gameplay_garageMode.initStepFinished() end

--- Indique si le mode garage est actif.
---Source : lua/ge/extensions/gameplay/garageMode.lua:485
---@return boolean  true si actif.
function gameplay_garageMode.isActive() end

--- Indique si le masquage automatique est actif.
---Source : lua/ge/extensions/gameplay/garageMode.lua:493
---@return boolean  État courant.
function gameplay_garageMode.isObjectsAutohide() end

--- Hook avant le démarrage d'un niveau : active le mode garage si demandé au chargement (décharge/recharge les extensions), sinon termine le mode garage s'il était actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:461
---@param levelPath string Chemin du niveau.
function gameplay_garageMode.onClientPreStartMission(levelPath) end

--- Hook au démarrage d'un niveau : remplace le véhicule par vehicleToLoad s'il existe (jamais assigné dans ce fichier).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:454
---@param levelPath string Chemin du niveau.
function gameplay_garageMode.onClientStartMission(levelPath) end

--- Hook de rechargement des extensions : restaure l'état actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:481
---@param v table Données de onSerialize.
function gameplay_garageMode.onDeserialized(v) end

--- Hook : mémorise le véhicule entré comme dernier véhicule possédé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:69
---@param vehicleId integer|nil ID du véhicule.
function gameplay_garageMode.onEnterVehicleFinished(vehicleId) end

--- Hook de navigation UI : remplit data.layoutMenu (barre du haut avec onglets Garage/Tuning, en-tête, rails) et data.garage pour la route garage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:146
---@param context table|nil Contexte de navigation.
---@param toRoute table|nil Route de destination (champ name).
---@param fromRoute table|nil Route d'origine (non utilisée).
---@param data table Table de données de route, modifiée en place.
function gameplay_garageMode.onGarageEnter(context, toRoute, fromRoute, data) end

--- Hook à la fin de l'écran de chargement : après testVehicle, navigue vers la route UI "play".
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:545
function gameplay_garageMode.onLoadingScreenFadeout() end

--- Hook de rechargement des extensions : sauvegarde {active}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:475
---@return table  {active = boolean}.
function gameplay_garageMode.onSerialize() end

--- Hook de spawn : demande que le véhicule apparaisse moteur éteint (spawnWithEngineRunning = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:121
---@param vehicleId integer ID du véhicule.
function gameplay_garageMode.onSpawnCCallback(vehicleId) end

--- Hook de prise de vignette : dans garage_v2, quitte le mode garage et masque piliers est (affiche ouest/plafond) pendant la capture, puis réactive le mode ; affiche/retire l'écran noir GarageModeBlackscreen.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:497
---@param active boolean true au début de la capture, false à la fin.
function gameplay_garageMode.onThumbnailTriggered(active) end

--- Hook : si l'initialisation du garage attend la sauvegarde, passe à l'étape suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:377
function gameplay_garageMode.onVehicleSaveFinished() end

--- Hook appelé à l'apparition d'un véhicule ; en mode garage, le téléporte sur le point de spawn du niveau garage et programme le gel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/garageMode.lua:114
---@param vehicleId integer ID du véhicule.
function gameplay_garageMode.onVehicleSpawned(vehicleId) end

--- Lance un job qui passe en caméra orbite et applique une rotation par défaut prédéfinie.
---Source : lua/ge/extensions/gameplay/garageMode.lua:84
---@param preset string|nil default, front, back, side, left, right ou top (default si nil).
function gameplay_garageMode.setCamera(preset) end

--- Mémorise le menu de garage ouvert ; l'état "paint" marque le véhicule comme modifié.
---Source : lua/ge/extensions/gameplay/garageMode.lua:56
---@param state string|nil Nom du menu.
function gameplay_garageMode.setGarageMenuState(state) end

--- Allume/éteint les trois groupes d'éclairage du garage (ouest, milieu, est).
---Source : lua/ge/extensions/gameplay/garageMode.lua:318
---@param state boolean[]|nil Tableau de 3 booléens ; nil rallume tout.
function gameplay_garageMode.setLighting(state) end

--- Active ou désactive le masquage automatique du plafond et des piliers.
---Source : lua/ge/extensions/gameplay/garageMode.lua:489
---@param v boolean true pour masquer automatiquement.
function gameplay_garageMode.setObjectsAutohide(v) end

--- Prévu pour signaler un véhicule modifié en carrière ; le déclenchement du guihook est actuellement commenté, la fonction ne fait donc rien d'observable.
---Source : lua/ge/extensions/gameplay/garageMode.lua:50
---@param vehicleDirty boolean État modifié.
---@param switchedToNewVehicle boolean|nil Changement de véhicule.
function gameplay_garageMode.setVehicleDirty(vehicleDirty, switchedToNewVehicle) end

--- Entre en mode garage. Avec useCurrentLocation vrai, reste sur la carte actuelle (carrière : vérifie qu'il y a des véhicules en inventaire, appelle career_modules_inventory.onBeforeGarage, passe en caméra orbite, met l'allumage à 0) ; sinon charge le niveau garage_v2 avec le véhicule courant.
---Source : lua/ge/extensions/gameplay/garageMode.lua:385
---@param _useCurrentLocation boolean|nil true pour utiliser l'emplacement actuel au lieu de charger garage_v2.
---@param skipInventoryStep boolean|nil En carrière, saute l'appel à career_modules_inventory.onBeforeGarage.
function gameplay_garageMode.start(_useCurrentLocation, skipInventoryStep) end

--- Quitte le mode garage : remet l'allumage au niveau 3, dégèle le véhicule, restaure la caméra et l'état freeroam, puis émet onEndGarageMode.
---Source : lua/ge/extensions/gameplay/garageMode.lua:445
function gameplay_garageMode.stop() end

--- Lance un job qui fait sortir le véhicule du garage (ai vers le waypoint garageExit), fond au noir puis charge gridmap_v2 en freeroam avec le véhicule courant.
---Source : lua/ge/extensions/gameplay/garageMode.lua:537
function gameplay_garageMode.testVehicle() end

--- Renvoie « Marque Nom » du modèle donné, ou du véhicule actif si aucun n'est fourni.
---Source : lua/ge/extensions/gameplay/garageMode.lua:191
---@param vehicleId string|nil Clé de modèle (nom du dossier jbeam), malgré son nom.
---@return string|nil  Texte « Brand Name » ou nil.
function gameplay_garageMode.vehicleByIdOrActive(vehicleId) end

--- Zoome la caméra de façon progressive (accélération limitée) ; sans effet hors mode garage. Le zoom s'arrête de lui-même après un court délai.
---Source : lua/ge/extensions/gameplay/garageMode.lua:211
---@param value number Sens et intensité (positif ou négatif) ; 0 ne fait rien.
function gameplay_garageMode.zoom(value) end

