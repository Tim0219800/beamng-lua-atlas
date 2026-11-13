---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/crashDetection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détecteur de collisions (« crashes ») pour des véhicules suivis. Il compare à chaque image les dégâts du véhicule (map.objects[id].damage et somme des dégâts de sections) à un seuil qui baisse quand la secousse (jerk d'accélération avant/arrière) augmente, regroupe les impacts proches en un crash, puis émet des hooks. Un moddeur ajoute un véhicule avec addTrackedVehicleById() et écoute onVehicleCrashStarted / onVehicleCrashEnded (utilisé notamment par les missions et le gameplay de dégâts). Dépend de gameplay_util_damageAssessment pour décrire les zones endommagées.
--- Accès : extension `gameplay_util_crashDetection` : `extensions.load("gameplay_util_crashDetection")`, puis la globale `gameplay_util_crashDetection`
---@class gameplay_util_crashDetection
---@field dependencies string[] {"gameplay_util_damageAssessment"}
gameplay_util_crashDetection = {}

--- Commence à suivre un véhicule pour détecter ses crashes, avec des réglages de sensibilité optionnels.
---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:633
---@param vehId_ integer Id du véhicule.
---@param crashSettings table|nil minAccel, maxAccel, minDamage, maxDamage, verticallyUnweighted, minVelocity (m/s), groupImpactsDist (m), enableImpactLocationData.
---@param owner string|nil Nom de l'appelant, pour le debug (« unknown » par défaut).
function gameplay_util_crashDetection.addTrackedVehicleById(vehId_, crashSettings, owner) end

--- Indique si un véhicule suivi est actuellement en crash.
---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:728
---@param vehId integer Id du véhicule.
---@return boolean  false si non suivi.
function gameplay_util_crashDetection.isVehCrashing(vehId) end

--- Indique si le véhicule est dans la liste de suivi.
---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:733
---@param vehId integer Id du véhicule.
---@return boolean
function gameplay_util_crashDetection.isVehTracked(vehId) end

--- Hook appelé après rechargement : restaure l'état sérialisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:745
---@param data table Table renvoyée par onSerialize.
function gameplay_util_crashDetection.onDeserialized(data) end

--- Hook appelé lors du rechargement des extensions Lua : renvoie l'état (véhicules suivis, debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:737
---@return table  {trackedVehIds, debug, debugDamageAssessmentUIPtr}
function gameplay_util_crashDetection.onSerialize() end

--- Hook appelé à chaque image : met à jour accélérations, détection d'impacts, fin de pré-impact/impact/crash pour chaque véhicule suivi ; supprime ceux qui n'existent plus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:599
---@param dtReal number Delta temps réel (s), inutilisé.
---@param _dtSim number Delta temps simulé (s).
function gameplay_util_crashDetection.onUpdate(dtReal, _dtSim) end

--- Hook appelé à la destruction d'un véhicule : le retire du suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:751
---@param vehId integer Id du véhicule détruit.
function gameplay_util_crashDetection.onVehicleDestroyed(vehId) end

--- Arrête de suivre un véhicule.
---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:718
---@param vehId integer Id du véhicule.
function gameplay_util_crashDetection.removeTrackedVehicleById(vehId) end

--- Réinitialise les données de crash, d'impact en cours et de pré-impact d'un véhicule suivi (sans le retirer).
---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:73
---@param vehId integer Id du véhicule.
function gameplay_util_crashDetection.resetCrashData(vehId) end

--- Active ou désactive le dessin de debug et la fenêtre ImGui.
---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:724
---@param _debug boolean true pour activer.
function gameplay_util_crashDetection.setDebug(_debug) end

