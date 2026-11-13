# `ui_photomode_camera`

*Fichier : `lua/ge/extensions/ui/photomode/camera.lua` · VM : Game Engine (GE) · 1380 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_camera` : `extensions.load("ui_photomode_camera")`, puis la globale `ui_photomode_camera`

Caméra du mode photo : FOV, vitesse de la caméra libre, roulis, exposition (auto ou EV manuel), mouvement lissé, visibilité des nœuds fixes du NodeGrabber, signets de caméra (absolus dans le monde ou relatifs au véhicule du joueur) et presets de caméra. Le module passe par core_camera (via ui_photomode_shared.getCoreCameraFunction) et par commands.setFreeCamera pour basculer en caméra libre, et mémorise l'état d'entrée pour le restaurer à la sortie du mode photo. Il sert de backend au panneau caméra de l'UI du mode photo.

## Exemple

```lua
ui_photomode_camera.setCameraFov(45)
local r = ui_photomode_camera.saveCurrentCameraBookmark()
-- plus tard
ui_photomode_camera.restoreSavedFreeCameraBookmark()
```

## Remarques

- Les fonctions renvoient une table. En cas d'échec : {ok = false, reason, ...}. En cas de succès, le champ ok est ABSENT (pas de ok = true) : tester res.ok ~= false plutôt que res.ok.
- Bornes appliquées par clamp : FOV 10 à 120 degrés (défaut 60), vitesse 2 à 300 (défaut 15), roulis -90 à 90 degrés (défaut 0), EV manuel -20 à 20 (défaut 10).
- Raisons d'échec courantes : camera_api_unavailable, camera_mode_unsupported (caméra « path » active, ou roulis hors caméra libre), camera_set_failed, camera_mode_switch_failed, bookmark_unavailable, bookmark_invalid, vehicle_unavailable, exposure_settings_unavailable, camera_exposure_patch_empty, nodegrabber_unavailable, preset_level_mismatch.
- Le roulis n'est modifiable qu'en caméra libre ; le FOV ne l'est pas avec la caméra « path ».
- Un signet relatif (mode relativeFreecam) stocke la position et la rotation de la caméra dans le repère de la boîte englobante (OOBB) du véhicule joueur ; un signet absolu stocke pos (x,y,z), rot (quaternion x,y,z,w) et fov dans le monde.
- L'exposition passe par l'objet scenetree « PostEffectLocalExposureObject » (champs autoExposure et manualEV).
- Au début de la session, captureNodeGrabberRestoreState masque les nœuds fixes du NodeGrabber ; restoreNodeGrabberState les rétablit à la fin (visibles par défaut si aucun getter n'existe).

**Dépendances (chargées avant) :** `ui_photomode_shared`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_camera.activateSessionFreeCamera()` | Passe en caméra libre au début de la session (sauf si la caméra d'entrée est « path » ou si la caméra libre est déjà active) et note qu'il faudra restaurer la caméra d'entrée à la sortie. *(interne)* | 485 |
| `ui_photomode_camera.applyPresetState(state)` | Applique un preset de caméra : refuse un preset de scène d'un autre niveau (preset_level_mismatch), restaure le signet ou applique FOV et roulis, puis vitesse, lissage et exposition. | 1225 |
| `ui_photomode_camera.buildMetadataState()` | Sous-ensemble de l'état à écrire dans les métadonnées d'une photo : pos, rot, fov, speed, yawDeg, pitchDown, rollDeg. | 784 |
| `ui_photomode_camera.buildState()` | Construit l'état de la caméra : sessionActive, disponibilité des signets, availability (exposure, nodeGrabber, smoothMovement), pos, rot, fov, speed, yawDeg, pitchDown, rollDeg, autoExposure, manualEV, nodeGrabberVisible, smoothMovement. | 751 |
| `ui_photomode_camera.captureDefaultPresetState()` | Preset « par défaut » construit à partir de l'état capturé à l'entrée de la session (fov, roulis, vitesse, lissage, exposition, levelId), ou nil si aucune session n'a été capturée. | 1207 |
| `ui_photomode_camera.captureNodeGrabberRestoreState()` | Mémorise la visibilité des nœuds fixes du NodeGrabber puis les masque pour la session. *(interne)* | 436 |
| `ui_photomode_camera.capturePresetState(options)` | État de caméra à enregistrer dans un preset. Type « vehicle » : signet relatif au véhicule (nil s'il est indisponible) ; type « scene » (défaut) : position absolue et levelId. Inclut aussi speed, smoothMovement, autoExposure, manualEV. | 1170 |
| `ui_photomode_camera.captureRestoreState()` | Capture l'état de la caméra à l'entrée de la session (pos, rot, fov, vitesse, roulis, lissage, exposition, nom de la caméra active). Appelée au début d'une session du mode photo. *(interne)* | 467 |
| `ui_photomode_camera.getCameraState()` | Renvoie l'état courant de la caméra (identique à buildState). | 1166 |
| `ui_photomode_camera.getTemporaryPresetList()` | Convertit les objets CameraBookmark de la scène (scenetree.findClassObjects) en presets temporaires de type camera (id __cameraBookmark_<id>, source cameraBookmark, position absolue). Liste vide si l'API est indisponible. | 1314 |
| `ui_photomode_camera.resetCameraDefaults()` | Remet les valeurs par défaut : mouvement lissé coupé, vitesse 15, roulis 0, exposition automatique avec EV manuel 10. Passe en caméra libre si nécessaire. | 1129 |
| `ui_photomode_camera.restoreCameraBookmark(bookmark)` | Déplace la caméra libre vers un signet (absolu : pos, rot, fov ; ou relatif : offset, rotOffset, fov calculés par rapport au véhicule joueur). Bascule en caméra libre si besoin. Accepte un signet {camera = {...}} ou directement le contenu. | 985 |
| `ui_photomode_camera.restoreNodeGrabberState()` | Rétablit la visibilité des nœuds fixes mémorisée au début de la session. *(interne)* | 452 |
| `ui_photomode_camera.restoreSavedFreeCameraBookmark()` | Restaure le signet absolu enregistré. | 1106 |
| `ui_photomode_camera.restoreSavedRelativeCameraBookmark()` | Restaure le signet relatif au véhicule enregistré ; l'efface s'il est invalide. | 1117 |
| `ui_photomode_camera.restoreSessionCameraTransformState()` | Replace la caméra libre à la position/rotation (et FOV) capturées au début de la session. | 797 |
| `ui_photomode_camera.restoreState()` | Restaure le mode de caméra d'entrée, le FOV, la vitesse, le roulis, le lissage et l'exposition capturés. Appelée à la fin de la session. *(interne)* | 703 |
| `ui_photomode_camera.saveCurrentCameraBookmark()` | Enregistre la position actuelle de la caméra comme signet de session : un signet absolu, et un signet relatif au véhicule joueur s'il est calculable. | 899 |
| `ui_photomode_camera.setCameraExposureState(partialState)` | Modifie l'exposition de la caméra : autoExposure (booléen) et/ou manualEV (-20 à 20). | 930 |
| `ui_photomode_camera.setCameraFov(value)` | Règle le FOV (borné à 10-120 degrés). Utilise la caméra libre (id 0) ou le véhicule joueur. Refusé avec la caméra « path ». | 914 |
| `ui_photomode_camera.setCameraRoll(value)` | Règle le roulis de la caméra libre (-90 à 90 degrés) en conservant lacet et tangage actuels. | 969 |
| `ui_photomode_camera.setCameraSmoothMovement(value)` | Active ou coupe le mouvement lissé de la caméra libre (réglage cameraFreeSmoothMovement) et prévient l'UI des réglages. | 1349 |
| `ui_photomode_camera.setCameraSpeed(value)` | Règle la vitesse de déplacement de la caméra (bornée à 2-300). | 953 |
| `ui_photomode_camera.setNodeGrabberVisible(value)` | Affiche ou masque les nœuds fixes du NodeGrabber (Engine.NodeGrabber_setFixedNodesVisible). | 1329 |

### Détail des paramètres

#### `ui_photomode_camera.applyPresetState(state)`

Applique un preset de caméra : refuse un preset de scène d'un autre niveau (preset_level_mismatch), restaure le signet ou applique FOV et roulis, puis vitesse, lissage et exposition.

- `state` (*table*) : État de preset
- **renvoie** : table {state} ou {ok = false, reason}

#### `ui_photomode_camera.buildMetadataState()`

Sous-ensemble de l'état à écrire dans les métadonnées d'une photo : pos, rot, fov, speed, yawDeg, pitchDown, rollDeg.

- **renvoie** : table Données de caméra

#### `ui_photomode_camera.buildState()`

Construit l'état de la caméra : sessionActive, disponibilité des signets, availability (exposure, nodeGrabber, smoothMovement), pos, rot, fov, speed, yawDeg, pitchDown, rollDeg, autoExposure, manualEV, nodeGrabberVisible, smoothMovement.

- **renvoie** : table État de la caméra

#### `ui_photomode_camera.captureDefaultPresetState()`

Preset « par défaut » construit à partir de l'état capturé à l'entrée de la session (fov, roulis, vitesse, lissage, exposition, levelId), ou nil si aucune session n'a été capturée.

- **renvoie** : table|nil État par défaut

#### `ui_photomode_camera.capturePresetState(options)`

État de caméra à enregistrer dans un preset. Type « vehicle » : signet relatif au véhicule (nil s'il est indisponible) ; type « scene » (défaut) : position absolue et levelId. Inclut aussi speed, smoothMovement, autoExposure, manualEV.

- `options` (*table|nil*) : {cameraPresetType = "vehicle"|"scene"}
- **renvoie** : table|nil État du preset

#### `ui_photomode_camera.getCameraState()`

Renvoie l'état courant de la caméra (identique à buildState).

- **renvoie** : table État de la caméra

#### `ui_photomode_camera.getTemporaryPresetList()`

Convertit les objets CameraBookmark de la scène (scenetree.findClassObjects) en presets temporaires de type camera (id __cameraBookmark_<id>, source cameraBookmark, position absolue). Liste vide si l'API est indisponible.

- **renvoie** : table[] Presets temporaires

#### `ui_photomode_camera.resetCameraDefaults()`

Remet les valeurs par défaut : mouvement lissé coupé, vitesse 15, roulis 0, exposition automatique avec EV manuel 10. Passe en caméra libre si nécessaire.

- **renvoie** : table {state} ou {ok = false, reason}

#### `ui_photomode_camera.restoreCameraBookmark(bookmark)`

Déplace la caméra libre vers un signet (absolu : pos, rot, fov ; ou relatif : offset, rotOffset, fov calculés par rapport au véhicule joueur). Bascule en caméra libre si besoin. Accepte un signet {camera = {...}} ou directement le contenu.

- `bookmark` (*table*) : Signet absolu ou relatif
- **renvoie** : table {state} ou {ok = false, reason}

#### `ui_photomode_camera.restoreSavedFreeCameraBookmark()`

Restaure le signet absolu enregistré.

- **renvoie** : table Résultat de restoreCameraBookmark, ou {ok = false, reason = "bookmark_unavailable"}

#### `ui_photomode_camera.restoreSavedRelativeCameraBookmark()`

Restaure le signet relatif au véhicule enregistré ; l'efface s'il est invalide.

- **renvoie** : table Résultat de restoreCameraBookmark, ou {ok = false, reason = "bookmark_unavailable"}

#### `ui_photomode_camera.restoreSessionCameraTransformState()`

Replace la caméra libre à la position/rotation (et FOV) capturées au début de la session.

- **renvoie** : table {state} ou {ok = false, reason}

#### `ui_photomode_camera.saveCurrentCameraBookmark()`

Enregistre la position actuelle de la caméra comme signet de session : un signet absolu, et un signet relatif au véhicule joueur s'il est calculable.

- **renvoie** : table {state} ou {ok = false, reason = "camera_state_unavailable", state}

#### `ui_photomode_camera.setCameraExposureState(partialState)`

Modifie l'exposition de la caméra : autoExposure (booléen) et/ou manualEV (-20 à 20).

- `partialState` (*table*) : {autoExposure?, manualEV?}
- **renvoie** : table {state} ou {ok = false, reason, state}

#### `ui_photomode_camera.setCameraFov(value)`

Règle le FOV (borné à 10-120 degrés). Utilise la caméra libre (id 0) ou le véhicule joueur. Refusé avec la caméra « path ».

- `value` (*number*) : FOV en degrés
- **renvoie** : table {value} en cas de succès, sinon {ok = false, reason, value}

#### `ui_photomode_camera.setCameraRoll(value)`

Règle le roulis de la caméra libre (-90 à 90 degrés) en conservant lacet et tangage actuels.

- `value` (*number*) : Roulis en degrés
- **renvoie** : table {value} ou {ok = false, reason, value}

#### `ui_photomode_camera.setCameraSmoothMovement(value)`

Active ou coupe le mouvement lissé de la caméra libre (réglage cameraFreeSmoothMovement) et prévient l'UI des réglages.

- `value` (*boolean|table*) : Booléen, ou table dont le champ smoothMovement est lu
- **renvoie** : table {value, state} ou {ok = false, reason, state}

#### `ui_photomode_camera.setCameraSpeed(value)`

Règle la vitesse de déplacement de la caméra (bornée à 2-300).

- `value` (*number*) : Vitesse de la caméra
- **renvoie** : table {value} ou {ok = false, reason, value}

#### `ui_photomode_camera.setNodeGrabberVisible(value)`

Affiche ou masque les nœuds fixes du NodeGrabber (Engine.NodeGrabber_setFixedNodesVisible).

- `value` (*boolean|table*) : Booléen, ou table dont le champ nodeGrabberVisible est lu
- **renvoie** : table {value, state} ou {ok = false, reason, state}

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_photomode_shared"} |

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/camera.lua`.*
