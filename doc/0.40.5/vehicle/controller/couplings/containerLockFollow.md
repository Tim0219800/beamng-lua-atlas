# `controller_couplings_containerLockFollow`

*Fichier : `lua/vehicle/controller/couplings/containerLockFollow.lua` · VM : Véhicule · 230 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `couplings/containerLockFollow` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Côté « suiveur » du système de verrouillage de conteneurs (twist-locks) : placé sur le véhicule qui reçoit (par exemple le conteneur), il répond au contrôleur `containerLockLead` d'un autre véhicule. Il fournit la position de ses sites de verrouillage, reçoit une force d'alignement du leader, active ou désactive ses coupleurs selon un electrics, et durcit ou assouplit les poutres de verrouillage quand tous les sites sont verrouillés. Les échanges entre véhicules passent par `obj:queueObjectLuaCommand` vers `controller.getControllersByType('couplings/containerLockFollow')`.

## Remarques

- Clés jbeam : `lockSites` (table d'en-tête) avec `name`, `feelerCouplerNodeName`, `lockCouplerNodeName`, `aligningForceNodeName`, `couplerLockBeamsTag`, `couplerLockBeamsUnlockedSpring`, `couplerLockBeamsLockedSpring`, `couplerLockBeamsUnlockedDamp`, `couplerLockBeamsLockedDamp`, `needsVisualLockProp` (true par défaut), `isEnabledElectricsName` et `isEnabledElectricsValue` (1 par défaut).
- Les sites sont indexés par l'id (cid) du noeud tâteur (feeler), qui sert aussi d'identifiant `lockSiteId` côté leader.
- Quand un site est désactivé (electrics différent de la valeur attendue), les tags de ses noeuds tâteur et verrou reçoivent le suffixe `_disabled`, ce qui empêche l'accouplement.
- Electrics écrit : `<nom>_<site>_lock_is_locked` (1 si verrouillé).
- Anomalie : debugDraw est défini dans le fichier mais n'est pas exporté dans M, donc jamais appelé. `beamBroken` est exporté mais vide. Le tableau `lockNodeFeelerLookup` est de niveau module et n'est pas vidé dans init.
- Dans onCouplerDetached, la recherche du site « tâteur » utilise directement l'id du noeud, et celle du site « verrou » passe par lockNodeFeelerLookup.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_couplings_containerLockFollow.applyAligningForce(lockSiteId, forceVector)` | Appelée à distance par le leader : mémorise la force d'alignement à appliquer au noeud d'alignement du site (ignorée si le noeud verrou est déjà couplé). *(interne)* | 51 |
| `controller_couplings_containerLockFollow.beamBroken(id, energy)` | Hook de rupture de poutre, vide. *(interne)* | 133 |
| `controller_couplings_containerLockFollow.init(jbeamData)` | Construit les sites de verrouillage depuis le jbeam (noeuds, tags, poutres de verrou, electrics) et assouplit les poutres de verrou. *(interne)* | 167 |
| `controller_couplings_containerLockFollow.onCouplerAttached(nodeId, obj2id, obj2nodeId)` | Hook : si le noeud est un noeud verrou, passe le site à l'état locked, efface la force d'alignement et durcit les poutres de verrou. *(interne)* *(hook)* | 136 |
| `controller_couplings_containerLockFollow.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook : efface la force d'alignement du site et, pour un noeud verrou, repasse le site à unlocked. *(interne)* *(hook)* | 146 |
| `controller_couplings_containerLockFollow.requestFollowLastLockCouplerPosition(objId, controllerName, lockCouplerNodeId)` | Appelée à distance par le leader : renvoie la position monde du noeud verrou du site dont le noeud verrou a l'id donné, via lastLockCouplerPositionCallback du leader. *(interne)* | 21 |
| `controller_couplings_containerLockFollow.requestFollowLockCouplerPosition(objId, controllerName, lockSiteId)` | Appelée à distance par le leader : renvoie la position monde du noeud verrou d'un site (et `needsVisualLockProp`) via lockSitePositionCallback du leader. *(interne)* | 36 |
| `controller_couplings_containerLockFollow.reset(jbeamData)` | Efface les forces d'alignement, force la réévaluation de l'activation et remet les electrics de verrouillage à 0. *(interne)* | 159 |
| `controller_couplings_containerLockFollow.updateGFX(dt)` | Chaque frame : applique la force d'alignement, active ou désactive chaque site selon son electrics, publie l'état verrouillé et ajuste la raideur des poutres de verrou (verrouillées seulement si tous les sites le sont). *(interne)* | 93 |

### Détail des paramètres

#### `controller_couplings_containerLockFollow.applyAligningForce(lockSiteId, forceVector)`

Appelée à distance par le leader : mémorise la force d'alignement à appliquer au noeud d'alignement du site (ignorée si le noeud verrou est déjà couplé).

- `lockSiteId` (*integer*) : Id du site.
- `forceVector` (*vec3|nil*) : Vecteur de force (N), nil pour l'annuler.

#### `controller_couplings_containerLockFollow.beamBroken(id, energy)`

Hook de rupture de poutre, vide.

- `id` (*integer*) : cid de la poutre.
- `energy` (*number*) : Énergie de rupture.

#### `controller_couplings_containerLockFollow.init(jbeamData)`

Construit les sites de verrouillage depuis le jbeam (noeuds, tags, poutres de verrou, electrics) et assouplit les poutres de verrou.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_couplings_containerLockFollow.onCouplerAttached(nodeId, obj2id, obj2nodeId)`

Hook : si le noeud est un noeud verrou, passe le site à l'état locked, efface la force d'alignement et durcit les poutres de verrou.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre véhicule.

#### `controller_couplings_containerLockFollow.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook : efface la force d'alignement du site et, pour un noeud verrou, repasse le site à unlocked.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre véhicule.
- `breakForce` (*number*) : Force de rupture (non utilisée).

#### `controller_couplings_containerLockFollow.requestFollowLastLockCouplerPosition(objId, controllerName, lockCouplerNodeId)`

Appelée à distance par le leader : renvoie la position monde du noeud verrou du site dont le noeud verrou a l'id donné, via lastLockCouplerPositionCallback du leader.

- `objId` (*integer*) : Id du véhicule leader à rappeler.
- `controllerName` (*string*) : Nom du contrôleur leader.
- `lockCouplerNodeId` (*integer*) : cid du noeud verrou de ce véhicule.

#### `controller_couplings_containerLockFollow.requestFollowLockCouplerPosition(objId, controllerName, lockSiteId)`

Appelée à distance par le leader : renvoie la position monde du noeud verrou d'un site (et `needsVisualLockProp`) via lockSitePositionCallback du leader.

- `objId` (*integer*) : Id du véhicule leader à rappeler.
- `controllerName` (*string*) : Nom du contrôleur leader.
- `lockSiteId` (*integer*) : Id du site (cid du noeud tâteur).

#### `controller_couplings_containerLockFollow.reset(jbeamData)`

Efface les forces d'alignement, force la réévaluation de l'activation et remet les electrics de verrouillage à 0.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_couplings_containerLockFollow.updateGFX(dt)`

Chaque frame : applique la force d'alignement, active ou désactive chaque site selon son electrics, publie l'état verrouillé et ajuste la raideur des poutres de verrou (verrouillées seulement si tous les sites le sont).

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `applyForceVectorTime`, `getNodeCoupler`, `getNodePosition`, `getPosition`, `queueObjectLuaCommand`, `setBeamSpringDamp`, `setNodeTag`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/couplings/containerLockFollow.lua`.*
