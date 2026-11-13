---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Point d'entrée du mode rallye (extension gameplay_rally). Il possède le gestionnaire de rallye (RallyManager) chargé pour une mission, relaye les mises à jour vers l'application de reconnaissance (RecceApp) et vers le gestionnaire, fournit la boîte à outils de debug (ImGui), place un copilote fictif dans le siège miroir du conducteur, transmet les actions d'entrée (reconnaissance, calage du copilote) et gère la couleur de thème des flux d'interface. Un moddeur de rallye l'utilise pour charger/décharger un rallye, lire son état ou régler le calage du copilote.
--- Accès : extension `gameplay_rally` : `extensions.load("gameplay_rally")`, puis la globale `gameplay_rally`
---@class gameplay_rally
---@field dependencies string[] {'gameplay_seatOccupants'}, extension chargée avant.
---@field recceApp table Module RecceApp (application de reconnaissance de rallye) exposé tel quel.
gameplay_rally = {}

--- Action d'entrée : avance les annonces du copilote de 0,1 s (décale la plage de délai) et affiche un message.
---Source : lua/ge/extensions/gameplay/rally.lua:307
function gameplay_rally.actionCodriverCallsEarlier() end

--- Action d'entrée : retarde les annonces du copilote de 0,1 s et affiche un message.
---Source : lua/ge/extensions/gameplay/rally.lua:311
function gameplay_rally.actionCodriverCallsLater() end

--- Action d'entrée : si la reconnaissance est active, envoie rallyInputActionRecceMoveVehicleBackward à l'UI.
---Source : lua/ge/extensions/gameplay/rally.lua:266
function gameplay_rally.actionRecceMoveVehicleBackward() end

--- Action d'entrée : si la reconnaissance est active, envoie rallyInputActionRecceMoveVehicleForward à l'UI.
---Source : lua/ge/extensions/gameplay/rally.lua:261
function gameplay_rally.actionRecceMoveVehicleForward() end

--- Action d'entrée : bascule la souris comme un véhicule dans la reconnaissance (si RecceApp est activée).
---Source : lua/ge/extensions/gameplay/rally.lua:252
function gameplay_rally.actionToggleMouseLikeVehicle() end

--- Action d'entrée : envoie à l'UI rallyInputActionCutRecording (coupe l'enregistrement de transcription).
---Source : lua/ge/extensions/gameplay/rally.lua:257
function gameplay_rally.actionTranscribeRecordingCut() end

--- Indique si le propriétaire donné a le droit de gérer le gestionnaire de rallye.
---Source : lua/ge/extensions/gameplay/rally.lua:79
---@param owner string|nil 'mission', 'recce' ou 'external' (défaut).
---@return boolean  true si autorisé.
---@return string|nil  Raison du refus.
function gameplay_rally.canManageMission(owner) end

--- Active ou désactive l'application de reconnaissance (RecceApp.setEnabled).
---Source : lua/ge/extensions/gameplay/rally.lua:179
---@param val boolean true pour activer.
function gameplay_rally.enableRecceApp(val) end

--- Indique si les logs de debug du rallye sont actifs.
---Source : lua/ge/extensions/gameplay/rally.lua:457
---@return boolean  true si actifs.
function gameplay_rally.getDebugLogging() end

--- Dernier message d'erreur destiné à l'utilisateur (échec de chargement).
---Source : lua/ge/extensions/gameplay/rally.lua:432
---@return string|nil  Message.
function gameplay_rally.getErrorMsgForUser() end

--- Données de course enregistrées par le hook onRallyRegisterRace.
---Source : lua/ge/extensions/gameplay/rally.lua:498
---@return table|nil  raceData.
function gameplay_rally.getRace() end

--- Gestionnaire de rallye courant.
---Source : lua/ge/extensions/gameplay/rally.lua:430
---@return table|nil  RallyManager ou nil.
function gameplay_rally.getRallyManager() end

--- Propriétaire du gestionnaire courant.
---Source : lua/ge/extensions/gameplay/rally.lua:431
---@return string|nil  'mission', 'recce', 'external' ou nil.
function gameplay_rally.getRallyManagerOwner() end

--- Objet de la boîte à outils de debug (nil tant que toggleDebug n'a pas été appelé).
---Source : lua/ge/extensions/gameplay/rally.lua:303
---@return table|nil  RallyToolbox.
function gameplay_rally.getRallyToolbox() end

--- Indique si le véhicule doit être réparé lors d'une récupération : demande au gestionnaire de boucle (gameplay_rallyLoop) s'il existe, sinon lit rallyRepairVehicleOnRecovery (réglage de mission, puis réglage du jeu, défaut true).
---Source : lua/ge/extensions/gameplay/rally.lua:433
---@return boolean  true si réparation.
function gameplay_rally.getRecoveryRepairVehicle() end

--- État de l'observateur d'étape du gestionnaire.
---Source : lua/ge/extensions/gameplay/rally.lua:452
---@return table|nil  État, nil sans gestionnaire.
function gameplay_rally.getStageObserverState() end

--- Mode d'autorité du runtime d'étape du gestionnaire, ou 'shadow' sans gestionnaire.
---Source : lua/ge/extensions/gameplay/rally.lua:449
---@return string  Mode.
function gameplay_rally.getStageRuntimeAuthorityMode() end

--- Couleur de thème actuelle : surcharge si définie, sinon couleur du gestionnaire de boucle (gameplay_rallyLoop), sinon du flux autonome, sinon '#009a1a'.
---Source : lua/ge/extensions/gameplay/rally.lua:487
---@return string  Couleur hexadécimale.
function gameplay_rally.getUiColor() end

--- Surcharge de couleur définie par setUiColor.
---Source : lua/ge/extensions/gameplay/rally.lua:490
---@return string|nil  Couleur ou nil.
function gameplay_rally.getUiColorOverride() end

--- Indique si la fenêtre Rally Toolbox est ouverte.
---Source : lua/ge/extensions/gameplay/rally.lua:496
---@return boolean  true si visible.
function gameplay_rally.isRallyToolboxVisible() end

--- Indique si un gestionnaire de rallye est chargé.
---Source : lua/ge/extensions/gameplay/rally.lua:171
---@return boolean  true si chargé.
function gameplay_rally.isReady() end

--- Crée un RallyManager pour le dossier de mission, règle le voicepack, reconstruit les assets et, en cas de succès, le met en place et place le copilote. Ne remplace pas l'ancien gestionnaire en cas d'échec.
---Source : lua/ge/extensions/gameplay/rally.lua:130
---@param missionId string Id de la mission.
---@param missionDir string Dossier de la mission de rallye.
---@param drivelineMode any Non utilisé (code commenté).
---@param voicepackPick any Voicepack ; nil = choix lu dans les réglages utilisateur de la mission (rallyVoicepackPick).
---@param options table|nil owner : 'mission', 'recce' ou 'external'.
---@return boolean  true si chargé.
---@return string|nil  Message d'erreur en cas d'échec.
function gameplay_rally.loadMission(missionId, missionDir, drivelineMode, voicepackPick, options) end

--- Hook de chargement : charge ExtHelper et envoie rally.onExtensionLoaded à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally.lua:233
function gameplay_rally.onExtensionLoaded() end

--- Hook de déchargement : retire le copilote fictif et décharge ExtHelper.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally.lua:240
function gameplay_rally.onExtensionUnloaded() end

--- Hook de course : enregistre un temps intermédiaire (recordSplit) pour le pathnode atteint ; logue un avertissement si event.pathnode manque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally.lua:320
---@param event table {pathnode, time, race}
function gameplay_rally.onRacePathnodeReached(event) end

--- Hook : mémorise les données de course et les transmet au gestionnaire (setRaceData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally.lua:380
---@param raceData table Données de la course.
function gameplay_rally.onRallyRegisterRace(raceData) end

--- Hook : ajoute le temps de récupération au gestionnaire (addRecoveryRaceTime).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally.lua:388
---@param recoveryType string Type de récupération.
function gameplay_rally.onRallyVehicleRecovery(recoveryType) end

--- Hook de siège : replace le copilote fictif (alias de la fonction interne seatCodriver).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally.lua:111
function gameplay_rally.onSeatOccupantEnter() end

--- Hook de siège : replace le copilote fictif après un départ d'occupant (le système de sièges supprime les occupants fictifs lors des respawns de configuration).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally.lua:111
function gameplay_rally.onSeatOccupantExit() end

--- Hook de changement de réglages : prévient le gestionnaire de rallye.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally.lua:417
function gameplay_rally.onSettingsChanged() end

--- Appelé à chaque image : met à jour RecceApp et le gestionnaire de rallye (sauf pendant l'enregistrement de reconnaissance) et dessine la Rally Toolbox si visible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally.lua:183
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_rally.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : quand le véhicule du joueur 0 est réinitialisé, prévient le gestionnaire de rallye.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally.lua:210
---@param vehicleID integer Véhicule réinitialisé.
function gameplay_rally.onVehicleResetted(vehicleID) end

--- Active ou désactive les logs de debug du rallye.
---Source : lua/ge/extensions/gameplay/rally.lua:458
---@param val boolean Nouvel état.
function gameplay_rally.setDebugLogging(val) end

--- Transmet au gestionnaire le mode d'autorité du runtime d'étape.
---Source : lua/ge/extensions/gameplay/rally.lua:444
---@param mode string Mode (valeur par défaut 'shadow' ; autres valeurs définies par le gestionnaire).
function gameplay_rally.setStageRuntimeAuthorityMode(mode) end

--- Surcharge la couleur du thème des flux Stage Timing / Progress. nil ou chaîne vide efface la surcharge.
---Source : lua/ge/extensions/gameplay/rally.lua:484
---@param hex string|nil Couleur hexadécimale, ex. '#ff0000'.
function gameplay_rally.setUiColor(hex) end

--- Affiche ou masque la fenêtre ImGui « Rally Toolbox » (créée au premier appel).
---Source : lua/ge/extensions/gameplay/rally.lua:291
function gameplay_rally.toggleDebug() end

--- Décharge le gestionnaire de rallye si le propriétaire correspond.
---Source : lua/ge/extensions/gameplay/rally.lua:156
---@param options table|nil owner (défaut 'external').
---@return boolean  true si déchargé.
---@return string|nil  Raison du refus.
function gameplay_rally.unloadMission(options) end

