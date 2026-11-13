---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de debug « Vehicle > Cargo Containers ». Interroge tous les véhicules actifs (core_vehicleBridge.requestValue 'getCargoContainers'), affiche leurs conteneurs de cargaison (volume, densité, capacité, cluster de nœuds) et permet d'y envoyer volume/densité ou de les remplir à un débit réglable (flow rate). Peut être ouvert hors carrière.
--- Accès : extension `career_modules_debug_cargoContainerDebug` : `extensions.load("career_modules_debug_cargoContainerDebug")`, puis la globale `career_modules_debug_cargoContainerDebug`
---@class career_modules_debug_cargoContainerDebug
---@field debugName string 'Vehicle > Cargo Containers'.
---@field debugOrder number Ordre de tri dans la fenêtre de debug (11).
---@field vehCargoData table[] Liste, triée par vehId, des véhicules avec leurs conteneurs : {vehId, name, containers, vehPos, clusterGeneration…}.
career_modules_debug_cargoContainerDebug = {}

--- Dessine la fenêtre 'Cargo Container Debug' : bouton de rafraîchissement, flow rate, et pour chaque véhicule updateVehicle puis drawVehicle (supprime ceux qui n'existent plus).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:320
---@param dt number Delta de temps.
function career_modules_debug_cargoContainerDebug.drawDebugMenu(dt) end

--- Dessine les curseurs Flow Rate (0..1) et Max Fill Rate (L/s), la case d'actionMap 'Refueling', et applique le remplissage aux conteneurs marqués.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:279
---@param dt number Delta de temps en secondes.
function career_modules_debug_cargoContainerDebug.drawFlowRate(dt) end

--- Dessine en ImGui le tableau d'un véhicule et de ses conteneurs avec champs de saisie volume/densité et case de remplissage au débit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:101
---@param data table Entrée de vehCargoData.
function career_modules_debug_cargoContainerDebug.drawVehicle(data) end

--- Demande à chaque véhicule actif la liste de ses conteneurs et remplit M.vehCargoData quand tous ont répondu (asynchrone). Renvoie une table vide si core_vehicleBridge est absent.
---Source : lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:19
---@return table|nil  {} si core_vehicleBridge est absent, sinon rien.
function career_modules_debug_cargoContainerDebug.getData() end

--- Hook (ex. action d'entrée) qui fixe le flow rate, borné à [0, 1].
---Source : lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:315
---@param factor number Nouveau facteur de débit.
function career_modules_debug_cargoContainerDebug.onChangeFlowRate(factor) end

--- Hook : même traitement que onVehicleDestroyed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:364
---@param id integer Id du véhicule.
function career_modules_debug_cargoContainerDebug.onInstabilityDetected(id) end

--- Hook : retire les données du véhicule détruit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:364
---@param id integer Id du véhicule.
function career_modules_debug_cargoContainerDebug.onVehicleDestroyed(id) end

--- Hook : retire les données du véhicule réinitialisé et force un nouveau getData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:357
---@param id integer Id du véhicule.
function career_modules_debug_cargoContainerDebug.onVehicleResetted(id) end

--- Ouvre l'outil hors carrière : branche drawDebugMenu sur onUpdate (hookUpdate) et lance getData.
---Source : lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:351
function career_modules_debug_cargoContainerDebug.show() end

--- Rafraîchit les données d'un véhicule : cluster de nœuds (si la génération a changé), position du véhicule et de chaque conteneur. Renvoie false si le véhicule n'existe plus.
---Source : lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua:75
---@param data table Entrée de vehCargoData.
---@return boolean  false si le véhicule est introuvable.
function career_modules_debug_cargoContainerDebug.updateVehicle(data) end

