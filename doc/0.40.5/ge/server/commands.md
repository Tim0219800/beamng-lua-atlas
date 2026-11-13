# `commands`

*Fichier : `lua/ge/server/commands.lua` · VM : Game Engine (GE) · 253 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `commands`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `commands.applyDropPlayerAtCameraNoResetPlan(player, plan)` |  | 128 |
| `commands.changeCameraSpeed(val)` | camera modifier for normal speed (typically alt+scrollwheel) | 53 |
| `commands.dropCameraAtPlayer(player)` |  | 73 |
| `commands.dropPlayerAtCamera(player)` |  | 82 |
| `commands.dropPlayerAtCameraNoReset(player)` |  | 148 |
| `commands.dropPlayerAtCameraNoResetImpl(player)` |  | 140 |
| `commands.getCamera()` |  | 31 |
| `commands.getCameraTransformJson()` |  | 164 |
| `commands.initCamera()` |  | 8 |
| `commands.isFreeCamera(player)` |  | 27 |
| `commands.onNodegrabStart(usingPlayerVehicle)` | retrocompat *(hook)* | 58 |
| `commands.onNodegrabStop(usingPlayerVehicle)` | *(hook)* | 66 |
| `commands.planDropPlayerAtCameraNoReset(player)` |  | 106 |
| `commands.resetDropPlayerAtCameraNoResetCamera(player)` |  | 98 |
| `commands.setCameraFree(player)` | function used by C++ side, if you rename or move, you need to edit C++ side too | 40 |
| `commands.setCameraPlayer(player)` | retrocompat | 33 |
| `commands.setFreeCamera(player)` | function used by C++ side, if you rename or move, you need to edit C++ side too | 40 |
| `commands.setFreeCameraTransformJson(json)` |  | 170 |
| `commands.setGameCamera(player)` | function used by C++ side, if you rename or move, you need to edit C++ side too | 33 |
| `commands.toggleCamera(player)` |  | 156 |
| `commands.toggleFastSpeed(enabled)` | camera modifier for faster speed (typically shift key) | 48 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `getGame` | any | retrocompat |
| `onSettingsChanged` | any |  |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `getCameraForward()` |  | 222 |
| `getCameraFov()` |  | 226 |
| `getCameraFovDeg()` |  | 224 |
| `getCameraFovRad()` |  | 225 |
| `getCameraPosition()` |  | 219 |
| `getCameraQuat()` |  | 223 |
| `getCameraRight()` |  | 221 |
| `getCameraUp()` |  | 220 |
| `setCameraFov(fovDeg)` |  | 213 |
| `setCameraFovDeg(fovDeg)` |  | 197 |
| `setCameraFovRad(fovRad)` |  | 207 |
| `setCameraPosRot(px, py, pz, rx, ry, rz, rw)` |  | 192 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCameraHandlerSet`
- `onCameraToggled` — écouté par 1 module(s)
- `onNodegrab` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/server/commands.lua`.*
