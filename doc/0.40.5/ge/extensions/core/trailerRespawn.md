# `core_trailerRespawn`

*Fichier : `lua/ge/extensions/core/trailerRespawn.lua` · VM : Game Engine (GE) · 275 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_trailerRespawn` : `extensions.load("core_trailerRespawn")`, puis la globale `core_trailerRespawn`

Extension GE `core_trailerRespawn` : mémorise quels véhicules tractent quelle remorque (registre `trailerReg`) à partir des évènements d'attelage, et replace la remorque derrière le véhicule tracteur quand celui-ci est remis à zéro (reset) ou réactivé. Dépend de core_vehicles (vehsCouplerOffset, vehsCouplerTags, couplerTagsOptions) et de spawn.placeTrailer. Utile pour interroger la composition d'un train routier (getVehicleTrain, getVehicleTrainHead).

## Remarques

- trailerReg[idTracteur] = {trailerId, trailerNode, node} : un véhicule ne peut tracter qu'une seule remorque dans ce registre. Les attelages avec un véhicule de type 'Prop' sont ignorés ; les boucles d'attelage sont refusées.
- Le type d'un véhicule ('Trailer', 'Prop', …) vient du champ aggregates.Type de sa config, sinon du Type du modèle (getConfigType).
- setEnabled(false) remplace M.onCouplerAttached et M.onCouplerDetached par `nop` : le registre n'est alors plus mis à jour (le moteur appelle les hooks via la table M, donc le changement est pris en compte). onVehicleResetted/onVehicleActiveChanged continuent d'agir sur le registre existant. Incohérence : le paramètre de setEnabled masque la variable locale `enabled` du module, qui n'est donc jamais mise à jour par setEnabled ; getEnabled() renvoie la valeur restaurée par resetData/onDeserialized (true au départ), pas le dernier état demandé.
- onVehicleResetted est marqué dans le code 'TODO: Remove this when trailer respawn is disabled' : core_vehicles contient une version commentée du même mécanisme.
- En multijoueur (multiplayer_vehicleSync), le replacement au reset est désactivé et l'état actif des remorques est délégué à multiplayer_vehicleSync.requestTrailerActiveFollow.

**Dépendances (chargées avant) :** `core_vehicleBridge`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_trailerRespawn.coupleTrailer(vehId)` | Si le tag du coupleur est de type 'autoCouple' (core_vehicles.couplerTagsOptions), lance beamstate.activateAutoCoupling(tag) sur le tracteur. | 187 |
| `core_trailerRespawn.getAttachedNonTrailer(vehId)` | Remonte les attelages pour trouver le véhicule qui n'est pas une remorque et qui tracte la chaîne contenant vehId. | 103 |
| `core_trailerRespawn.getConfigType(objId)` | Renvoie le type d'un véhicule ('Car', 'Trailer', 'Prop'…), d'après sa config (aggregates.Type) ou, à défaut, le Type de son modèle. | 88 |
| `core_trailerRespawn.getEnabled()` | Renvoie la variable `enabled` du module (voir notes : n'est pas mise à jour par setEnabled). | 251 |
| `core_trailerRespawn.getPreviousAttachedVehicleId(vehId)` | Renvoie le véhicule qui tracte vehId (celui dont la remorque enregistrée est vehId). | 47 |
| `core_trailerRespawn.getTrailerData()` | Renvoie le registre interne trailerReg (pas une copie). | 31 |
| `core_trailerRespawn.getVehicleTrain(vehId, res, forward)` | Renvoie tous les véhicules reliés à vehId, vers l'avant et vers l'arrière. | 64 |
| `core_trailerRespawn.getVehicleTrainHead(vehId)` | Remonte la chaîne d'attelages jusqu'au premier véhicule (tête du train). | 55 |
| `core_trailerRespawn.isVehicleCoupledToTrailer(vehId, trailerId)` | Indique si trailerId fait partie de la chaîne tractée par vehId. | 243 |
| `core_trailerRespawn.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | Hook : un attelage se ferme. Enregistre le sens tracteur/remorque dans trailerReg (le non-remorque tracte), ignore les Props et les boucles, puis émet onTrailerAttached(objId1, objId2). *(interne)* *(hook)* | 130 |
| `core_trailerRespawn.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)` | Hook : un attelage s'ouvre. Ne retire l'enregistrement que si breakForce est 0 (détachement volontaire), avec un délai d'une frame (job) pour ne pas empêcher le reset de la remorque. *(interne)* *(hook)* | 148 |
| `core_trailerRespawn.onDeserialized(data)` | Hook : restaure le registre et réapplique setEnabled. *(interne)* *(hook)* | 19 |
| `core_trailerRespawn.onSerialize()` | Hook : sauvegarde le registre et l'état activé avant un rechargement Lua. *(interne)* *(hook)* | 12 |
| `core_trailerRespawn.onVehicleActiveChanged(vehId, active)` | Hook : un véhicule est activé/désactivé. Aligne l'état actif de sa remorque et, à l'activation, la replace derrière lui. *(interne)* *(hook)* | 158 |
| `core_trailerRespawn.onVehicleDestroyed(vehId)` | Hook : un véhicule est détruit ; efface ses enregistrements d'attelage. *(interne)* *(hook)* | 212 |
| `core_trailerRespawn.onVehicleResetted(vehId)` | Hook : un véhicule est remis à zéro ; replace sa remorque derrière lui (désactivé en multijoueur). *(interne)* *(hook)* | 203 |
| `core_trailerRespawn.onVehicleSpawned(vehId)` | Hook : un véhicule apparaît ; efface ses anciens enregistrements d'attelage. *(interne)* *(hook)* | 198 |
| `core_trailerRespawn.placeTrailer(vehId)` | Replace la remorque enregistrée de vehId derrière lui (spawn.placeTrailer, d'après les décalages de coupleurs). | 178 |
| `core_trailerRespawn.resetData()` | Vide le registre des remorques et réactive le système. | 25 |
| `core_trailerRespawn.setEnabled(enabled)` | Active ou désactive l'enregistrement des attelages (remplace onCouplerAttached/onCouplerDetached par la fonction vide nop si false). | 233 |

### Détail des paramètres

#### `core_trailerRespawn.coupleTrailer(vehId)`

Si le tag du coupleur est de type 'autoCouple' (core_vehicles.couplerTagsOptions), lance beamstate.activateAutoCoupling(tag) sur le tracteur.

- `vehId` (*integer*) : tracteur

#### `core_trailerRespawn.getAttachedNonTrailer(vehId)`

Remonte les attelages pour trouver le véhicule qui n'est pas une remorque et qui tracte la chaîne contenant vehId.

- `vehId` (*integer*) : véhicule de départ
- **renvoie** : integer|false identifiant du premier véhicule non-remorque, false si la chaîne ne contient que des remorques

#### `core_trailerRespawn.getConfigType(objId)`

Renvoie le type d'un véhicule ('Car', 'Trailer', 'Prop'…), d'après sa config (aggregates.Type) ou, à défaut, le Type de son modèle.

- `objId` (*integer*) : identifiant du véhicule
- **renvoie** : string type

#### `core_trailerRespawn.getEnabled()`

Renvoie la variable `enabled` du module (voir notes : n'est pas mise à jour par setEnabled).

- **renvoie** : boolean true tant que resetData/onDeserialized ne l'ont pas changé

#### `core_trailerRespawn.getPreviousAttachedVehicleId(vehId)`

Renvoie le véhicule qui tracte vehId (celui dont la remorque enregistrée est vehId).

- `vehId` (*integer*) : identifiant de la remorque
- **renvoie** : integer|nil identifiant du tracteur, nil s'il n'y en a pas

#### `core_trailerRespawn.getTrailerData()`

Renvoie le registre interne trailerReg (pas une copie).

- **renvoie** : table<integer, {trailerId: integer, trailerNode: integer, node: integer}> [idTracteur] = infos d'attelage

#### `core_trailerRespawn.getVehicleTrain(vehId, res, forward)`

Renvoie tous les véhicules reliés à vehId, vers l'avant et vers l'arrière.

- `vehId` (*integer*) : véhicule de départ
- `res` (*table|nil*) : table accumulatrice (usage interne, laisser nil)
- `forward` (*boolean|nil*) : true : seulement vers le tracteur ; false : seulement vers les remorques ; nil : les deux
- **renvoie** : table<integer, boolean> ensemble [vehId] = true

#### `core_trailerRespawn.getVehicleTrainHead(vehId)`

Remonte la chaîne d'attelages jusqu'au premier véhicule (tête du train).

- `vehId` (*integer*) : véhicule de départ
- **renvoie** : integer identifiant de la tête de train (vehId lui-même s'il n'est pas tracté)

#### `core_trailerRespawn.isVehicleCoupledToTrailer(vehId, trailerId)`

Indique si trailerId fait partie de la chaîne tractée par vehId.

- `vehId` (*integer*) : tracteur
- `trailerId` (*integer*) : remorque recherchée
- **renvoie** : boolean true si relié (directement ou en chaîne)

#### `core_trailerRespawn.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)`

Hook : un attelage se ferme. Enregistre le sens tracteur/remorque dans trailerReg (le non-remorque tracte), ignore les Props et les boucles, puis émet onTrailerAttached(objId1, objId2).

- `objId1` (*integer*) : premier véhicule
- `objId2` (*integer*) : second véhicule
- `nodeId` (*integer*) : noeud du premier
- `obj2nodeId` (*integer*) : noeud du second

#### `core_trailerRespawn.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)`

Hook : un attelage s'ouvre. Ne retire l'enregistrement que si breakForce est 0 (détachement volontaire), avec un délai d'une frame (job) pour ne pas empêcher le reset de la remorque.

- `objId1` (*integer*) : premier véhicule
- `objId2` (*integer*) : second véhicule
- `nodeId` (*integer*) : noeud du premier
- `obj2nodeId` (*integer*) : noeud du second
- `breakForce` (*number|nil*) : force de rupture ; ignoré si nil ou > 0

#### `core_trailerRespawn.onDeserialized(data)`

Hook : restaure le registre et réapplique setEnabled.

- `data` (*table*) : données de onSerialize

#### `core_trailerRespawn.onSerialize()`

Hook : sauvegarde le registre et l'état activé avant un rechargement Lua.

- **renvoie** : table {trailerReg, enabled}

#### `core_trailerRespawn.onVehicleActiveChanged(vehId, active)`

Hook : un véhicule est activé/désactivé. Aligne l'état actif de sa remorque et, à l'activation, la replace derrière lui.

- `vehId` (*integer*) : véhicule
- `active` (*boolean*) : nouvel état

#### `core_trailerRespawn.onVehicleDestroyed(vehId)`

Hook : un véhicule est détruit ; efface ses enregistrements d'attelage.

- `vehId` (*integer*) : véhicule

#### `core_trailerRespawn.onVehicleResetted(vehId)`

Hook : un véhicule est remis à zéro ; replace sa remorque derrière lui (désactivé en multijoueur).

- `vehId` (*integer*) : véhicule

#### `core_trailerRespawn.onVehicleSpawned(vehId)`

Hook : un véhicule apparaît ; efface ses anciens enregistrements d'attelage.

- `vehId` (*integer*) : véhicule

#### `core_trailerRespawn.placeTrailer(vehId)`

Replace la remorque enregistrée de vehId derrière lui (spawn.placeTrailer, d'après les décalages de coupleurs).

- `vehId` (*integer*) : tracteur

#### `core_trailerRespawn.setEnabled(enabled)`

Active ou désactive l'enregistrement des attelages (remplace onCouplerAttached/onCouplerDetached par la fonction vide nop si false).

- `enabled` (*boolean*) : état voulu

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugEnabled` | boolean | false par défaut ; l'affichage debug des noeuds d'attelage (debugUpdate) n'est pas branché (M.onPreRender est commenté). |
| `dependencies` | string[] | {'core_vehicleBridge'} |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTrailerAttached` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/trailerRespawn.lua`.*
