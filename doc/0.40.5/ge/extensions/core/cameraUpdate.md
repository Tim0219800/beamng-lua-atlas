# `core_cameraUpdate`

*Fichier : `lua/ge/extensions/core/cameraUpdate.lua` · VM : Game Engine (GE) · 318 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_cameraUpdate` : `extensions.load("core_cameraUpdate")`, puis la globale `core_cameraUpdate`

Boucle de mise à jour de la caméra à chaque image, séparée de core/camera.lua. Elle traite la vue principale du joueur puis les contextes de rendu supplémentaires (écran partagé, flux vidéo) : remplit camData (position, vitesse, dt, véhicule suivi), appelle le mode de caméra sélectionné (caméra globale ou caméra du véhicule), puis les caméras « en cours d'exécution » (filtres), et copie le résultat dans finalCameraData. core_camera injecte son état via setup() et expose onPreRender / onClientPostStartMission comme ses propres callbacks ; un moddeur n'appelle normalement rien ici.

## Remarques

- Hooks émis : onCameraChanged(player, camName, vehId) quand le nom de caméra ou le véhicule change pour un contexte (player vaut 0 si le contexte n'a pas de joueur) ; onCameraPreRender(camData) seulement sur la vue principale et seulement quand une caméra globale a réussi son update().
- Si les calculs de caméra donnent NaN/inf, la dernière pose valide est réutilisée et le mode est réinitialisé via cam:init() (journal d'erreur).
- Repli en cascade : caméra du véhicule manquante -> « orbit » -> caméra libre (commands.setFreeCamera() sur la vue principale ; sur un contexte supplémentaire, la caméra globale 'free' du contexte).
- camData.dt est multiplié par cameraM.speedFactor (dtSim, dtReal, dtRaw aussi). Sur la vue principale, la distance des ombres de soleil vaut 0.5 en conduite (caméra attachée) et 1.0 avec une caméra globale.
- Le rayon SSAO passe à 0.5 quand la caméra est à l'intérieur du véhicule (et 1.5 dehors), sauf en mode bigMap.
- Le nearClip par défaut vient de theLevelInfo.nearClip, sinon 0.1 ; le fov par défaut vaut 60.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_cameraUpdate.onClientPostStartMission()` | Hook appelé après le démarrage d'un niveau : oublie le nearClip du niveau et l'état intérieur/extérieur de la caméra pour que le rayon SSAO soit réappliqué. *(interne)* *(hook)* | 79 |
| `core_cameraUpdate.onPreRender(dtReal, dtSim, dtRaw)` | Appelé à chaque image avant le rendu (via core_camera) : met à jour la vue principale puis chaque contexte supplémentaire. Ne fait rien tant que levelLoaded est faux. *(interne)* *(hook)* | 308 |
| `core_cameraUpdate.setup(deps)` | Reçoit de core/camera.lua ses tables d'état et ses fonctions utilitaires (extraContexts, mainContext, moveManager, getGlobalCameras, getVehicleData, getRunningCamsOrder, setGlobalCameraByName, set, vehicleChanged, isInsideBasedOnCameras, isUnicycle, cameraM). Appelé une fois par core_camera. *(interne)* | 22 |

### Détail des paramètres

#### `core_cameraUpdate.onPreRender(dtReal, dtSim, dtRaw)`

Appelé à chaque image avant le rendu (via core_camera) : met à jour la vue principale puis chaque contexte supplémentaire. Ne fait rien tant que levelLoaded est faux.

- `dtReal` (*number*) : dt de rendu lissé, en secondes
- `dtSim` (*number*) : dt de simulation lissé (tient compte du ralenti/pause), en secondes
- `dtRaw` (*number*) : dt de rendu brut, horloge réelle, en secondes

#### `core_cameraUpdate.setup(deps)`

Reçoit de core/camera.lua ses tables d'état et ses fonctions utilitaires (extraContexts, mainContext, moveManager, getGlobalCameras, getVehicleData, getRunningCamsOrder, setGlobalCameraByName, set, vehicleChanged, isInsideBasedOnCameras, isUnicycle, cameraM). Appelé une fois par core_camera.

- `deps` (*table*) : Table des dépendances injectées par core_camera, clés citées ci-dessus.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCameraChanged` — écouté par 3 module(s)
- `onCameraPreRender` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraUpdate.lua`.*
