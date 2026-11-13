---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE (core_camera, dépend de core_vehicle_manager et core_environment) : gestionnaire central de toutes les caméras du jeu. Elle charge les modes de caméra du dossier lua/ge/extensions/core/cameraModes (un fichier par mode), crée pour chaque véhicule une instance de chaque mode (configurée par la section jbeam 'camera') et gère des instances 'globales' (free, observer, path, bigMap...) qui existent une seule fois sans véhicule. Elle décide quelle caméra est active (par joueur), gère la configuration utilisateur (ordre et activation des caméras, menu Options > Caméras, sauvegardée dans les réglages cameraConfig et freeCameraConfig), le cycle des caméras (touches), les transitions, et expose la position/orientation/FOV finaux. Le calcul par frame est dans core/cameraUpdate.lua, les entrées dans core/cameraInput.lua (ré-exposées ici). Un moddeur s'en sert pour lire la position de la caméra, changer de caméra par nom, piloter la caméra libre ou créer des vues supplémentaires (contextes).
--- Accès : extension `core_camera` : `extensions.load("core_camera")`, puis la globale `core_camera`
---@class core_camera
---@field cameraZoom any
---@field dependencies table<integer, string> Extensions chargées avant : core_vehicle_manager, core_environment.
---@field getLastCameraMovementType any
---@field getLastFilter any
---@field moveForwardBackward any
---@field moveLeftRight any
---@field movebackward any
---@field movedown any
---@field moveforward any
---@field moveleft any
---@field moveright any
---@field moveup any
---@field objectTeleported function Alias obsolète de la globale objectTeleported (utils.lua).
---@field pitchAbs any
---@field rollAbs any
---@field rotate_pitch any
---@field rotate_pitch_down any
---@field rotate_pitch_relative any
---@field rotate_pitch_up any
---@field rotate_roll_left any
---@field rotate_roll_right any
---@field rotate_yaw any
---@field rotate_yaw_left any
---@field rotate_yaw_relative any
---@field rotate_yaw_right any
---@field speedFactor number Facteur de vitesse (1 par défaut) utilisé pour corriger un mouvement de caméra trop lent/lissé lors de la création de vignettes.
---@field timeSinceLastRotation any
---@field xAxisAbs any
---@field yAxisAbs any
---@field yAxisMoveStep any
---@field yawAbs any
---@field zAxisAbs any
core_camera = {}

--- Déplace une caméra libre dans la configuration des caméras 'world' et sauvegarde (réglage freeCameraConfig).
---Source : lua/ge/extensions/core/camera.lua:622
---@param camId integer Indice dans la configuration libre
---@param offset integer Décalage
function core_camera.changeFreeCameraOrder(camId, offset) end

--- Déplace la caméra d'indice camId de offset positions dans la liste de configuration (en sautant les caméras cachées), puis sauvegarde.
---Source : lua/ge/extensions/core/camera.lua:586
---@param camId integer Indice dans la configuration (base 1)
---@param offset integer Décalage, ex. -1 ou +1
function core_camera.changeOrder(camId, offset) end

--- Multiplie ou divise la vitesse de la caméra de la vue principale par (1 + 0.2*|val|) selon le signe, bornée entre 2 et 100, et affiche un message. Ignorée si le zoom caméra est désactivé dans l'éditeur.
---Source : lua/ge/extensions/core/camera.lua:1879
---@param val number Variation signée (molette)
function core_camera.changeSpeed(val) end

--- Annule le mouvement angulaire de la caméra du joueur.
---Source : lua/ge/extensions/core/camera.lua:1447
---@param pid integer|nil Joueur/vue
function core_camera.clearAngularMotion(pid) end

--- Remet à zéro les entrées de rotation et de zoom (roulis, tangage, lacet, zoom) d'une structure MoveManager. Utilisé par d'autres scripts GE.
---Source : lua/ge/extensions/core/camera.lua:574
---@param mm table|nil Structure d'entrées, MoveManager par défaut
function core_camera.clearInputs(mm) end

--- Annule le mouvement (vitesse) de la caméra du joueur (cam:clearMotion).
---Source : lua/ge/extensions/core/camera.lua:1443
---@param pid integer|nil Joueur/vue
function core_camera.clearMotion(pid) end

--- Crée (ou met à jour) un contexte de caméra supplémentaire = une sortie caméra avec sa propre RenderView, réutilisant tous les modes de caméra. L'identifiant 'main' (ou nil) renvoie le contexte principal. Le rendu cible (résolution, texture) est géré par l'appelant. vehiclePlayer permet à la vue d'afficher le véhicule d'un autre siège alors que player ne fait que fournir l'entrée.
---Source : lua/ge/extensions/core/camera.lua:1908
---@param id string Identifiant du contexte
---@param renderView string|nil Nom de la RenderView (par défaut id)
---@param player integer|nil Joueur/siège dont la vue suit les entrées (0 par défaut)
---@param vehiclePlayer integer|nil Siège dont on prend le véhicule (facultatif)
---@return table  Contexte (table interne)
function core_camera.createContext(id, renderView, player, vehiclePlayer) end

--- Passe au groupe de caméras suivant (caméras de jeu, puis caméras libres 'world', puis retour), entre dans la première caméra du groupe, émet onCameraToggled et affiche le nom.
---Source : lua/ge/extensions/core/camera.lua:693
---@param player integer|nil Indice du joueur
function core_camera.cycleCameraGroup(player) end

--- Détruit un contexte supplémentaire (jamais le principal) et vide le cache des caméras du contexte principal.
---Source : lua/ge/extensions/core/camera.lua:1923
---@param id string Identifiant du contexte
function core_camera.destroyContext(id) end

--- Envoie à l'UI (app Messages) le nom de la caméra courante avec le nombre d'options et l'indice courant. Ne fait rien pour une unicycle (marche à pied).
---Source : lua/ge/extensions/core/camera.lua:412
---@param player integer|nil Indice du joueur
function core_camera.displayCameraNameUI(player) end

--- Bascule le zoom de la caméra conducteur entre 0 et 1.
---Source : lua/ge/extensions/core/camera.lua:1803
---@param player integer|nil Indice du joueur
function core_camera.driverZoomToggle(player) end

--- Compatibilité : quitte la caméra globale (setGlobalCameraByName(nil)).
---Source : lua/ge/extensions/core/camera.lua:2096
function core_camera.exitCinematicCamera() end

--- Nom de la caméra active du joueur : caméra globale si active, sinon caméra de véhicule (ou celle demandée en attente). nil si le joueur n'a pas de véhicule.
---Source : lua/ge/extensions/core/camera.lua:939
---@param player integer|nil Indice du joueur
---@return string|nil  Nom de la caméra
function core_camera.getActiveCamName(player) end

--- Nom de la caméra focalisée d'un véhicule (vue principale).
---Source : lua/ge/extensions/core/camera.lua:958
---@param vehId integer Identifiant du véhicule
---@return string|nil  Nom de la caméra
function core_camera.getActiveCamNameByVehId(vehId) end

--- Nom de la caméra globale active pour le joueur, nil si c'est une caméra de véhicule.
---Source : lua/ge/extensions/core/camera.lua:1893
---@param player integer|nil Indice du joueur
---@return string|nil  Nom de caméra globale
function core_camera.getActiveGlobalCameraName(player) end

--- Renvoie les instances de caméras d'un véhicule.
---Source : lua/ge/extensions/core/camera.lua:899
---@param vid integer Identifiant du véhicule
---@param ctxId string|nil Identifiant de contexte (nil = main)
---@return table<string, table>|nil  Caméras par nom, nil si le véhicule est inconnu
function core_camera.getCameraDataById(vid, ctxId) end

--- Zoom actuel de la caméra conducteur.
---Source : lua/ge/extensions/core/camera.lua:1799
---@param player integer|nil Indice du joueur
---@return number|nil  Zoom
function core_camera.getCameraDriverZoom(player) end

--- Liste triée des noms de groupes de caméras ayant au moins une caméra utilisable.
---Source : lua/ge/extensions/core/camera.lua:304
---@param ctx table|nil Contexte interne (nil = main)
---@return table<integer, string>  Noms de groupes
function core_camera.getCameraGroups(ctx) end

--- Copie profonde de la liste de configuration des caméras de véhicule ({name, enabled}).
---Source : lua/ge/extensions/core/camera.lua:382
---@return table  Liste de {name, enabled}
function core_camera.getConfigurationReadOnly() end

--- Réglages ajustables de la caméra active d'un contexte, pour l'UI de contrôle de caméra / flux vidéo. Chaque mode fournit sa liste via listParams ; descripteurs {key, title, kind ('range'|'bool'|'choice'|'slots'), type ('float'|'int'|'bool'|'enum'), value, icon, default, min, max, step, unit, options}.
---Source : lua/ge/extensions/core/camera.lua:2023
---@param id string|nil Identifiant de contexte
---@return table  Liste de descripteurs (vide si aucun)
function core_camera.getContextCameraParams(id) end

--- Instantané léger et sérialisable (JSON) de la caméra d'un contexte : nom, pose monde (pos, rot, fov) et état propre du mode (data, via cam:serialize) pour pouvoir la restaurer.
---Source : lua/ge/extensions/core/camera.lua:1983
---@param id string|nil Identifiant de contexte (nil = main)
---@return table|nil  {cam, pos={x,y,z}, rot={x,y,z,w}, fov, data}
function core_camera.getContextCameraState(id) end

--- Identifiant de la vue par laquelle regarde ce joueur, utilisable avec les getters get*(ctxId). nil = vue principale.
---Source : lua/ge/extensions/core/camera.lua:1942
---@param player integer|nil Indice du joueur
---@return string|nil  Identifiant de contexte ou nil
function core_camera.getContextIdForPlayer(player) end

--- Liste des identifiants de contextes ('main' en premier).
---Source : lua/ge/extensions/core/camera.lua:1935
---@return table<integer, string>  Identifiants
function core_camera.getContextIds() end

--- Nom de la caméra conducteur : 'driver' (si 'onboard.driver' existe) ou le nom d'une caméra 'occupant.*' en mode permission 'driver'.
---Source : lua/ge/extensions/core/camera.lua:923
---@param vehId integer Identifiant du véhicule
---@param ctxId string|nil Contexte
---@return string|nil  Nom de caméra conducteur
function core_camera.getDriverCameraNameById(vehId, ctxId) end

--- Comme getDriverDataById à partir d'un objet véhicule.
---Source : lua/ge/extensions/core/camera.lua:935
---@param veh userdata|nil Véhicule
---@param ctxId string|nil Contexte
---@return integer|nil  camNodeID
---@return boolean  rightHandCamera
---@return boolean  rightHandDoor
function core_camera.getDriverData(veh, ctxId) end

--- Données de la caméra conducteur d'un véhicule.
---Source : lua/ge/extensions/core/camera.lua:927
---@param vehId integer Identifiant du véhicule
---@param ctxId string|nil Contexte
---@return integer|nil  camNodeID (noeud du point de vue conducteur)
---@return boolean  rightHandCamera
---@return boolean  rightHandDoor
function core_camera.getDriverDataById(vehId, ctxId) end

--- Vecteur 'avant' de la caméra (axe y tourné par l'orientation).
---Source : lua/ge/extensions/core/camera.lua:1833
---@param ctxId string|nil Contexte
---@return vec3  Vecteur avant
function core_camera.getForward(ctxId) end

--- Vecteur avant en composantes séparées (utilise un vec3 interne réutilisé).
---Source : lua/ge/extensions/core/camera.lua:1840
---@param ctxId string|nil Contexte
---@return number  x
---@return number  y
---@return number  z
function core_camera.getForwardXYZ(ctxId) end

--- Champ de vision final en degrés.
---Source : lua/ge/extensions/core/camera.lua:1871
---@param ctxId string|nil Contexte
---@return number  FOV (deg)
function core_camera.getFovDeg(ctxId) end

--- Champ de vision final en radians.
---Source : lua/ge/extensions/core/camera.lua:1875
---@param ctxId string|nil Contexte
---@return number  FOV (rad)
function core_camera.getFovRad(ctxId) end

--- Copie profonde de la configuration (ordre, activation) des caméras libres du groupe 'world'.
---Source : lua/ge/extensions/core/camera.lua:386
---@return table  Liste de {name, enabled}
function core_camera.getFreeCameraConfigurationReadOnly() end

--- Renvoie la table nom -> instance des caméras globales (une fois par contexte, créées à la demande à partir des constructeurs où cam.isGlobal est vrai).
---Source : lua/ge/extensions/core/camera.lua:199
---@param ctx table|nil Contexte interne (nil = main) ; les appels externes omettent généralement l'argument
---@return table<string, table>  Caméras globales par nom
function core_camera.getGlobalCameras(ctx) end

--- Liste des noms de caméras d'un groupe (ex. 'world'), dans l'ordre configuré. Les caméras 'world' désactivées sont omises sauf si includeDisabled est vrai (elles restent visibles dans les options mais sont sautées lors du cycle).
---Source : lua/ge/extensions/core/camera.lua:277
---@param ctx table|nil Contexte interne (nil = main)
---@param groupName string Nom du groupe, ex. 'world'
---@param includeDisabled boolean|nil Inclure les caméras désactivées
---@return table<integer, string>  Noms de caméras
function core_camera.getGroupCams(ctx, groupName, includeDisabled) end

--- Etat 'regard vers l'arrière' de la vue principale.
---Source : lua/ge/extensions/core/camera.lua:1783
---@return boolean|nil  Etat
function core_camera.getLookBack() end

--- Position finale de la caméra (copie).
---Source : lua/ge/extensions/core/camera.lua:1812
---@param ctxId string|nil Contexte (nil = vue du joueur)
---@return vec3  Position monde (m)
function core_camera.getPosition(ctxId) end

--- Position finale en composantes séparées (évite l'allocation).
---Source : lua/ge/extensions/core/camera.lua:1816
---@param ctxId string|nil Contexte
---@return number  x
---@return number  y
---@return number  z
function core_camera.getPositionXYZ(ctxId) end

--- Orientation finale de la caméra (copie).
---Source : lua/ge/extensions/core/camera.lua:1846
---@param ctxId string|nil Contexte
---@return quat  Orientation
function core_camera.getQuat(ctxId) end

--- Orientation en composantes séparées.
---Source : lua/ge/extensions/core/camera.lua:1866
---@param ctxId string|nil Contexte
---@return number  x
---@return number  y
---@return number  z
---@return number  w
function core_camera.getQuatXYZW(ctxId) end

--- Vecteur 'droite' de la caméra (axe x tourné par l'orientation).
---Source : lua/ge/extensions/core/camera.lua:1827
---@param ctxId string|nil Contexte
---@return vec3  Vecteur droite
function core_camera.getRight(ctxId) end

--- Vitesse de déplacement de la caméra libre d'un contexte (30 par défaut).
---Source : lua/ge/extensions/core/camera.lua:1774
---@param ctxId string|nil Contexte
---@return number|nil  Vitesse
function core_camera.getSpeed(ctxId) end

--- Vecteur 'haut' de la caméra (axe z tourné par l'orientation).
---Source : lua/ge/extensions/core/camera.lua:1821
---@param ctxId string|nil Contexte
---@return vec3  Vecteur haut
function core_camera.getUp(ctxId) end

--- Lacet, tangage et roulis de la caméra principale en une seule fois.
---Source : lua/ge/extensions/core/camera.lua:1851
---@return table  {yawDeg, pitchDown (positif = vers le bas), rollDeg}
function core_camera.getYawPitchRoll() end

--- Appelle la méthode functionName d'une caméra globale nommée. Loggue une erreur si la caméra ou la méthode n'existe pas.
---Source : lua/ge/extensions/core/camera.lua:1463
---@param globalCameraName string Nom de caméra globale
---@param functionName string Nom de méthode
---@param ... any Arguments
---@return any  Retour de la méthode
function core_camera.globalCameraFunction(globalCameraName, functionName, ...) end

--- Transmet une touche de raccourci à la caméra active (méthode hotkey du mode).
---Source : lua/ge/extensions/core/camera.lua:1546
---@param player integer|nil Indice du joueur
---@param hotkeyid any Identifiant de raccourci
---@param modifier any Modificateur
---@return any  Retour de la caméra
function core_camera.hotkey(player, hotkeyid, modifier) end

--- Teste si une position de caméra est à l'intérieur du véhicule du joueur (dans sa boîte orientée et à moins de 0,6 m d'un point de vue 'inside' d'une caméra).
---Source : lua/ge/extensions/core/camera.lua:881
---@param player integer|nil Indice du joueur
---@param camPos vec3 Position à tester (m)
---@return integer  1 si à l'intérieur, 0 sinon (0 aussi sans véhicule ou en unicycle)
function core_camera.isCameraInside(player, camPos) end

--- Teste si la caméra active du joueur appartient au groupe 'world' (caméras libres).
---Source : lua/ge/extensions/core/camera.lua:1973
---@param player integer|nil Indice du joueur
---@return boolean  true si caméra 'world'
function core_camera.isWorldCamera(player) end

--- Calcule le groupe suivant dans l'anneau de cycle : caméras de jeu (active = nil) vers le premier groupe, entre groupes, puis du dernier groupe vers les caméras de jeu (nil). active = false (caméra système) renvoie nil.
---Source : lua/ge/extensions/core/camera.lua:324
---@param groups table<integer, string> Noms de groupes
---@param active string|boolean|nil Groupe actif : nil = caméra de jeu, false = caméra sans groupe
---@return string|nil  Groupe suivant ou nil (retour aux caméras de jeu)
function core_camera.nextCameraGroup(groups, active) end

--- Prévient l'UI et les extensions du changement de caméra : guihooks 'onCameraNameChanged', hook onCameraModeChanged, puis mise à jour du menu d'options.
---Source : lua/ge/extensions/core/camera.lua:557
---@param vdata table|nil Données caméra du véhicule (joueur 0 par défaut)
---@param forcedCamName string|nil Nom à annoncer au lieu de la caméra focalisée
function core_camera.notifyUI(vdata, forcedCamName) end

--- Hook (émis par cycleCameraGroup, setCameraByNameFromOptions) : réaffiche le nom de la caméra du joueur 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:488
---@param data table {cameraType = 'FreeCam'|'GameCam'}
function core_camera.onCameraToggled(data) end

--- Hook appelé à la fin du niveau : détache la caméra de la RenderView 'main' pour éviter une référence morte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1749
function core_camera.onClientEndMission() end

--- Hook appelé après le démarrage du niveau : délégué à core/cameraUpdate.lua. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:dyn
function core_camera.onClientPostStartMission() end

--- Hook de restauration après rechargement Lua (fusionne l'état sérialisé dans les caméras existantes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1694
---@param data table Données de onSerialize
function core_camera.onDeserialized(data) end

--- Hook appelé à la suppression d'un objet : retire ses données caméra si ce n'est pas un rechargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1582
---@param vid integer Identifiant
---@param isReloading boolean true lors d'un rechargement
function core_camera.onDespawnObject(vid, isReloading) end

--- Hook appelé quand un fichier change : l'ajout/suppression d'un fichier de cameraModes invalide les caches (rechargement à chaud).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1743
---@param filePath string Chemin du fichier
---@param changeType string 'added', 'deleted', 'modified'...
function core_camera.onFileChanged(filePath, changeType) end

--- Hook appelé quand la souris est verrouillée/déverrouillée : transmis à la caméra active (mouseLocked), sauf en caméra libre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1576
---@param locked boolean true si verrouillée
function core_camera.onMouseLocked(locked) end

--- Hook appelé juste avant le rendu : met à jour la caméra (cameraUpdate.onPreRender), puis affiche le nom de caméra en attente après un changement de véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1655
---@param ... any dtReal, dtSim, dtRaw (déduit de cameraUpdate)
function core_camera.onPreRender(...) end

--- Hook appelé quand l'état du replay change : à la sortie d'une lecture ('playback' vers 'inactive'), vide le cache des caméras de véhicules (les véhicules supprimés par le replay seraient sinon perdus).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:2203
---@param newState table Table avec le champ state
function core_camera.onReplayStateChanged(newState) end

--- Hook appelé quand l'état du scénario change : propagé aux caméras ; si un trigger était en attente et que le scénario passe à 'running', il est rejoué.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1632
---@param ... any
function core_camera.onScenarioChange(...) end

--- Hook appelé au redémarrage d'un scénario : propagé à toutes les caméras.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1628
---@param ... any Arguments du hook
function core_camera.onScenarioRestarted(...) end

--- Hook de sérialisation avant rechargement Lua : sérialise les caméras globales et de véhicules, la caméra globale active, le dernier véhicule, le trigger en attente et les demandes de caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1663
---@return table  Données à restaurer
function core_camera.onSerialize() end

--- Hook appelé quand les réglages changent : applique le lissage de la caméra libre et propage onSettingsChanged à toutes les caméras.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1610
---@param ... any Arguments du hook
function core_camera.onSettingsChanged(...) end

--- Hook appelé par les triggers BeamNG : si le sujet est le véhicule du joueur (ou le triggerOverride), 'enter' avec cameraOnEnter bascule sur la caméra globale 'observer' pointant cet objet caméra, et 'exit' avec cameraOnLeave la quitte. Pendant le démarrage d'un scénario, la demande est mise en attente jusqu'à l'état 'running'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1481
---@param trigger table {subjectID, event, cameraOnEnter, cameraOnLeave, triggerOverride...}
function core_camera.onTrigger(trigger) end

--- Hook appelé quand un véhicule est détruit : retire ses données caméra de tous les contextes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:177
---@param vid integer Identifiant
function core_camera.onVehicleDestroyed(vid) end

--- Hook appelé quand un véhicule est remplacé (nouvelle config) : recrée ses caméras.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:169
---@param vid integer Identifiant du véhicule
function core_camera.onVehicleReplaced(vid) end

--- Hook appelé quand un véhicule est réinitialisé : propage aux caméras du véhicule et réinitialise la caméra focalisée sauf si resetCameraOnVehicleReset vaut false ou si une caméra globale est active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1563
---@param vid integer Identifiant du véhicule
---@param ... any Arguments
function core_camera.onVehicleResetted(vid, ...) end

--- Hook appelé à la création d'un véhicule : crée ses données caméra dans chaque contexte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:161
---@param vid integer Identifiant du véhicule
function core_camera.onVehicleSpawned(vid) end

--- Hook appelé quand le joueur change de véhicule : lance une transition (hors caméra globale), propage aux caméras et programme l'affichage du nom. Ignore les joueurs autres que 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.lua:1644
---@param oldId integer Ancien véhicule
---@param newId integer Nouveau véhicule
---@param player integer Joueur
function core_camera.onVehicleSwitched(oldId, newId, player) end

--- (Re)crée les instances de caméras d'un véhicule d'après ses données jbeam (cameraData), met à jour la configuration partagée (ordre, activation, sauvegardée par le contexte principal), puis choisit la caméra : demande en attente, sinon caméra précédente, sinon première caméra activée et visible, sinon première existante. Renvoie false si les données du véhicule ne sont pas encore disponibles.
---Source : lua/ge/extensions/core/camera.lua:1021
---@param vid integer Identifiant du véhicule
---@param vdata table Table de données caméra du véhicule (modifiée)
---@param focusedCamNamePrevious string|nil Nom de la caméra précédemment focalisée
---@param ctx table|nil Contexte interne (nil = main)
---@return boolean  true si traité
function core_camera.processVehicleCameraConfigChanged(vid, vdata, focusedCamNamePrevious, ctx) end

--- Appelle la méthode fct sur la caméra active du joueur 0 (globale ou focalisée).
---Source : lua/ge/extensions/core/camera.lua:1476
---@param fct string Nom de méthode
---@param ... any Arguments
---@return any  Retour de la méthode
function core_camera.proxy_Player(fct, ...) end

--- Demande l'envoi de la configuration actuelle au menu Options > Caméras (guihooks CameraConfigChanged).
---Source : lua/ge/extensions/core/camera.lua:568
---@param forcedCamName string|nil Nom de caméra à marquer comme active
function core_camera.requestConfig(forcedCamName) end

--- Remet à zéro les entrées de la vue du joueur, émet le hook onCameraReset et appelle reset() sur la caméra active.
---Source : lua/ge/extensions/core/camera.lua:1540
---@param player integer|nil Indice du joueur
---@return any  Retour de reset
function core_camera.resetCamera(player) end

--- Appelle reset() sur la caméra (globale active ou focalisée du véhicule) de la vue principale.
---Source : lua/ge/extensions/core/camera.lua:1359
---@param vid integer|table Id de véhicule, ou table {vehId, camName}
---@param ... any Arguments passés à reset
---@return any  Retour de la méthode de la caméra
function core_camera.resetCameraByID(vid, ...) end

--- Efface les réglages cameraConfig et freeCameraConfig et recalcule la configuration pour tous les véhicules.
---Source : lua/ge/extensions/core/camera.lua:1617
function core_camera.resetConfiguration() end

--- Sélectionne une caméra par nom. Signature souple : setByName(player, camName, withTransition, customData) si le premier argument est un nombre, sinon setByName(camName, withTransition, customData). Un nom de caméra globale (ou nil) agit sur la vue globale ; sinon c'est la caméra de véhicule du joueur.
---Source : lua/ge/extensions/core/camera.lua:838
---@param ... any [player,] camName, withTransition, customData
function core_camera.setByName(...) end

--- Sélectionne la caméra associée à un numéro de raccourci (touches 1 à 9, slotId calculé sur les caméras visibles).
---Source : lua/ge/extensions/core/camera.lua:977
---@param player integer|nil Indice du joueur
---@param slotId integer Numéro de slot
function core_camera.setBySlotId(player, slotId) end

--- Sélection depuis le menu Options : une caméra du groupe 'world' passe par enterGroupCam (et le hook onCameraToggled FreeCam), sinon c'est une caméra de véhicule. Affiche le nom si la sélection réussit.
---Source : lua/ge/extensions/core/camera.lua:851
---@param player integer|nil Indice du joueur
---@param camName string Nom de caméra
---@return boolean  true si sélectionnée
function core_camera.setCameraByNameFromOptions(player, camName) end

--- Définit le zoom de la caméra conducteur.
---Source : lua/ge/extensions/core/camera.lua:1795
---@param value number 0 ou 1 (seuil 0.5)
---@param player integer|nil Indice du joueur
function core_camera.setCameraDriverZoom(value, player) end

--- Définit le zoom de la caméra en marche à pied (unicycle).
---Source : lua/ge/extensions/core/camera.lua:1787
---@param value number 0 ou 1 (déduit du code : seuil à 0.5)
---@param player integer|nil Indice du joueur
function core_camera.setCameraUnicycleZoom(value, player) end

--- Sélectionne une caméra sur un contexte sans toucher au joueur. camName nil ou nom de caméra globale : caméra globale (initialisée avec la pose actuelle de la vue) ; sinon caméra de véhicule du joueur du contexte.
---Source : lua/ge/extensions/core/camera.lua:1949
---@param id string|nil Identifiant de contexte (nil = main)
---@param camName string|nil Nom de caméra
---@param withTransition boolean|nil Transition
---@param customData any Données passées à setCustomData
---@return any  Aucun retour utile (la fonction interne ne renvoie rien)
function core_camera.setContextCamera(id, camName, withTransition, customData) end

--- Applique un réglage à la caméra active d'un contexte en déléguant à cam:setParam(key, value, id).
---Source : lua/ge/extensions/core/camera.lua:2032
---@param id string|nil Identifiant de contexte
---@param key string Clé de réglage (ex. 'fov')
---@param value any Nouvelle valeur
function core_camera.setContextCameraParam(id, key, value) end

--- Restaure la caméra d'un contexte depuis un instantané de getContextCameraState. Un mode avec deserialize restaure son état ; une caméra libre/globale sans deserialize est replacée à la pose sauvegardée.
---Source : lua/ge/extensions/core/camera.lua:2002
---@param id string|nil Identifiant de contexte
---@param state table Instantané
function core_camera.setContextCameraState(id, state) end

--- Délègue cam:setDefaultDistance(...) à la caméra.
---Source : lua/ge/extensions/core/camera.lua:1407
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... number Distance par défaut (m)
---@return any  Retour de la caméra
function core_camera.setDefaultDistance(vid, ...) end

--- Délègue cam:setDefaultRotation(...) à la caméra.
---Source : lua/ge/extensions/core/camera.lua:1419
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... any Rotation par défaut
---@return any  Retour de la caméra
function core_camera.setDefaultRotation(vid, ...) end

--- Délègue cam:setDistance(...) à la caméra.
---Source : lua/ge/extensions/core/camera.lua:1411
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... number Distance (m)
---@return any  Retour de la caméra
function core_camera.setDistance(vid, ...) end

--- Fixe le champ de vision (degrés). Si 'free' est active, l'applique aussi au moteur ; puis cam:setFOV(...).
---Source : lua/ge/extensions/core/camera.lua:1375
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... number FOV en degrés
---@return any  Retour de la caméra
function core_camera.setFOV(vid, ...) end

--- Active le modificateur de vitesse rapide (touche) de la vue principale.
---Source : lua/ge/extensions/core/camera.lua:1757
---@param enabled boolean true pour aller plus vite
function core_camera.setFastSpeedModifier(enabled) end

--- Oriente la caméra libre (active seulement si la caméra globale 'free' est active) à partir de lacet, tangage (positif = regarder vers le bas) et roulis en degrés ; annule la vitesse angulaire.
---Source : lua/ge/extensions/core/camera.lua:1233
---@param yawDeg number Lacet (0 = axe +Y)
---@param pitchDownDeg number Tangage vers le bas (deg)
---@param rollDeg number Roulis (deg)
function core_camera.setFreeCameraYawPitchRollDeg(yawDeg, pitchDownDeg, rollDeg) end

--- Active une caméra globale par son nom, ou repasse à la caméra du véhicule avec nil. Appelle onCameraChanged(false) sur l'ancienne et setCustomData + onCameraChanged(true) sur la nouvelle ; dans la vue principale, émet le hook onGlobalCameraSet. Sans effet si le nom est inconnu ou s'il n'y a pas de véhicule pour revenir à la caméra de véhicule.
---Source : lua/ge/extensions/core/camera.lua:639
---@param name string|nil Nom de caméra globale, nil pour quitter
---@param withTransition boolean|nil Non utilisé dans le code (déduit du code)
---@param customData table|nil Données passées à cam:setCustomData
---@param ctx table|nil Contexte interne (nil = main)
function core_camera.setGlobalCameraByName(name, withTransition, customData, ctx) end

--- Force toutes les entrées caméra à cibler le joueur donné (nil pour désactiver cette redirection).
---Source : lua/ge/extensions/core/camera.lua:105
---@param player integer|nil Indice du joueur ciblé
function core_camera.setInputTargetPlayer(player) end

--- Active/désactive le regard vers l'arrière pour le joueur.
---Source : lua/ge/extensions/core/camera.lua:1779
---@param player integer|nil Indice du joueur
---@param enabled boolean true pour regarder derrière
function core_camera.setLookBack(player, enabled) end

--- Délègue cam:setMaxDistance(...) à la caméra.
---Source : lua/ge/extensions/core/camera.lua:1415
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... number Distance maximale (m)
---@return any  Retour de la caméra
function core_camera.setMaxDistance(vid, ...) end

--- Active/désactive le mode 'Newton' (inertie) en rotation de la caméra libre.
---Source : lua/ge/extensions/core/camera.lua:1455
---@param pid integer|nil Joueur/vue
---@param ... any Argument du mode
function core_camera.setNewtonRotation(pid, ...) end

--- Active/désactive le mode 'Newton' (inertie) en translation de la caméra libre.
---Source : lua/ge/extensions/core/camera.lua:1459
---@param pid integer|nil Joueur/vue
---@param ... any Argument du mode
function core_camera.setNewtonTranslation(pid, ...) end

--- Délègue cam:setOffset(...) à la caméra de la vue principale.
---Source : lua/ge/extensions/core/camera.lua:1387
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... any Arguments du mode de caméra
---@return any  Retour de la caméra
function core_camera.setOffset(vid, ...) end

--- Place la caméra libre à une position (et orientation quaternion facultative). Sans effet si la caméra libre n'est pas active.
---Source : lua/ge/extensions/core/camera.lua:1761
---@param pid integer Joueur
---@param px number x (m)
---@param py number y (m)
---@param pz number z (m)
---@param rx number|nil Quaternion x
---@param ry number|nil Quaternion y
---@param rz number|nil Quaternion z
---@param rw number|nil Quaternion w
function core_camera.setPosRot(pid, px, py, pz, rx, ry, rz, rw) end

--- Fixe la position de la caméra (vec3 en premier argument supplémentaire). Si la caméra globale 'free' est active dans la vue principale, la position est aussi appliquée directement au moteur ; puis cam:setPosition(...) est appelé.
---Source : lua/ge/extensions/core/camera.lua:1430
---@param pid integer|nil Joueur/vue
---@param ... vec3 Position monde (m)
---@return any  Retour de la caméra
function core_camera.setPosition(pid, ...) end

--- Délègue cam:setRef(...) à la caméra.
---Source : lua/ge/extensions/core/camera.lua:1399
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... any Arguments
---@return any  Retour de la caméra
function core_camera.setRef(vid, ...) end

--- Délègue cam:setRefNodes(...) (noeuds de référence centre, gauche, arrière).
---Source : lua/ge/extensions/core/camera.lua:1395
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... any Noeuds de référence
---@return any  Retour de la caméra
function core_camera.setRefNodes(vid, ...) end

--- Fixe l'orientation de la caméra. Si la caméra globale 'free' est active, applique aussi directement la rotation (quat) au moteur ; puis appelle cam:setRotation(...).
---Source : lua/ge/extensions/core/camera.lua:1363
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... any Rotation (quat) et autres arguments
---@return any  Retour de la caméra
function core_camera.setRotation(vid, ...) end

--- Délègue cam:setSkipFovModifier(...) à la caméra.
---Source : lua/ge/extensions/core/camera.lua:1423
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... boolean Ignorer le modificateur de FOV
---@return any  Retour de la caméra
function core_camera.setSkipFovModifier(vid, ...) end

--- Active/désactive le lissage de la caméra libre (cam:setSmoothedCam).
---Source : lua/ge/extensions/core/camera.lua:1451
---@param pid integer|nil Joueur/vue
---@param ... boolean Activer le lissage
function core_camera.setSmoothedCam(pid, ...) end

--- Fixe la vitesse de déplacement de la caméra libre.
---Source : lua/ge/extensions/core/camera.lua:1769
---@param speed number Vitesse (m/s)
---@param ctxId string|nil Contexte
function core_camera.setSpeed(speed, ctxId) end

--- Délègue cam:setTargetMode(...) à la caméra.
---Source : lua/ge/extensions/core/camera.lua:1403
---@param vid integer|table Id de véhicule ou {vehId, camName}
---@param ... any Arguments
---@return any  Retour de la caméra
function core_camera.setTargetMode(vid, ...) end

--- Passe à la caméra suivante (offset = 1) ou précédente (-1) en sautant les cachées/désactivées. En caméra globale d'un groupe, cycle dans ce groupe. Utilisé par les actions d'entrée.
---Source : lua/ge/extensions/core/camera.lua:1275
---@param player integer|nil Indice du joueur
---@param offset integer +1 ou -1
function core_camera.setVehicleCameraByIndexOffset(player, offset) end

--- Sélectionne une caméra de véhicule pour le véhicule d'identifiant vehId. Si les données du véhicule ne sont pas encore prêtes, la demande est mémorisée et appliquée plus tard.
---Source : lua/ge/extensions/core/camera.lua:800
---@param vehId integer Identifiant du véhicule
---@param name string Nom de caméra
---@param withTransition boolean|nil Lance une transition
---@param customData any Passé à cam:setCustomData si présent
---@param ctx table|nil Contexte interne (nil = main)
---@return boolean|nil  true si changée, false sinon
function core_camera.setVehicleCameraByNameWithId(vehId, name, withTransition, customData, ctx) end

--- Fond le point de vue actuel vers celui de la caméra de cette frame. À appeler juste après un changement de caméra. duration remplace la durée configurée.
---Source : lua/ge/extensions/core/camera.lua:669
---@param duration number|nil Durée du fondu en secondes
---@param player integer|nil Joueur/vue (nil = main)
function core_camera.startCameraTransition(duration, player) end

--- Active ou désactive la caméra de véhicule d'indice camId dans le cycle (compatibilité) puis sauvegarde la configuration.
---Source : lua/ge/extensions/core/camera.lua:613
---@param camId integer Indice dans la configuration
function core_camera.toggleEnabledById(camId) end

--- Active/désactive une caméra libre du groupe 'world' dans le cycle et sauvegarde.
---Source : lua/ge/extensions/core/camera.lua:631
---@param camId integer Indice dans la configuration libre
function core_camera.toggleFreeCameraEnabledById(camId) end

--- Bascule le zoom de la caméra en marche à pied entre 0 et 1.
---Source : lua/ge/extensions/core/camera.lua:1807
---@param player integer|nil Indice du joueur
function core_camera.unicycleZoomToggle(player) end

--- Exécute une méthode sur toutes les caméras d'un véhicule, dans tous les contextes.
---Source : lua/ge/extensions/core/camera.lua:1551
---@param vid integer Identifiant du véhicule
---@param functionName string Nom de méthode
---@param ... any Arguments
function core_camera.vehicleCamerasFunction(vid, functionName, ...) end

---@type any
MoveManager = nil
