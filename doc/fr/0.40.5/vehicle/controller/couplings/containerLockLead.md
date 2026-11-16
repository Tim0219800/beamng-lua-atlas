# `controller_couplings_containerLockLead`

*Fichier : `lua/vehicle/controller/couplings/containerLockLead.lua` · VM : Véhicule · 640 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `couplings/containerLockLead` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Côté « leader » du système de verrouillage de conteneurs (twist-locks) : placé sur le véhicule qui porte les verrous (grue, portique, châssis porte-conteneur). Pour chaque site, un coupleur « tâteur » (feeler) cherche un conteneur, puis le leader interroge le contrôleur `containerLockFollow` du conteneur pour obtenir la position du verrou cible, calcule une force d'alignement dans un cône (appliquée aux deux véhicules) et, quand l'alignement vertical est suffisant, active le coupleur de verrou (lock). Gère les états feeling, locking, locked, la stabilité du verrouillage et les electrics de visibilité des props.

## Remarques

- États d'un site : feeling (cherche), locking (verrou armé), locked (verrouillé). Le global `lockState` est locked seulement si tous les sites le sont.
- Clés jbeam communes : `feelerCouplerRadius` (0.35), `feelerCouplerLockRadius` (0.005), `feelerCouplerLatchSpeed` (1.0), `feelerCouplerStrength` (500), `aligningForceMaximum` (10000 N), `lockCouplerRadius` (0.05), `lockCouplerLockRadius` (0.02), `lockCouplerLatchSpeed` (0.05), `lockCouplerStrength` (10001000), `aligningForceConeVerticalOffset` (0.05), `aligningForceConeSlope` (0.2), `aligningForceConeTransitionWidth` (0.01), `aligningForceConeDeadzoneRadius` (lockCouplerRadius × 0.5), `aligningForceSmootherIn` (math.huge), `aligningForceSmootherOut` (aligningForceMaximum), `stableLockTime` (0.5 s).
- Clés par site (table `lockSites`) : `name`, `feelerCouplerNodeName`, `lockCouplerNodeName`, `verticalReferenceNodeName`, `feelerCouplerTag`, `lockCouplerTag`, `lockStateElectricsName` (`<name>_lock_state` par défaut).
- Electrics écrits : `<site>_lock_state` (0 au repos, 0.5 en feeling/locking, 1 verrouillé), `<nom>_<site>_lock_is_visible` et `<nom>_<site>_lock_is_locked`.
- La force d'alignement croît quand la distance verticale diminue (0 à 0.5 m) ; la composante horizontale est limitée par un cône puis un tube mort ; la force réaction est envoyée au suiveur par `applyAligningForce`.
- Verrouillage lorsque la distance verticale est inférieure à 0.8 × lockCouplerRadius ; retour en feeling si elle remonte au-dessus de 0.9 × lockCouplerRadius.
- Après un déverrouillage normal (breakForce <= 0) d'un verrou stable, le site mémorise la dernière cible pour ne pas se reverrouiller sur le même conteneur tant que le verrou n'a pas bougé de plus de 0.2 m ; toggleLockState efface cette mémoire.
- Un flux de debug `containerLockDebug` est envoyé via `gui.send` si le flux est écouté. La fonction debugDraw est écrite mais n'est pas exportée dans M (jamais appelée). `beamBroken`, `onCouplerFound`, `initSounds` sont exportés vides.
- Si aucun site n'est défini, updateGFX est remplacé par `nop`.
- Anomalie : toggleLockState, dans les deux branches, appelle setLockState(feeling) ; seule la branche non verrouillée efface en plus la mémoire de dernière cible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_couplings_containerLockLead.beamBroken(id, energy)` | Hook de rupture de poutre, vide. *(interne)* | 388 |
| `controller_couplings_containerLockLead.init(jbeamData)` | Lit les paramètres communs et les sites depuis le jbeam, résout les noeuds par nom, crée les tables de recherche et initialise les electrics. *(interne)* | 513 |
| `controller_couplings_containerLockLead.initSounds(jbeamData)` | Vide. *(interne)* | 510 |
| `controller_couplings_containerLockLead.lastLockCouplerPositionCallback(lockCouplerNodeId, lastLockCouplerPosition)` | Rappel venant du suiveur : enregistre la dernière position connue du verrou précédemment relâché, pour détecter que le leader s'en est éloigné. *(interne)* | 48 |
| `controller_couplings_containerLockLead.lockSitePositionCallback(lockSiteId, lockCouplerPosition, needsVisualLockProp)` | Rappel venant du suiveur : enregistre la position monde du verrou du suiveur et si un prop visuel est requis. *(interne)* | 65 |
| `controller_couplings_containerLockLead.onCouplerAttached(nodeId, obj2id, obj2nodeId)` | Hook : si le noeud est un tâteur, mémorise le véhicule suiveur et l'id du site, efface l'alignement ; si c'est un verrou, passe le site à locked et supprime la force d'alignement du suiveur. *(interne)* *(hook)* | 394 |
| `controller_couplings_containerLockLead.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook : oublie le suiveur pour un tâteur ; pour un verrou, mémorise la cible précédente si le détachement est normal et le verrou stable (sinon l'efface) et remet le site en feeling. *(interne)* *(hook)* | 427 |
| `controller_couplings_containerLockLead.onCouplerFound(nodeId, obj2id, obj2nodeId)` | Hook de coupleur trouvé, vide. *(interne)* *(hook)* | 391 |
| `controller_couplings_containerLockLead.reset(jbeamData)` | Remet tous les sites en feeling avec des valeurs neutres et les electrics à 0. *(interne)* | 482 |
| `controller_couplings_containerLockLead.toggleLockState()` | Ramène tous les sites en feeling (ce qui déverrouille s'ils sont verrouillés). Quand rien n'est verrouillé, efface aussi la mémoire de dernière cible pour permettre de reverrouiller la même. | 464 |
| `controller_couplings_containerLockLead.updateGFX(dt)` | Chaque frame : fait tourner la recherche de tâteurs inactifs (10 Hz), interroge les suiveurs, calcule et applique la force d'alignement, fait passer les sites de feeling à locking, met à jour la stabilité du verrou et les electrics, et envoie les données de debug. *(interne)* | 231 |

### Détail des paramètres

#### `controller_couplings_containerLockLead.beamBroken(id, energy)`

Hook de rupture de poutre, vide.

- `id` (*integer*) : cid de la poutre.
- `energy` (*number*) : Énergie de rupture.

#### `controller_couplings_containerLockLead.init(jbeamData)`

Lit les paramètres communs et les sites depuis le jbeam, résout les noeuds par nom, crée les tables de recherche et initialise les electrics.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_couplings_containerLockLead.initSounds(jbeamData)`

Vide.

- `jbeamData` (*table*) : Non utilisé.

#### `controller_couplings_containerLockLead.lastLockCouplerPositionCallback(lockCouplerNodeId, lastLockCouplerPosition)`

Rappel venant du suiveur : enregistre la dernière position connue du verrou précédemment relâché, pour détecter que le leader s'en est éloigné.

- `lockCouplerNodeId` (*integer*) : cid du noeud verrou du suiveur.
- `lastLockCouplerPosition` (*vec3*) : Position monde.

#### `controller_couplings_containerLockLead.lockSitePositionCallback(lockSiteId, lockCouplerPosition, needsVisualLockProp)`

Rappel venant du suiveur : enregistre la position monde du verrou du suiveur et si un prop visuel est requis.

- `lockSiteId` (*integer*) : Id du site (cid du noeud tâteur côté suiveur).
- `lockCouplerPosition` (*vec3*) : Position monde du verrou du suiveur.
- `needsVisualLockProp` (*boolean*) : true si le prop visuel de verrou est nécessaire.

#### `controller_couplings_containerLockLead.onCouplerAttached(nodeId, obj2id, obj2nodeId)`

Hook : si le noeud est un tâteur, mémorise le véhicule suiveur et l'id du site, efface l'alignement ; si c'est un verrou, passe le site à locked et supprime la force d'alignement du suiveur.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre véhicule.

#### `controller_couplings_containerLockLead.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook : oublie le suiveur pour un tâteur ; pour un verrou, mémorise la cible précédente si le détachement est normal et le verrou stable (sinon l'efface) et remet le site en feeling.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre véhicule.
- `breakForce` (*number*) : Force de rupture (> 0 si le verrou a cassé).

#### `controller_couplings_containerLockLead.onCouplerFound(nodeId, obj2id, obj2nodeId)`

Hook de coupleur trouvé, vide.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre véhicule.

#### `controller_couplings_containerLockLead.reset(jbeamData)`

Remet tous les sites en feeling avec des valeurs neutres et les electrics à 0.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_couplings_containerLockLead.updateGFX(dt)`

Chaque frame : fait tourner la recherche de tâteurs inactifs (10 Hz), interroge les suiveurs, calcule et applique la force d'alignement, fait passer les sites de feeling à locking, met à jour la stabilité du verrou et les electrics, et envoie les données de debug.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `applyForceVectorTime`, `attachCoupler`, `detachCoupler`, `getNodeCoupler`, `getNodeLatch`, `getNodePosition`, `getNodesVector`, `getPosition`, `queueObjectLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/couplings/containerLockLead.lua`.*
