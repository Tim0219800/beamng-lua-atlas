---@meta
-- tim19Atlas stub generated from lua/ge/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Appelée par le C++ quand le champ de saisie CEF perd le focus ; relaye l'évènement UI 'CEFTypingLostFocus'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1264
function CEFTypingLostFocus() end

--- Callback global vide pour la console imgui ; une extension peut le redéfinir pour recevoir la saisie.
---Source : lua/ge/main.lua:80
function ConsoleInputCallback() end

--- Une seule fois par session : lit Engine.Platform.getFSInfo() ; si une erreur est signalée, affiche un toast d'erreur dans l'UI et logue un message de corruption d'installation.
---Source : lua/ge/main.lua:923
function checkFSErrors() end

--- Appelée à la fin/déchargement du niveau. Émet onClientPreEndMission, arrête la simulation physique (be:physicsStopSimulation), retire la pause temporelle, puis émet onClientEndMission(levelPath).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:839
---@param levelPath string chemin du niveau
function clientEndMission(levelPath) end

--- Appelée quand le niveau et les véhicules sont chargés (après clientPreStartMission). Met l'état de jeu 'freeroam' par défaut (core_gamestate) puis émet onClientPostStartMission(levelPath).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:819
---@param levelPath string chemin du niveau
function clientPostStartMission(levelPath) end

--- Appelée par le moteur avant le chargement des ressources du niveau. Met worldReadyState=0, enregistre l'action, émet onClientPreStartMission(levelPath) et l'évènement UI 'PreStartMission'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:809
---@param levelPath string chemin du niveau
function clientPreStartMission(levelPath) end

--- Appelée quand les objets du niveau sont chargés (après clientPostStartMission). Coupe la musique du menu (sauf keepAlive), émet onClientStartMission(levelPath) via hookNotify, puis map.assureLoad() et vide le cache Sim.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:826
---@param levelPath string chemin du niveau
function clientStartMission(levelPath) end

--- Outil de dev : exécute des scripts TorqueScript (.cs), détecte les objets créés et les sauvegarde au nouveau format JSON via un PersistenceManager, puis supprime les objets (sauf SimSet/SimGroup).
---Source : lua/ge/main.lua:176
---@param filenames table<integer, string> scripts .cs à convertir
---@param newExtSuffix string non utilisé dans le corps de la fonction
function convertCStoJson(filenames, newExtSuffix) end

--- Outil de dev : cherche tous les *.prefab / *.prefab.json sous levelPath et appelle convertPrefabtoJson sur chacun.
---Source : lua/ge/main.lua:145
---@param levelPath string dossier du niveau
function convertLevelPrefabs(levelPath) end

--- Outil de dev : charge un prefab .prefab (TorqueScript) à l'origine, le sauvegarde en .prefab.json puis le décharge et le supprime.
---Source : lua/ge/main.lua:130
---@param filepath string chemin du fichier .prefab
function convertPrefabtoJson(filepath) end

--- Appelée par le moteur quand l'éditeur est activé/désactivé (et à la première frame). Émet onEditorEnabled(enabled) et informe map via map.setEditorState.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:863
---@param enabled boolean état de l'éditeur
function editorEnabled(enabled) end

--- Active le réglage communityTranslations puis lance updateTranslations().
---Source : lua/ge/main.lua:1319
function enableCommunityTranslations() end

--- Se déconnecte du serveur local (serverConnection.disconnect, machine à états asynchrone) puis, dans le callback, décharge toutes les extensions non manuelles et appelle callback.
---Source : lua/ge/main.lua:456
---@param callback function|nil appelé une fois le mode terminé
function endActiveGameMode(callback) end

--- Avant un rechargement Lua : sérialise les paquets des extensions (serializePackages), levelLoaded et l'id de la source musicale dans be.persistenceLuaData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1268
function exportPersistentData() end

--- Rétrocompatibilité : renvoie la globale gameConnection, qui vaut nil (n'est plus un objet de scène).
---Source : lua/ge/main.lua:83
---@return nil  toujours nil dans ce fichier
function getGame() end

--- Inverse d'exportPersistentData, appelée à la fin de init(). En cas d'erreur de désérialisation, journalise et écrit persistentDataError.txt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1278
function importPersistentData() end

--- Initialise la VM GE au démarrage et au rechargement (Ctrl+L) : initSettings, réserve _tr, active detectGlobalWrites, charge les extensions de démarrage (+ util_materialHotReload sous Windows), ouvre la session en ligne, importPersistentData, demande l'état de l'UI (guihooks 'isUIReady'), appelle core_modmanager.onUiReady(), map.assureLoad(), crée les dossiers mods et trackEditor, puis luaReady=true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1044
---@param reason string 'startup' ou 'reload' ; copié dans la globale luaVmStartReason
function init(reason) end

--- Permet à l'UI de savoir si init() est terminée.
---Source : lua/ge/main.lua:1039
---@return boolean  true une fois init() exécutée jusqu'au bout
function isLuaReady() end

--- Indique si le jeu a été lancé avec l'argument de ligne de commande -safemode.
---Source : lua/ge/main.lua:126
---@return integer|nil  clé trouvée dans les arguments (truthy) ou nil
function isSafeMode() end

--- Charge récursivement les matériaux d'un dossier : d'abord *materials.cs (TorqueScript), puis *materials.json, puis *datablocks.json.
---Source : lua/ge/main.lua:1393
---@param dir string dossier à parcourir
function loadDirRec(dir) end

--- OBSOLÈTE : unloadAutoExtensions() + loadPresetExtensions() + extensions.load(...) avec journal d'erreur.
---Source : lua/ge/main.lua:1627
---@param ... any extensions à charger en plus
function loadGameModeModules(...) end

--- Charge toutes les extensions en unloadMode 'manual'.
---Source : lua/ge/main.lua:405
function loadManualUnloadExtensions() end

--- Charge la liste presetExtensions (+ celles demandées en ligne de commande via queueCmdlineLevelLoadExtension), puis vide cette liste de ligne de commande (usage unique).
---Source : lua/ge/main.lua:415
function loadPresetExtensions() end

--- Test de dev : spawnPrefab de test_v2.prefab.json via spawnPrefab.
---Source : lua/ge/main.lua:1808
function load_spawn_prefabv2_indirect() end

--- Test de dev : spawn du prefab /levels/smallgrid/test_v1.prefab.json.
---Source : lua/ge/main.lua:1717
function load_test_prefabv1() end

--- Test de dev : charge /levels/smallgrid/test_v2.prefab.json comme PrefabV2 'test_v2'.
---Source : lua/ge/main.lua:1724
function load_test_prefabv2() end

--- Remplacement global de log : transmet tous les arguments à Lua:log (niveau 'D','I','W','E','A', origine, message).
---Source : lua/ge/main.lua:30
---@param ... any niveau, tag, message
function log(...) end

--- Appelée à chaque frame par le moteur, juste avant le rendu et après la physique. Ordre : map.updateGFX, hook onPreRender(dtReal, dtSim, dtRaw), hook onDrawDebug(Lua.lastDebugFocusPos, dtReal, dtSim, dtRaw), puis, si worldReadyState==1, attend que les matériaux du véhicule joueur soient prêts (max 5 s) pour quitter l'écran de chargement, passer worldReadyState à 2 et émettre onWorldReadyState(2).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:878
---@param dtReal number delta temps réel (s)
---@param dtSim number delta temps simulé (s)
---@param dtRaw number delta temps brut (s)
function luaPreRender(dtReal, dtSim, dtRaw) end

--- Le mode de l'IA d'un véhicule a changé ; émet onAiModeChange.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1221
---@param vehicleID integer id du véhicule
---@param newAiMode string nouveau mode IA (déduit du nom)
function onAiModeChange(vehicleID, newAiMode) end

--- L'IA a terminé sa route ; émet onAiRouteDone(vehicleID).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1225
---@param vehicleID integer id du véhicule
function onAiRouteDone(vehicleID) end

--- Nom de fonction par défaut du callback des BeamNGTrigger côté C++ ; émet le hook onBeamNGTrigger(data).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1122
---@param data table données du déclencheur (structure fournie par le C++)
function onBeamNGTrigger(data) end

--- Appelée par le moteur quand un véhicule franchit un waypoint BeamNG (objet de scène). Appelle map.onWaypoint puis émet onBeamNGWaypoint(args).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1116
---@param args table données du waypoint (structure fournie par le C++)
function onBeamNGWaypoint(args) end

--- Un attelage s'est accroché ; émet onCouplerAttached.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1208
---@param objId1 integer véhicule 1
---@param objId2 integer véhicule 2
---@param nodeId integer nœud d'attelage du véhicule 1
---@param obj2nodeId integer nœud d'attelage du véhicule 2
function onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

--- Déclenchée quand l'utilisateur détache volontairement l'attelage d'une remorque ; émet onCouplerDetach(objId, nodeId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1217
---@param objId integer id du véhicule
---@param nodeId integer nœud d'attelage
function onCouplerDetach(objId, nodeId) end

--- Un attelage s'est détaché ; émet onCouplerDetached.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1212
---@param objId1 integer véhicule 1
---@param objId2 integer véhicule 2
---@param nodeId integer nœud du véhicule 1
---@param obj2nodeId integer nœud du véhicule 2
---@param breakForce number force de rupture (déduit du nom)
function onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce) end

--- Appelée directement par le C++ à la sortie : émet onExit, déconnecte le serveur, détruit PhysicsPlugin, poste l'évènement 'onExit' du MainEventManager, puis settings.exit().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1456
function onExit() end

--- Appelée par le moteur quand des fichiers surveillés changent. Appelle settings.onFilesChanged et map.onFilesChanged, émet onFilesChanged(files), puis pour chaque fichier onFileChanged(filename, type), enfin onFileChangedEnd.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1126
---@param files table liste d'entrées {filename, type}
function onFileChanged(files) end

--- Appelée une fois par le moteur au démarrage de la VM : crée les dossiers settings/ et screenshots/, l'EventManager 'MainEventManager', parse la ligne de commande, initialise le core et le client (client/core, client/init), PhysicsPlugin, puis charge le niveau $levelToLoad éventuel via core_loadMapCmd (différé jusqu'à ce que le mod manager soit prêt).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1493
function onGameEngineStartup() end

--- Appelée par le moteur physique quand un véhicule est instable : journalise les véhicules proches (< 1 m), affiche un message UI, émet onInstabilityDetected(vid, returnData), puis, si non géré, met le véhicule en mode fantôme et le téléporte sur place ; une 2e instabilité dans la seconde supprime le véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1328
---@param vid integer id du véhicule instable
function onInstabilityDetected(vid) end

--- Logue la durée totale du rechargement et efface luaReloadStartTime. Appelée par tryCompleteLuaReload quand jobs, settings, UI, mod manager (et MCP) sont prêts.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1589
function onLuaReloadCompleted() end

--- Signale que le mod manager a fini après un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1585
function onLuaReloadModManagerCompleted() end

--- Appelée après un rechargement Lua (Ctrl+L) : client/core reloadCore, client/init reloadClient, mesure la durée et arme le suivi de fin de rechargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1573
---@param reloadStartTime number os.clockhp() au début du rechargement (s)
function onLuaReloaded(reloadStartTime) end

--- Appelée quand le curseur est verrouillé/déverrouillé ; émet onMouseLocked(locked).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1196
---@param locked boolean état du verrouillage
function onMouseLocked(locked) end

--- Appelée avant la sortie du jeu ; émet onPreExit (profilée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1448
function onPreExit() end

--- Point d'entrée appelé par le moteur avant onGameEngineStartup ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1440
function onPreStart() end

--- Appelée avant la fermeture de la fenêtre ; émet onPreWindowClose.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1444
function onPreWindowClose() end

--- Le clavier virtuel est fermé ; émet onScreenKeyboardClosed(applied, text).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1324
---@param applied boolean saisie validée
---@param text string texte saisi
function onScreenKeyboardClosed(applied, text) end

--- Callback asynchrone quand un cluster de nœuds d'un véhicule est téléporté ; émet onSetClusterPosRelRot(vehicleID, cNodeId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1181
---@param vehicleID integer id du véhicule
---@param cNodeId integer id du nœud de cluster
function onSetClusterPosRelRot(vehicleID, cNodeId) end

--- Erreur de création d'un véhicule : journalise et affiche un toast d'erreur dans l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1374
---@param status any code d'erreur
---@param jbeamFilename string véhicule concerné
function onSpawnError(status, jbeamFilename) end

--- Une texture dessinée est compressée ; émet onTexDrawPrimCompressDone(textureName).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1594
---@param textureName string nom de la texture
function onTexDrawPrimCompressDone(textureName) end

--- Transmet à render_openxr.errorDetected si ce module existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1238
---@param ... any détails de l'erreur
function openXRErrorDetected(...) end

--- Transmet à render_openxr.stateChanged si ce module existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1233
---@param state any état OpenXR
function openXRStateChanged(state) end

--- Relaie un évènement du moteur physique : hook onPhysicsEngineEvent. Seul le premier argument est transmis (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1139
---@param ... any arguments de l'évènement
function physicsEngineEvent(...) end

--- La simulation physique est mise en pause/reprise. Relaye l'évènement UI 'physicsStateChanged' puis émet onPhysicsUnpaused (val vrai) ou onPhysicsPaused.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1296
---@param val boolean true si la physique tourne
function physicsStateChanged(val) end

--- Si PlatformSwitches.useEditor est vrai, ajoute editor_main et editor_veMain à la liste des extensions de démarrage ; recalcule la liste des extensions en déchargement manuel. Appelée par init().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:393
function prepareStartupExtensionsList() end

--- Remplacement global de print : écrit via log('A','print', tostring(...)). Seul le premier argument est converti et journalisé.
---Source : lua/ge/main.lua:34
---@param ... any valeurs à afficher
function print(...) end

--- Ajoute une extension à charger au prochain loadPresetExtensions (utilisé pour les extensions demandées en ligne de commande).
---Source : lua/ge/main.lua:469
---@param extension string nom de l'extension
function queueCmdlineLevelLoadExtension(extension) end

--- Lit la route courante dans ui_router.getCurrent() et appelle setMainMenuMusicRouteState.
---Source : lua/ge/main.lua:801
function refreshMainMenuMusicRouteState() end

--- OBSOLÈTE : équivaut à setExtensionUnloadMode(nom, 'manual').
---Source : lua/ge/main.lua:1639
---@param extensionName string chemin Lua ou nom d'extension
function registerCoreModule(extensionName) end

--- Appelée par le moteur de replay pour recréer un véhicule en (0,0,0) ; le joueur n'y est installé que s'il n'a pas encore de véhicule. S'il n'y a qu'un véhicule enterable, passe en caméra de jeu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1244
---@param jbeamFilename string véhicule
---@param partConfigData table configuration des pièces
---@return table|nil  objet véhicule créé
function replaySpawnVehicle(jbeamFilename, partConfigData) end

--- Appelée par le replay : core_replay.startLevel(levelPath).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1256
---@param levelPath string niveau à charger
function replayStartLevel(levelPath) end

--- Transmet à core_replay.stateChanged(...).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1229
---@param ... any arguments du moteur
function replayStateChanged(...) end

--- Appelée par le C++ quand un journal de performance est voulu : crée un LuaProfiler pour la prochaine frame (update + luaPreRender), activé dans les extensions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:873
function requestGeluaProfile() end

--- Émet onResetGameplay(playerID).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1379
---@param playerID integer joueur concerné
function resetGameplay(playerID) end

--- Quitte le mode de jeu actif (endActiveGameMode) et demande l'état de jeu par défaut (menu principal). Le callback est appelé quand le niveau est déchargé et qu'un nouveau peut être chargé.
---Source : lua/ge/main.lua:848
---@param callback function|nil appelé une fois le niveau déchargé
function returnToMainMenu(callback) end

--- Debug : appelle Engine.Debug.mimalloc_test().
---Source : lua/ge/main.lua:859
function runMimalloc_test() end

--- Envoie à l'UI (évènement 'onUIBootstrap') la liste des dossiers de /ui/modModules/ ; liste vide en cas d'erreur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1383
function sendUIModules() end

--- Définit si une extension survit aux changements de niveau ('manual') ou peut être déchargée automatiquement ('auto', défaut). Logue une erreur si l'extension ou le mode est inconnu.
---Source : lua/ge/main.lua:425
---@param extension table|string module M (son __extensionName__ est lu) ou nom de l'extension
---@param unloadMode string 'manual' ou 'auto'
function setExtensionUnloadMode(extension, unloadMode) end

--- Force la musique du menu principal à continuer (true) ou rend la main à la logique par route UI (false). Ne fait rien si l'état ne change pas.
---Source : lua/ge/main.lua:704
---@param active boolean true pour maintenir la musique
function setMainMenuMusicKeepAlive(active) end

--- Enregistre ou retire une demande de pause de la musique du menu identifiée par requestId, puis rafraîchit l'état.
---Source : lua/ge/main.lua:715
---@param requestId string identifiant non vide
---@param active boolean true pour demander la pause
---@return boolean  false si requestId est invalide, sinon true
function setMainMenuMusicPauseRequest(requestId, active) end

--- Applique la logique de musique selon la route UI : pause demandée > keepAlive > route 'menu' (reprise) > niveau chargé (arrêt avec fondu 0,6 s) > route 'menu.credits' (extension ui_credits) > route 'menu.uiSounds' (pause) > reprise.
---Source : lua/ge/main.lua:757
---@param routeName string|nil nom de la route UI courante
function setMainMenuMusicRouteState(routeName) end

--- Test de dev : construit des SimGroup et TSStatic dans MissionGroup puis supprime thePlayer, spawn_default, ParticleEmitter.
---Source : lua/ge/main.lua:1649
function test_prefabv2() end

--- Test de dev : instancie 'test_v2' à (6,3,2), échelle 1,5, rotation 45° en Z.
---Source : lua/ge/main.lua:1743
function test_spawn_prefabv2() end

--- Test de dev : instancie count copies aléatoires de 'test_v2' dans MissionGroup.
---Source : lua/ge/main.lua:1770
---@param count integer|nil nombre d'instances (1000 par défaut)
function test_spawn_prefabv2_massive(count) end

--- Test de dev : supprime l'objet 'test_v2'.
---Source : lua/ge/main.lua:1800
function test_unload_prefabv2() end

--- Appelée quand l'UI est prête. Émet onUiReady et marque l'UI prête pour la finalisation d'un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1032
function uiReady() end

--- Décharge toutes les extensions sauf celles en mode 'manual' (extensions.unloadExcept). À appeler lors du changement de mode de jeu/niveau.
---Source : lua/ge/main.lua:410
function unloadAutoExtensions() end

--- Appelée à chaque frame par le moteur, après les entrées et avant la physique. Voir notes : settingsTick, core_input_bindings.updateGFX, simTimeAuthority.update, hook onUpdate(dtReal, dtSim, dtRaw), gestion des véhicules instables, et si l'UI doit être rafraîchie hook onGuiUpdate + envoi des streams guihooks.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:991
---@param dtReal number delta temps réel (s)
---@param dtSim number delta temps simulé (s)
---@param dtRaw number delta temps brut (s)
function update(dtReal, dtSim, dtRaw) end

--- Appelée par le moteur à la première frame. Émet onFirstUpdate, settings.finalizeInit(), synchronise l'état de l'éditeur, traite les arguments de ligne de commande de première frame (-flowgraph, -compilemeshes, -convertCSMaterials, -deps, -disableDynamicCollision, -enablemcp, etc.) et appelle uiReady() directement avec -noui ou en mode headless.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:973
function updateFirstFrame() end

--- Met à jour la barre de chargement UI (évènement 'UpdateProgress') et force un repaint du Canvas pendant le chargement d'un niveau ; stocke $lastProgress et $$lastProgressTxt.
---Source : lua/ge/main.lua:1598
---@param val number progression entre 0 et 1
---@param txt string texte affiché
function updateLoadingProgress(val, txt) end

--- Utilise updateTSShapeLoadProgress si défini (éditeur chargé), sinon updateLoadingProgress.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1615
---@param progress number progression
---@param msg string texte
function updateTSShapeLoadProgressDynamic(progress, msg) end

--- Démonte mods/translations.zip s'il est monté, télécharge locales_v2.zip via core_repository.installMod, puis recharge les réglages.
---Source : lua/ge/main.lua:1305
function updateTranslations() end

--- Outil de dev : appelle validatePrefabJson sur chaque *.prefab.json de levelPath.
---Source : lua/ge/main.lua:168
---@param levelPath string dossier du niveau
function validateLevelPrefabs(levelPath) end

--- Outil de dev : recharge un .prefab.json et le resauvegarde au même endroit (normalisation du format).
---Source : lua/ge/main.lua:153
---@param filepath string chemin du .prefab.json
function validatePrefabJson(filepath) end

--- Appelée quand un véhicule est activé/désactivé (ex. pooling du trafic). Sans rapport avec le changement de véhicule du joueur. Émet onVehicleActiveChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1192
---@param vehicleID integer id du véhicule
---@param active boolean nouvel état
---@param setActiveCount any transmis tel quel (déduit du code)
function vehicleActiveChanged(vehicleID, active, setActiveCount) end

--- Appelée quand un véhicule est supprimé : oublie ses minuteries d'instabilité, émet onVehicleDestroyed(vid), invalide les caches de véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1200
---@param vid integer id du véhicule
function vehicleDestroyed(vid) end

--- Callback asynchrone après la réinitialisation d'un véhicule ; émet onVehicleResetted(vehicleID).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1186
---@param vehicleID integer id du véhicule
function vehicleReset(vehicleID) end

--- Appelée par le moteur quand un véhicule apparaît. Invalide les caches de véhicules, règle la gravité du véhicule (core_environment.getGravity), puis émet onPreVehicleSpawned(vid, veh) puis onVehicleSpawned(vid, veh). Ne fait rien si l'objet n'existe pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1144
---@param vid integer id de l'objet véhicule
function vehicleSpawned(vid) end

--- Appelée quand le joueur change de véhicule. Émet onVehicleSwitched(oldId, newId, player) (id -1 si absent) et l'évènement UI 'VehicleFocusChanged'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/main.lua:1166
---@param oldVehicle table|nil ancien objet véhicule
---@param newVehicle table|nil nouvel objet véhicule
---@param player integer index du joueur
function vehicleSwitched(oldVehicle, newVehicle, player) end

---@type table
MoveManager = nil
---@type vec3
Point3F = nil
---@type any
WinInput = nil
---@type any
bullettime = nil
---@type any
commands = nil
---@type any
doStartupProfiling = nil
---@type table
editor = nil
---@type any
extensions = nil
---@type any
guihooks = nil
---@type any
json = nil
---@type any
logAlways = nil
---@type any
map = nil
---@type any
parseArgs = nil
---@type any
perf = nil
---@type boolean
photoModeOpen = nil
---@type any
sailingTheHighSeas = nil
---@type any
screenshot = nil
---@type any
server = nil
---@type any
serverConnection = nil
---@type any
setSpawnpoint = nil
---@type any
settings = nil
---@type any
simTimeAuthority = nil
---@type any
spawn = nil
---@type string
vmType = nil
---@type any
worldReadyState = nil
