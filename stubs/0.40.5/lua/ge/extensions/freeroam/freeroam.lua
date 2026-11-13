---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/freeroam.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode de jeu « freeroam » (balade libre) : démarre un niveau en freeroam, applique les options de spawn (trafic, véhicules garés, heure du jour, date, écoulement du temps), lance les flowgraphs associés au niveau, gère la remise à zéro du joueur et les messages de radars. Un moddeur l'utilise pour lancer un niveau (startFreeroam / startFreeroamByName) ou pour préconfigurer le trafic et l'heure via spawningOptionsHelper avant le lancement. Global : freeroam_freeroam.
--- Accès : extension `freeroam_freeroam` : `extensions.load("freeroam_freeroam")`, puis la globale `freeroam_freeroam`
---@class freeroam_freeroam
---@field dependencies string[] {'core_environment'}
---@field spawningOptionsHelper table Options de lancement : trafficMode ('fromSetting'|'disabled'|'enabled'), trafficAmount (-1 auto, 0 aucun, N), trafficPolice ('disabled'|'enabled'), trafficParked ('disabled'|'enabled'), trafficParkedAmount (-1 auto), timeOfDay ('default'|'current'|'currentUtc'|clé du niveau|nombre 0..1), date (secondes epoch Unix), timePlay ('disabled'|'level'|'fast'|'normal'|'slow'|'realtime'), resetOptionsAfterStartingFreeroam (boolean).
freeroam_freeroam = {}

--- Hook de fin de niveau : désactive freeroamActive, retire l'action map ExplorationCheckpointsActionMap et décharge mainLevel si chargé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:301
---@param levelPath string Chemin du niveau.
function freeroam_freeroam.onClientEndMission(levelPath) end

--- Hook après le démarrage : applique date, heure du jour et écoulement du temps demandés dans spawningOptionsHelper, les remet par défaut, puis lance les flowgraphs associés au niveau (sauf scénario actif).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:224
---@param levelPath string Chemin du niveau.
function freeroam_freeroam.onClientPostStartMission(levelPath) end

--- Hook avant le démarrage du niveau : charge à la racine le fichier `mainLevel.lua` du dossier du niveau s'il existe et appelle son onClientPreStartMission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:187
---@param levelPath string Chemin du niveau.
function freeroam_freeroam.onClientPreStartMission(levelPath) end

--- Hook au démarrage du niveau : si freeroam actif, émet onFreeroamLoaded(levelPath) et pousse l'action map ExplorationCheckpointsActionMap si elle existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:197
---@param levelPath string Chemin du niveau.
function freeroam_freeroam.onClientStartMission(levelPath) end

--- Hook appelé quand la caméra joueur est prête : si le freeroam est actif, décide du trafic et des véhicules garés d'après spawningOptionsHelper et du réglage trafficParkedVehicles, puis appelle gameplay_traffic.setupTrafficHelper. Ne fait rien si le niveau ne supporte pas le trafic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:118
function freeroam_freeroam.onPlayerCameraReady() end

--- Hook de radar de feu rouge : en freeroam pour le véhicule joueur, affiche un message avec la plaque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:393
---@param speedTrapData table Données du radar.
---@param playerSpeed number Vitesse (non utilisée).
function freeroam_freeroam.onRedLightCamTriggered(speedTrapData, playerSpeed) end

--- Hook de remise à zéro du joueur : ignoré en scénario, campagne, invite de récupération, flowgraph bloquant ou session multijoueur ; sinon spawn.safeReset si le réglage enableSmartRecovery est actif, sinon be:resetVehicle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:324
---@param playerID integer Joueur (-1 = aucun véhicule).
function freeroam_freeroam.onResetGameplay(playerID) end

--- Hook de radar : en freeroam, si le sujet est le véhicule joueur, enregistre le record dans gameplay_speedTrapLeaderboards et affiche les messages de vitesse et de record (ui_message).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:370
---@param speedTrapData table Données du radar (speedLimit, subjectID…).
---@param playerSpeed number Vitesse enregistrée (m/s, déduit du code).
---@param overSpeed number|boolean Dépassement (déduit du code).
function freeroam_freeroam.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed) end

--- Hook appelé quand trafic/véhicules garés sont prêts : retire l'écran de chargement « traffic ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:181
function freeroam_freeroam.onTrafficOrParkingReady() end

--- Hook par frame : tant que worldReadyState vaut 0, initialise la caméra (commands.initCamera) et passe en caméra libre s'il n'y a pas de véhicule joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:354
---@param dtReal number Durée réelle (s).
---@param dtSim number Durée simulée (s).
---@param dtRaw number Durée brute (s).
function freeroam_freeroam.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook d'apparition de véhicule : réinitialise les surbrillances de parts et appelle core_vehicle_partmgmt.setNewParts.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:319
---@param vehID integer Id du véhicule.
function freeroam_freeroam.onVehicleSpawned(vehID) end

--- Hook de changement de véhicule : efface les surbrillances de parts de l'ancien véhicule (core_vehicle_partmgmt.clearVehicleHighlights).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/freeroam.lua:315
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
---@param player integer Joueur (non utilisé).
function freeroam_freeroam.onVehicleSwitched(oldId, newId, player) end

--- Remet spawningOptionsHelper à ses valeurs par défaut (copie profonde de l'état initial).
---Source : lua/ge/extensions/freeroam/freeroam.lua:31
function freeroam_freeroam.resetSpawningOptions() end

--- Démarre le freeroam sur un niveau : affiche l'écran de chargement, décharge les extensions automatiques, charge les extensions de preset, vide le filtre d'actions, puis core_levels.startLevel. Si un niveau est déjà chargé, attend sa fin.
---Source : lua/ge/extensions/freeroam/freeroam.lua:83
---@param level table|string Table niveau (levelName, misFilePath) ou chemin du fichier du niveau.
---@param startPointName string|nil Nom du point de départ (utilisé seulement si level est une table, via setSpawnpoint.setDefaultSP).
---@param wasDelayed boolean|nil Vrai quand l'appel vient d'un démarrage différé (non utilisé dans le corps actif).
---@param spawnVehicle boolean|nil false = ne pas faire apparaître de véhicule (efface les variables $beamngVehicle*).
---@param customLoadingFunction function|nil Fonction de chargement personnalisée transmise à core_levels.startLevel.
function freeroam_freeroam.startFreeroam(level, startPointName, wasDelayed, spawnVehicle, customLoadingFunction) end

--- Retrouve le niveau par nom (core_levels.getLevelByName) et appelle startFreeroam.
---Source : lua/ge/extensions/freeroam/freeroam.lua:109
---@param levelName string Nom du niveau.
---@param startPointName string|nil Point de départ.
---@param wasDelayed boolean|nil Voir startFreeroam.
---@param spawnVehicle boolean|nil Voir startFreeroam.
---@param customLoadingFunction function|nil Voir startFreeroam.
---@return boolean  true si le niveau existe.
function freeroam_freeroam.startFreeroamByName(levelName, startPointName, wasDelayed, spawnVehicle, customLoadingFunction) end

--- Charge l'extension trackbuilder_trackBuilder et appelle son enter(levelName, forceLoad).
---Source : lua/ge/extensions/freeroam/freeroam.lua:343
---@param levelName string Niveau.
---@param forceLoad boolean|nil Forcer le chargement.
function freeroam_freeroam.startTrackBuilder(levelName, forceLoad) end

