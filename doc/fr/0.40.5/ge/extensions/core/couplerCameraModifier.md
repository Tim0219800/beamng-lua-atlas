# `core_couplerCameraModifier`

*Fichier : `lua/ge/extensions/core/couplerCameraModifier.lua` · VM : Game Engine (GE) · 234 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_couplerCameraModifier` : `extensions.load("core_couplerCameraModifier")`, puis la globale `core_couplerCameraModifier`

Quand le véhicule du joueur 0 est attelé à une remorque (distance entre les deux véhicules entre 1 et 15 m, l'un des deux de type « Trailer »), cette extension verrouille leurs caméras orbit, règle leur distance à (d1+d2)/1.5+1 et recentre la caméra du joueur sur le milieu de l'attelage à chaque image. À la séparation, au rechargement ou si l'écart devient trop grand, les caméras orbit sont restaurées. Active seulement si le réglage settings « couplerCameraModifier » est vrai (sinon onExtensionLoaded renvoie false).

## Remarques

- Utilise core_camera : getCameraDataById, setDefaultDistance, setDistance, setTargetMode, setRef ; le mode utilisé est « orbit » (champs orbit.refNodes.ref/left/back, orbit.offset, orbit.lockCamera, orbit.distance, 5 m par défaut).
- Seul le joueur 0 est considéré (be:getPlayerVehicleID(0)).
- Incohérence : checkForTrailer appelle obj1:getPosition() et obj2:getPosition() avant de tester obj1/obj2 ~= nil (erreur si un id est introuvable).
- onExtensionLoaded renvoie false si le réglage est désactivé (retour non utilisé ailleurs dans ce fichier).

**Dépendances (chargées avant) :** `core_trailerRespawn`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_couplerCameraModifier.checkForTrailer(objId1_, objId2_)` | Dit si deux véhicules forment un attelage voisin avec remorque : ids différents, au moins l'un de type « Trailer » (core_trailerRespawn.getConfigType) et distance comprise entre 1 et 15 m. | 19 |
| `core_couplerCameraModifier.onCouplerAttached(objId1_, objId2_)` | Hook : deux véhicules s'attellent ; si l'un est le véhicule du joueur 0 et que checkForTrailer est vrai, démarre le suivi. *(interne)* *(hook)* | 107 |
| `core_couplerCameraModifier.onCouplerDetached(objId1_, objId2_)` | Hook : appelé pour tout détachement dans le monde ; arrête le suivi seulement s'il concerne la paire suivie. *(interne)* *(hook)* | 118 |
| `core_couplerCameraModifier.onDeserialized(data)` | Hook : restaure objId1, objId2, detached. *(interne)* *(hook)* | 215 |
| `core_couplerCameraModifier.onExtensionLoaded()` | Hook : si le réglage couplerCameraModifier est actif, prend en charge un attelage déjà existant du véhicule du joueur 0. *(interne)* *(hook)* | 102 |
| `core_couplerCameraModifier.onExtensionUnloaded()` | Hook : restaure les caméras orbit d'origine (restoreOriginalCamera). *(interne)* *(hook)* | 52 |
| `core_couplerCameraModifier.onSerialize()` | Hook : sauvegarde objId1, objId2, detached. *(interne)* *(hook)* | 207 |
| `core_couplerCameraModifier.onUpdate()` | Hook par image : calcule la position moyenne des deux caméras orbit et applique setTargetMode(vid, 'notCenter') + setRef(vid, milieu, gauche, arrière) au véhicule du joueur ; restaure si les caméras sont plus éloignées que la somme des distances orbit. *(interne)* *(hook)* | 125 |
| `core_couplerCameraModifier.onVehicleSpawned(vehId)` | Hook : si un des véhicules suivis est remplacé, arrête le suivi. *(interne)* *(hook)* | 201 |
| `core_couplerCameraModifier.onVehicleSwitched(oldId, newId, player)` | Hook : le joueur change de véhicule ; cherche un attelage pour le nouveau. *(interne)* *(hook)* | 197 |

### Détail des paramètres

#### `core_couplerCameraModifier.checkForTrailer(objId1_, objId2_)`

Dit si deux véhicules forment un attelage voisin avec remorque : ids différents, au moins l'un de type « Trailer » (core_trailerRespawn.getConfigType) et distance comprise entre 1 et 15 m.

- `objId1_` (*integer*) : id du premier véhicule
- `objId2_` (*integer*) : id du second véhicule
- **renvoie** : boolean true si c'est un attelage avec remorque

#### `core_couplerCameraModifier.onCouplerAttached(objId1_, objId2_)`

Hook : deux véhicules s'attellent ; si l'un est le véhicule du joueur 0 et que checkForTrailer est vrai, démarre le suivi.

- `objId1_` (*integer*) : id véhicule 1
- `objId2_` (*integer*) : id véhicule 2

#### `core_couplerCameraModifier.onCouplerDetached(objId1_, objId2_)`

Hook : appelé pour tout détachement dans le monde ; arrête le suivi seulement s'il concerne la paire suivie.

- `objId1_` (*integer*) : id véhicule 1
- `objId2_` (*integer*) : id véhicule 2

#### `core_couplerCameraModifier.onDeserialized(data)`

Hook : restaure objId1, objId2, detached.

- `data` (*table|nil*) : table renvoyée par onSerialize

#### `core_couplerCameraModifier.onSerialize()`

Hook : sauvegarde objId1, objId2, detached.

- **renvoie** : table données à sérialiser

#### `core_couplerCameraModifier.onVehicleSpawned(vehId)`

Hook : si un des véhicules suivis est remplacé, arrête le suivi.

- `vehId` (*integer*) : id du véhicule

#### `core_couplerCameraModifier.onVehicleSwitched(oldId, newId, player)`

Hook : le joueur change de véhicule ; cherche un attelage pour le nouveau.

- `oldId` (*integer*) : ancien id
- `newId` (*integer*) : nouvel id
- `player` (*integer*) : numéro de joueur (non utilisé)

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"core_trailerRespawn"} : chargé avant (fournit getConfigType). |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/couplerCameraModifier.lua`.*
