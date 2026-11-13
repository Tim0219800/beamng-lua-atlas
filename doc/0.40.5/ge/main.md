# `main`

*Fichier : `lua/ge/main.lua` · VM : Game Engine (GE) · 1814 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("main")`

Point d'entrée de la VM Lua « Game Engine » (GE, vmType = 'game'). Le moteur C++ charge ce fichier au démarrage puis appelle ses fonctions globales (onGameEngineStartup, init, update, luaPreRender, clientPreStartMission, vehicleSpawned, onExit…). Chacune relaie en général l'évènement aux extensions via extensions.hook('onXxx', ...). Un moddeur n'appelle presque jamais ces fonctions : il écoute les hooks correspondants dans son extension (onUpdate, onPreRender, onClientStartMission, onVehicleSpawned…). Il utilise en revanche setExtensionUnloadMode, loadPresetExtensions, unloadAutoExtensions, returnToMainMenu et endActiveGameMode.

## Exemple

```lua
-- extension GE (lua/ge/extensions/monmod.lua)
local M = {}
local function onInit() setExtensionUnloadMode(M, 'manual') end -- survit aux changements de niveau
local function onUpdate(dtReal, dtSim, dtRaw) end -- appelé depuis update() de main.lua
local function onPreRender(dtReal, dtSim, dtRaw) end -- appelé depuis luaPreRender()
local function onVehicleSpawned(vid, veh) end
M.onInit, M.onUpdate, M.onPreRender, M.onVehicleSpawned = onInit, onUpdate, onPreRender, onVehicleSpawned
return M
```

## Remarques

- Ordre de chargement du fichier (top-level) : vmType='game', package.path, require luaCore et common/cdefs, définition de log/print (log -> Lua:log, print -> log('A','print',...)), puis mathlib, utils, devUtils, ge_utils, luaProfiler, StackTracePlus (remplace debug.traceback), puis les modules globaux ci-dessous.
- Modules chargés et exposés en globales par main.lua : Point3F (= vec3), json, guihooks, screenshot, simTimeAuthority (alias rétrocompatible bullettime), WinInput (= Input), extensions (chemins lua/ge/extensions/ et lua/common/extensions/), map, settings (= extensions.core_settings_settings), perf (utils/perf), spawn, setSpawnpoint, serverConnection, server (server/server), commands (server/commands), editor (table vide ; si PlatformSwitches.useEditor est faux : editor.isEditorActive renvoie false et editor.toggleActive ne fait rien), parseArgs (client/parseArgs), MoveManager (table vide), sailingTheHighSeas, photoModeOpen=false, levelLoaded=nil, worldReadyState=-1, logAlways (= print), doStartupProfiling. gameConnection=nil (rétrocompatibilité, getGame() la renvoie).
- Ordre de démarrage : (1) chargement du fichier ; (2) C++ appelle onPreStart() (vide) puis onGameEngineStartup() qui crée les dossiers settings/ et screenshots/, l'EventManager 'MainEventManager', parseArgs.defaultParseArgs(), client/core initializeCore, client/init initClient, PhysicsPlugin.init, poste l'évènement 'onStart', puis charge un niveau passé en ligne de commande ($levelToLoad) via core_loadMapCmd ; (3) init(reason) charge les extensions de démarrage (startupExtensions) ; (4) à la première frame updateFirstFrame() ; (5) l'UI appelle uiReady(). Dans le code lu, l'appelant exact de init n'est pas dans ce fichier : le commentaire dit qu'elle est aussi appelée au rechargement (Ctrl+L), reason valant 'startup' ou 'reload'.
- Boucle d'update : update(dtReal, dtSim, dtRaw) est appelée à chaque frame après les entrées et avant la physique. Elle fait : fondu de la musique du menu, settings.settingsTick, core_input_bindings.updateGFX(dtRaw), simTimeAuthority.update(dtReal), hook onUpdate, gestion des véhicules instables, puis (seulement si be:getUpdateUIflag()) hook onGuiUpdate et envoi des streams UI (guihooks.sendStreams), perf.update(), tryCompleteLuaReload. luaPreRender(dtReal, dtSim, dtRaw) est appelée juste avant le rendu et après la physique : map.updateGFX(dtReal, dtSim), hook onPreRender, hook onDrawDebug(Lua.lastDebugFocusPos, dtReal, dtSim, dtRaw), puis la détection de fin de chargement (worldReadyState).
- Ordre au chargement d'un niveau : clientPreStartMission (worldReadyState=0, hook onClientPreStartMission, UI 'PreStartMission') -> clientPostStartMission (état de jeu 'freeroam' par défaut, hook onClientPostStartMission) -> clientStartMission (hook onClientStartMission, puis map.assureLoad()). worldReadyState passe à 1 (valeur posée par du code hors de ce fichier, non vue ici) ; dans luaPreRender, quand le véhicule joueur 0 a ses matériaux prêts (ou après 5 s de dtRaw cumulé), l'écran de chargement est quitté, worldReadyState=2 et le hook onWorldReadyState(2) est émis. À la fin : clientEndMission émet onClientPreEndMission, arrête la simulation physique, retire la pause puis émet onClientEndMission.
- Unités : dtReal, dtSim, dtRaw en secondes (dtSim est le temps simulé, tient compte du ralenti/pause ; dtRaw est le temps brut).
- Extensions : les startupExtensions sont toutes en unloadMode 'manual' (jamais déchargées au changement de niveau). Les presetExtensions (core_environment, core_weather, gameplay_traffic, gameplay_parking, core_groundMarkers…) sont chargées par loadPresetExtensions() lors de la mise en place d'un mode de jeu. Les autres sont en mode 'auto' et déchargées par unloadAutoExtensions().
- Instabilité physique : onInstabilityDetected active le mode fantôme du véhicule et le téléporte sur place pendant 1 s (instabilityDetectionTime) ; une deuxième instabilité pendant ce délai supprime le véhicule. Un hook onInstabilityDetected(vid, returnData) permet à une extension de gérer le cas elle-même en mettant returnData.instabilityHandled = true.
- Bug/incohérence : physicsEngineEvent(...) fait « local args = unpack({...}) » : seule la première valeur est conservée et transmise au hook onPhysicsEngineEvent.
- Bug/incohérence : onInstabilityDetected appelle v:getJBeamFilename() avant de tester « if v » ; si le véhicule n'existe plus, la fonction plante (la garde plus bas est inutile).
- Bug/incohérence : validatePrefabJson calcule newPath sans l'utiliser ; loadModScriptsRec est local, jamais appelée dans ce fichier ; handleCommandLineFirstFrame et loadRequiredExtension sont locales (inaccessibles aux extensions).
- Fonctions obsolètes : loadGameModeModules et registerCoreModule loguent « OUTDATED MOD CODE » et sont prévues pour disparaître ; utiliser unloadAutoExtensions()+loadPresetExtensions()+extensions.load(...) et setExtensionUnloadMode(M,'manual').
- Fonctions de test/debug (test_prefabv2, load_test_prefabv1/2, test_spawn_prefabv2, test_spawn_prefabv2_massive, test_unload_prefabv2, load_spawn_prefabv2_indirect, runMimalloc_test, convert*/validate* prefab) : outils de développement appelables depuis la console.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `CEFTypingLostFocus()` | Appelée par le C++ quand le champ de saisie CEF perd le focus ; relaye l'évènement UI 'CEFTypingLostFocus'. | 1264 |
| `ConsoleInputCallback()` | Callback global vide pour la console imgui ; une extension peut le redéfinir pour recevoir la saisie. | 80 |
| `checkFSErrors()` | Une seule fois par session : lit Engine.Platform.getFSInfo() ; si une erreur est signalée, affiche un toast d'erreur dans l'UI et logue un message de corruption d'installation. | 923 |
| `clientEndMission(levelPath)` | Appelée à la fin/déchargement du niveau. Émet onClientPreEndMission, arrête la simulation physique (be:physicsStopSimulation), retire la pause temporelle, puis émet onClientEndMission(levelPath). | 839 |
| `clientPostStartMission(levelPath)` | Appelée quand le niveau et les véhicules sont chargés (après clientPreStartMission). Met l'état de jeu 'freeroam' par défaut (core_gamestate) puis émet onClientPostStartMission(levelPath). | 819 |
| `clientPreStartMission(levelPath)` | Appelée par le moteur avant le chargement des ressources du niveau. Met worldReadyState=0, enregistre l'action, émet onClientPreStartMission(levelPath) et l'évènement UI 'PreStartMission'. | 809 |
| `clientStartMission(levelPath)` | Appelée quand les objets du niveau sont chargés (après clientPostStartMission). Coupe la musique du menu (sauf keepAlive), émet onClientStartMission(levelPath) via hookNotify, puis map.assureLoad() et vide le cache Sim. | 826 |
| `convertCStoJson(filenames, newExtSuffix)` | Outil de dev : exécute des scripts TorqueScript (.cs), détecte les objets créés et les sauvegarde au nouveau format JSON via un PersistenceManager, puis supprime les objets (sauf SimSet/SimGroup). | 176 |
| `convertLevelPrefabs(levelPath)` | Outil de dev : cherche tous les *.prefab / *.prefab.json sous levelPath et appelle convertPrefabtoJson sur chacun. | 145 |
| `convertPrefabtoJson(filepath)` | Outil de dev : charge un prefab .prefab (TorqueScript) à l'origine, le sauvegarde en .prefab.json puis le décharge et le supprime. | 130 |
| `editorEnabled(enabled)` | Appelée par le moteur quand l'éditeur est activé/désactivé (et à la première frame). Émet onEditorEnabled(enabled) et informe map via map.setEditorState. | 863 |
| `enableCommunityTranslations()` | Active le réglage communityTranslations puis lance updateTranslations(). | 1319 |
| `endActiveGameMode(callback)` | Se déconnecte du serveur local (serverConnection.disconnect, machine à états asynchrone) puis, dans le callback, décharge toutes les extensions non manuelles et appelle callback. | 456 |
| `exportPersistentData()` | Avant un rechargement Lua : sérialise les paquets des extensions (serializePackages), levelLoaded et l'id de la source musicale dans be.persistenceLuaData. | 1268 |
| `getGame()` | Rétrocompatibilité : renvoie la globale gameConnection, qui vaut nil (n'est plus un objet de scène). | 83 |
| `importPersistentData()` | Inverse d'exportPersistentData, appelée à la fin de init(). En cas d'erreur de désérialisation, journalise et écrit persistentDataError.txt. | 1278 |
| `init(reason)` | Initialise la VM GE au démarrage et au rechargement (Ctrl+L) : initSettings, réserve _tr, active detectGlobalWrites, charge les extensions de démarrage (+ util_materialHotReload sous Windows), ouvre la session en ligne, importPersistentData, demande l'état de l'UI (guihooks 'isUIReady'), appelle core_modmanager.onUiReady(), map.assureLoad(), crée les dossiers mods et trackEditor, puis luaReady=true. | 1044 |
| `isLuaReady()` | Permet à l'UI de savoir si init() est terminée. | 1039 |
| `isSafeMode()` | Indique si le jeu a été lancé avec l'argument de ligne de commande -safemode. | 126 |
| `loadDirRec(dir)` | Charge récursivement les matériaux d'un dossier : d'abord *materials.cs (TorqueScript), puis *materials.json, puis *datablocks.json. | 1393 |
| `loadGameModeModules(...)` | OBSOLÈTE : unloadAutoExtensions() + loadPresetExtensions() + extensions.load(...) avec journal d'erreur. | 1627 |
| `loadManualUnloadExtensions()` | Charge toutes les extensions en unloadMode 'manual'. | 405 |
| `loadPresetExtensions()` | Charge la liste presetExtensions (+ celles demandées en ligne de commande via queueCmdlineLevelLoadExtension), puis vide cette liste de ligne de commande (usage unique). | 415 |
| `load_spawn_prefabv2_indirect()` | Test de dev : spawnPrefab de test_v2.prefab.json via spawnPrefab. | 1808 |
| `load_test_prefabv1()` | Test de dev : spawn du prefab /levels/smallgrid/test_v1.prefab.json. | 1717 |
| `load_test_prefabv2()` | Test de dev : charge /levels/smallgrid/test_v2.prefab.json comme PrefabV2 'test_v2'. | 1724 |
| `log(...)` | Remplacement global de log : transmet tous les arguments à Lua:log (niveau 'D','I','W','E','A', origine, message). | 30 |
| `luaPreRender(dtReal, dtSim, dtRaw)` | Appelée à chaque frame par le moteur, juste avant le rendu et après la physique. Ordre : map.updateGFX, hook onPreRender(dtReal, dtSim, dtRaw), hook onDrawDebug(Lua.lastDebugFocusPos, dtReal, dtSim, dtRaw), puis, si worldReadyState==1, attend que les matériaux du véhicule joueur soient prêts (max 5 s) pour quitter l'écran de chargement, passer worldReadyState à 2 et émettre onWorldReadyState(2). | 878 |
| `onAiModeChange(vehicleID, newAiMode)` | Le mode de l'IA d'un véhicule a changé ; émet onAiModeChange. | 1221 |
| `onAiRouteDone(vehicleID)` | L'IA a terminé sa route ; émet onAiRouteDone(vehicleID). | 1225 |
| `onBeamNGTrigger(data)` | Nom de fonction par défaut du callback des BeamNGTrigger côté C++ ; émet le hook onBeamNGTrigger(data). | 1122 |
| `onBeamNGWaypoint(args)` | Appelée par le moteur quand un véhicule franchit un waypoint BeamNG (objet de scène). Appelle map.onWaypoint puis émet onBeamNGWaypoint(args). | 1116 |
| `onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | Un attelage s'est accroché ; émet onCouplerAttached. | 1208 |
| `onCouplerDetach(objId, nodeId)` | Déclenchée quand l'utilisateur détache volontairement l'attelage d'une remorque ; émet onCouplerDetach(objId, nodeId). | 1217 |
| `onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)` | Un attelage s'est détaché ; émet onCouplerDetached. | 1212 |
| `onExit()` | Appelée directement par le C++ à la sortie : émet onExit, déconnecte le serveur, détruit PhysicsPlugin, poste l'évènement 'onExit' du MainEventManager, puis settings.exit(). | 1456 |
| `onFileChanged(files)` | Appelée par le moteur quand des fichiers surveillés changent. Appelle settings.onFilesChanged et map.onFilesChanged, émet onFilesChanged(files), puis pour chaque fichier onFileChanged(filename, type), enfin onFileChangedEnd. | 1126 |
| `onGameEngineStartup()` | Appelée une fois par le moteur au démarrage de la VM : crée les dossiers settings/ et screenshots/, l'EventManager 'MainEventManager', parse la ligne de commande, initialise le core et le client (client/core, client/init), PhysicsPlugin, puis charge le niveau $levelToLoad éventuel via core_loadMapCmd (différé jusqu'à ce que le mod manager soit prêt). | 1493 |
| `onInstabilityDetected(vid)` | Appelée par le moteur physique quand un véhicule est instable : journalise les véhicules proches (< 1 m), affiche un message UI, émet onInstabilityDetected(vid, returnData), puis, si non géré, met le véhicule en mode fantôme et le téléporte sur place ; une 2e instabilité dans la seconde supprime le véhicule. | 1328 |
| `onLuaReloadCompleted()` | Logue la durée totale du rechargement et efface luaReloadStartTime. Appelée par tryCompleteLuaReload quand jobs, settings, UI, mod manager (et MCP) sont prêts. | 1589 |
| `onLuaReloadModManagerCompleted()` | Signale que le mod manager a fini après un rechargement Lua. | 1585 |
| `onLuaReloaded(reloadStartTime)` | Appelée après un rechargement Lua (Ctrl+L) : client/core reloadCore, client/init reloadClient, mesure la durée et arme le suivi de fin de rechargement. | 1573 |
| `onMouseLocked(locked)` | Appelée quand le curseur est verrouillé/déverrouillé ; émet onMouseLocked(locked). | 1196 |
| `onPreExit()` | Appelée avant la sortie du jeu ; émet onPreExit (profilée). | 1448 |
| `onPreStart()` | Point d'entrée appelé par le moteur avant onGameEngineStartup ; corps vide. | 1440 |
| `onPreWindowClose()` | Appelée avant la fermeture de la fenêtre ; émet onPreWindowClose. | 1444 |
| `onScreenKeyboardClosed(applied, text)` | Le clavier virtuel est fermé ; émet onScreenKeyboardClosed(applied, text). | 1324 |
| `onSetClusterPosRelRot(vehicleID, cNodeId)` | Callback asynchrone quand un cluster de nœuds d'un véhicule est téléporté ; émet onSetClusterPosRelRot(vehicleID, cNodeId). | 1181 |
| `onSpawnError(status, jbeamFilename)` | Erreur de création d'un véhicule : journalise et affiche un toast d'erreur dans l'UI. | 1374 |
| `onTexDrawPrimCompressDone(textureName)` | Une texture dessinée est compressée ; émet onTexDrawPrimCompressDone(textureName). | 1594 |
| `openXRErrorDetected(...)` | Transmet à render_openxr.errorDetected si ce module existe. | 1238 |
| `openXRStateChanged(state)` | Transmet à render_openxr.stateChanged si ce module existe. | 1233 |
| `physicsEngineEvent(...)` | Relaie un évènement du moteur physique : hook onPhysicsEngineEvent. Seul le premier argument est transmis (voir notes). | 1139 |
| `physicsStateChanged(val)` | La simulation physique est mise en pause/reprise. Relaye l'évènement UI 'physicsStateChanged' puis émet onPhysicsUnpaused (val vrai) ou onPhysicsPaused. | 1296 |
| `prepareStartupExtensionsList()` | Si PlatformSwitches.useEditor est vrai, ajoute editor_main et editor_veMain à la liste des extensions de démarrage ; recalcule la liste des extensions en déchargement manuel. Appelée par init(). | 393 |
| `print(...)` | Remplacement global de print : écrit via log('A','print', tostring(...)). Seul le premier argument est converti et journalisé. | 34 |
| `queueCmdlineLevelLoadExtension(extension)` | Ajoute une extension à charger au prochain loadPresetExtensions (utilisé pour les extensions demandées en ligne de commande). | 469 |
| `refreshMainMenuMusicRouteState()` | Lit la route courante dans ui_router.getCurrent() et appelle setMainMenuMusicRouteState. | 801 |
| `registerCoreModule(extensionName)` | OBSOLÈTE : équivaut à setExtensionUnloadMode(nom, 'manual'). | 1639 |
| `replaySpawnVehicle(jbeamFilename, partConfigData)` | Appelée par le moteur de replay pour recréer un véhicule en (0,0,0) ; le joueur n'y est installé que s'il n'a pas encore de véhicule. S'il n'y a qu'un véhicule enterable, passe en caméra de jeu. | 1244 |
| `replayStartLevel(levelPath)` | Appelée par le replay : core_replay.startLevel(levelPath). | 1256 |
| `replayStateChanged(...)` | Transmet à core_replay.stateChanged(...). | 1229 |
| `requestGeluaProfile()` | Appelée par le C++ quand un journal de performance est voulu : crée un LuaProfiler pour la prochaine frame (update + luaPreRender), activé dans les extensions. | 873 |
| `resetGameplay(playerID)` | Émet onResetGameplay(playerID). | 1379 |
| `returnToMainMenu(callback)` | Quitte le mode de jeu actif (endActiveGameMode) et demande l'état de jeu par défaut (menu principal). Le callback est appelé quand le niveau est déchargé et qu'un nouveau peut être chargé. | 848 |
| `runMimalloc_test()` | Debug : appelle Engine.Debug.mimalloc_test(). | 859 |
| `sendUIModules()` | Envoie à l'UI (évènement 'onUIBootstrap') la liste des dossiers de /ui/modModules/ ; liste vide en cas d'erreur. | 1383 |
| `setExtensionUnloadMode(extension, unloadMode)` | Définit si une extension survit aux changements de niveau ('manual') ou peut être déchargée automatiquement ('auto', défaut). Logue une erreur si l'extension ou le mode est inconnu. | 425 |
| `setMainMenuMusicKeepAlive(active)` | Force la musique du menu principal à continuer (true) ou rend la main à la logique par route UI (false). Ne fait rien si l'état ne change pas. | 704 |
| `setMainMenuMusicPauseRequest(requestId, active)` | Enregistre ou retire une demande de pause de la musique du menu identifiée par requestId, puis rafraîchit l'état. | 715 |
| `setMainMenuMusicRouteState(routeName)` | Applique la logique de musique selon la route UI : pause demandée > keepAlive > route 'menu' (reprise) > niveau chargé (arrêt avec fondu 0,6 s) > route 'menu.credits' (extension ui_credits) > route 'menu.uiSounds' (pause) > reprise. | 757 |
| `test_prefabv2()` | Test de dev : construit des SimGroup et TSStatic dans MissionGroup puis supprime thePlayer, spawn_default, ParticleEmitter. | 1649 |
| `test_spawn_prefabv2()` | Test de dev : instancie 'test_v2' à (6,3,2), échelle 1,5, rotation 45° en Z. | 1743 |
| `test_spawn_prefabv2_massive(count)` | Test de dev : instancie count copies aléatoires de 'test_v2' dans MissionGroup. | 1770 |
| `test_unload_prefabv2()` | Test de dev : supprime l'objet 'test_v2'. | 1800 |
| `uiReady()` | Appelée quand l'UI est prête. Émet onUiReady et marque l'UI prête pour la finalisation d'un rechargement Lua. | 1032 |
| `unloadAutoExtensions()` | Décharge toutes les extensions sauf celles en mode 'manual' (extensions.unloadExcept). À appeler lors du changement de mode de jeu/niveau. | 410 |
| `update(dtReal, dtSim, dtRaw)` | Appelée à chaque frame par le moteur, après les entrées et avant la physique. Voir notes : settingsTick, core_input_bindings.updateGFX, simTimeAuthority.update, hook onUpdate(dtReal, dtSim, dtRaw), gestion des véhicules instables, et si l'UI doit être rafraîchie hook onGuiUpdate + envoi des streams guihooks. | 991 |
| `updateFirstFrame()` | Appelée par le moteur à la première frame. Émet onFirstUpdate, settings.finalizeInit(), synchronise l'état de l'éditeur, traite les arguments de ligne de commande de première frame (-flowgraph, -compilemeshes, -convertCSMaterials, -deps, -disableDynamicCollision, -enablemcp, etc.) et appelle uiReady() directement avec -noui ou en mode headless. | 973 |
| `updateLoadingProgress(val, txt)` | Met à jour la barre de chargement UI (évènement 'UpdateProgress') et force un repaint du Canvas pendant le chargement d'un niveau ; stocke $lastProgress et $$lastProgressTxt. | 1598 |
| `updateTSShapeLoadProgressDynamic(progress, msg)` | Utilise updateTSShapeLoadProgress si défini (éditeur chargé), sinon updateLoadingProgress. | 1615 |
| `updateTranslations()` | Démonte mods/translations.zip s'il est monté, télécharge locales_v2.zip via core_repository.installMod, puis recharge les réglages. | 1305 |
| `validateLevelPrefabs(levelPath)` | Outil de dev : appelle validatePrefabJson sur chaque *.prefab.json de levelPath. | 168 |
| `validatePrefabJson(filepath)` | Outil de dev : recharge un .prefab.json et le resauvegarde au même endroit (normalisation du format). | 153 |
| `vehicleActiveChanged(vehicleID, active, setActiveCount)` | Appelée quand un véhicule est activé/désactivé (ex. pooling du trafic). Sans rapport avec le changement de véhicule du joueur. Émet onVehicleActiveChanged. | 1192 |
| `vehicleDestroyed(vid)` | Appelée quand un véhicule est supprimé : oublie ses minuteries d'instabilité, émet onVehicleDestroyed(vid), invalide les caches de véhicules. | 1200 |
| `vehicleReset(vehicleID)` | Callback asynchrone après la réinitialisation d'un véhicule ; émet onVehicleResetted(vehicleID). | 1186 |
| `vehicleSpawned(vid)` | Appelée par le moteur quand un véhicule apparaît. Invalide les caches de véhicules, règle la gravité du véhicule (core_environment.getGravity), puis émet onPreVehicleSpawned(vid, veh) puis onVehicleSpawned(vid, veh). Ne fait rien si l'objet n'existe pas. | 1144 |
| `vehicleSwitched(oldVehicle, newVehicle, player)` | Appelée quand le joueur change de véhicule. Émet onVehicleSwitched(oldId, newId, player) (id -1 si absent) et l'évènement UI 'VehicleFocusChanged'. | 1166 |

**Globales affectées :** `MoveManager`, `Point3F`, `WinInput`, `bullettime`, `commands`, `doStartupProfiling`, `editor`, `extensions`, `guihooks`, `json`, `logAlways`, `map`, `parseArgs`, `perf`, `photoModeOpen`, `sailingTheHighSeas`, `screenshot`, `server`, `serverConnection`, `setSpawnpoint`, `settings`, `simTimeAuthority`, `spawn`, `vmType`, `worldReadyState`

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAiModeChange`
- `onAiRouteDone` — écouté par 1 module(s)
- `onBeamNGTrigger` — écouté par 8 module(s)
- `onBeamNGWaypoint`
- `onClientEndMission` — écouté par 83 module(s)
- `onClientPostStartMission` — écouté par 15 module(s)
- `onClientPreEndMission`
- `onClientPreStartMission` — écouté par 6 module(s)
- `onClientStartMission` — écouté par 40 module(s)
- `onCouplerAttached` — écouté par 4 module(s)
- `onCouplerDetach`
- `onCouplerDetached` — écouté par 4 module(s)
- `onDrawDebug` — écouté par 3 module(s)
- `onEditorEnabled`
- `onExit` — écouté par 16 module(s)
- `onFileChanged` — écouté par 13 module(s)
- `onFileChangedEnd` — écouté par 1 module(s)
- `onFilesChanged` — écouté par 12 module(s)
- `onFirstUpdate` — écouté par 10 module(s)
- `onGuiUpdate` — écouté par 6 module(s)
- `onInstabilityDetected` — écouté par 4 module(s)
- `onMouseLocked` — écouté par 2 module(s)
- `onPhysicsEngineEvent`
- `onPhysicsPaused` — écouté par 3 module(s)
- `onPhysicsUnpaused` — écouté par 3 module(s)
- `onPreExit` — écouté par 1 module(s)
- `onPreRender` — écouté par 53 module(s)
- `onPreVehicleSpawned` — écouté par 1 module(s)
- `onPreWindowClose` — écouté par 1 module(s)
- `onResetGameplay` — écouté par 5 module(s)
- `onScreenKeyboardClosed` — écouté par 1 module(s)
- `onSetClusterPosRelRot`
- `onTexDrawPrimCompressDone`
- `onUiReady` — écouté par 6 module(s)
- `onUpdate` — écouté par 186 module(s)
- `onVehicleActiveChanged` — écouté par 8 module(s)
- `onVehicleDestroyed` — écouté par 39 module(s)
- `onVehicleResetted` — écouté par 29 module(s)
- `onVehicleSpawned` — écouté par 34 module(s)
- `onVehicleSwitched` — écouté par 57 module(s)
- `onWorldReadyState` — écouté par 4 module(s)

**Évènements UI (guihooks.trigger) :** `CEFTypingLostFocus`, `PreStartMission`, `UpdateProgress`, `VehicleFocusChanged`, `isUIReady`, `onUIBootstrap`, `physicsStateChanged`, `toastrMsg`

## Appels vers le moteur (C++)

- `Engine.` `getEditorEnabled`, `getStartingArgs`
- `FS:` `directoryCreate`, `directoryExists`, `directoryList`, `fileExists`, `findFiles`, `getFileRealPath`, `getUserPath`, `isMounted`, `unmount`
- `Lua:` `log`
- `Sim.` `clearSimObjectCache`
- `TorqueScriptLua.` `exec`
- `be:` `getEnterableObjectCount`, `getUpdateUIflag`, `physicsStopSimulation`, `queueObjectFastLua`, `setDynamicCollisionEnabled`
- `core_environment.` `getGravity`
- `obj:` `delete`, `getClassName`, `getName`, `registerObject`, `setField`, `setPosition`
- `scenetree.` `findObject`, `findObjectById`, `getAllObjects`

**Charge les extensions :** `core_loadMapCmd`, `editor_flowgraphEditor`, `util_materialHotReload`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/main.lua`.*
