# `controller_couplings_kingpin`

*Fichier : `lua/vehicle/controller/couplings/kingpin.lua` · VM : Véhicule · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `couplings/kingpin` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire du pivot d'attelage (kingpin) d'une semi-remorque. Il ne fait que répondre au contrôleur `couplings/fifthwheel` d'un tracteur : si la clé de la sellette correspond à la sienne, il renvoie son cid de noeud et sa position monde. Il peut aussi afficher son noeud en debug quand la sellette demande l'affichage de l'indicateur.

## Remarques

- Clés jbeam lues par init : `kingpinNode` (nom du noeud, résolu via `beamstate.nodeNameMap`) et `kingpinKey` ("fifthwheel_v2" par défaut, doit être identique à `fifthwheelKey` de la sellette).
- Aucun update : tout se fait par appels à distance (`obj:queueObjectLuaCommand` du tracteur).
- `M.debugDraw` est nil par défaut ; setKingpinVisibility l'active ou le retire puis appelle `controller.cacheAllControllerFunctions()`.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_couplings_kingpin.init(jbeamData)` | Retrouve le noeud de pivot par nom et lit la clé. *(interne)* | 42 |
| `controller_couplings_kingpin.reset(jbeamData)` | Vide. *(interne)* | 39 |
| `controller_couplings_kingpin.sendDataToVehicle(objId, controllerName, couplerTag)` | Appelée à distance par une sellette : si `couplerTag` est égal à la clé de ce pivot, renvoie {nodeId, nodePosition} à `kingpinDataCallback` du contrôleur de sellette du véhicule demandeur. *(interne)* | 13 |
| `controller_couplings_kingpin.setKingpinVisibility(key, visible)` | Active ou retire l'affichage de debug du noeud de pivot si la clé correspond. *(interne)* | 31 |

### Détail des paramètres

#### `controller_couplings_kingpin.init(jbeamData)`

Retrouve le noeud de pivot par nom et lit la clé.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_couplings_kingpin.reset(jbeamData)`

Vide.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_couplings_kingpin.sendDataToVehicle(objId, controllerName, couplerTag)`

Appelée à distance par une sellette : si `couplerTag` est égal à la clé de ce pivot, renvoie {nodeId, nodePosition} à `kingpinDataCallback` du contrôleur de sellette du véhicule demandeur.

- `objId` (*integer*) : Id du véhicule demandeur (tracteur).
- `controllerName` (*string*) : Nom du contrôleur de sellette à rappeler.
- `couplerTag` (*string*) : Clé de sellette demandée.

#### `controller_couplings_kingpin.setKingpinVisibility(key, visible)`

Active ou retire l'affichage de debug du noeud de pivot si la clé correspond.

- `key` (*string*) : Clé de sellette concernée.
- `visible` (*boolean*) : true pour afficher.

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugDraw` | function|nil | nil par défaut ; fonction de dessin du noeud de pivot quand l'indicateur est visible. |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getNodePosition`, `getPosition`, `queueObjectLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/couplings/kingpin.lua`.*
