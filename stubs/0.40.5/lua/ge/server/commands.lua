---@meta
-- tim19Atlas stub generated from lua/ge/server/commands.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Commandes de caméra et de placement du joueur, appelées en grande partie par le côté C++ et les actions d'entrée : basculer entre caméra de jeu et caméra libre, vitesse de la caméra libre, déposer la caméra sur le véhicule ou le véhicule à la position de la caméra, lire/écrire la transformée de la caméra libre en JSON. Contient aussi d'anciennes fonctions globales (getCameraPosition, setCameraFov…) conservées pour compatibilité, qui redirigent vers core_camera en journalisant un avertissement de dépréciation (une fois par fonction).
--- Accès : globale `commands`
---@class commands
---@field getGame any Rétrocompatibilité ; vaut nil si la globale getGame n'existe pas.
---@field onSettingsChanged any Exporté depuis une variable non définie dans ce fichier : vaut nil (voir notes).
commands = {}

--- Applique un plan : déplace le cluster de nœuds du véhicule (setClusterPosRelRot), annule sa vitesse et met à jour la transformée d'origine.
---Source : lua/ge/server/commands.lua:128
---@param player integer|nil indice du joueur (non utilisé)
---@param plan table plan retourné par planDropPlayerAtCameraNoReset
---@return boolean  faux si le véhicule du plan n'existe plus
function commands.applyDropPlayerAtCameraNoResetPlan(player, plan) end

--- Modifie la vitesse normale de la caméra (typiquement Alt + molette).
---Source : lua/ge/server/commands.lua:53
---@param val number variation de vitesse (transmise à core_camera.changeSpeed)
function commands.changeCameraSpeed(val) end

--- Passe en caméra libre et la place à la position et orientation du véhicule du joueur.
---Source : lua/ge/server/commands.lua:73
---@param player integer|nil indice du joueur
function commands.dropCameraAtPlayer(player) end

--- Téléporte le véhicule du joueur à la position de la caméra, orienté selon la direction horizontale de la caméra, puis repasse en caméra de jeu (la caméra bigMap devient orbit) et la réinitialise.
---Source : lua/ge/server/commands.lua:82
---@param player integer|nil indice du joueur
function commands.dropPlayerAtCamera(player) end

--- Dépose le véhicule à la caméra sans reset. Si multiplayer_vehicleSync existe, délègue la demande à celui-ci ; sinon appelle dropPlayerAtCameraNoResetImpl.
---Source : lua/ge/server/commands.lua:148
---@param player integer|nil indice du joueur
function commands.dropPlayerAtCameraNoReset(player) end

--- Planifie puis applique le dépôt sans reset, puis remet la caméra en mode jeu.
---Source : lua/ge/server/commands.lua:140
---@param player integer|nil indice du joueur
---@return table|nil  le plan appliqué, ou nil en cas d'échec
function commands.dropPlayerAtCameraNoResetImpl(player) end

--- Retourne l'objet de scène « gameCamera » (rétrocompatibilité).
---Source : lua/ge/server/commands.lua:31
---@return table|nil  objet gameCamera
function commands.getCamera() end

--- Retourne la position et la rotation de la caméra sous forme de chaîne JSON.
---Source : lua/ge/server/commands.lua:164
---@return string  '[x, y, z, qx, qy, qz, qw]' (position à 2 décimales)
function commands.getCameraTransformJson() end

--- Initialise la caméra principale : vide les entrées de core_camera, retrouve l'objet « gameCamera », l'attache à la vue 'main', émet le hook onCameraHandlerSet et remet la configuration de caméra par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/server/commands.lua:8
---@return table|nil  objet de la scène gameCamera, ou nil s'il est introuvable
function commands.initCamera() end

--- Indique si la caméra active du joueur est « free ».
---Source : lua/ge/server/commands.lua:27
---@param player integer|nil indice du joueur
---@return boolean  vrai si la caméra libre est active
function commands.isFreeCamera(player) end

--- Hook appelé au début d'une saisie de nœud (node grab) : émet onNodegrab(true), mémorise si la caméra était libre et, si la saisie ne passe pas par le véhicule joueur, bascule en caméra libre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/server/commands.lua:58
---@param usingPlayerVehicle boolean vrai si la saisie utilise le véhicule du joueur
function commands.onNodegrabStart(usingPlayerVehicle) end

--- Hook appelé à la fin de la saisie de nœud : émet onNodegrab(false) et revient en caméra de jeu si la caméra libre avait été activée par la saisie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/server/commands.lua:66
---@param usingPlayerVehicle boolean vrai si la saisie utilisait le véhicule du joueur (non utilisé)
function commands.onNodegrabStop(usingPlayerVehicle) end

--- Calcule un plan de dépôt du véhicule à la position de la caméra sans le réinitialiser (la déformation est conservée).
---Source : lua/ge/server/commands.lua:106
---@param player integer|nil indice du joueur
---@return table|nil  plan {vid, nodeId, clusterId, x, y, z, rx, ry, rz, rw, origin*}, ou nil si pas de véhicule
function commands.planDropPlayerAtCameraNoReset(player) end

--- Repasse en caméra de jeu (bigMap devient orbit) et réinitialise la caméra du joueur ; étape finale du dépôt sans reset.
---Source : lua/ge/server/commands.lua:98
---@param player integer|nil indice du joueur
function commands.resetDropPlayerAtCameraNoResetCamera(player) end

--- Alias de compatibilité de setFreeCamera. Appelée par le C++.
---Source : lua/ge/server/commands.lua:40
---@param player integer|nil indice du joueur
function commands.setCameraFree(player) end

--- Alias de compatibilité de setGameCamera.
---Source : lua/ge/server/commands.lua:33
---@param player integer|nil indice du joueur
function commands.setCameraPlayer(player) end

--- Active la caméra libre (initialisée à la transformée actuelle de la vue), la réinitialise et émet onCameraToggled (FreeCam) pour la vue principale. Appelée par le C++.
---Source : lua/ge/server/commands.lua:40
---@param player integer|nil indice du joueur
function commands.setFreeCamera(player) end

--- Active la caméra libre puis lui applique la transformée décrite par une chaîne JSON de 7 nombres (x, y, z, qx, qy, qz, qw). Ignore silencieusement un JSON invalide ou incomplet.
---Source : lua/ge/server/commands.lua:170
---@param json string chaîne produite par getCameraTransformJson
function commands.setFreeCameraTransformJson(json) end

--- Repasse en caméra de jeu pour la vue du joueur ; émet onCameraToggled (GameCam) pour la vue principale. Alias : setCameraPlayer.
---Source : lua/ge/server/commands.lua:33
---@param player integer|nil indice du joueur
function commands.setGameCamera(player) end

--- Bascule la caméra : en écran partagé, bascule la caméra libre de la vue du joueur ; sinon passe au groupe de caméras suivant (core_camera.cycleCameraGroup, Maj+C).
---Source : lua/ge/server/commands.lua:156
---@param player integer|nil indice du joueur (0 par défaut)
function commands.toggleCamera(player) end

--- Active ou coupe le modificateur de vitesse rapide de la caméra libre (typiquement la touche Maj).
---Source : lua/ge/server/commands.lua:48
---@param enabled boolean vrai pour accélérer
function commands.toggleFastSpeed(enabled) end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getForward.
---Source : lua/ge/server/commands.lua:222
function getCameraForward() end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getFovDeg (retourne des degrés).
---Source : lua/ge/server/commands.lua:226
function getCameraFov() end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getFovDeg.
---Source : lua/ge/server/commands.lua:224
function getCameraFovDeg() end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getFovRad.
---Source : lua/ge/server/commands.lua:225
function getCameraFovRad() end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getPosition.
---Source : lua/ge/server/commands.lua:219
function getCameraPosition() end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getQuat.
---Source : lua/ge/server/commands.lua:223
function getCameraQuat() end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getRight.
---Source : lua/ge/server/commands.lua:221
function getCameraRight() end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getUp.
---Source : lua/ge/server/commands.lua:220
function getCameraUp() end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.setFOV. Règle le FOV en degrés si la caméra libre est active.
---Source : lua/ge/server/commands.lua:213
---@param fovDeg number FOV en degrés
function setCameraFov(fovDeg) end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.setFOV. Règle le champ de vision (degrés) si la caméra libre est active.
---Source : lua/ge/server/commands.lua:197
---@param fovDeg number FOV en degrés
function setCameraFovDeg(fovDeg) end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.setFOV. Règle le FOV (radians, converti en degrés) si la caméra libre est active.
---Source : lua/ge/server/commands.lua:207
---@param fovRad number FOV en radians
function setCameraFovRad(fovRad) end

--- (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.setPosRot. Applique position et quaternion à la caméra du joueur 0.
---Source : lua/ge/server/commands.lua:192
---@param px number x
---@param py number y
---@param pz number z
---@param rx number quat x
---@param ry number quat y
---@param rz number quat z
---@param rw number quat w
function setCameraPosRot(px, py, pz, rx, ry, rz, rw) end

