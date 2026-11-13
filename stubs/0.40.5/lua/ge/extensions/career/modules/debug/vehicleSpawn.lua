---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/vehicleSpawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de debug « Vehicle Spawn » : ajoute un marqueur de point d'intérêt au parking 'debugParking' de west_coast_usa (facilities.sites.json) dont la fenêtre de détail propose de faire apparaître un véhicule ou une remorque 'loués' (sunburst/race_M, boxutility/loaded_200), éventuellement ajoutés à l'inventaire (owned = false). spawnVehicle enchaîne fondu au noir, spawn, initPartConditions, attente puis fondu retour via util_stepHandler.
--- Accès : extension `career_modules_debug_vehicleSpawn` : `extensions.load("career_modules_debug_vehicleSpawn")`, puis la globale `career_modules_debug_vehicleSpawn`
---@class career_modules_debug_vehicleSpawn
---@field debugName string 'Vehicle Spawn'.
---@field debugOrder number Ordre de tri (12).
---@field dependencies string[] {"gameplay_sites_sitesManager"}.
career_modules_debug_vehicleSpawn = {}

--- Exécute buttonOptions[i]() ; cette table n'est jamais remplie dans le module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:81
---@param i integer Index du bouton.
function career_modules_debug_vehicleSpawn.buttonPressed(i) end

--- À la première frame charge les sites de west_coast_usa et récupère 'debugParking' ; dessine la fenêtre 'Vehicle Spawn' avec un bouton 'Spawn and rent a vehicle' (sunburst/race_M, ajouté à l'inventaire).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:30
function career_modules_debug_vehicleSpawn.drawDebugMenu() end

--- Hook de la liste de POI : si le parking 'debugParking' est chargé, ajoute un élément 'debugVehicleSpawn' avec un marqueur de parking (path, pos, rot, scl).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:15
---@param levelIdentifier string Identifiant du niveau.
---@param elements table[] Liste de POI à compléter.
function career_modules_debug_vehicleSpawn.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook : si l'élément est 'debugVehicleSpawn', ajoute à promptData un bouton 'Open Debug Menu' qui affiche un dialogue (guihooks 'showConfirmationDialog') avec trois choix de spawn.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:85
---@param elemData table[] Éléments POI concernés.
---@param promptData table[] Liste de boutons du prompt à compléter.
function career_modules_debug_vehicleSpawn.onPoiDetailPromptOpening(elemData, promptData) end

--- Fait apparaître un véhicule avec fondu au noir, initialise ses part conditions, attend la réponse du véhicule (ping) puis fait le fondu retour ; si addToInventory est vrai, l'ajoute à l'inventaire avec owned = false.
---Source : lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:48
---@param model string Modèle JBeam (ex. 'sunburst').
---@param config string Nom de configuration (ex. 'race_M').
---@param addToInventory boolean|nil Ajoute le véhicule à l'inventaire (non possédé).
function career_modules_debug_vehicleSpawn.spawnVehicle(model, config, addToInventory) end

