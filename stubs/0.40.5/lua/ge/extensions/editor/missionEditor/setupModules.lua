---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/setupModules.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du panneau. Champs : missionEditor, name = 'SetupModules', mission, missionInstance, blockedSetupModules, ainsi que de nombreux tampons imgui (traffic*, todInput, normalizedTodInput, windSpeedInput, cloudCoverInput, fogDensityInput…).
---@class editor_missionEditor_setupModules
local editor_missionEditor_setupModules = {}

--- Combo de cases à cocher pour les réglages de différentiels d'un véhicule : toggleDifferentials, lockFrontDiffs, lockRearDiffs, setTransfercase (4hi), setRangebox (low), ou tous d'un coup.
---Source : lua/ge/extensions/editor/missionEditor/setupModules.lua:762
---@param veh table Données du véhicule (ou playerVehicleDiffs) modifiées sur place.
function editor_missionEditor_setupModules:displayDiffSetup(veh) end

--- Dessine les trois sections Vehicles, Traffic et Environment avec leurs cases d'activation et champs. Utilise core_environment.getTimeOfDay et getTimeOfDayValueForNormalizedTime pour l'heure actuelle et la conversion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/setupModules.lua:226
function editor_missionEditor_setupModules:draw() end

--- Appelle setMission(m) puis signale les modules mal formés (error), l'heure fixe legacy (minor) et un normalizedTime invalide (error).
---Source : lua/ge/extensions/editor/missionEditor/setupModules.lua:163
---@param m table Mission à vérifier.
---@return table[]  Liste d'éléments {label, severity}.
function editor_missionEditor_setupModules:getMissionIssues(m) end

--- Constructeur : mémorise missionEditor et le nom du panneau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/setupModules.lua:8
---@param missionEditor table Module principal editor_missionEditor.
function editor_missionEditor_setupModules:init(missionEditor) end

--- Copie dans la mission les modules corrigés par l'instance de jeu (ceux marqués _compatibility) et supprime les modules obsolètes playerVehicle et timeOfDay.
---Source : lua/ge/extensions/editor/missionEditor/setupModules.lua:149
function editor_missionEditor_setupModules:setBackwardsCompatibility() end

--- Définit la mission courante, applique la compatibilité ascendante et initialise tous les tampons de saisie depuis mission.setupModules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/missionEditor/setupModules.lua:114
---@param mission table Mission courante.
function editor_missionEditor_setupModules:setMission(mission) end

