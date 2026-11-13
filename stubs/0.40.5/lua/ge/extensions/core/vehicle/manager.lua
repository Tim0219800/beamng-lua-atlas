---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/manager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_manager` : chargeur de véhicules côté GE. Quand le moteur crée un objet véhicule, il appelle `_spawnCCallback` : charge les matériaux du dossier du modèle, construit la config (core_vehicle_partmgmt.buildConfigFromString), exécute l'étape 1 du chargeur jbeam (jbeam/loader), termine les meshes, notifie l'UI (VehicleChange), fait entrer le joueur si autoEnterVehicle, puis envoie les données de physique au véhicule (spawnPhysics). Conserve pour chaque véhicule son « bundle » (vdata = données jbeam, config, ioCtx…) accessible par getVehicleData, et applique en direct les changements de peinture.
--- Accès : extension `core_vehicle_manager` : `extensions.load("core_vehicle_manager")`, puis la globale `core_vehicle_manager`
---@class core_vehicle_manager
---@field autoSpawnPhysics boolean true par défaut ; si false, la physique n'est pas envoyée au véhicule après le chargement (spawnPhysicsForVehicle doit être appelée à la main). Aussi désactivé pour un véhicule dont NoPhysics == 'true'.
core_vehicle_manager = {}

--- Appelée par le moteur C++ quand un objet véhicule est créé ou rechargé : charge matériaux, config et jbeam (étape 1), notifie, fait entrer le joueur (autoEnterVehicle / autoEnterVehiclePlayer) et lance la physique. Émet le hook onSpawnCCallback(objID) et appelle vehicleSpawned(objID).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:111
---@param objID integer id de l'objet véhicule
---@param vehicleDir string dossier du modèle (ex. '/vehicles/pickup/')
---@param configDataIn table|string config reçue (partConfig du véhicule)
---@param reloading boolean true lors d'un rechargement (non exploité dans le code)
function core_vehicle_manager._spawnCCallback(objID, vehicleDir, configDataIn, reloading) end

--- Indique si le mode debug de chargement des véhicules est actif.
---Source : lua/ge/extensions/core/vehicle/manager.lua:20
---@return boolean  état
function core_vehicle_manager.getDebug() end

--- Bundle de données du véhicule du joueur 0.
---Source : lua/ge/extensions/core/vehicle/manager.lua:248
---@return table|nil  même structure que getVehicleData
function core_vehicle_manager.getPlayerVehicleData() end

--- Bundle de données d'un véhicule (vdata jbeam, config, ioCtx…).
---Source : lua/ge/extensions/core/vehicle/manager.lua:252
---@param id integer id du véhicule
---@return table|nil  bundle ; nil si le véhicule n'est pas connu
function core_vehicle_manager.getVehicleData(id) end

--- Change la peinture d'un emplacement sur l'objet véhicule (color, colorPalette0, colorPalette1 + données métalliques) sans respawn, puis émet onVehicleColorChanged(objID, index, paint). Ne fait rien si le véhicule n'a pas de config.paints.
---Source : lua/ge/extensions/core/vehicle/manager.lua:256
---@param objID integer id du véhicule
---@param _vehicleObj userdata|nil objet véhicule (cherché si nil)
---@param index integer emplacement 1, 2 ou 3
---@param paint table peinture {baseColor, metallic, roughness, clearcoat, clearcoatRoughness}
function core_vehicle_manager.liveUpdateVehicleColors(objID, _vehicleObj, index, paint) end

--- Hook : fin du niveau ; invalide le cache de matériaux chargés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:52
function core_vehicle_manager.onClientEndMission() end

--- Hook : restaure les bundles encodés par onSerialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:296
---@param data table données de onSerialize
function core_vehicle_manager.onDeserialized(data) end

--- Hook : un objet véhicule est retiré. Oublie son bundle sauf s'il s'agit d'un rechargement (isReloading true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:242
---@param id integer véhicule
---@param isReloading boolean true si rechargement
function core_vehicle_manager.onDespawnObject(id, isReloading) end

--- Hook de l'éditeur : affiche un message d'obsolescence recommandant -debugVehicleLoading.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:333
function core_vehicle_manager.onEditorGui() end

--- Hook de l'éditeur : enregistre la fenêtre obsolète « Vehicle Manager ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:369
function core_vehicle_manager.onEditorInitialized() end

--- Hook : un fichier a changé. Prévient jbeam/io pour les .jbeam et invalide le cache de matériaux d'un dossier de véhicule si un .materials.json y change.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:63
---@param filename string chemin
---@param type string type de modification
function core_vehicle_manager.onFileChanged(filename, type) end

--- Hook : fichiers modifiés ; prévient jbeam/loader.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:57
---@param files table liste de fichiers modifiés
function core_vehicle_manager.onFilesChanged(files) end

--- Hook : encode (lpack) les bundles avant rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:304
---@return table  {vehicles, autoSpawnPhysics}
function core_vehicle_manager.onSerialize() end

--- Hook par frame : vide le cache de placement de spawn.lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:375
function core_vehicle_manager.onUpdate() end

--- Hook : le joueur change de véhicule. Met à jour activePlayer des bundles et relâche l'embrayage (input.event('clutch', 0, 0)) de l'ancien véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/manager.lua:229
---@param oldID integer ancien véhicule
---@param newID integer nouveau véhicule
---@param player integer joueur
function core_vehicle_manager.onVehicleSwitched(oldID, newID, player) end

--- Prépare une table de données supplémentaires qui sera ajoutée à la config du prochain véhicule chargé (config.additionalVehicleData, retirée ensuite). Appelée par core_vehicles au spawn/remplacement.
---Source : lua/ge/extensions/core/vehicle/manager.lua:76
---@param data table|nil données ; nil annule
---@param vehId integer|nil si donné, seul ce véhicule recevra les données
function core_vehicle_manager.queueAdditionalVehicleData(data, vehId) end

--- Recharge tous les véhicules (be:reloadAllVehicles).
---Source : lua/ge/extensions/core/vehicle/manager.lua:326
function core_vehicle_manager.reloadAllVehicles() end

--- Recharge le véhicule d'un joueur : prévient core_vehicles.reloadVehicle puis be:reloadVehicle(playerId).
---Source : lua/ge/extensions/core/vehicle/manager.lua:319
---@param playerId integer index du joueur
function core_vehicle_manager.reloadVehicle(playerId) end

--- Active/désactive le debug de chargement (transmis dans additionalVehicleData.debugEnabled) et prévient l'UI (guihook debugSpawnChanged).
---Source : lua/ge/extensions/core/vehicle/manager.lua:24
---@param enabled boolean état voulu
function core_vehicle_manager.setDebug(enabled) end

--- Applique jusqu'à 3 peintures nommées (de model.paints) à un véhicule, en direct.
---Source : lua/ge/extensions/core/vehicle/manager.lua:279
---@param id integer|nil véhicule ; nil = joueur 0
---@param paintNames string[] {nom1, nom2, nom3}
---@param optional any si non nil, devait annuler l'action quand les 3 couleurs du véhicule sont identiques (inopérant, voir notes)
function core_vehicle_manager.setVehicleColorsNames(id, paintNames, optional) end

--- Alias de setVehicleColorsNames.
---Source : lua/ge/extensions/core/vehicle/manager.lua:279
---@param id integer|nil véhicule ; nil = joueur 0
---@param paintNames string[] noms de peintures
---@param optional any voir setVehicleColorsNames
function core_vehicle_manager.setVehiclePaintsNames(id, paintNames, optional) end

--- Envoie au véhicule (vehicleObj:spawnPhysics) ses données de physique encodées (vdata + config) ; envoie un paquet vide si le bundle est absent.
---Source : lua/ge/extensions/core/vehicle/manager.lua:81
---@param objID integer|nil véhicule ; nil = joueur 0
---@param vehicleObj userdata|nil objet véhicule (cherché si nil)
---@param vehicleBundle table|nil bundle à envoyer (défaut : celui mémorisé)
function core_vehicle_manager.spawnPhysicsForVehicle(objID, vehicleObj, vehicleBundle) end

--- Inverse le mode debug.
---Source : lua/ge/extensions/core/vehicle/manager.lua:29
function core_vehicle_manager.toggleDebug() end

--- Affiche/masque la fenêtre d'édition en place des véhicules (core_vehicle_inplaceEdit).
---Source : lua/ge/extensions/core/vehicle/manager.lua:315
function core_vehicle_manager.toggleModifyKey() end

