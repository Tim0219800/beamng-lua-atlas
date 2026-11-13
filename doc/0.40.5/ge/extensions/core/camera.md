# `core_camera`

*Fichier : `lua/ge/extensions/core/camera.lua` · VM : Game Engine (GE) · 2220 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_camera` : `extensions.load("core_camera")`, puis la globale `core_camera`

Extension GE (core_camera, dépend de core_vehicle_manager et core_environment) : gestionnaire central de toutes les caméras du jeu. Elle charge les modes de caméra du dossier lua/ge/extensions/core/cameraModes (un fichier par mode), crée pour chaque véhicule une instance de chaque mode (configurée par la section jbeam 'camera') et gère des instances 'globales' (free, observer, path, bigMap...) qui existent une seule fois sans véhicule. Elle décide quelle caméra est active (par joueur), gère la configuration utilisateur (ordre et activation des caméras, menu Options > Caméras, sauvegardée dans les réglages cameraConfig et freeCameraConfig), le cycle des caméras (touches), les transitions, et expose la position/orientation/FOV finaux. Le calcul par frame est dans core/cameraUpdate.lua, les entrées dans core/cameraInput.lua (ré-exposées ici). Un moddeur s'en sert pour lire la position de la caméra, changer de caméra par nom, piloter la caméra libre ou créer des vues supplémentaires (contextes).

## Exemple

```lua
local pos = core_camera.getPosition()
local fwd = core_camera.getForward()
core_camera.setByName(0, 'orbit', true)          -- caméra de véhicule du joueur 0
core_camera.setByName('free')                    -- caméra globale
core_camera.setPosition(0, vec3(0,0,100))        -- seulement en caméra libre
```

## Remarques

- Choix de la caméra active : si ctx.activeGlobalCameraName est défini (caméra globale, ex. 'free', 'observer', 'bigMap'), c'est elle qui est utilisée ; sinon c'est la caméra 'focusedCamName' du véhicule du joueur (parmi vdata.cameras, ordre de la liste 'configuration').
- Contextes : une vue = un contexte. 'main' est la vue du joueur (RenderView 'main') ; createContext ajoute des vues supplémentaires (écran partagé, flux vidéo). Presque toutes les fonctions get*(ctxId) prennent un identifiant de contexte (nil = main).
- Les fonctions adressées par véhicule (setRotation, setFOV, setOffset, setRef, setRefNodes, setTargetMode, setDistance, setMaxDistance, setDefaultDistance, setDefaultRotation, setSkipFovModifier, resetCameraByID, setup) agissent toujours sur la vue principale et appellent la méthode du même nom sur la caméra globale active ou la caméra focalisée du véhicule ; si cette caméra n'a pas la méthode, rien ne se passe.
- Les fonctions adressées par joueur (setPosition, clearMotion, clearAngularMotion, setSmoothedCam, setNewtonRotation, setNewtonTranslation, resetCamera, hotkey) agissent sur la vue du joueur (pid) ; setPosition ne positionne la caméra que si la caméra globale 'free' est active.
- Configuration des caméras : liste par défaut {orbit, driver, onboard.hood, external, relative, chase, droneChase}, remplacée par le réglage utilisateur cameraConfig si sa version >= 2 ; les autres caméras du véhicule sont ajoutées à la suite (triées par le champ order), les caméras 'occupant.*' sont insérées avant 'onboard.hood'. Un mode peut avoir disabledByDefault = true.
- Les types de mode 'onboard' et 'occupant' sont 'multicam' : le jbeam peut définir plusieurs entrées, nommées '<mode>.<nom>' (ex. 'onboard.driver', 'occupant.xxx'). Le mode 'driver' hérité est un alias du constructeur 'occupant' (constructorsCache.driver).
- Les modes marqués isFilter (autopoint, autozoom, bobbing...) ne deviennent jamais des caméras sélectionnables : ils sont créés mais ignorés par initCam ; d'autres modes les instancient pour traiter leur propre résultat.
- Cache : l'ajout ou la suppression d'un fichier dans cameraModes (onFileChanged) invalide les constructeurs et les caches de tous les contextes (rechargement à chaud).
- Incohérence : M.objectTeleported est affecté depuis la globale objectTeleported définie dans utils.lua (marqué obsolète dans le code : utiliser directement objectTeleported). L'index automatique signale à tort cette référence comme non définie.
- Incohérence : setVehicleCameraByNameWithId utilise la variable `player` (inexistante dans la fonction, donc nil) dans son message d'erreur.
- Incohérence : getCameraUnicycleZoom est local et non exporté (seuls setCameraUnicycleZoom et unicycleZoomToggle le sont), contrairement à getCameraDriverZoom.
- L'extension remplace la globale MoveManager par sa propre table d'entrées (newMove) et la repointe vers la vue en cours de mise à jour à chaque frame.

**Dépendances (chargées avant) :** `core_vehicle_manager`, `core_environment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_camera.changeFreeCameraOrder(camId, offset)` | Déplace une caméra libre dans la configuration des caméras 'world' et sauvegarde (réglage freeCameraConfig). | 622 |
| `core_camera.changeOrder(camId, offset)` | Déplace la caméra d'indice camId de offset positions dans la liste de configuration (en sautant les caméras cachées), puis sauvegarde. | 586 |
| `core_camera.changeSpeed(val)` | Multiplie ou divise la vitesse de la caméra de la vue principale par (1 + 0.2*\|val\|) selon le signe, bornée entre 2 et 100, et affiche un message. Ignorée si le zoom caméra est désactivé dans l'éditeur. | 1879 |
| `core_camera.clearAngularMotion(pid)` | Annule le mouvement angulaire de la caméra du joueur. | 1447 |
| `core_camera.clearInputs(mm)` | Remet à zéro les entrées de rotation et de zoom (roulis, tangage, lacet, zoom) d'une structure MoveManager. Utilisé par d'autres scripts GE. | 574 |
| `core_camera.clearMotion(pid)` | Annule le mouvement (vitesse) de la caméra du joueur (cam:clearMotion). | 1443 |
| `core_camera.createContext(id, renderView, player, vehiclePlayer)` | Crée (ou met à jour) un contexte de caméra supplémentaire = une sortie caméra avec sa propre RenderView, réutilisant tous les modes de caméra. L'identifiant 'main' (ou nil) renvoie le contexte principal. Le rendu cible (résolution, texture) est géré par l'appelant. vehiclePlayer permet à la vue d'afficher le véhicule d'un autre siège alors que player ne fait que fournir l'entrée. | 1908 |
| `core_camera.cycleCameraGroup(player)` | Passe au groupe de caméras suivant (caméras de jeu, puis caméras libres 'world', puis retour), entre dans la première caméra du groupe, émet onCameraToggled et affiche le nom. | 693 |
| `core_camera.destroyContext(id)` | Détruit un contexte supplémentaire (jamais le principal) et vide le cache des caméras du contexte principal. | 1923 |
| `core_camera.displayCameraNameUI(player)` | Envoie à l'UI (app Messages) le nom de la caméra courante avec le nombre d'options et l'indice courant. Ne fait rien pour une unicycle (marche à pied). | 412 |
| `core_camera.driverZoomToggle(player)` | Bascule le zoom de la caméra conducteur entre 0 et 1. | 1803 |
| `core_camera.exitCinematicCamera()` | Compatibilité : quitte la caméra globale (setGlobalCameraByName(nil)). | 2096 |
| `core_camera.getActiveCamName(player)` | Nom de la caméra active du joueur : caméra globale si active, sinon caméra de véhicule (ou celle demandée en attente). nil si le joueur n'a pas de véhicule. | 939 |
| `core_camera.getActiveCamNameByVehId(vehId)` | Nom de la caméra focalisée d'un véhicule (vue principale). | 958 |
| `core_camera.getActiveGlobalCameraName(player)` | Nom de la caméra globale active pour le joueur, nil si c'est une caméra de véhicule. | 1893 |
| `core_camera.getCameraDataById(vid, ctxId)` | Renvoie les instances de caméras d'un véhicule. | 899 |
| `core_camera.getCameraDriverZoom(player)` | Zoom actuel de la caméra conducteur. | 1799 |
| `core_camera.getCameraGroups(ctx)` | Liste triée des noms de groupes de caméras ayant au moins une caméra utilisable. | 304 |
| `core_camera.getConfigurationReadOnly()` | Copie profonde de la liste de configuration des caméras de véhicule ({name, enabled}). | 382 |
| `core_camera.getContextCameraParams(id)` | Réglages ajustables de la caméra active d'un contexte, pour l'UI de contrôle de caméra / flux vidéo. Chaque mode fournit sa liste via listParams ; descripteurs {key, title, kind ('range'\|'bool'\|'choice'\|'slots'), type ('float'\|'int'\|'bool'\|'enum'), value, icon, default, min, max, step, unit, options}. | 2023 |
| `core_camera.getContextCameraState(id)` | Instantané léger et sérialisable (JSON) de la caméra d'un contexte : nom, pose monde (pos, rot, fov) et état propre du mode (data, via cam:serialize) pour pouvoir la restaurer. | 1983 |
| `core_camera.getContextIdForPlayer(player)` | Identifiant de la vue par laquelle regarde ce joueur, utilisable avec les getters get*(ctxId). nil = vue principale. | 1942 |
| `core_camera.getContextIds()` | Liste des identifiants de contextes ('main' en premier). | 1935 |
| `core_camera.getDriverCameraNameById(vehId, ctxId)` | Nom de la caméra conducteur : 'driver' (si 'onboard.driver' existe) ou le nom d'une caméra 'occupant.*' en mode permission 'driver'. | 923 |
| `core_camera.getDriverData(veh, ctxId)` | Comme getDriverDataById à partir d'un objet véhicule. | 935 |
| `core_camera.getDriverDataById(vehId, ctxId)` | Données de la caméra conducteur d'un véhicule. | 927 |
| `core_camera.getForward(ctxId)` | Vecteur 'avant' de la caméra (axe y tourné par l'orientation). | 1833 |
| `core_camera.getForwardXYZ(ctxId)` | Vecteur avant en composantes séparées (utilise un vec3 interne réutilisé). | 1840 |
| `core_camera.getFovDeg(ctxId)` | Champ de vision final en degrés. | 1871 |
| `core_camera.getFovRad(ctxId)` | Champ de vision final en radians. | 1875 |
| `core_camera.getFreeCameraConfigurationReadOnly()` | Copie profonde de la configuration (ordre, activation) des caméras libres du groupe 'world'. | 386 |
| `core_camera.getGlobalCameras(ctx)` | Renvoie la table nom -> instance des caméras globales (une fois par contexte, créées à la demande à partir des constructeurs où cam.isGlobal est vrai). | 199 |
| `core_camera.getGroupCams(ctx, groupName, includeDisabled)` | Liste des noms de caméras d'un groupe (ex. 'world'), dans l'ordre configuré. Les caméras 'world' désactivées sont omises sauf si includeDisabled est vrai (elles restent visibles dans les options mais sont sautées lors du cycle). | 277 |
| `core_camera.getLookBack()` | Etat 'regard vers l'arrière' de la vue principale. | 1783 |
| `core_camera.getPosition(ctxId)` | Position finale de la caméra (copie). | 1812 |
| `core_camera.getPositionXYZ(ctxId)` | Position finale en composantes séparées (évite l'allocation). | 1816 |
| `core_camera.getQuat(ctxId)` | Orientation finale de la caméra (copie). | 1846 |
| `core_camera.getQuatXYZW(ctxId)` | Orientation en composantes séparées. | 1866 |
| `core_camera.getRight(ctxId)` | Vecteur 'droite' de la caméra (axe x tourné par l'orientation). | 1827 |
| `core_camera.getSpeed(ctxId)` | Vitesse de déplacement de la caméra libre d'un contexte (30 par défaut). | 1774 |
| `core_camera.getUp(ctxId)` | Vecteur 'haut' de la caméra (axe z tourné par l'orientation). | 1821 |
| `core_camera.getYawPitchRoll()` | Lacet, tangage et roulis de la caméra principale en une seule fois. | 1851 |
| `core_camera.globalCameraFunction(globalCameraName, functionName, ...)` | Appelle la méthode functionName d'une caméra globale nommée. Loggue une erreur si la caméra ou la méthode n'existe pas. | 1463 |
| `core_camera.hotkey(player, hotkeyid, modifier)` | Transmet une touche de raccourci à la caméra active (méthode hotkey du mode). | 1546 |
| `core_camera.isCameraInside(player, camPos)` | Teste si une position de caméra est à l'intérieur du véhicule du joueur (dans sa boîte orientée et à moins de 0,6 m d'un point de vue 'inside' d'une caméra). | 881 |
| `core_camera.isWorldCamera(player)` | Teste si la caméra active du joueur appartient au groupe 'world' (caméras libres). | 1973 |
| `core_camera.nextCameraGroup(groups, active)` | Calcule le groupe suivant dans l'anneau de cycle : caméras de jeu (active = nil) vers le premier groupe, entre groupes, puis du dernier groupe vers les caméras de jeu (nil). active = false (caméra système) renvoie nil. | 324 |
| `core_camera.notifyUI(vdata, forcedCamName)` | Prévient l'UI et les extensions du changement de caméra : guihooks 'onCameraNameChanged', hook onCameraModeChanged, puis mise à jour du menu d'options. | 557 |
| `core_camera.onCameraToggled(data)` | Hook (émis par cycleCameraGroup, setCameraByNameFromOptions) : réaffiche le nom de la caméra du joueur 0. *(interne)* *(hook)* | 488 |
| `core_camera.onClientEndMission()` | Hook appelé à la fin du niveau : détache la caméra de la RenderView 'main' pour éviter une référence morte. *(interne)* *(hook)* | 1749 |
| `core_camera.onClientPostStartMission()` | Hook appelé après le démarrage du niveau : délégué à core/cameraUpdate.lua. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `core_camera.onDeserialized(data)` | Hook de restauration après rechargement Lua (fusionne l'état sérialisé dans les caméras existantes). *(interne)* *(hook)* | 1694 |
| `core_camera.onDespawnObject(vid, isReloading)` | Hook appelé à la suppression d'un objet : retire ses données caméra si ce n'est pas un rechargement. *(interne)* *(hook)* | 1582 |
| `core_camera.onFileChanged(filePath, changeType)` | Hook appelé quand un fichier change : l'ajout/suppression d'un fichier de cameraModes invalide les caches (rechargement à chaud). *(interne)* *(hook)* | 1743 |
| `core_camera.onMouseLocked(locked)` | Hook appelé quand la souris est verrouillée/déverrouillée : transmis à la caméra active (mouseLocked), sauf en caméra libre. *(interne)* *(hook)* | 1576 |
| `core_camera.onPreRender(...)` | Hook appelé juste avant le rendu : met à jour la caméra (cameraUpdate.onPreRender), puis affiche le nom de caméra en attente après un changement de véhicule. *(interne)* *(hook)* | 1655 |
| `core_camera.onReplayStateChanged(newState)` | Hook appelé quand l'état du replay change : à la sortie d'une lecture ('playback' vers 'inactive'), vide le cache des caméras de véhicules (les véhicules supprimés par le replay seraient sinon perdus). *(interne)* *(hook)* | 2203 |
| `core_camera.onScenarioChange(...)` | Hook appelé quand l'état du scénario change : propagé aux caméras ; si un trigger était en attente et que le scénario passe à 'running', il est rejoué. *(interne)* *(hook)* | 1632 |
| `core_camera.onScenarioRestarted(...)` | Hook appelé au redémarrage d'un scénario : propagé à toutes les caméras. *(interne)* *(hook)* | 1628 |
| `core_camera.onSerialize()` | Hook de sérialisation avant rechargement Lua : sérialise les caméras globales et de véhicules, la caméra globale active, le dernier véhicule, le trigger en attente et les demandes de caméra. *(interne)* *(hook)* | 1663 |
| `core_camera.onSettingsChanged(...)` | Hook appelé quand les réglages changent : applique le lissage de la caméra libre et propage onSettingsChanged à toutes les caméras. *(interne)* *(hook)* | 1610 |
| `core_camera.onTrigger(trigger)` | Hook appelé par les triggers BeamNG : si le sujet est le véhicule du joueur (ou le triggerOverride), 'enter' avec cameraOnEnter bascule sur la caméra globale 'observer' pointant cet objet caméra, et 'exit' avec cameraOnLeave la quitte. Pendant le démarrage d'un scénario, la demande est mise en attente jusqu'à l'état 'running'. *(interne)* *(hook)* | 1481 |
| `core_camera.onVehicleDestroyed(vid)` | Hook appelé quand un véhicule est détruit : retire ses données caméra de tous les contextes. *(interne)* *(hook)* | 177 |
| `core_camera.onVehicleReplaced(vid)` | Hook appelé quand un véhicule est remplacé (nouvelle config) : recrée ses caméras. *(interne)* *(hook)* | 169 |
| `core_camera.onVehicleResetted(vid, ...)` | Hook appelé quand un véhicule est réinitialisé : propage aux caméras du véhicule et réinitialise la caméra focalisée sauf si resetCameraOnVehicleReset vaut false ou si une caméra globale est active. *(interne)* *(hook)* | 1563 |
| `core_camera.onVehicleSpawned(vid)` | Hook appelé à la création d'un véhicule : crée ses données caméra dans chaque contexte. *(interne)* *(hook)* | 161 |
| `core_camera.onVehicleSwitched(oldId, newId, player)` | Hook appelé quand le joueur change de véhicule : lance une transition (hors caméra globale), propage aux caméras et programme l'affichage du nom. Ignore les joueurs autres que 0. *(interne)* *(hook)* | 1644 |
| `core_camera.processVehicleCameraConfigChanged(vid, vdata, focusedCamNamePrevious, ctx)` | (Re)crée les instances de caméras d'un véhicule d'après ses données jbeam (cameraData), met à jour la configuration partagée (ordre, activation, sauvegardée par le contexte principal), puis choisit la caméra : demande en attente, sinon caméra précédente, sinon première caméra activée et visible, sinon première existante. Renvoie false si les données du véhicule ne sont pas encore disponibles. | 1021 |
| `core_camera.proxy_Player(fct, ...)` | Appelle la méthode fct sur la caméra active du joueur 0 (globale ou focalisée). | 1476 |
| `core_camera.requestConfig(forcedCamName)` | Demande l'envoi de la configuration actuelle au menu Options > Caméras (guihooks CameraConfigChanged). | 568 |
| `core_camera.resetCamera(player)` | Remet à zéro les entrées de la vue du joueur, émet le hook onCameraReset et appelle reset() sur la caméra active. | 1540 |
| `core_camera.resetCameraByID(vid, ...)` | Appelle reset() sur la caméra (globale active ou focalisée du véhicule) de la vue principale. | 1359 |
| `core_camera.resetConfiguration()` | Efface les réglages cameraConfig et freeCameraConfig et recalcule la configuration pour tous les véhicules. | 1617 |
| `core_camera.setByName(...)` | Sélectionne une caméra par nom. Signature souple : setByName(player, camName, withTransition, customData) si le premier argument est un nombre, sinon setByName(camName, withTransition, customData). Un nom de caméra globale (ou nil) agit sur la vue globale ; sinon c'est la caméra de véhicule du joueur. | 838 |
| `core_camera.setBySlotId(player, slotId)` | Sélectionne la caméra associée à un numéro de raccourci (touches 1 à 9, slotId calculé sur les caméras visibles). | 977 |
| `core_camera.setCameraByNameFromOptions(player, camName)` | Sélection depuis le menu Options : une caméra du groupe 'world' passe par enterGroupCam (et le hook onCameraToggled FreeCam), sinon c'est une caméra de véhicule. Affiche le nom si la sélection réussit. | 851 |
| `core_camera.setCameraDriverZoom(value, player)` | Définit le zoom de la caméra conducteur. | 1795 |
| `core_camera.setCameraUnicycleZoom(value, player)` | Définit le zoom de la caméra en marche à pied (unicycle). | 1787 |
| `core_camera.setContextCamera(id, camName, withTransition, customData)` | Sélectionne une caméra sur un contexte sans toucher au joueur. camName nil ou nom de caméra globale : caméra globale (initialisée avec la pose actuelle de la vue) ; sinon caméra de véhicule du joueur du contexte. | 1949 |
| `core_camera.setContextCameraParam(id, key, value)` | Applique un réglage à la caméra active d'un contexte en déléguant à cam:setParam(key, value, id). | 2032 |
| `core_camera.setContextCameraState(id, state)` | Restaure la caméra d'un contexte depuis un instantané de getContextCameraState. Un mode avec deserialize restaure son état ; une caméra libre/globale sans deserialize est replacée à la pose sauvegardée. | 2002 |
| `core_camera.setDefaultDistance(vid, ...)` | Délègue cam:setDefaultDistance(...) à la caméra. | 1407 |
| `core_camera.setDefaultRotation(vid, ...)` | Délègue cam:setDefaultRotation(...) à la caméra. | 1419 |
| `core_camera.setDistance(vid, ...)` | Délègue cam:setDistance(...) à la caméra. | 1411 |
| `core_camera.setFOV(vid, ...)` | Fixe le champ de vision (degrés). Si 'free' est active, l'applique aussi au moteur ; puis cam:setFOV(...). | 1375 |
| `core_camera.setFastSpeedModifier(enabled)` | Active le modificateur de vitesse rapide (touche) de la vue principale. | 1757 |
| `core_camera.setFreeCameraYawPitchRollDeg(yawDeg, pitchDownDeg, rollDeg)` | Oriente la caméra libre (active seulement si la caméra globale 'free' est active) à partir de lacet, tangage (positif = regarder vers le bas) et roulis en degrés ; annule la vitesse angulaire. | 1233 |
| `core_camera.setGlobalCameraByName(name, withTransition, customData, ctx)` | Active une caméra globale par son nom, ou repasse à la caméra du véhicule avec nil. Appelle onCameraChanged(false) sur l'ancienne et setCustomData + onCameraChanged(true) sur la nouvelle ; dans la vue principale, émet le hook onGlobalCameraSet. Sans effet si le nom est inconnu ou s'il n'y a pas de véhicule pour revenir à la caméra de véhicule. | 639 |
| `core_camera.setInputTargetPlayer(player)` | Force toutes les entrées caméra à cibler le joueur donné (nil pour désactiver cette redirection). | 105 |
| `core_camera.setLookBack(player, enabled)` | Active/désactive le regard vers l'arrière pour le joueur. | 1779 |
| `core_camera.setMaxDistance(vid, ...)` | Délègue cam:setMaxDistance(...) à la caméra. | 1415 |
| `core_camera.setNewtonRotation(pid, ...)` | Active/désactive le mode 'Newton' (inertie) en rotation de la caméra libre. | 1455 |
| `core_camera.setNewtonTranslation(pid, ...)` | Active/désactive le mode 'Newton' (inertie) en translation de la caméra libre. | 1459 |
| `core_camera.setOffset(vid, ...)` | Délègue cam:setOffset(...) à la caméra de la vue principale. | 1387 |
| `core_camera.setPosRot(pid, px, py, pz, rx, ry, rz, rw)` | Place la caméra libre à une position (et orientation quaternion facultative). Sans effet si la caméra libre n'est pas active. | 1761 |
| `core_camera.setPosition(pid, ...)` | Fixe la position de la caméra (vec3 en premier argument supplémentaire). Si la caméra globale 'free' est active dans la vue principale, la position est aussi appliquée directement au moteur ; puis cam:setPosition(...) est appelé. | 1430 |
| `core_camera.setRef(vid, ...)` | Délègue cam:setRef(...) à la caméra. | 1399 |
| `core_camera.setRefNodes(vid, ...)` | Délègue cam:setRefNodes(...) (noeuds de référence centre, gauche, arrière). | 1395 |
| `core_camera.setRotation(vid, ...)` | Fixe l'orientation de la caméra. Si la caméra globale 'free' est active, applique aussi directement la rotation (quat) au moteur ; puis appelle cam:setRotation(...). | 1363 |
| `core_camera.setSkipFovModifier(vid, ...)` | Délègue cam:setSkipFovModifier(...) à la caméra. | 1423 |
| `core_camera.setSmoothedCam(pid, ...)` | Active/désactive le lissage de la caméra libre (cam:setSmoothedCam). | 1451 |
| `core_camera.setSpeed(speed, ctxId)` | Fixe la vitesse de déplacement de la caméra libre. | 1769 |
| `core_camera.setTargetMode(vid, ...)` | Délègue cam:setTargetMode(...) à la caméra. | 1403 |
| `core_camera.setVehicleCameraByIndexOffset(player, offset)` | Passe à la caméra suivante (offset = 1) ou précédente (-1) en sautant les cachées/désactivées. En caméra globale d'un groupe, cycle dans ce groupe. Utilisé par les actions d'entrée. | 1275 |
| `core_camera.setVehicleCameraByNameWithId(vehId, name, withTransition, customData, ctx)` | Sélectionne une caméra de véhicule pour le véhicule d'identifiant vehId. Si les données du véhicule ne sont pas encore prêtes, la demande est mémorisée et appliquée plus tard. | 800 |
| `core_camera.startCameraTransition(duration, player)` | Fond le point de vue actuel vers celui de la caméra de cette frame. À appeler juste après un changement de caméra. duration remplace la durée configurée. | 669 |
| `core_camera.toggleEnabledById(camId)` | Active ou désactive la caméra de véhicule d'indice camId dans le cycle (compatibilité) puis sauvegarde la configuration. | 613 |
| `core_camera.toggleFreeCameraEnabledById(camId)` | Active/désactive une caméra libre du groupe 'world' dans le cycle et sauvegarde. | 631 |
| `core_camera.unicycleZoomToggle(player)` | Bascule le zoom de la caméra en marche à pied entre 0 et 1. | 1807 |
| `core_camera.vehicleCamerasFunction(vid, functionName, ...)` | Exécute une méthode sur toutes les caméras d'un véhicule, dans tous les contextes. | 1551 |

### Détail des paramètres

#### `core_camera.changeFreeCameraOrder(camId, offset)`

Déplace une caméra libre dans la configuration des caméras 'world' et sauvegarde (réglage freeCameraConfig).

- `camId` (*integer*) : Indice dans la configuration libre
- `offset` (*integer*) : Décalage

#### `core_camera.changeOrder(camId, offset)`

Déplace la caméra d'indice camId de offset positions dans la liste de configuration (en sautant les caméras cachées), puis sauvegarde.

- `camId` (*integer*) : Indice dans la configuration (base 1)
- `offset` (*integer*) : Décalage, ex. -1 ou +1

#### `core_camera.changeSpeed(val)`

Multiplie ou divise la vitesse de la caméra de la vue principale par (1 + 0.2*|val|) selon le signe, bornée entre 2 et 100, et affiche un message. Ignorée si le zoom caméra est désactivé dans l'éditeur.

- `val` (*number*) : Variation signée (molette)

#### `core_camera.clearAngularMotion(pid)`

Annule le mouvement angulaire de la caméra du joueur.

- `pid` (*integer|nil*) : Joueur/vue

#### `core_camera.clearInputs(mm)`

Remet à zéro les entrées de rotation et de zoom (roulis, tangage, lacet, zoom) d'une structure MoveManager. Utilisé par d'autres scripts GE.

- `mm` (*table|nil*) : Structure d'entrées, MoveManager par défaut

#### `core_camera.clearMotion(pid)`

Annule le mouvement (vitesse) de la caméra du joueur (cam:clearMotion).

- `pid` (*integer|nil*) : Joueur/vue

#### `core_camera.createContext(id, renderView, player, vehiclePlayer)`

Crée (ou met à jour) un contexte de caméra supplémentaire = une sortie caméra avec sa propre RenderView, réutilisant tous les modes de caméra. L'identifiant 'main' (ou nil) renvoie le contexte principal. Le rendu cible (résolution, texture) est géré par l'appelant. vehiclePlayer permet à la vue d'afficher le véhicule d'un autre siège alors que player ne fait que fournir l'entrée.

- `id` (*string*) : Identifiant du contexte
- `renderView` (*string|nil*) : Nom de la RenderView (par défaut id)
- `player` (*integer|nil*) : Joueur/siège dont la vue suit les entrées (0 par défaut)
- `vehiclePlayer` (*integer|nil*) : Siège dont on prend le véhicule (facultatif)
- **renvoie** : table Contexte (table interne)

#### `core_camera.cycleCameraGroup(player)`

Passe au groupe de caméras suivant (caméras de jeu, puis caméras libres 'world', puis retour), entre dans la première caméra du groupe, émet onCameraToggled et affiche le nom.

- `player` (*integer|nil*) : Indice du joueur

#### `core_camera.destroyContext(id)`

Détruit un contexte supplémentaire (jamais le principal) et vide le cache des caméras du contexte principal.

- `id` (*string*) : Identifiant du contexte

#### `core_camera.displayCameraNameUI(player)`

Envoie à l'UI (app Messages) le nom de la caméra courante avec le nombre d'options et l'indice courant. Ne fait rien pour une unicycle (marche à pied).

- `player` (*integer|nil*) : Indice du joueur

#### `core_camera.driverZoomToggle(player)`

Bascule le zoom de la caméra conducteur entre 0 et 1.

- `player` (*integer|nil*) : Indice du joueur

#### `core_camera.getActiveCamName(player)`

Nom de la caméra active du joueur : caméra globale si active, sinon caméra de véhicule (ou celle demandée en attente). nil si le joueur n'a pas de véhicule.

- `player` (*integer|nil*) : Indice du joueur
- **renvoie** : string|nil Nom de la caméra

#### `core_camera.getActiveCamNameByVehId(vehId)`

Nom de la caméra focalisée d'un véhicule (vue principale).

- `vehId` (*integer*) : Identifiant du véhicule
- **renvoie** : string|nil Nom de la caméra

#### `core_camera.getActiveGlobalCameraName(player)`

Nom de la caméra globale active pour le joueur, nil si c'est une caméra de véhicule.

- `player` (*integer|nil*) : Indice du joueur
- **renvoie** : string|nil Nom de caméra globale

#### `core_camera.getCameraDataById(vid, ctxId)`

Renvoie les instances de caméras d'un véhicule.

- `vid` (*integer*) : Identifiant du véhicule
- `ctxId` (*string|nil*) : Identifiant de contexte (nil = main)
- **renvoie** : table<string, table>|nil Caméras par nom, nil si le véhicule est inconnu

#### `core_camera.getCameraDriverZoom(player)`

Zoom actuel de la caméra conducteur.

- `player` (*integer|nil*) : Indice du joueur
- **renvoie** : number|nil Zoom

#### `core_camera.getCameraGroups(ctx)`

Liste triée des noms de groupes de caméras ayant au moins une caméra utilisable.

- `ctx` (*table|nil*) : Contexte interne (nil = main)
- **renvoie** : table<integer, string> Noms de groupes

#### `core_camera.getConfigurationReadOnly()`

Copie profonde de la liste de configuration des caméras de véhicule ({name, enabled}).

- **renvoie** : table Liste de {name, enabled}

#### `core_camera.getContextCameraParams(id)`

Réglages ajustables de la caméra active d'un contexte, pour l'UI de contrôle de caméra / flux vidéo. Chaque mode fournit sa liste via listParams ; descripteurs {key, title, kind ('range'|'bool'|'choice'|'slots'), type ('float'|'int'|'bool'|'enum'), value, icon, default, min, max, step, unit, options}.

- `id` (*string|nil*) : Identifiant de contexte
- **renvoie** : table Liste de descripteurs (vide si aucun)

#### `core_camera.getContextCameraState(id)`

Instantané léger et sérialisable (JSON) de la caméra d'un contexte : nom, pose monde (pos, rot, fov) et état propre du mode (data, via cam:serialize) pour pouvoir la restaurer.

- `id` (*string|nil*) : Identifiant de contexte (nil = main)
- **renvoie** : table|nil {cam, pos={x,y,z}, rot={x,y,z,w}, fov, data}

#### `core_camera.getContextIdForPlayer(player)`

Identifiant de la vue par laquelle regarde ce joueur, utilisable avec les getters get*(ctxId). nil = vue principale.

- `player` (*integer|nil*) : Indice du joueur
- **renvoie** : string|nil Identifiant de contexte ou nil

#### `core_camera.getContextIds()`

Liste des identifiants de contextes ('main' en premier).

- **renvoie** : table<integer, string> Identifiants

#### `core_camera.getDriverCameraNameById(vehId, ctxId)`

Nom de la caméra conducteur : 'driver' (si 'onboard.driver' existe) ou le nom d'une caméra 'occupant.*' en mode permission 'driver'.

- `vehId` (*integer*) : Identifiant du véhicule
- `ctxId` (*string|nil*) : Contexte
- **renvoie** : string|nil Nom de caméra conducteur

#### `core_camera.getDriverData(veh, ctxId)`

Comme getDriverDataById à partir d'un objet véhicule.

- `veh` (*userdata|nil*) : Véhicule
- `ctxId` (*string|nil*) : Contexte
- **renvoie** : integer|nil camNodeID
- **renvoie** : boolean rightHandCamera
- **renvoie** : boolean rightHandDoor

#### `core_camera.getDriverDataById(vehId, ctxId)`

Données de la caméra conducteur d'un véhicule.

- `vehId` (*integer*) : Identifiant du véhicule
- `ctxId` (*string|nil*) : Contexte
- **renvoie** : integer|nil camNodeID (noeud du point de vue conducteur)
- **renvoie** : boolean rightHandCamera
- **renvoie** : boolean rightHandDoor

#### `core_camera.getForward(ctxId)`

Vecteur 'avant' de la caméra (axe y tourné par l'orientation).

- `ctxId` (*string|nil*) : Contexte
- **renvoie** : vec3 Vecteur avant

#### `core_camera.getForwardXYZ(ctxId)`

Vecteur avant en composantes séparées (utilise un vec3 interne réutilisé).

- `ctxId` (*string|nil*) : Contexte
- **renvoie** : number x
- **renvoie** : number y
- **renvoie** : number z

#### `core_camera.getFovDeg(ctxId)`

Champ de vision final en degrés.

- `ctxId` (*string|nil*) : Contexte
- **renvoie** : number FOV (deg)

#### `core_camera.getFovRad(ctxId)`

Champ de vision final en radians.

- `ctxId` (*string|nil*) : Contexte
- **renvoie** : number FOV (rad)

#### `core_camera.getFreeCameraConfigurationReadOnly()`

Copie profonde de la configuration (ordre, activation) des caméras libres du groupe 'world'.

- **renvoie** : table Liste de {name, enabled}

#### `core_camera.getGlobalCameras(ctx)`

Renvoie la table nom -> instance des caméras globales (une fois par contexte, créées à la demande à partir des constructeurs où cam.isGlobal est vrai).

- `ctx` (*table|nil*) : Contexte interne (nil = main) ; les appels externes omettent généralement l'argument
- **renvoie** : table<string, table> Caméras globales par nom

#### `core_camera.getGroupCams(ctx, groupName, includeDisabled)`

Liste des noms de caméras d'un groupe (ex. 'world'), dans l'ordre configuré. Les caméras 'world' désactivées sont omises sauf si includeDisabled est vrai (elles restent visibles dans les options mais sont sautées lors du cycle).

- `ctx` (*table|nil*) : Contexte interne (nil = main)
- `groupName` (*string*) : Nom du groupe, ex. 'world'
- `includeDisabled` (*boolean|nil*) : Inclure les caméras désactivées
- **renvoie** : table<integer, string> Noms de caméras

#### `core_camera.getLookBack()`

Etat 'regard vers l'arrière' de la vue principale.

- **renvoie** : boolean|nil Etat

#### `core_camera.getPosition(ctxId)`

Position finale de la caméra (copie).

- `ctxId` (*string|nil*) : Contexte (nil = vue du joueur)
- **renvoie** : vec3 Position monde (m)

#### `core_camera.getPositionXYZ(ctxId)`

Position finale en composantes séparées (évite l'allocation).

- `ctxId` (*string|nil*) : Contexte
- **renvoie** : number x
- **renvoie** : number y
- **renvoie** : number z

#### `core_camera.getQuat(ctxId)`

Orientation finale de la caméra (copie).

- `ctxId` (*string|nil*) : Contexte
- **renvoie** : quat Orientation

#### `core_camera.getQuatXYZW(ctxId)`

Orientation en composantes séparées.

- `ctxId` (*string|nil*) : Contexte
- **renvoie** : number x
- **renvoie** : number y
- **renvoie** : number z
- **renvoie** : number w

#### `core_camera.getRight(ctxId)`

Vecteur 'droite' de la caméra (axe x tourné par l'orientation).

- `ctxId` (*string|nil*) : Contexte
- **renvoie** : vec3 Vecteur droite

#### `core_camera.getSpeed(ctxId)`

Vitesse de déplacement de la caméra libre d'un contexte (30 par défaut).

- `ctxId` (*string|nil*) : Contexte
- **renvoie** : number|nil Vitesse

#### `core_camera.getUp(ctxId)`

Vecteur 'haut' de la caméra (axe z tourné par l'orientation).

- `ctxId` (*string|nil*) : Contexte
- **renvoie** : vec3 Vecteur haut

#### `core_camera.getYawPitchRoll()`

Lacet, tangage et roulis de la caméra principale en une seule fois.

- **renvoie** : table {yawDeg, pitchDown (positif = vers le bas), rollDeg}

#### `core_camera.globalCameraFunction(globalCameraName, functionName, ...)`

Appelle la méthode functionName d'une caméra globale nommée. Loggue une erreur si la caméra ou la méthode n'existe pas.

- `globalCameraName` (*string*) : Nom de caméra globale
- `functionName` (*string*) : Nom de méthode
- `...` (*any*) : Arguments
- **renvoie** : any Retour de la méthode

#### `core_camera.hotkey(player, hotkeyid, modifier)`

Transmet une touche de raccourci à la caméra active (méthode hotkey du mode).

- `player` (*integer|nil*) : Indice du joueur
- `hotkeyid` (*any*) : Identifiant de raccourci
- `modifier` (*any*) : Modificateur
- **renvoie** : any Retour de la caméra

#### `core_camera.isCameraInside(player, camPos)`

Teste si une position de caméra est à l'intérieur du véhicule du joueur (dans sa boîte orientée et à moins de 0,6 m d'un point de vue 'inside' d'une caméra).

- `player` (*integer|nil*) : Indice du joueur
- `camPos` (*vec3*) : Position à tester (m)
- **renvoie** : integer 1 si à l'intérieur, 0 sinon (0 aussi sans véhicule ou en unicycle)

#### `core_camera.isWorldCamera(player)`

Teste si la caméra active du joueur appartient au groupe 'world' (caméras libres).

- `player` (*integer|nil*) : Indice du joueur
- **renvoie** : boolean true si caméra 'world'

#### `core_camera.nextCameraGroup(groups, active)`

Calcule le groupe suivant dans l'anneau de cycle : caméras de jeu (active = nil) vers le premier groupe, entre groupes, puis du dernier groupe vers les caméras de jeu (nil). active = false (caméra système) renvoie nil.

- `groups` (*table<integer, string>*) : Noms de groupes
- `active` (*string|boolean|nil*) : Groupe actif : nil = caméra de jeu, false = caméra sans groupe
- **renvoie** : string|nil Groupe suivant ou nil (retour aux caméras de jeu)

#### `core_camera.notifyUI(vdata, forcedCamName)`

Prévient l'UI et les extensions du changement de caméra : guihooks 'onCameraNameChanged', hook onCameraModeChanged, puis mise à jour du menu d'options.

- `vdata` (*table|nil*) : Données caméra du véhicule (joueur 0 par défaut)
- `forcedCamName` (*string|nil*) : Nom à annoncer au lieu de la caméra focalisée

#### `core_camera.onCameraToggled(data)`

Hook (émis par cycleCameraGroup, setCameraByNameFromOptions) : réaffiche le nom de la caméra du joueur 0.

- `data` (*table*) : {cameraType = 'FreeCam'|'GameCam'}

#### `core_camera.onDeserialized(data)`

Hook de restauration après rechargement Lua (fusionne l'état sérialisé dans les caméras existantes).

- `data` (*table*) : Données de onSerialize

#### `core_camera.onDespawnObject(vid, isReloading)`

Hook appelé à la suppression d'un objet : retire ses données caméra si ce n'est pas un rechargement.

- `vid` (*integer*) : Identifiant
- `isReloading` (*boolean*) : true lors d'un rechargement

#### `core_camera.onFileChanged(filePath, changeType)`

Hook appelé quand un fichier change : l'ajout/suppression d'un fichier de cameraModes invalide les caches (rechargement à chaud).

- `filePath` (*string*) : Chemin du fichier
- `changeType` (*string*) : 'added', 'deleted', 'modified'...

#### `core_camera.onMouseLocked(locked)`

Hook appelé quand la souris est verrouillée/déverrouillée : transmis à la caméra active (mouseLocked), sauf en caméra libre.

- `locked` (*boolean*) : true si verrouillée

#### `core_camera.onPreRender(...)`

Hook appelé juste avant le rendu : met à jour la caméra (cameraUpdate.onPreRender), puis affiche le nom de caméra en attente après un changement de véhicule.

- `...` (*any*) : dtReal, dtSim, dtRaw (déduit de cameraUpdate)

#### `core_camera.onReplayStateChanged(newState)`

Hook appelé quand l'état du replay change : à la sortie d'une lecture ('playback' vers 'inactive'), vide le cache des caméras de véhicules (les véhicules supprimés par le replay seraient sinon perdus).

- `newState` (*table*) : Table avec le champ state

#### `core_camera.onScenarioChange(...)`

Hook appelé quand l'état du scénario change : propagé aux caméras ; si un trigger était en attente et que le scénario passe à 'running', il est rejoué.

- `...` (*any*) : 

#### `core_camera.onScenarioRestarted(...)`

Hook appelé au redémarrage d'un scénario : propagé à toutes les caméras.

- `...` (*any*) : Arguments du hook

#### `core_camera.onSerialize()`

Hook de sérialisation avant rechargement Lua : sérialise les caméras globales et de véhicules, la caméra globale active, le dernier véhicule, le trigger en attente et les demandes de caméra.

- **renvoie** : table Données à restaurer

#### `core_camera.onSettingsChanged(...)`

Hook appelé quand les réglages changent : applique le lissage de la caméra libre et propage onSettingsChanged à toutes les caméras.

- `...` (*any*) : Arguments du hook

#### `core_camera.onTrigger(trigger)`

Hook appelé par les triggers BeamNG : si le sujet est le véhicule du joueur (ou le triggerOverride), 'enter' avec cameraOnEnter bascule sur la caméra globale 'observer' pointant cet objet caméra, et 'exit' avec cameraOnLeave la quitte. Pendant le démarrage d'un scénario, la demande est mise en attente jusqu'à l'état 'running'.

- `trigger` (*table*) : {subjectID, event, cameraOnEnter, cameraOnLeave, triggerOverride...}

#### `core_camera.onVehicleDestroyed(vid)`

Hook appelé quand un véhicule est détruit : retire ses données caméra de tous les contextes.

- `vid` (*integer*) : Identifiant

#### `core_camera.onVehicleReplaced(vid)`

Hook appelé quand un véhicule est remplacé (nouvelle config) : recrée ses caméras.

- `vid` (*integer*) : Identifiant du véhicule

#### `core_camera.onVehicleResetted(vid, ...)`

Hook appelé quand un véhicule est réinitialisé : propage aux caméras du véhicule et réinitialise la caméra focalisée sauf si resetCameraOnVehicleReset vaut false ou si une caméra globale est active.

- `vid` (*integer*) : Identifiant du véhicule
- `...` (*any*) : Arguments

#### `core_camera.onVehicleSpawned(vid)`

Hook appelé à la création d'un véhicule : crée ses données caméra dans chaque contexte.

- `vid` (*integer*) : Identifiant du véhicule

#### `core_camera.onVehicleSwitched(oldId, newId, player)`

Hook appelé quand le joueur change de véhicule : lance une transition (hors caméra globale), propage aux caméras et programme l'affichage du nom. Ignore les joueurs autres que 0.

- `oldId` (*integer*) : Ancien véhicule
- `newId` (*integer*) : Nouveau véhicule
- `player` (*integer*) : Joueur

#### `core_camera.processVehicleCameraConfigChanged(vid, vdata, focusedCamNamePrevious, ctx)`

(Re)crée les instances de caméras d'un véhicule d'après ses données jbeam (cameraData), met à jour la configuration partagée (ordre, activation, sauvegardée par le contexte principal), puis choisit la caméra : demande en attente, sinon caméra précédente, sinon première caméra activée et visible, sinon première existante. Renvoie false si les données du véhicule ne sont pas encore disponibles.

- `vid` (*integer*) : Identifiant du véhicule
- `vdata` (*table*) : Table de données caméra du véhicule (modifiée)
- `focusedCamNamePrevious` (*string|nil*) : Nom de la caméra précédemment focalisée
- `ctx` (*table|nil*) : Contexte interne (nil = main)
- **renvoie** : boolean true si traité

#### `core_camera.proxy_Player(fct, ...)`

Appelle la méthode fct sur la caméra active du joueur 0 (globale ou focalisée).

- `fct` (*string*) : Nom de méthode
- `...` (*any*) : Arguments
- **renvoie** : any Retour de la méthode

#### `core_camera.requestConfig(forcedCamName)`

Demande l'envoi de la configuration actuelle au menu Options > Caméras (guihooks CameraConfigChanged).

- `forcedCamName` (*string|nil*) : Nom de caméra à marquer comme active

#### `core_camera.resetCamera(player)`

Remet à zéro les entrées de la vue du joueur, émet le hook onCameraReset et appelle reset() sur la caméra active.

- `player` (*integer|nil*) : Indice du joueur
- **renvoie** : any Retour de reset

#### `core_camera.resetCameraByID(vid, ...)`

Appelle reset() sur la caméra (globale active ou focalisée du véhicule) de la vue principale.

- `vid` (*integer|table*) : Id de véhicule, ou table {vehId, camName}
- `...` (*any*) : Arguments passés à reset
- **renvoie** : any Retour de la méthode de la caméra

#### `core_camera.setByName(...)`

Sélectionne une caméra par nom. Signature souple : setByName(player, camName, withTransition, customData) si le premier argument est un nombre, sinon setByName(camName, withTransition, customData). Un nom de caméra globale (ou nil) agit sur la vue globale ; sinon c'est la caméra de véhicule du joueur.

- `...` (*any*) : [player,] camName, withTransition, customData

#### `core_camera.setBySlotId(player, slotId)`

Sélectionne la caméra associée à un numéro de raccourci (touches 1 à 9, slotId calculé sur les caméras visibles).

- `player` (*integer|nil*) : Indice du joueur
- `slotId` (*integer*) : Numéro de slot

#### `core_camera.setCameraByNameFromOptions(player, camName)`

Sélection depuis le menu Options : une caméra du groupe 'world' passe par enterGroupCam (et le hook onCameraToggled FreeCam), sinon c'est une caméra de véhicule. Affiche le nom si la sélection réussit.

- `player` (*integer|nil*) : Indice du joueur
- `camName` (*string*) : Nom de caméra
- **renvoie** : boolean true si sélectionnée

#### `core_camera.setCameraDriverZoom(value, player)`

Définit le zoom de la caméra conducteur.

- `value` (*number*) : 0 ou 1 (seuil 0.5)
- `player` (*integer|nil*) : Indice du joueur

#### `core_camera.setCameraUnicycleZoom(value, player)`

Définit le zoom de la caméra en marche à pied (unicycle).

- `value` (*number*) : 0 ou 1 (déduit du code : seuil à 0.5)
- `player` (*integer|nil*) : Indice du joueur

#### `core_camera.setContextCamera(id, camName, withTransition, customData)`

Sélectionne une caméra sur un contexte sans toucher au joueur. camName nil ou nom de caméra globale : caméra globale (initialisée avec la pose actuelle de la vue) ; sinon caméra de véhicule du joueur du contexte.

- `id` (*string|nil*) : Identifiant de contexte (nil = main)
- `camName` (*string|nil*) : Nom de caméra
- `withTransition` (*boolean|nil*) : Transition
- `customData` (*any*) : Données passées à setCustomData
- **renvoie** : any Aucun retour utile (la fonction interne ne renvoie rien)

#### `core_camera.setContextCameraParam(id, key, value)`

Applique un réglage à la caméra active d'un contexte en déléguant à cam:setParam(key, value, id).

- `id` (*string|nil*) : Identifiant de contexte
- `key` (*string*) : Clé de réglage (ex. 'fov')
- `value` (*any*) : Nouvelle valeur

#### `core_camera.setContextCameraState(id, state)`

Restaure la caméra d'un contexte depuis un instantané de getContextCameraState. Un mode avec deserialize restaure son état ; une caméra libre/globale sans deserialize est replacée à la pose sauvegardée.

- `id` (*string|nil*) : Identifiant de contexte
- `state` (*table*) : Instantané

#### `core_camera.setDefaultDistance(vid, ...)`

Délègue cam:setDefaultDistance(...) à la caméra.

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*number*) : Distance par défaut (m)
- **renvoie** : any Retour de la caméra

#### `core_camera.setDefaultRotation(vid, ...)`

Délègue cam:setDefaultRotation(...) à la caméra.

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*any*) : Rotation par défaut
- **renvoie** : any Retour de la caméra

#### `core_camera.setDistance(vid, ...)`

Délègue cam:setDistance(...) à la caméra.

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*number*) : Distance (m)
- **renvoie** : any Retour de la caméra

#### `core_camera.setFOV(vid, ...)`

Fixe le champ de vision (degrés). Si 'free' est active, l'applique aussi au moteur ; puis cam:setFOV(...).

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*number*) : FOV en degrés
- **renvoie** : any Retour de la caméra

#### `core_camera.setFastSpeedModifier(enabled)`

Active le modificateur de vitesse rapide (touche) de la vue principale.

- `enabled` (*boolean*) : true pour aller plus vite

#### `core_camera.setFreeCameraYawPitchRollDeg(yawDeg, pitchDownDeg, rollDeg)`

Oriente la caméra libre (active seulement si la caméra globale 'free' est active) à partir de lacet, tangage (positif = regarder vers le bas) et roulis en degrés ; annule la vitesse angulaire.

- `yawDeg` (*number*) : Lacet (0 = axe +Y)
- `pitchDownDeg` (*number*) : Tangage vers le bas (deg)
- `rollDeg` (*number*) : Roulis (deg)

#### `core_camera.setGlobalCameraByName(name, withTransition, customData, ctx)`

Active une caméra globale par son nom, ou repasse à la caméra du véhicule avec nil. Appelle onCameraChanged(false) sur l'ancienne et setCustomData + onCameraChanged(true) sur la nouvelle ; dans la vue principale, émet le hook onGlobalCameraSet. Sans effet si le nom est inconnu ou s'il n'y a pas de véhicule pour revenir à la caméra de véhicule.

- `name` (*string|nil*) : Nom de caméra globale, nil pour quitter
- `withTransition` (*boolean|nil*) : Non utilisé dans le code (déduit du code)
- `customData` (*table|nil*) : Données passées à cam:setCustomData
- `ctx` (*table|nil*) : Contexte interne (nil = main)

#### `core_camera.setInputTargetPlayer(player)`

Force toutes les entrées caméra à cibler le joueur donné (nil pour désactiver cette redirection).

- `player` (*integer|nil*) : Indice du joueur ciblé

#### `core_camera.setLookBack(player, enabled)`

Active/désactive le regard vers l'arrière pour le joueur.

- `player` (*integer|nil*) : Indice du joueur
- `enabled` (*boolean*) : true pour regarder derrière

#### `core_camera.setMaxDistance(vid, ...)`

Délègue cam:setMaxDistance(...) à la caméra.

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*number*) : Distance maximale (m)
- **renvoie** : any Retour de la caméra

#### `core_camera.setNewtonRotation(pid, ...)`

Active/désactive le mode 'Newton' (inertie) en rotation de la caméra libre.

- `pid` (*integer|nil*) : Joueur/vue
- `...` (*any*) : Argument du mode

#### `core_camera.setNewtonTranslation(pid, ...)`

Active/désactive le mode 'Newton' (inertie) en translation de la caméra libre.

- `pid` (*integer|nil*) : Joueur/vue
- `...` (*any*) : Argument du mode

#### `core_camera.setOffset(vid, ...)`

Délègue cam:setOffset(...) à la caméra de la vue principale.

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*any*) : Arguments du mode de caméra
- **renvoie** : any Retour de la caméra

#### `core_camera.setPosRot(pid, px, py, pz, rx, ry, rz, rw)`

Place la caméra libre à une position (et orientation quaternion facultative). Sans effet si la caméra libre n'est pas active.

- `pid` (*integer*) : Joueur
- `px` (*number*) : x (m)
- `py` (*number*) : y (m)
- `pz` (*number*) : z (m)
- `rx` (*number|nil*) : Quaternion x
- `ry` (*number|nil*) : Quaternion y
- `rz` (*number|nil*) : Quaternion z
- `rw` (*number|nil*) : Quaternion w

#### `core_camera.setPosition(pid, ...)`

Fixe la position de la caméra (vec3 en premier argument supplémentaire). Si la caméra globale 'free' est active dans la vue principale, la position est aussi appliquée directement au moteur ; puis cam:setPosition(...) est appelé.

- `pid` (*integer|nil*) : Joueur/vue
- `...` (*vec3*) : Position monde (m)
- **renvoie** : any Retour de la caméra

#### `core_camera.setRef(vid, ...)`

Délègue cam:setRef(...) à la caméra.

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*any*) : Arguments
- **renvoie** : any Retour de la caméra

#### `core_camera.setRefNodes(vid, ...)`

Délègue cam:setRefNodes(...) (noeuds de référence centre, gauche, arrière).

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*any*) : Noeuds de référence
- **renvoie** : any Retour de la caméra

#### `core_camera.setRotation(vid, ...)`

Fixe l'orientation de la caméra. Si la caméra globale 'free' est active, applique aussi directement la rotation (quat) au moteur ; puis appelle cam:setRotation(...).

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*any*) : Rotation (quat) et autres arguments
- **renvoie** : any Retour de la caméra

#### `core_camera.setSkipFovModifier(vid, ...)`

Délègue cam:setSkipFovModifier(...) à la caméra.

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*boolean*) : Ignorer le modificateur de FOV
- **renvoie** : any Retour de la caméra

#### `core_camera.setSmoothedCam(pid, ...)`

Active/désactive le lissage de la caméra libre (cam:setSmoothedCam).

- `pid` (*integer|nil*) : Joueur/vue
- `...` (*boolean*) : Activer le lissage

#### `core_camera.setSpeed(speed, ctxId)`

Fixe la vitesse de déplacement de la caméra libre.

- `speed` (*number*) : Vitesse (m/s)
- `ctxId` (*string|nil*) : Contexte

#### `core_camera.setTargetMode(vid, ...)`

Délègue cam:setTargetMode(...) à la caméra.

- `vid` (*integer|table*) : Id de véhicule ou {vehId, camName}
- `...` (*any*) : Arguments
- **renvoie** : any Retour de la caméra

#### `core_camera.setVehicleCameraByIndexOffset(player, offset)`

Passe à la caméra suivante (offset = 1) ou précédente (-1) en sautant les cachées/désactivées. En caméra globale d'un groupe, cycle dans ce groupe. Utilisé par les actions d'entrée.

- `player` (*integer|nil*) : Indice du joueur
- `offset` (*integer*) : +1 ou -1

#### `core_camera.setVehicleCameraByNameWithId(vehId, name, withTransition, customData, ctx)`

Sélectionne une caméra de véhicule pour le véhicule d'identifiant vehId. Si les données du véhicule ne sont pas encore prêtes, la demande est mémorisée et appliquée plus tard.

- `vehId` (*integer*) : Identifiant du véhicule
- `name` (*string*) : Nom de caméra
- `withTransition` (*boolean|nil*) : Lance une transition
- `customData` (*any*) : Passé à cam:setCustomData si présent
- `ctx` (*table|nil*) : Contexte interne (nil = main)
- **renvoie** : boolean|nil true si changée, false sinon

#### `core_camera.startCameraTransition(duration, player)`

Fond le point de vue actuel vers celui de la caméra de cette frame. À appeler juste après un changement de caméra. duration remplace la durée configurée.

- `duration` (*number|nil*) : Durée du fondu en secondes
- `player` (*integer|nil*) : Joueur/vue (nil = main)

#### `core_camera.toggleEnabledById(camId)`

Active ou désactive la caméra de véhicule d'indice camId dans le cycle (compatibilité) puis sauvegarde la configuration.

- `camId` (*integer*) : Indice dans la configuration

#### `core_camera.toggleFreeCameraEnabledById(camId)`

Active/désactive une caméra libre du groupe 'world' dans le cycle et sauvegarde.

- `camId` (*integer*) : Indice dans la configuration libre

#### `core_camera.unicycleZoomToggle(player)`

Bascule le zoom de la caméra en marche à pied entre 0 et 1.

- `player` (*integer|nil*) : Indice du joueur

#### `core_camera.vehicleCamerasFunction(vid, functionName, ...)`

Exécute une méthode sur toutes les caméras d'un véhicule, dans tous les contextes.

- `vid` (*integer*) : Identifiant du véhicule
- `functionName` (*string*) : Nom de méthode
- `...` (*any*) : Arguments

## Champs

| Champ | Type | Description |
|---|---|---|
| `cameraZoom` | any |  |
| `dependencies` | table<integer, string> | Extensions chargées avant : core_vehicle_manager, core_environment. |
| `getLastCameraMovementType` | any |  |
| `getLastFilter` | any |  |
| `moveForwardBackward` | any |  |
| `moveLeftRight` | any |  |
| `movebackward` | any |  |
| `movedown` | any |  |
| `moveforward` | any |  |
| `moveleft` | any |  |
| `moveright` | any |  |
| `moveup` | any |  |
| `objectTeleported` | function | Alias obsolète de la globale objectTeleported (utils.lua). |
| `pitchAbs` | any |  |
| `rollAbs` | any |  |
| `rotate_pitch` | any |  |
| `rotate_pitch_down` | any |  |
| `rotate_pitch_relative` | any |  |
| `rotate_pitch_up` | any |  |
| `rotate_roll_left` | any |  |
| `rotate_roll_right` | any |  |
| `rotate_yaw` | any |  |
| `rotate_yaw_left` | any |  |
| `rotate_yaw_relative` | any |  |
| `rotate_yaw_right` | any |  |
| `speedFactor` | number | Facteur de vitesse (1 par défaut) utilisé pour corriger un mouvement de caméra trop lent/lissé lors de la création de vignettes. |
| `timeSinceLastRotation` | any |  |
| `xAxisAbs` | any |  |
| `yAxisAbs` | any |  |
| `yAxisMoveStep` | any |  |
| `yawAbs` | any |  |
| `zAxisAbs` | any |  |

**Globales affectées :** `MoveManager`

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCameraModeChanged` — écouté par 3 module(s)
- `onCameraReset`
- `onCameraToggled` — écouté par 1 module(s)
- `onGlobalCameraSet` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `CameraConfigChanged`, `Message`, `appContainer:loadLayoutByType`, `onCameraNameChanged`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getObject`, `getObjectCount`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/camera.lua`.*
