---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/drift.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Moteur de détection du drift. Pour chaque véhicule suivi (un état par vehId, le véhicule du joueur 0 est suivi automatiquement), calcule à chaque frame l'angle de dérive, le survirage, la vitesse, la distance aux murs (raycasts avant/arrière), les crashs et spinouts, et décide si le véhicule drifte. Gère les structures driftActiveData (drift en cours) et driftChainActiveData (chaîne de drifts) et émet les hooks onDriftChainStarted, onDriftStatusChanged, onDriftTransition, onDriftActiveDataFinished, onDriftCompleted, onDriftCrash et onDriftSpinout que consomment scoring, display, quickMessages, statistics, etc. C'est le module à lire pour savoir si le joueur drifte et avec quel angle.
--- Accès : extension `gameplay_drift_drift` : `extensions.load("gameplay_drift_drift")`, puis la globale `gameplay_drift_drift`
---@class gameplay_drift_drift
---@field dependencies string[] gameplay_walk, chargé avant.
gameplay_drift_drift = {}

--- Ajoute un véhicule au suivi de drift (crée son état) et renvoie cet état. Avec opts.playerId, associe le véhicule à un joueur et retire tout autre véhicule suivi pour ce même joueur.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:873
---@param vehId integer Id du véhicule (ignoré si nil ou < 0).
---@param opts table|nil {playerId = integer}.
---@return table|nil  État de drift du véhicule.
function gameplay_drift_drift.addTrackedVehicle(vehId, opts) end

--- Indique si le véhicule suivi a des données de map valides.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1000
---@param vehId integer|nil Id du véhicule.
---@return boolean|nil  true si vehData existe.
function gameplay_drift_drift.doesPlHaveVeh(vehId) end

--- Renvoie la vitesse du véhicule en km/h (norme de la vitesse * 3.6).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:920
---@param vehId integer|nil Id du véhicule.
---@return number|nil  Vitesse en km/h.
function gameplay_drift_drift.getAirSpeed(vehId) end

--- Renvoie la variation d'angle de la direction de vitesse depuis la frame précédente (degrés), calculée pendant un drift.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:962
---@param vehId integer|nil Id du véhicule.
---@return number|nil  Variation en degrés.
function gameplay_drift_drift.getAngleDiff(vehId) end

--- Renvoie l'angle de dérive actuel en degrés, signé (le signe donne le côté).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:950
---@param vehId integer|nil Id du véhicule.
---@return number  Angle en degrés.
function gameplay_drift_drift.getCurrDegAngleSigned(vehId) end

--- Renvoie la fraction (0..1) restante du temps de confirmation de la chaîne de drifts (1 = le drift vient d'avoir lieu, 0 = confirmé).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:956
---@param vehId integer|nil Id du véhicule.
---@return number  Fraction du temps restant.
function gameplay_drift_drift.getCurrDriftCompletedTime(vehId) end

--- Renvoie la durée du drift en cours (totalDriftTime), 0 s'il ne drifte pas.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:972
---@param vehId integer|nil Id du véhicule.
---@return number  Durée en secondes.
function gameplay_drift_drift.getCurrentDriftDuration(vehId) end

--- Renvoie la distance parcourue depuis la frame précédente, en mètres.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:967
---@param vehId integer|nil Id du véhicule.
---@return number  Distance en m.
function gameplay_drift_drift.getDistSinceLastFrame(vehId) end

--- Renvoie les données du drift en cours (nil s'il n'y en a pas).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:900
---@param vehId integer|nil Id du véhicule.
---@return table|nil  driftActiveData.
function gameplay_drift_drift.getDriftActiveData(vehId) end

--- Renvoie les données de la chaîne de drifts en cours (nil si aucune).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:905
---@param vehId integer|nil Id du véhicule.
---@return table|nil  driftChainActiveData.
function gameplay_drift_drift.getDriftChainActiveData(vehId) end

--- Renvoie le nombre de drifts enchaînés dans la chaîne en cours.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:910
---@param vehId integer|nil Id du véhicule.
---@return integer  Nombre de drifts, 0 si aucune chaîne.
function gameplay_drift_drift.getDriftChainChainedDrifts(vehId) end

--- Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1017
---@return table  {default = true, canBeChanged = true}
function gameplay_drift_drift.getDriftDebugInfo() end

--- Renvoie la table des réglages de détection : minAngle 7, maxAngle 165, allowDonut, allowTightDrifts, raycastHeight 0.5, wallDetectionLength 3, baseDriftCompleteTime 1.2, failPointsCooldown 1.65, minAirSpeed 4, maxWasDriftingTime 4, crashDamageThreshold 150, etc. Table vivante, modifiable.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1005
---@return table  driftOptions.
function gameplay_drift_drift.getDriftOptions() end

--- Renvoie la quantité de garbage mesurée par le profileur.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1013
---@return number|nil  nil tant que le debug général n'a jamais été actif.
function gameplay_drift_drift.getGC() end

--- Indique si le véhicule est en train de crasher (gameplay_util_crashDetection).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:995
---@param vehId integer|nil Id du véhicule.
---@return boolean  État de crash.
function gameplay_drift_drift.getIsCrashing(vehId) end

--- Indique si le véhicule est en train de drifter.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:915
---@param vehId integer|nil Id du véhicule.
---@return boolean  État de drift.
function gameplay_drift_drift.getIsDrifting(vehId) end

--- Indique si le véhicule n'est pas sur ses roues.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:990
---@param vehId integer|nil Id du véhicule.
---@return boolean  true en l'air.
function gameplay_drift_drift.getIsInTheAir(vehId) end

--- Indique si la vitesse moyenne des points de référence dépasse minAirSpeed (4 km/h).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:985
---@param vehId integer|nil Id du véhicule.
---@return boolean  true si assez rapide.
function gameplay_drift_drift.getIsOverMinSpeedForDrift(vehId) end

--- Indique si le véhicule est en survirage (avant et centre vont dans le même sens que l'arrière).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:980
---@param vehId integer|nil Id du véhicule.
---@return boolean  État de survirage.
function gameplay_drift_drift.getIsOverSteering(vehId) end

--- Renvoie l'objet véhicule principal suivi.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:935
---@return userdata|nil  Objet véhicule de la scène.
function gameplay_drift_drift.getPlVeh() end

--- Renvoie l'id de joueur associé à un véhicule suivi.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:859
---@param vehId integer Id du véhicule.
---@return integer  playerId, 0 si inconnu.
function gameplay_drift_drift.getPlayerIdForVehicle(vehId) end

--- Renvoie la table des états de drift, indexée par vehId (table vivante).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:896
---@return table<integer, table>  États de drift.
function gameplay_drift_drift.getTrackedVehicles() end

--- Renvoie les 4 coins de la boîte englobante utilisée pour les raycasts (avant droit, arrière droit, arrière gauche, avant gauche), à hauteur raycastHeight.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1009
---@return vec3[]  {corner_FR, corner_BR, corner_BL, corner_FL}
function gameplay_drift_drift.getVehCorners() end

--- Renvoie les données de map.objects du véhicule (pos, vel, dirVec, ...).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:940
---@param vehId integer|nil Id du véhicule.
---@return table|nil  Entrée map.objects.
function gameplay_drift_drift.getVehData(vehId) end

--- Renvoie l'id du véhicule principal suivi (joueur 0 si possible).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:930
---@return integer|nil  Id du véhicule.
function gameplay_drift_drift.getVehId() end

--- Renvoie la position du véhicule suivie par le module.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:925
---@param vehId integer|nil Id du véhicule.
---@return vec3|nil  Position (vec3 partagé, à ne pas modifier).
function gameplay_drift_drift.getVehPos(vehId) end

--- Renvoie la direction normalisée de la vitesse du véhicule (velDir), pas son module.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:945
---@param vehId integer|nil Id du véhicule.
---@return vec3|nil  Direction unitaire de la vitesse.
function gameplay_drift_drift.getVehVel(vehId) end

--- Hook : une zone de cascade est réussie ; remet le temps de confirmation de la chaîne de drifts au maximum.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1080
function gameplay_drift_drift.onAnyStuntZoneAccomplished() end

--- Hook : fin de niveau ; vide la liste des véhicules suivis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1076
function gameplay_drift_drift.onClientEndMission() end

--- Hook : restaure la case de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1151
---@param data table Table de onSerialize.
function gameplay_drift_drift.onDeserialized(data) end

--- Hook : fin d'un défi de drift ; émet onDriftCompleted pour les chaînes en cours et onDriftActiveDataFinished pour les drifts en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1103
function gameplay_drift_drift.onDriftChallengeFinished() end

--- Hook : à un changement de contexte, ajoute les véhicules au suivi de crash (sauf en inAnotherMissionType, où ils en sont retirés).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1087
---@param context string Nouveau contexte.
---@param oldContext string|nil Ancien contexte.
function gameplay_drift_drift.onDriftContextChanged(context, oldContext) end

--- Hook : véhicule remis en place ; réinitialise son état et active un timer de reset de 0.1 s pendant lequel il ne drifte pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1130
---@param vehId integer|nil Véhicule ; nil pour tous.
function gameplay_drift_drift.onDriftPlVehReset(vehId) end

--- Hook : sauvegarde la case de debug avant rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1145
---@return table  {debugToggleSmothnessGraph}
function gameplay_drift_drift.onSerialize() end

--- Appelé à chaque frame : suit automatiquement le véhicule du joueur 0 si rien n'est suivi, puis met à jour la détection pour chaque véhicule suivi. Sauté pendant firstDrive, la marche, la pause ou dtSim <= 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:807
---@param dtReal number Delta temps réel (inutilisé).
---@param _dtSim number Delta temps simulé.
---@param dtRaw number Delta temps brut (inutilisé).
function gameplay_drift_drift.onUpdate(dtReal, _dtSim, dtRaw) end

--- Hook : début de crash détecté par gameplay_util_crashDetection ; marque le véhicule comme crashé si son score en cache est > 0 (hors pause, gel, marche).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1117
---@param crashStartData table Contient vehId.
function gameplay_drift_drift.onVehicleCrashStarted(crashStartData) end

--- Hook : retire le véhicule détruit du suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1072
---@param vehId integer Véhicule détruit.
function gameplay_drift_drift.onVehicleDestroyed(vehId) end

--- Hook : changement de véhicule d'un joueur ; retire l'ancien véhicule s'il appartenait à ce joueur et suit le nouveau (timer de reset 0.1 s).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1056
---@param oldId integer Ancien véhicule (-1 si aucun).
---@param newVehId integer Nouveau véhicule.
---@param player integer|nil Index du joueur (0 par défaut).
function gameplay_drift_drift.onVehicleSwitched(oldId, newVehId, player) end

--- Retire un véhicule du suivi de drift et du suivi de crash (gameplay_util_crashDetection).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:864
---@param vehId integer Id du véhicule.
function gameplay_drift_drift.removeTrackedVehicle(vehId) end

--- Réinitialise l'état de drift d'un véhicule (ou de tous si vehId est nil) : supprime drift/chaîne en cours, remet à zéro les données de crash.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1045
---@param vehId integer|nil Véhicule ; nil pour tous.
function gameplay_drift_drift.reset(vehId) end

--- Active/désactive la prise en compte des donuts (driftOptions.allowDonut), lue par les zones de cascade.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1021
---@param value boolean true pour autoriser.
function gameplay_drift_drift.setAllowDonut(value) end

--- Active/désactive les drifts serrés (driftOptions.allowTightDrifts).
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1025
---@param value boolean true pour autoriser.
function gameplay_drift_drift.setAllowTightDrift(value) end

--- Active le mode « équilibre » : tant qu'il est actif le temps de confirmation reste figé à 1 et la chaîne de drifts n'est pas conclue.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1038
---@param _balanceMode boolean true pour activer.
---@param vehId integer|nil Id du véhicule.
function gameplay_drift_drift.setBalanceMode(_balanceMode, vehId) end

--- Ne suit plus que ce véhicule : retire tous les autres véhicules suivis puis l'ajoute.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:1029
---@param newVehId integer Id du véhicule à suivre.
function gameplay_drift_drift.setVehId(newVehId) end

--- Active une simulation de drift pour le debug audio ; nil l'arrête.
---Source : lua/ge/extensions/gameplay/drift/drift.lua:855
---@param data table|nil {currDegAngle, airSpeed, wallDistance, isCrashing}.
function gameplay_drift_drift.simulateADrift(data) end

