---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/sounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pont entre le jeu et le moteur audio FMOD côté GE. Chaque rendu (onPreRender), il pousse des paramètres globaux (vitesse et rotation de caméra, heure du jour, vent, vitesse du véhicule joueur, caméra intérieure, sous l'eau, hauteur au sol et à la mer, flou audio). Il fournit aussi des fonctions pour initialiser et piloter les sons moteur/échappement d'un véhicule, et gère le flou audio quand un menu de mission est ouvert.
--- Accès : extension `core_sounds` : `extensions.load("core_sounds")`, puis la globale `core_sounds`
---@class core_sounds
---@field cabinFilterStrength number Force du filtre/réverbération d'habitacle (0 à 1, borné à l'envoi) pour la caméra intérieure du véhicule joueur. Défaut 1. Écrit par setCabinFilterStrength.
---@field dependencies string[] core_camera, core_settings_settings, core_input_bindings.
core_sounds = {}

--- Initialise le son moteur d'un véhicule : vehicle:engineSoundInit puis fixe wet_level = 0 et dry_level = 1. Ne fait rien si le véhicule n'existe pas.
---Source : lua/ge/extensions/core/sounds.lua:95
---@param vehicleId integer Id de l'objet véhicule.
---@param engineId integer Identifiant du moteur (déduit du code).
---@param jsonPath string Chemin du fichier de description du son.
---@param nodeIdArray integer|integer[] Noeud(s) d'émission ; un nombre seul est mis en tableau.
---@param noloadVol number|nil Volume sans charge, 1 par défaut.
---@param loadVol number|nil Volume en charge, 1 par défaut.
function core_sounds.initEngineSound(vehicleId, engineId, jsonPath, nodeIdArray, noloadVol, loadVol) end

--- Comme initEngineSound mais pour l'échappement, avec des paires de noeuds. Appelle aussi vehicle:engineSoundInit (même appel moteur).
---Source : lua/ge/extensions/core/sounds.lua:106
---@param vehicleId integer Id du véhicule.
---@param engineId integer Identifiant du moteur.
---@param jsonPath string Chemin du fichier de son.
---@param nodeIdPairArray table|integer Tableau de paires de noeuds ; un nombre seul devient {{n, n}}.
---@param noloadVol number|nil Volume sans charge, 1 par défaut.
---@param loadVol number|nil Volume en charge, 1 par défaut.
function core_sounds.initExhaustSound(vehicleId, engineId, jsonPath, nodeIdPairArray, noloadVol, loadVol) end

--- Hook appelé quand une activité collecte ses données d'acceptation. Mémorise si l'un des éléments est de type "mission".
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/sounds.lua:202
---@param elemData table[] Liste d'éléments avec un champ type.
---@param activityData any Non utilisé (log seulement).
function core_sounds.onActivityAcceptGatherData(elemData, activityData) end

--- Hook appelé après rechargement des extensions Lua : relance sounds.updateCabinFilter() sur tous les véhicules pour restaurer cabinFilterStrength.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/sounds.lua:232
---@param data any Non utilisé.
function core_sounds.onDeserialized(data) end

--- Hook : si data.missionCount vaut 0, désactive l'interaction mission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/sounds.lua:214
---@param data table|nil Table avec missionCount.
function core_sounds.onMissionAvailabilityChanged(data) end

--- Hook appelé quand la fenêtre d'info mission change d'état : passe à 'opened' active l'interaction ; 'opened' vers 'closed' la désactive et remet le flou à 0. Sans effet si aucun marqueur de mission actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/sounds.lua:186
---@param fromState string Ancien état.
---@param toState string Nouvel état.
---@param content any Non utilisé.
function core_sounds.onMissionInfoChangedState(fromState, toState, content) end

--- Hook de rendu. Met à jour les paramètres globaux FMOD (Engine.Audio.getGlobalParams) si disponibles. Voir notes pour la liste des paramètres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/sounds.lua:32
---@param dtReal number Durée réelle de l'image (s).
---@param dtSim number Durée simulée (s) ; si 0, les vitesses de caméra ne sont pas mises à jour.
---@param dtRaw number Durée brute (non utilisée).
function core_sounds.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook appelé quand les réglages changent : relit AudioInsideModifier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/sounds.lua:143
function core_sounds.onSettingsChanged() end

--- Hook appelé quand l'état de l'UI change. Si un marqueur de mission est actif, gère gameAudioBlurValue : 1 tant qu'on interagit avec l'UI mission, remis à 0 pour les transitions vers play (depuis scenario.start, menu, fadeScreen, blank) ou vers scenario.end.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/sounds.lua:147
---@param toState string Nouvel état UI.
---@param fromState string Ancien état UI.
function core_sounds.onUiChangedState(toState, fromState) end

--- Hook : quand le véhicule du joueur 0 change, exécute sounds.updateCabinFilter() dans la VM du nouveau véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/sounds.lua:225
---@param oldId integer Ancien id.
---@param newId integer Nouvel id.
---@param player integer Index du joueur ; ignoré si différent de 0.
function core_sounds.onVehicleSwitched(oldId, newId, player) end

--- Fixe manuellement la valeur du flou audio global (paramètre g_GameAudioBlur).
---Source : lua/ge/extensions/core/sounds.lua:255
---@param value number 0 = pas de flou, 1 = flou maximal (déduit du code).
function core_sounds.setAudioBlur(value) end

--- Fixe cabinFilterStrength, mais seulement si objId est le véhicule joueur 0. Appelé typiquement depuis la VM véhicule.
---Source : lua/ge/extensions/core/sounds.lua:220
---@param objId integer Id du véhicule émetteur.
---@param value number Force 0 à 1.
function core_sounds.setCabinFilterStrength(objId, value) end

--- Fixe un paramètre du son moteur (vehicle:engineSoundParameter).
---Source : lua/ge/extensions/core/sounds.lua:124
---@param vehicleId integer Id du véhicule.
---@param engineId integer Identifiant du moteur.
---@param paramName string Nom du paramètre.
---@param paramValue number Valeur.
function core_sounds.setEngineSoundParameter(vehicleId, engineId, paramName, paramValue) end

--- Fixe plusieurs paramètres du son moteur d'un coup.
---Source : lua/ge/extensions/core/sounds.lua:130
---@param vehicleId integer Id du véhicule.
---@param engineId integer Identifiant du moteur.
---@param parameters table<string, number> Nom -> valeur (déduit du code).
function core_sounds.setEngineSoundParameterList(vehicleId, engineId, parameters) end

--- Change les noeuds d'émission du son d'échappement (vehicle:engineSoundNodes).
---Source : lua/ge/extensions/core/sounds.lua:136
---@param vehicleId integer Id du véhicule.
---@param engineId integer Identifiant du moteur.
---@param nodeIdPairArray table Tableau de paires de noeuds.
function core_sounds.setExhaustSoundNodes(vehicleId, engineId, nodeIdPairArray) end

--- Met à jour le son moteur (vehicle:engineSoundUpdate).
---Source : lua/ge/extensions/core/sounds.lua:118
---@param vehicleId integer Id du véhicule.
---@param engineId integer Identifiant du moteur.
---@param rpm number Régime moteur.
---@param onLoad number Charge moteur (déduit du code).
---@param engineVolume number Volume moteur.
function core_sounds.updateEngineSound(vehicleId, engineId, rpm, onLoad, engineVolume) end

