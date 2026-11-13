---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/painting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Atelier de peinture de la carrière, accessible depuis l'ordinateur du garage. Il prépare la scène (entre dans le véhicule, le fige, caméra orbitale, blocage des actions walkingMode et bigMap), envoie à l'UI les couleurs d'origine, les prix et les classes de peinture, applique en direct les peintures choisies (setPaints), puis facture et enregistre (apply) ou annule (close/cleanup). Les données restent dans l'inventaire du véhicule (config.paints et partConditions).
--- Accès : extension `career_modules_painting` : `extensions.load("career_modules_painting")`, puis la globale `career_modules_painting`
---@class career_modules_painting
---@field dependencies table<integer, string> Extensions chargées avant : career_career, gameplay_achievement.
career_modules_painting = {}

--- Valide la sélection : vérifie et paie le prix total (tags vehiclePainting, buying), joue le son d'achat, enregistre les peintures dans le véhicule d'inventaire, débloque VEHICLE_MODIFIED, ferme le mode et lance la sauvegarde du véhicule. Ne fait rien si le joueur ne peut pas payer.
---Source : lua/ge/extensions/career/modules/painting.lua:186
function career_modules_painting.apply() end

--- Restaure l'état du véhicule (réapparition depuis l'inventaire), de la caméra, du mode marche et des entrées. Ne navigue pas (le routeur UI s'en charge) ; sans effet si la peinture n'est pas active.
---Source : lua/ge/extensions/career/modules/painting.lua:128
function career_modules_painting.cleanup() end

--- Quitte le mode peinture (cleanup) puis rouvre le menu de l'ordinateur ou ferme les menus ; si autosauvegarde active et _closeMenuAfterSaving vrai, la fermeture du menu attend onVehicleSaveFinished.
---Source : lua/ge/extensions/career/modules/painting.lua:153
---@param _closeMenuAfterSaving boolean|nil Attendre la fin de la sauvegarde avant de fermer le menu.
function career_modules_painting.close(_closeMenuAfterSaving) end

--- Renvoie les peintures d'usine du modèle du véhicule en cours de peinture.
---Source : lua/ge/extensions/career/modules/painting.lua:282
---@return table  Peintures du modèle ({} si aucune).
function career_modules_painting.getFactoryPaint() end

--- Renvoie les données envoyées à l'UI : colors (peintures d'origine de la pièce « body » ou de la première pièce peinte), prices et colorClassData.
---Source : lua/ge/extensions/career/modules/painting.lua:75
---@return {colors: table|nil, prices: table, colorClassData: table}  Données de peinture.
function career_modules_painting.getPaintData() end

--- Renvoie la peinture d'apprêt grise (baseColor {0.58, 0.58, 0.585}, roughness 0.475, clearcoat 0).
---Source : lua/ge/extensions/career/modules/painting.lua:45
---@return table  Table de peinture.
function career_modules_painting.getPrimerColor() end

--- Hook de l'ordinateur : ajoute la fonction « peinture » (ordre 15) pour chaque véhicule présent dans le garage, avec les raisons de désactivation éventuelles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/painting.lua:215
---@param menuData table Données du menu (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
---@param computerFunctions table Fonctions de l'ordinateur à compléter (vehicleSpecific[inventoryId]).
function career_modules_painting.onComputerAddFunctions(menuData, computerFunctions) end

--- Cycle de vie du routeur UI : renvoie les données de peinture une fois la vue montée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/painting.lua:296
---@param context any Contexte du routeur.
---@param toRoute any Route cible.
---@param fromRoute any Route précédente.
---@param data table routeData.
function career_modules_painting.onRouteMount(context, toRoute, fromRoute, data) end

--- Hook appelé à l'ouverture de l'UI : entre dans le véhicule (avec un délai d'une frame), le fige, règle la caméra orbitale (rotation 145, -15) et décale le cadrage ; émet onVehiclePaintingUiOpened.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/painting.lua:300
function career_modules_painting.onUIOpened() end

--- Hook appelé quand la sauvegarde du véhicule est terminée : ferme le menu si close() l'avait demandé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/painting.lua:165
function career_modules_painting.onVehicleSaveFinished() end

--- Envoie à l'UI les données de peinture et la peinture d'usine (guihooks paintingData) si la peinture est active.
---Source : lua/ge/extensions/career/modules/painting.lua:288
function career_modules_painting.sendPaintingDataToUI() end

--- Enregistre le choix du joueur, envoie le prix du panier à l'UI (sendPaintingShoppingCartData) et applique les peintures au véhicule (toutes les pièces, ou seulement partName).
---Source : lua/ge/extensions/career/modules/painting.lua:258
---@param paints table[] Jusqu'à 3 peintures.
---@param paintOptions table[] Options par peinture (paintClass, clearCoat, clearCoatPolish) servant au calcul du prix.
---@param partName string|nil Pièce visée ; toutes les pièces si nil.
function career_modules_painting.setPaints(paints, paintOptions, partName) end

--- Ouvre le mode peinture pour un véhicule de l'inventaire (celui du garage le plus proche si inventoryId est nil). Ne fait rien si le véhicule n'est pas apparu dans le monde. Passe d'abord par une réparation d'assurance si nécessaire.
---Source : lua/ge/extensions/career/modules/painting.lua:105
---@param _inventoryId integer|nil Id d'inventaire du véhicule.
---@param _originComputerId string|nil Id de l'ordinateur d'origine ; si fourni, navigue vers career.computer.painting.
function career_modules_painting.start(_inventoryId, _originComputerId) end

