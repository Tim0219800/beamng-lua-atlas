# `core_camera.test`

*Fichier : `lua/ge/extensions/core/camera.test.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_camera.test` : `extensions.load("core_camera.test")`, puis la globale `core_camera.test`

Tests unitaires du système de caméras, pour le framework de tests du jeu. À lancer depuis la console Lua GE : extensions.testFramework_TestManager:runTestFiles('camera'). Chaque fonction testXxx reçoit un contexte ctx (assert, assertEqual). Elle vérifie notamment l'anneau de groupes de caméras, l'appartenance des caméras libres au groupe 'world', la caméra Drone Chase, la caméra conducteur 'occupant' et la présence de l'API de configuration des caméras libres. Utile comme exemple d'usage de core_camera.

## Exemple

```lua
extensions.testFramework_TestManager:runTestFiles('camera')
```

## Remarques

- Charge core_camera à la demande (extensions.load) si elle n'est pas chargée.
- Les tests documentent des comportements : nextCameraGroup({'world'}, nil) -> 'world', ('world') -> nil, (false) -> nil ; free, smoothFree et steadycam sont dans le groupe 'world' ; le mode droneChase est lié au véhicule, visible dans les options et désactivé par défaut ; une caméra 'driver' ancienne devient un mode 'occupant' avec seatSide 'right' si rightHandCamera.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_camera.test.testCameraGroupRing(ctx)` | Teste core_camera.nextCameraGroup : caméras de jeu vers caméras libres vers caméras de jeu. *(interne)* | 11 |
| `core_camera.test.testDroneIsRegularCamera(ctx)` | Vérifie le mode core/cameraModes/droneChase : non global, non caché, désactivé par défaut. *(interne)* | 25 |
| `core_camera.test.testFreeCameraConfigurationApi(ctx)` | Vérifie que core_camera expose getFreeCameraConfigurationReadOnly, changeFreeCameraOrder, toggleFreeCameraEnabledById et setCameraByNameFromOptions. *(interne)* | 43 |
| `core_camera.test.testFreeCameraModes(ctx)` | Vérifie que les caméras free, smoothFree et steadycam appartiennent au groupe 'world'. *(interne)* | 18 |
| `core_camera.test.testLegacyDriverIsOccupant(ctx)` | Vérifie la conversion d'une ancienne caméra 'driver' en mode occupant (noeud 5, côté 'right', épaule droite à 0.6 m). *(interne)* | 32 |

### Détail des paramètres

#### `core_camera.test.testCameraGroupRing(ctx)`

Teste core_camera.nextCameraGroup : caméras de jeu vers caméras libres vers caméras de jeu.

- `ctx` (*table*) : Contexte de test (assert, assertEqual)

#### `core_camera.test.testDroneIsRegularCamera(ctx)`

Vérifie le mode core/cameraModes/droneChase : non global, non caché, désactivé par défaut.

- `ctx` (*table*) : Contexte de test

#### `core_camera.test.testFreeCameraConfigurationApi(ctx)`

Vérifie que core_camera expose getFreeCameraConfigurationReadOnly, changeFreeCameraOrder, toggleFreeCameraEnabledById et setCameraByNameFromOptions.

- `ctx` (*table*) : Contexte de test

#### `core_camera.test.testFreeCameraModes(ctx)`

Vérifie que les caméras free, smoothFree et steadycam appartiennent au groupe 'world'.

- `ctx` (*table*) : Contexte de test

#### `core_camera.test.testLegacyDriverIsOccupant(ctx)`

Vérifie la conversion d'une ancienne caméra 'driver' en mode occupant (noeud 5, côté 'right', épaule droite à 0.6 m).

- `ctx` (*table*) : Contexte de test

**Charge les extensions :** `core_camera`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/camera.test.lua`.*
