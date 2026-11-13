---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rallyLoop.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension façade du mode « boucle de rallye » (enchaînement service, liaison, spéciales). Elle possède l'instance de RallyLoopManager (loop/rallyLoopManager) créée par setup(missionId, missionDir), lui relaie les mises à jour et les hooks du jeu, et publie chaque image le flux UI « rallyLoop » via guihooks.queueStream. Sans manager, elle publie le flux du StandaloneFallbackStream (mode `standaloneUiBridge`) ; getRuntimeMode renvoie 'rallyLoop', 'standaloneUiBridge' ou 'idle'. Elle héberge aussi la fenêtre imgui « Loop Toolbox » de debug.
--- Accès : extension `gameplay_rallyLoop` : `extensions.load("gameplay_rallyLoop")`, puis la globale `gameplay_rallyLoop`
---@class gameplay_rallyLoop
gameplay_rallyLoop = {}

--- Enregistre une pénalité de test dans le manager (recordTestPenalty).
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:324
---@param amount number Montant de la pénalité (unité déduite du code : temps).
---@return boolean|any  Résultat du manager, ou false et 'no rally loop manager'.
function gameplay_rallyLoop.addTestPenalty(amount) end

--- Délègue le dessin de debug au manager.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:205
---@param zOnTop boolean Dessiner au premier plan.
---@param drawRoute boolean Dessiner la route.
---@param drawLabels boolean Dessiner les étiquettes.
function gameplay_rallyLoop.drawDebug(zOnTop, drawRoute, drawLabels) end

--- État du log de debug.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:278
---@return boolean  debugLogging.
function gameplay_rallyLoop.getDebugLogging() end

--- Lit un indicateur de dessin de debug du manager.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:374
---@param flagName string Nom de l'indicateur.
---@return boolean  false sans manager.
function gameplay_rallyLoop.getDrawFlag(flagName) end

--- Objet LoopToolbox courant.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:201
---@return table|nil  Toolbox, nil si la fenêtre n'a jamais été ouverte ou est fermée.
function gameplay_rallyLoop.getLoopToolbox() end

--- Instance RallyLoopManager courante.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:368
---@return table|nil  Manager.
function gameplay_rallyLoop.getManager() end

--- Lit l'indicateur de transfert d'exécution.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:296
---@return boolean  false sans manager.
function gameplay_rallyLoop.getMissionExecutionTransferFlag() end

--- Id de la prochaine mission de la boucle.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:303
---@return string|nil  Id, nil sans manager.
function gameplay_rallyLoop.getNextMissionId() end

--- Mode d'exécution courant.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:83
---@return string  'rallyLoop', 'standaloneUiBridge' ou 'idle'.
function gameplay_rallyLoop.getRuntimeMode() end

--- Nombre de reprogrammations de spéciale (SS) du manager.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:387
---@return integer  0 sans manager.
function gameplay_rallyLoop.getSSRescheduleCount() end

--- Traite une demande de navigation depuis l'UI : 'restart' relance la boucle, 'abandon' retourne instantanément à la boucle, 'postServiceIn' et tout autre valeur démarrent la mission suivante.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:331
---@param gotoRallyLoop string 'restart', 'abandon', 'postServiceIn' ou autre.
function gameplay_rallyLoop.handleGOTO(gotoRallyLoop) end

--- Indique si la fenêtre Loop Toolbox est affichée.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:283
---@return boolean  Visibilité.
function gameplay_rallyLoop.isLoopToolboxVisible() end

--- API publique : vrai si un manager existe.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:75
---@return boolean  true après setup.
function gameplay_rallyLoop.isReady() end

--- Hook appelé avant tout changement d'état de mission. Supprime l'exclusion de trafic du manager et enregistre un DNF en cas d'abandon (sauf en serviceOut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:351
---@param state string Nouvel état de la mission (ex. 'stopped').
---@param mission table|nil Mission concernée.
---@param abandoned boolean true si la mission est abandonnée.
function gameplay_rallyLoop.onAnyMissionWillChange(state, mission, abandoned) end

--- Hook appelé quand la route des marqueurs au sol est créée ; relayé au manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:239
function gameplay_rallyLoop.onCreatedRallyGroundMarkerRoute() end

--- Hook de chargement ; n'écrit qu'un log si debugLogging est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:161
function gameplay_rallyLoop.onExtensionLoaded() end

--- Hook de déchargement : publie un flux {activeState = inactive} et vide le flux de repli.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:169
function gameplay_rallyLoop.onExtensionUnloaded() end

--- Hook d'interaction gameplay ; appelle manager:onRallyModeInteract().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:219
function gameplay_rallyLoop.onGameplayInteract() end

--- Hook appelé à chaque mise à jour GUI ; relayé au manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:136
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_rallyLoop.onGuiUpdate(dtReal, dtSim, dtRaw) end

--- Hook émis quand les données de rallye changent ; relayé au manager, sinon au flux de repli.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:211
---@param data table Données de rallye.
function gameplay_rallyLoop.onRallyDataUpdated(data) end

--- Hook appelé quand la récupération de route est terminée ; relayé au manager s'il gère le hook.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:251
---@param data table Données de la récupération.
function gameplay_rallyLoop.onRallyRouteRecoveryComplete(data) end

--- Hook appelé lors d'une récupération du véhicule ; appelle manager:trackRecovery.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:245
---@param recoveryType string Type de récupération.
function gameplay_rallyLoop.onRallyVehicleRecovery(recoveryType) end

--- Hook appelé quand la route a été recalculée ; relayé au manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:233
function gameplay_rallyLoop.onRecalculatedRoute() end

--- Hook appelé quand les réglages changent ; relayé au manager (s'il gère le hook) et au flux de repli.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:185
function gameplay_rallyLoop.onSettingsChanged() end

--- Hook appelé quand le bouton de départ de l'UI est cliqué ; relayé au manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:227
function gameplay_rallyLoop.onUIStartButtonClicked() end

--- Hook d'extension appelé chaque image. Met à jour le manager et publie le flux 'rallyLoop' ; gère aussi la fenêtre Loop Toolbox.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:101
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_rallyLoop.onUpdate(dtReal, dtSim, dtRaw) end

--- Active le log de debug.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:279
---@param val boolean Nouvelle valeur.
function gameplay_rallyLoop.setDebugLogging(val) end

--- Fixe un indicateur de dessin de debug du manager.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:381
---@param flagName string Nom de l'indicateur.
---@param value boolean Valeur.
function gameplay_rallyLoop.setDrawFlag(flagName, value) end

--- Fixe l'indicateur de transfert d'exécution de mission du manager.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:291
---@param val boolean Valeur.
function gameplay_rallyLoop.setMissionExecutionTransferFlag(val) end

--- Crée le RallyLoopManager pour la mission et vide le flux de repli.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:64
---@param missionId string Id de la mission boucle.
---@param missionDir string Dossier de la mission.
function gameplay_rallyLoop.setup(missionId, missionDir) end

--- Prépare le manager pour la mission suivante (manager:setupForNewMission).
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:285
function gameplay_rallyLoop.setupForNewMission() end

--- Aide de test : saute la liaison.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:317
---@param options table|nil Options transmises au manager (déduit du code).
---@return boolean  Succès.
---@return string|nil  'no rally loop manager' sans manager.
function gameplay_rallyLoop.skipLiaisonForTesting(options) end

--- Démarre la mission suivante de la boucle.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:310
---@return any  Résultat du manager (false sans manager).
function gameplay_rallyLoop.startNextMission() end

--- Affiche ou masque la fenêtre Loop Toolbox.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:193
function gameplay_rallyLoop.toggleDebug() end

--- Détruit le manager et vide le flux de repli.
---Source : lua/ge/extensions/gameplay/rallyLoop.lua:69
function gameplay_rallyLoop.unload() end

