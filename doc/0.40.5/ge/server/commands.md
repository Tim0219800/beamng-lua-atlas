# `commands`

*Fichier : `lua/ge/server/commands.lua` · VM : Game Engine (GE) · 253 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `commands`

Commandes de caméra et de placement du joueur, appelées en grande partie par le côté C++ et les actions d'entrée : basculer entre caméra de jeu et caméra libre, vitesse de la caméra libre, déposer la caméra sur le véhicule ou le véhicule à la position de la caméra, lire/écrire la transformée de la caméra libre en JSON. Contient aussi d'anciennes fonctions globales (getCameraPosition, setCameraFov…) conservées pour compatibilité, qui redirigent vers core_camera en journalisant un avertissement de dépréciation (une fois par fonction).

## Exemple

```lua
commands.toggleCamera(0)
local json = commands.getCameraTransformJson() -- '[x, y, z, qx, qy, qz, qw]'
```

## Remarques

- setFreeCamera est appelée par le C++ : ne pas la renommer ni la déplacer.
- Alias de compatibilité : setCameraFree = setFreeCamera ; setCameraPlayer = setGameCamera ; getCamera retourne l'objet scenetree « gameCamera ».
- Bug : M.getGame = getGame et M.onSettingsChanged = onSettingsChanged exportent des variables jamais définies dans ce fichier ; ces champs valent donc nil sauf si une globale du même nom existe.
- Dans les globales dépréciées, setCameraFovDeg/Rad/setCameraFov n'agissent que si la caméra libre est active.
- Dans les fonctions dropPlayerAtCamera, la rotation du véhicule est multipliée par quat(0,0,1,0) car l'avant d'un véhicule est inversé.
- Hooks émis : onCameraHandlerSet (initCamera), onCameraToggled ({cameraType = 'GameCam'|'FreeCam'}), onNodegrab (true/false).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `commands.applyDropPlayerAtCameraNoResetPlan(player, plan)` | Applique un plan : déplace le cluster de nœuds du véhicule (setClusterPosRelRot), annule sa vitesse et met à jour la transformée d'origine. | 128 |
| `commands.changeCameraSpeed(val)` | Modifie la vitesse normale de la caméra (typiquement Alt + molette). | 53 |
| `commands.dropCameraAtPlayer(player)` | Passe en caméra libre et la place à la position et orientation du véhicule du joueur. | 73 |
| `commands.dropPlayerAtCamera(player)` | Téléporte le véhicule du joueur à la position de la caméra, orienté selon la direction horizontale de la caméra, puis repasse en caméra de jeu (la caméra bigMap devient orbit) et la réinitialise. | 82 |
| `commands.dropPlayerAtCameraNoReset(player)` | Dépose le véhicule à la caméra sans reset. Si multiplayer_vehicleSync existe, délègue la demande à celui-ci ; sinon appelle dropPlayerAtCameraNoResetImpl. | 148 |
| `commands.dropPlayerAtCameraNoResetImpl(player)` | Planifie puis applique le dépôt sans reset, puis remet la caméra en mode jeu. | 140 |
| `commands.getCamera()` | Retourne l'objet de scène « gameCamera » (rétrocompatibilité). | 31 |
| `commands.getCameraTransformJson()` | Retourne la position et la rotation de la caméra sous forme de chaîne JSON. | 164 |
| `commands.initCamera()` | Initialise la caméra principale : vide les entrées de core_camera, retrouve l'objet « gameCamera », l'attache à la vue 'main', émet le hook onCameraHandlerSet et remet la configuration de caméra par défaut. *(interne)* | 8 |
| `commands.isFreeCamera(player)` | Indique si la caméra active du joueur est « free ». | 27 |
| `commands.onNodegrabStart(usingPlayerVehicle)` | Hook appelé au début d'une saisie de nœud (node grab) : émet onNodegrab(true), mémorise si la caméra était libre et, si la saisie ne passe pas par le véhicule joueur, bascule en caméra libre. *(interne)* *(hook)* | 58 |
| `commands.onNodegrabStop(usingPlayerVehicle)` | Hook appelé à la fin de la saisie de nœud : émet onNodegrab(false) et revient en caméra de jeu si la caméra libre avait été activée par la saisie. *(interne)* *(hook)* | 66 |
| `commands.planDropPlayerAtCameraNoReset(player)` | Calcule un plan de dépôt du véhicule à la position de la caméra sans le réinitialiser (la déformation est conservée). | 106 |
| `commands.resetDropPlayerAtCameraNoResetCamera(player)` | Repasse en caméra de jeu (bigMap devient orbit) et réinitialise la caméra du joueur ; étape finale du dépôt sans reset. | 98 |
| `commands.setCameraFree(player)` | Alias de compatibilité de setFreeCamera. Appelée par le C++. | 40 |
| `commands.setCameraPlayer(player)` | Alias de compatibilité de setGameCamera. | 33 |
| `commands.setFreeCamera(player)` | Active la caméra libre (initialisée à la transformée actuelle de la vue), la réinitialise et émet onCameraToggled (FreeCam) pour la vue principale. Appelée par le C++. | 40 |
| `commands.setFreeCameraTransformJson(json)` | Active la caméra libre puis lui applique la transformée décrite par une chaîne JSON de 7 nombres (x, y, z, qx, qy, qz, qw). Ignore silencieusement un JSON invalide ou incomplet. | 170 |
| `commands.setGameCamera(player)` | Repasse en caméra de jeu pour la vue du joueur ; émet onCameraToggled (GameCam) pour la vue principale. Alias : setCameraPlayer. | 33 |
| `commands.toggleCamera(player)` | Bascule la caméra : en écran partagé, bascule la caméra libre de la vue du joueur ; sinon passe au groupe de caméras suivant (core_camera.cycleCameraGroup, Maj+C). | 156 |
| `commands.toggleFastSpeed(enabled)` | Active ou coupe le modificateur de vitesse rapide de la caméra libre (typiquement la touche Maj). | 48 |

### Détail des paramètres

#### `commands.applyDropPlayerAtCameraNoResetPlan(player, plan)`

Applique un plan : déplace le cluster de nœuds du véhicule (setClusterPosRelRot), annule sa vitesse et met à jour la transformée d'origine.

- `player` (*integer|nil*) : indice du joueur (non utilisé)
- `plan` (*table*) : plan retourné par planDropPlayerAtCameraNoReset
- **renvoie** : boolean faux si le véhicule du plan n'existe plus

#### `commands.changeCameraSpeed(val)`

Modifie la vitesse normale de la caméra (typiquement Alt + molette).

- `val` (*number*) : variation de vitesse (transmise à core_camera.changeSpeed)

#### `commands.dropCameraAtPlayer(player)`

Passe en caméra libre et la place à la position et orientation du véhicule du joueur.

- `player` (*integer|nil*) : indice du joueur

#### `commands.dropPlayerAtCamera(player)`

Téléporte le véhicule du joueur à la position de la caméra, orienté selon la direction horizontale de la caméra, puis repasse en caméra de jeu (la caméra bigMap devient orbit) et la réinitialise.

- `player` (*integer|nil*) : indice du joueur

#### `commands.dropPlayerAtCameraNoReset(player)`

Dépose le véhicule à la caméra sans reset. Si multiplayer_vehicleSync existe, délègue la demande à celui-ci ; sinon appelle dropPlayerAtCameraNoResetImpl.

- `player` (*integer|nil*) : indice du joueur

#### `commands.dropPlayerAtCameraNoResetImpl(player)`

Planifie puis applique le dépôt sans reset, puis remet la caméra en mode jeu.

- `player` (*integer|nil*) : indice du joueur
- **renvoie** : table|nil le plan appliqué, ou nil en cas d'échec

#### `commands.getCamera()`

Retourne l'objet de scène « gameCamera » (rétrocompatibilité).

- **renvoie** : table|nil objet gameCamera

#### `commands.getCameraTransformJson()`

Retourne la position et la rotation de la caméra sous forme de chaîne JSON.

- **renvoie** : string '[x, y, z, qx, qy, qz, qw]' (position à 2 décimales)

#### `commands.initCamera()`

Initialise la caméra principale : vide les entrées de core_camera, retrouve l'objet « gameCamera », l'attache à la vue 'main', émet le hook onCameraHandlerSet et remet la configuration de caméra par défaut.

- **renvoie** : table|nil objet de la scène gameCamera, ou nil s'il est introuvable

#### `commands.isFreeCamera(player)`

Indique si la caméra active du joueur est « free ».

- `player` (*integer|nil*) : indice du joueur
- **renvoie** : boolean vrai si la caméra libre est active

#### `commands.onNodegrabStart(usingPlayerVehicle)`

Hook appelé au début d'une saisie de nœud (node grab) : émet onNodegrab(true), mémorise si la caméra était libre et, si la saisie ne passe pas par le véhicule joueur, bascule en caméra libre.

- `usingPlayerVehicle` (*boolean*) : vrai si la saisie utilise le véhicule du joueur

#### `commands.onNodegrabStop(usingPlayerVehicle)`

Hook appelé à la fin de la saisie de nœud : émet onNodegrab(false) et revient en caméra de jeu si la caméra libre avait été activée par la saisie.

- `usingPlayerVehicle` (*boolean*) : vrai si la saisie utilisait le véhicule du joueur (non utilisé)

#### `commands.planDropPlayerAtCameraNoReset(player)`

Calcule un plan de dépôt du véhicule à la position de la caméra sans le réinitialiser (la déformation est conservée).

- `player` (*integer|nil*) : indice du joueur
- **renvoie** : table|nil plan {vid, nodeId, clusterId, x, y, z, rx, ry, rz, rw, origin*}, ou nil si pas de véhicule

#### `commands.resetDropPlayerAtCameraNoResetCamera(player)`

Repasse en caméra de jeu (bigMap devient orbit) et réinitialise la caméra du joueur ; étape finale du dépôt sans reset.

- `player` (*integer|nil*) : indice du joueur

#### `commands.setCameraFree(player)`

Alias de compatibilité de setFreeCamera. Appelée par le C++.

- `player` (*integer|nil*) : indice du joueur

#### `commands.setCameraPlayer(player)`

Alias de compatibilité de setGameCamera.

- `player` (*integer|nil*) : indice du joueur

#### `commands.setFreeCamera(player)`

Active la caméra libre (initialisée à la transformée actuelle de la vue), la réinitialise et émet onCameraToggled (FreeCam) pour la vue principale. Appelée par le C++.

- `player` (*integer|nil*) : indice du joueur

#### `commands.setFreeCameraTransformJson(json)`

Active la caméra libre puis lui applique la transformée décrite par une chaîne JSON de 7 nombres (x, y, z, qx, qy, qz, qw). Ignore silencieusement un JSON invalide ou incomplet.

- `json` (*string*) : chaîne produite par getCameraTransformJson

#### `commands.setGameCamera(player)`

Repasse en caméra de jeu pour la vue du joueur ; émet onCameraToggled (GameCam) pour la vue principale. Alias : setCameraPlayer.

- `player` (*integer|nil*) : indice du joueur

#### `commands.toggleCamera(player)`

Bascule la caméra : en écran partagé, bascule la caméra libre de la vue du joueur ; sinon passe au groupe de caméras suivant (core_camera.cycleCameraGroup, Maj+C).

- `player` (*integer|nil*) : indice du joueur (0 par défaut)

#### `commands.toggleFastSpeed(enabled)`

Active ou coupe le modificateur de vitesse rapide de la caméra libre (typiquement la touche Maj).

- `enabled` (*boolean*) : vrai pour accélérer

## Champs

| Champ | Type | Description |
|---|---|---|
| `getGame` | any | Rétrocompatibilité ; vaut nil si la globale getGame n'existe pas. |
| `onSettingsChanged` | any | Exporté depuis une variable non définie dans ce fichier : vaut nil (voir notes). |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `getCameraForward()` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getForward. | 222 |
| `getCameraFov()` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getFovDeg (retourne des degrés). | 226 |
| `getCameraFovDeg()` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getFovDeg. | 224 |
| `getCameraFovRad()` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getFovRad. | 225 |
| `getCameraPosition()` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getPosition. | 219 |
| `getCameraQuat()` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getQuat. | 223 |
| `getCameraRight()` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getRight. | 221 |
| `getCameraUp()` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.getUp. | 220 |
| `setCameraFov(fovDeg)` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.setFOV. Règle le FOV en degrés si la caméra libre est active. | 213 |
| `setCameraFovDeg(fovDeg)` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.setFOV. Règle le champ de vision (degrés) si la caméra libre est active. | 197 |
| `setCameraFovRad(fovRad)` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.setFOV. Règle le FOV (radians, converti en degrés) si la caméra libre est active. | 207 |
| `setCameraPosRot(px, py, pz, rx, ry, rz, rw)` | (Fonction globale, pas dans M.) Déprécié : utiliser core_camera.setPosRot. Applique position et quaternion à la caméra du joueur 0. | 192 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCameraHandlerSet`
- `onCameraToggled` — écouté par 1 module(s)
- `onNodegrab` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/server/commands.lua`.*
