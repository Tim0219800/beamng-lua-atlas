---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recceApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Application « Recce » du rallye en freeroam : permet de charger une mission de rallye (rallyStage, rallyStageLoop ou rallyRoadSection du niveau courant), d'afficher les pacenotes à venir, de téléporter le véhicule le long des pacenotes, au départ ou au déclencheur de mission, et d'enregistrer une reconnaissance (driveline du véhicule et « cuts » vocaux). Fournit aussi une fenêtre imgui « Recce Toolbox » dessinée dans onUpdate. S'appuie sur gameplay_rally (loadMission, getRallyManager, canManageMission), RecceSettings, VehicleCapture et CutCapture. Ne fait rien dans onUpdate tant que setEnabled(true) n'a pas été appelé.
--- Accès : extension `gameplay_rally_recceApp` : `extensions.load("gameplay_rally_recceApp")`, puis la globale `gameplay_rally_recceApp`
---@class gameplay_rally_recceApp
gameplay_rally_recceApp = {}

--- Ferme la fenêtre imgui (sans désactiver l'application).
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:522
function gameplay_rally_recceApp.closeWindow() end

--- Indique si l'application est activée.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:80
---@return boolean  état activé
function gameplay_rally_recceApp.isEnabled() end

--- Indique si un enregistrement de driveline est en cours.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:764
---@return boolean  true pendant l'enregistrement
function gameplay_rally_recceApp.isRecording() end

--- Indique si la fenêtre imgui est ouverte.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:770
---@return boolean  true si ouverte
function gameplay_rally_recceApp.isWindowVisible() end

--- Charge une mission via gameplay_rally.loadMission (propriétaire 'recce'), construit l'index kd-tree des départs de virage du notebook, mémorise la mission et l'état de chargement, puis envoie rally.recceApp.missionLoaded.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:113
---@param missionId string Identifiant de la mission
---@param missionDir string Dossier de la mission
---@return boolean  true si la mission est chargée
---@return string|nil  Message d'erreur en cas d'échec
function gameplay_rally_recceApp.loadMission(missionId, missionDir) end

--- Téléporte le véhicule joueur vers la pacenote précédente (ou la plus proche si loin de toute pacenote), puis resynchronise le rally manager.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:301
function gameplay_rally_recceApp.moveVehicleBackward() end

--- Téléporte le véhicule joueur vers la pacenote suivante (ou la plus proche si loin de toute pacenote), puis resynchronise le rally manager.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:297
function gameplay_rally_recceApp.moveVehicleForward() end

--- Téléporte le véhicule joueur sur le déclencheur de départ de la mission (pos, rot), puis resynchronise le rally manager.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:305
function gameplay_rally_recceApp.moveVehicleToMission() end

--- Téléporte le véhicule joueur à la position de départ par défaut du chemin de course (orientation retournée de 180°), puis resynchronise le rally manager.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:212
function gameplay_rally_recceApp.moveVehicleToStart() end

--- Hook d'extension appelé à chaque frame : si l'application est activée, dessine les pacenotes (ou la route courte), la fenêtre imgui si ouverte, et capture la position du véhicule pendant l'enregistrement de driveline.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:329
---@param dtReal number Temps réel écoulé (s)
---@param dtSim number Temps de simulation écoulé (s)
---@param dtRaw number Temps brut écoulé (s)
function gameplay_rally_recceApp.onUpdate(dtReal, dtSim, dtRaw) end

--- Active l'application, ouvre la fenêtre imgui « Recce Toolbox » et rafraîchit la liste des missions.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:516
function gameplay_rally_recceApp.openWindow() end

--- Efface les fichiers d'enregistrement de la mission : driveline, cuts et transcripts (troncature des fichiers).
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:397
function gameplay_rally_recceApp.recordDrivelineClearAll() end

--- Enregistre un cut à la position actuelle du véhicule (CutCapture) et, si l'enregistrement vocal est activé, demande la transcription au client rally.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:354
function gameplay_rally_recceApp.recordDrivelineCut() end

--- Démarre l'enregistrement de la driveline : initialise les captures (dossiers de recce créés si besoin) et active la capture à chaque frame.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:372
---@param recordVoice boolean true pour aussi transcrire la voix à chaque cut
function gameplay_rally_recceApp.recordDrivelineStart(recordVoice) end

--- Arrête l'enregistrement : écrit les captures du véhicule sur disque puis oublie les captures.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:382
function gameplay_rally_recceApp.recordDrivelineStop() end

--- Désactive l'application, ferme la fenêtre, oublie les captures et décharge la mission si elle appartient à 'recce'.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:178
function gameplay_rally_recceApp.release() end

--- Recharge les réglages RecceSettings, reconstruit la liste des missions de rallye du niveau et envoie le hook UI rally.recceApp.refreshed avec {missions, last_mission_id, last_load_state, can_auto_load, corner_angles_style}.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:492
---@param rallyExt any Non utilisé dans le corps de la fonction
function gameplay_rally_recceApp.reload(rallyExt) end

--- Active ou désactive l'application ; onUpdate ne fait rien si elle est désactivée.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:76
---@param val boolean true pour activer
function gameplay_rally_recceApp.setEnabled(val) end

--- Mémorise dans les réglages le dernier état de chargement (true/false) pour le niveau courant.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:107
---@param state boolean true si une mission était chargée
function gameplay_rally_recceApp.setLastLoadState(state) end

--- Mémorise dans les réglages le dernier id de mission pour le niveau courant.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:101
---@param mid string Identifiant de mission
function gameplay_rally_recceApp.setLastMissionId(mid) end

--- Active ou désactive l'affichage des prochaines pacenotes pendant la conduite (hors éditeur actif et hors boîte à outils rally visible).
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:342
---@param val boolean true pour afficher
function gameplay_rally_recceApp.setShowNotes(val) end

--- Bascule le mode debug de gameplay_rally (gameplay_rally.toggleDebug).
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:416
function gameplay_rally_recceApp.toggleDebug() end

--- Bascule la case de déplacement du véhicule à la souris de la boîte à outils rally, si elle existe.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:633
function gameplay_rally_recceApp.toggleMouseLikeVehicle() end

--- Ouvre la fenêtre si elle est fermée, la ferme sinon.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:526
function gameplay_rally_recceApp.toggleWindow() end

--- Décharge la mission du propriétaire 'recce' et mémorise l'état de chargement à false.
---Source : lua/ge/extensions/gameplay/rally/recceApp.lua:167
---@return boolean  false si le déchargement est refusé
---@return string|nil  Message d'erreur en cas de refus
function gameplay_rally_recceApp.unloadMission() end

