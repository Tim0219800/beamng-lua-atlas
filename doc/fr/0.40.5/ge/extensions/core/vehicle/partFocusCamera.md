# `core_vehicle_partFocusCamera`

*Fichier : `lua/ge/extensions/core/vehicle/partFocusCamera.lua` · VM : Game Engine (GE) · 524 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_partFocusCamera` : `extensions.load("core_vehicle_partFocusCamera")`, puis la globale `core_vehicle_partFocusCamera`

Extension GE `core_vehicle_partFocusCamera` : pilote le mode caméra caché 'partFocus' depuis le menu de pièces. À partir des pièces sélectionnées, calcule une boîte englobante (taille d'après les meshes, position d'après les noeuds jbeam, qui suivent le véhicule en direct), règle la distance de la caméra pour la cadrer (FOV 35°, marge 1,2) et la déplace en douceur. Les demandes attendent 0,5 s que la sélection se stabilise, sauf option immediate. Rend la caméra au joueur quand la sélection reste vide.

## Exemple

```lua
core_vehicle_partFocusCamera.focusOnParts(vehId, {['pickup/pickup_hood'] = true}, nil, 0, {immediate = true})
-- plus tard
core_vehicle_partFocusCamera.release()
```

## Remarques

- cameraOptions accepte : immediate (saute le délai d'attente), focusOffsetUp (décalage de la cible vers le haut du véhicule, m), distanceMultiplier (multiplicateur de la distance de cadrage) et preserveDistance (ne pas recalculer la distance).
- Constantes internes : settleDelay 0.5 s, transitionTime 1.2 s, minExtent 0.15 m (une pièce tenue par un seul noeud ne se réduit pas à un point).
- updateTarget est appelée par le mode caméra partFocus lui-même (pas par le hook onUpdate) pour lire les positions de noeuds au bon moment de la frame ; elle dessine la boîte englobante (debugDrawer:drawLine) à chaque appel, y compris hors debug.
- M.onSerialize pointe sur M.clear (qui ne renvoie rien) : aucune donnée n'est sauvegardée et la caméra est libérée avant un rechargement Lua ; M.onExtensionUnloaded pointe aussi sur M.clear.

**Dépendances (chargées avant) :** `core_vehicle_configTarget`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_partFocusCamera.clear()` | Annule les demandes, quitte le mode partFocus (retour à la caméra précédente, 'orbit' par défaut) et retire l'action map PartCamera. | 354 |
| `core_vehicle_partFocusCamera.consumeZoomSteps()` | Renvoie et remet à zéro les crans de zoom accumulés (appelée par le mode caméra). | 437 |
| `core_vehicle_partFocusCamera.focusOnParts(inVehId, partNames, selectedMeshes, playerId, cameraOptions)` | Demande à la caméra de cadrer un ensemble de pièces. Les demandes identiques répétées sont ignorées (pas de redémarrage du délai). Une liste vide revient à release(). | 312 |
| `core_vehicle_partFocusCamera.isActive()` | Indique si la caméra de pièces est active (un véhicule est cadré). | 429 |
| `core_vehicle_partFocusCamera.onUpdate(dtReal)` | Hook par frame : décompte le délai d'attente (temps réel, car le menu de configuration tourne souvent en pause) puis applique la demande ou libère la caméra. *(interne)* *(hook)* | 477 |
| `core_vehicle_partFocusCamera.onVehicleConfigTargetChanged()` | Hook : la cible de configuration change ; libère la caméra. *(interne)* *(hook)* | 515 |
| `core_vehicle_partFocusCamera.onVehicleDestroyed(destroyedId)` | Hook : le véhicule cadré est détruit ; libère la caméra. *(interne)* *(hook)* | 497 |
| `core_vehicle_partFocusCamera.onVehicleResetted(resettedId)` | Hook : le véhicule est remis à zéro ; force une remesure immédiate de la boîte. *(interne)* *(hook)* | 490 |
| `core_vehicle_partFocusCamera.onVehicleSpawned(spawnedId)` | Hook : le véhicule cadré est recréé ; garde la dernière pose de caméra. *(interne)* *(hook)* | 503 |
| `core_vehicle_partFocusCamera.onVehicleSwitched(oldId, newId, player)` | Hook : le joueur piloté quitte le véhicule cadré ; libère la caméra. *(interne)* *(hook)* | 509 |
| `core_vehicle_partFocusCamera.release(immediate)` | Rend la caméra au joueur une fois que la sélection reste vide pendant settleDelay (0,5 s), ou immédiatement. | 343 |
| `core_vehicle_partFocusCamera.updateTarget(dt, cam)` | Appelée par le mode caméra partFocus à chaque frame : remesure périodiquement la boîte, reconstruit la boîte en repère monde, la dessine et fixe le point de visée de la caméra. *(interne)* | 446 |
| `core_vehicle_partFocusCamera.zoomStep(value)` | Ajoute des crans de molette (zoom) à appliquer par le mode caméra. | 433 |

### Détail des paramètres

#### `core_vehicle_partFocusCamera.consumeZoomSteps()`

Renvoie et remet à zéro les crans de zoom accumulés (appelée par le mode caméra).

- **renvoie** : number crans accumulés

#### `core_vehicle_partFocusCamera.focusOnParts(inVehId, partNames, selectedMeshes, playerId, cameraOptions)`

Demande à la caméra de cadrer un ensemble de pièces. Les demandes identiques répétées sont ignorées (pas de redémarrage du délai). Une liste vide revient à release().

- `inVehId` (*integer*) : véhicule
- `partNames` (*table<string, boolean>*) : [chemin de pièce] = true
- `selectedMeshes` (*table|nil*) : meshes des pièces (fournis par core_vehicle_partmgmt), utilisés pour mesurer la taille
- `playerId` (*integer|nil*) : joueur dont la caméra est pilotée
- `cameraOptions` (*table|nil*) : voir notes : immediate, focusOffsetUp, distanceMultiplier, preserveDistance

#### `core_vehicle_partFocusCamera.isActive()`

Indique si la caméra de pièces est active (un véhicule est cadré).

- **renvoie** : boolean true si active

#### `core_vehicle_partFocusCamera.onUpdate(dtReal)`

Hook par frame : décompte le délai d'attente (temps réel, car le menu de configuration tourne souvent en pause) puis applique la demande ou libère la caméra.

- `dtReal` (*number*) : temps réel écoulé (s)

#### `core_vehicle_partFocusCamera.onVehicleDestroyed(destroyedId)`

Hook : le véhicule cadré est détruit ; libère la caméra.

- `destroyedId` (*integer*) : véhicule

#### `core_vehicle_partFocusCamera.onVehicleResetted(resettedId)`

Hook : le véhicule est remis à zéro ; force une remesure immédiate de la boîte.

- `resettedId` (*integer*) : véhicule

#### `core_vehicle_partFocusCamera.onVehicleSpawned(spawnedId)`

Hook : le véhicule cadré est recréé ; garde la dernière pose de caméra.

- `spawnedId` (*integer*) : véhicule

#### `core_vehicle_partFocusCamera.onVehicleSwitched(oldId, newId, player)`

Hook : le joueur piloté quitte le véhicule cadré ; libère la caméra.

- `oldId` (*integer*) : ancien véhicule
- `newId` (*integer*) : nouveau véhicule
- `player` (*integer*) : joueur

#### `core_vehicle_partFocusCamera.release(immediate)`

Rend la caméra au joueur une fois que la sélection reste vide pendant settleDelay (0,5 s), ou immédiatement.

- `immediate` (*boolean|nil*) : true : libère tout de suite (clear)

#### `core_vehicle_partFocusCamera.updateTarget(dt, cam)`

Appelée par le mode caméra partFocus à chaque frame : remesure périodiquement la boîte, reconstruit la boîte en repère monde, la dessine et fixe le point de visée de la caméra.

- `dt` (*number*) : temps écoulé (s)
- `cam` (*table|nil*) : objet mode caméra (setRef, setDefaultDistance, retarget)

#### `core_vehicle_partFocusCamera.zoomStep(value)`

Ajoute des crans de molette (zoom) à appliquer par le mode caméra.

- `value` (*number*) : nombre de crans (signe = sens)

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugDrawPivot` | boolean | false par défaut ; true marque le centre de la boîte d'une sphère. |
| `dependencies` | string[] | {'core_vehicle_configTarget'} |
| `onExtensionUnloaded` | function | Alias de clear. |
| `onSerialize` | function | Alias de clear. |
| `updateInterval` | number | Intervalle de remesure de la boîte, en secondes (0.1). |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`
- `obj:` `getInitVertexPos`, `getVertexCount`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/partFocusCamera.lua`.*
