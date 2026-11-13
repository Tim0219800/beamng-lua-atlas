---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mise en place physique du véhicule avant une vignette : le replace à l'endroit de départ (premier SpawnSphere du niveau, sinon une position de repli), applique la rotation de vignette configurée (thumbnailConfig.getRotation), l'aligne au sol et attend qu'il se stabilise. Fournit aussi des mesures du sol sous une boîte englobante (utilisées par le cadrage procédural) et l'allumage des feux de croisement.
--- Accès : extension `util_screenshotCreator_vehicleSetup` : `extensions.load("util_screenshotCreator_vehicleSetup")`, puis la globale `util_screenshotCreator_vehicleSetup`
---@class util_screenshotCreator_vehicleSetup
---@field dependencies string[] Extension chargée avant : util_screenshotCreator_thumbnailConfig.
util_screenshotCreator_vehicleSetup = {}

--- Trouve la hauteur du sol sous une boîte englobante en lançant le rayon depuis le dessus de la boîte (utile pour les accessoires dont des nœuds sont enterrés, comme des bornes). Se replie sur le bas de la boîte si aucun sol n'est touché.
---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:46
---@param bb table OOBB avec getPoint(i) et getCenter().
---@return number  Hauteur Z du sol en mètres.
function util_screenshotCreator_vehicleSetup.getFloorHeight(bb) end

--- Lance un rayon statique vers le bas (0,5 m au-dessus, 2 m en dessous) depuis la position donnée et renvoie la hauteur du sol, ou la hauteur de la position si le sol n'est pas trouvé ou est incohérent.
---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:29
---@param position vec3 Position monde.
---@return number  Hauteur Z du sol en mètres.
function util_screenshotCreator_vehicleSetup.getGroundHeight(position) end

--- Renvoie la position et la rotation à utiliser pour replacer le véhicule : celles d'origine mémorisées si une rotation de vignette avait été appliquée, sinon sa pose actuelle.
---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:96
---@param vehicle table Objet véhicule.
---@return vec3  Position.
---@return quat  Rotation.
function util_screenshotCreator_vehicleSetup.getResetTransform(vehicle) end

--- Renvoie la position et la rotation du premier objet SpawnSphere de la scène, point de départ des vignettes.
---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:89
---@return vec3|nil  Position, nil s'il n'y a pas de SpawnSphere.
---@return quat|nil  Rotation.
function util_screenshotCreator_vehicleSetup.getThumbnailSpawnTransform() end

--- Hook appelé quand un véhicule apparaît : oublie la rotation de vignette mémorisée pour ce véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:149
---@param vehicleId integer Identifiant du véhicule.
function util_screenshotCreator_vehicleSetup.onVehicleSpawned(vehicleId) end

--- Réinitialise le véhicule (vehicle:reset), le téléporte sur le point de départ avec la rotation de vignette de la config, puis l'aligne au sol (deux coroutine.yield).
---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:102
---@param vehicle table Objet véhicule.
---@param configName string Nom de la configuration (pour la rotation de vignette).
---@param fallbackPosition vec3|nil Position utilisée s'il n'y a pas de SpawnSphere.
---@param fallbackRotation quat|nil Rotation utilisée s'il n'y a pas de SpawnSphere.
function util_screenshotCreator_vehicleSetup.placeVehicleForThumbnail(vehicle, configName, fallbackPosition, fallbackRotation) end

--- Si enabled est vrai, envoie au véhicule electrics.setLightsState(1) (feux de croisement). Ne fait rien sinon.
---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:143
---@param vehicle table Objet véhicule.
---@param enabled boolean Allumer les feux.
function util_screenshotCreator_vehicleSetup.setLowBeams(vehicle, enabled) end

--- Attend (en cédant la main à chaque frame) le temps de stabilisation du véhicule.
---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:135
---@param modelName string Nom du modèle.
---@param configName string Nom de la configuration.
---@param options table|nil {settleDelay = secondes} (défaut 2).
function util_screenshotCreator_vehicleSetup.waitForVehicleToSettle(modelName, configName, options) end

