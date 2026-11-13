---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/inspectVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère l'inspection d'un véhicule à vendre (concession ou vendeur privé) en mode carrière avant achat. startInspection fait apparaître le véhicule gelé sur une place de parking, soit en téléportant le joueur, soit en lui donnant un trajet GPS à parcourir dans un temps limité ; une fois arrivé, un « tether » (laisse de distance) limite l'éloignement. Le module définit les règles d'essai (testDriveInfo : durée 60 s, zone, route, frais d'abandon), ouvre le menu d'achat, démarre l'essai via career_modules_testDrive, publie un point d'intérêt (POI) et nettoie à la fin (achat, abandon, trop loin, véhicule déplacé, mode livraison ou mission lancé).
--- Accès : extension `career_modules_inspectVehicle` : `extensions.load("career_modules_inspectVehicle")`, puis la globale `career_modules_inspectVehicle`
---@class career_modules_inspectVehicle
---@field dependencies table Table vide : aucune dépendance.
career_modules_inspectVehicle = {}

--- Achète le véhicule inspecté via career_modules_vehicleShopping puis quitte la vente en le conservant.
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:293
---@param buyVehicleOptions table Options d'achat transmises à vehicleShopping.buySpawnedVehicle.
function career_modules_inspectVehicle.buySpawnedVehicle(buyVehicleOptions) end

--- Indique si le joueur a fait l'essai pendant cette inspection.
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:471
---@return boolean|nil  true si un essai a eu lieu.
function career_modules_inspectVehicle.getDidTestDrive() end

--- Construit le POI du véhicule inspecté (marqueur inspectVehicleMarker sur la place de départ ; marqueur de grande carte si le joueur doit s'y rendre).
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:403
---@return table|nil  POI ou nil si carrière inactive / pas d'essai défini.
function career_modules_inspectVehicle.getInspectVehiclePoi() end

--- Infos du véhicule actuellement inspecté.
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:388
---@return table|nil  {shopId, vehId, name, value} ou nil.
function career_modules_inspectVehicle.getSpawnedVehicleInfo() end

--- Indique si des dégâts ont été détectés pendant l'essai.
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:368
---@return boolean  true si oui.
function career_modules_inspectVehicle.isTestDriveDamageDetected() end

--- Termine la vente en cours (laisse dépassée, abandon, achat…) : ferme les menus, abandonne l'essai si actif, déclare une réclamation de dégâts d'essai s'il y a lieu, gère le véhicule selon despawnPreviousVehMode, puis réinitialise l'état. Ignoré sans véhicule inspecté ou si un départ est déjà en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:157
---@param despawnPreviousVehMode string|nil 'despawn', 'flagForDeletion' ou 'dontDespawn' (défaut).
---@param freezePreviousVeh boolean|nil Geler le véhicule s'il est gardé ; true par défaut.
---@param checkDamage boolean|nil Vérifier les dégâts après un essai ; true par défaut.
---@param defaultLeaveMessage string|nil Message affiché si aucun essai actif ; « leftSale » par défaut.
function career_modules_inspectVehicle.leaveSaleCallback(despawnPreviousVehMode, freezePreviousVeh, checkDamage, defaultLeaveMessage) end

--- Hook du prompt d'activité : pour un élément de type inspectVehicle, ajoute une carte avec le nom du véhicule, le vendeur et un bouton qui ouvre le menu d'achat avec tether.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:443
---@param elemData table Éléments proches.
---@param activityData table Données d'activité à compléter.
function career_modules_inspectVehicle.onActivityAcceptGatherData(elemData, activityData) end

--- Hook : quand une mission démarre en carrière, quitte la vente et supprime le véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:372
---@param status string État de la mission ('started'…).
---@param id string Identifiant de la mission.
function career_modules_inspectVehicle.onAnyMissionChanged(status, id) end

--- Hook : le début du mode livraison termine l'inspection et supprime le véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:379
function career_modules_inspectVehicle.onDeliveryModeStarted() end

--- Hook de collecte des POI : ajoute le POI d'inspection à la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:436
---@param levelIdentifier string Niveau courant.
---@param elements table Liste de POI à compléter.
function career_modules_inspectVehicle.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook : le menu d'achat est fermé ; retire le tether sphérique du menu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:475
function career_modules_inspectVehicle.onPurchaseMenuClosed() end

--- Hook : essai abandonné ; quitte la vente (véhicule marqué pour suppression).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:482
function career_modules_inspectVehicle.onTestDriveAbandoned() end

--- Hook : un dégât a été détecté pendant l'essai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:364
function career_modules_inspectVehicle.onTestDriveDamageDetected() end

--- Hook : essai terminé après fondu ; réarme les tethers et rouvre le menu d'achat.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:486
function career_modules_inspectVehicle.onTestDriveEndedAfterFade() end

--- Hook de début d'essai : note qu'un essai a eu lieu et retire les tethers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:356
function career_modules_inspectVehicle.onTestDriveStarted() end

--- Hook par image : détecte le déplacement du véhicule à vendre, décompte le temps imparti pour arriver et détecte l'arrivée du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:333
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps de simulation (s).
---@param dtRaw number Delta temps brut (s).
function career_modules_inspectVehicle.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : si le véhicule inspecté est détruit, réinitialise l'inspection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:349
---@param vehId integer Véhicule supprimé.
function career_modules_inspectVehicle.onVehicleDestroyed(vehId) end

--- Hook : si le joueur passe dans le véhicule inspecté hors essai, le regèle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:502
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
---@param player integer Joueur concerné.
function career_modules_inspectVehicle.onVehicleSwitched(oldId, newId, player) end

--- Utilisé seulement dans le tutoriel : fondu d'écran puis paiement de la réparation d'un véhicule générique (voir bug dans notes : vehId non défini).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:393
function career_modules_inspectVehicle.repairVehicle() end

--- Fait apparaître le véhicule à vendre (shopId) sans l'activer (contact coupé, gelé, conditions de pièces initialisées) et mémorise ses infos (shopId, vehId, nom, valeur).
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:98
---@param vehicleInfo table|nil Infos de l'annonce (shopId, Brand, Name, Value…).
---@return userdata|nil  Objet véhicule, nil en cas d'échec.
function career_modules_inspectVehicle.showVehicle(vehicleInfo) end

--- Démarre l'inspection : ferme une inspection précédente, fait apparaître le véhicule, choisit la place de parking (celle du vendeur privé, ou la meilleure place de la concession), déplace d'éventuels véhicules gênants, place le véhicule, puis téléporte le joueur (quickTravel) ou lui trace un chemin GPS avec limite de temps. Définit les règles d'essai.
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:222
---@param vehicleInfo table Annonce (shopId, sellerId, parkingSpotName pour un privé…).
---@param teleportToVehicle boolean true pour téléporter le joueur à la place du véhicule.
---@param job table|nil Job coroutine existant ; sinon un job est créé.
---@return boolean|nil  Avec un job fourni : true si démarré, false si le spawn échoue ; sans job : nil (asynchrone).
function career_modules_inspectVehicle.startInspection(vehicleInfo, teleportToVehicle, job) end

--- Ferme les menus et démarre l'essai du véhicule inspecté avec les règles testDriveInfo.
---Source : lua/ge/extensions/career/modules/inspectVehicle.lua:383
function career_modules_inspectVehicle.startTestDrive() end

