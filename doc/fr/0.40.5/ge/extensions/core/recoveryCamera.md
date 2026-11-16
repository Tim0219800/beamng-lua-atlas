# `core_recoveryCamera`

*Fichier : `lua/ge/extensions/core/recoveryCamera.lua` · VM : Game Engine (GE) · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_recoveryCamera` : `extensions.load("core_recoveryCamera")`, puis la globale `core_recoveryCamera`

Caméra libre temporaire pendant le « recovery » (retour en arrière/réapparition) d'un véhicule. beginRecoveryCamera bascule le joueur assis dans ce véhicule en caméra libre, setRecoveryCameraPosRot la déplace, endRecoveryCamera restaure la caméra de jeu. Si le joueur était déjà en caméra libre, rien n'est modifié. Appelé en pratique depuis le code de recovery du véhicule.

## Exemple

```lua
core_recoveryCamera.beginRecoveryCamera(vid)
core_recoveryCamera.setRecoveryCameraPosRot(vid, x, y, z, qx, qy, qz, qw)
core_recoveryCamera.endRecoveryCamera(vid)
```

## Remarques

- Le joueur est retrouvé parmi core_multiseat.getPlayers() (ou {0}) via be:getPlayerVehicleID ; si personne n'est assis dans le véhicule, rien ne se passe.
- En mode multiseat, la caméra de recovery n'est active que si core_camera.getContextIdForPlayer(player) existe.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_recoveryCamera.beginRecoveryCamera(vehicleId)` | Démarre la caméra de recovery pour le joueur assis dans le véhicule : mémorise s'il était déjà en caméra libre, sinon appelle commands.setFreeCamera(player). | 27 |
| `core_recoveryCamera.endRecoveryCamera(vehicleId)` | Termine le recovery : oublie l'état et remet la caméra de jeu (commands.setGameCamera) si la caméra libre avait été activée par beginRecoveryCamera. | 45 |
| `core_recoveryCamera.onDespawnObject(vehicleId)` | Hook appelé quand un objet est supprimé : oublie un recovery en cours pour ce véhicule. *(interne)* *(hook)* | 52 |
| `core_recoveryCamera.setRecoveryCameraPosRot(vehicleId, px, py, pz, qx, qy, qz, qw)` | Place la caméra du joueur (core_camera.setPosRot). Sans effet si aucun recovery actif pour ce véhicule ou si le joueur était déjà en caméra libre. | 38 |

### Détail des paramètres

#### `core_recoveryCamera.beginRecoveryCamera(vehicleId)`

Démarre la caméra de recovery pour le joueur assis dans le véhicule : mémorise s'il était déjà en caméra libre, sinon appelle commands.setFreeCamera(player).

- `vehicleId` (*integer*) : Id du véhicule en recovery.

#### `core_recoveryCamera.endRecoveryCamera(vehicleId)`

Termine le recovery : oublie l'état et remet la caméra de jeu (commands.setGameCamera) si la caméra libre avait été activée par beginRecoveryCamera.

- `vehicleId` (*integer*) : Id du véhicule.

#### `core_recoveryCamera.onDespawnObject(vehicleId)`

Hook appelé quand un objet est supprimé : oublie un recovery en cours pour ce véhicule.

- `vehicleId` (*integer*) : Id de l'objet supprimé.

#### `core_recoveryCamera.setRecoveryCameraPosRot(vehicleId, px, py, pz, qx, qy, qz, qw)`

Place la caméra du joueur (core_camera.setPosRot). Sans effet si aucun recovery actif pour ce véhicule ou si le joueur était déjà en caméra libre.

- `vehicleId` (*integer*) : Id du véhicule.
- `px` (*number*) : Position x (m).
- `py` (*number*) : Position y (m).
- `pz` (*number*) : Position z (m).
- `qx` (*number*) : Quaternion x.
- `qy` (*number*) : Quaternion y.
- `qz` (*number*) : Quaternion z.
- `qw` (*number*) : Quaternion w.

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/recoveryCamera.lua`.*
