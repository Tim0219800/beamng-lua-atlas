# `controller_couplings_fifthwheel`

*Fichier : `lua/vehicle/controller/couplings/fifthwheel.lua` · VM : Véhicule · 299 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `couplings/fifthwheel` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de sellette d'attelage (fifth wheel) du tracteur : il cherche, parmi les véhicules en collision, les pivots (kingpin) compatibles en demandant leurs données au contrôleur `couplings/kingpin` de la remorque, calcule les distances, et attache un coupleur externe (`obj:attachExternalCoupler`) quand un pivot passe à moins de 80 % du rayon du coupleur. Il suit l'état attached, attaching, detaching, detached, joue des sons et publie un electrics d'attache.

## Exemple

```lua
controller.getControllerSafe("fifthwheel").detachFifthwheel()
print(controller.getControllerSafe("fifthwheel").isAttached())
```

## Remarques

- Clés jbeam lues par init : `fifthwheelNode` (nom du noeud), `fifthwheelKey` ("fifthwheel_v2" : doit correspondre à `kingpinKey` du pivot), `attachmentStateElectricsName` (`<nom>_attachmentState`). Lues par initSounds : `attachSoundEvent` ("event:>Vehicle>Latches>Special>tailgate_01_close"), `detachSoundEvent` ("...tailgate_01_open"), `attachSoundEventVolume` (0.5), `detachSoundEventVolume` (0.5). Les paramètres du coupleur (`couplerStrength` 10000000, `couplerRadius` 0.5, `couplerLockRadius` 0.025, `couplerLatchSpeed` 0.3) sont lus sur le noeud jbeam lui-même.
- Les demandes de données aux pivots se font à 5 Hz tant que le coupleur n'est pas attaché ; une réponse est attendue en 1 s (sinon le cache du véhicule est effacé).
- Après détachement (`detaching`), le contrôleur attend que le pivot précédent s'éloigne à plus de 0.6 m avant de redevenir `detached`.
- Appelle `extensions.couplings.couplingAttached/couplingDetached` pour informer l'extension de couplage.
- Anomalie : onCouplerAttached appelle `setFifthwheelIndicatorVisibility(false)` pour tout noeud attaché, pas seulement la sellette.
- `M.debugDraw` est nil au départ ; setFifthwheelIndicatorVisibility l'active ou le retire puis appelle `controller.cacheAllControllerFunctions()` et diffuse la visibilité aux contrôleurs kingpin de tous les véhicules.
- La variable interne s'écrit `fithwheel...` (faute de frappe sans effet).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_couplings_fifthwheel.detachFifthwheel()` | Détache le coupleur de la sellette (obj:detachCoupler). Appelée par l'entrée du menu radial. | 64 |
| `controller_couplings_fifthwheel.init(jbeamData)` | Retrouve le noeud de sellette, lit les paramètres du coupleur sur ce noeud, initialise l'état et ajoute l'entrée du menu radial de détachement (une seule fois). *(interne)* | 233 |
| `controller_couplings_fifthwheel.initSounds(jbeamData)` | Lit les événements et volumes de sons d'attache et de détache. *(interne)* | 226 |
| `controller_couplings_fifthwheel.isAttached()` | Indique si la sellette est attachée à un pivot. | 202 |
| `controller_couplings_fifthwheel.kingpinDataCallback(obj2Id, data)` | Rappel venant du contrôleur kingpin d'une remorque : calcule la distance entre la sellette et le pivot et la met en cache. *(interne)* | 75 |
| `controller_couplings_fifthwheel.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)` | Hook : pour le noeud de sellette, passe à attached, mémorise le pivot, joue le son d'attache et prévient l'extension couplings. Masque l'indicateur. *(interne)* *(hook)* | 171 |
| `controller_couplings_fifthwheel.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook : pour le noeud de sellette, passe à detaching, mémorise le pivot quitté, joue le son de détache et prévient l'extension couplings. *(interne)* *(hook)* | 187 |
| `controller_couplings_fifthwheel.onCouplerFound(nodeId, obj2id, obj2nodeId)` | Hook de coupleur trouvé, vide. *(interne)* *(hook)* | 167 |
| `controller_couplings_fifthwheel.reset(jbeamData)` | Remet l'état à detached et vide les caches de pivots. *(interne)* | 212 |
| `controller_couplings_fifthwheel.setFifthwheelIndicatorVisibility(visible)` | Affiche ou masque l'indicateur de debug de la sellette ici et sur les pivots de tous les véhicules (par clé). | 53 |
| `controller_couplings_fifthwheel.toggleFifthwheelIndicatorVisibility()` | Inverse la visibilité de l'indicateur. | 60 |
| `controller_couplings_fifthwheel.updateGFX(dt)` | Chaque frame : met à jour les collisions et les délais de requêtes, interroge les pivots proches, gère la sortie de l'état detaching, déclenche l'attache externe vers le pivot le plus proche et publie l'electrics. *(interne)* | 95 |

### Détail des paramètres

#### `controller_couplings_fifthwheel.init(jbeamData)`

Retrouve le noeud de sellette, lit les paramètres du coupleur sur ce noeud, initialise l'état et ajoute l'entrée du menu radial de détachement (une seule fois).

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_couplings_fifthwheel.initSounds(jbeamData)`

Lit les événements et volumes de sons d'attache et de détache.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_couplings_fifthwheel.isAttached()`

Indique si la sellette est attachée à un pivot.

- **renvoie** : boolean true si l'état est attached.

#### `controller_couplings_fifthwheel.kingpinDataCallback(obj2Id, data)`

Rappel venant du contrôleur kingpin d'une remorque : calcule la distance entre la sellette et le pivot et la met en cache.

- `obj2Id` (*integer*) : Id du véhicule remorque.
- `data` (*table*) : {nodeId = cid du pivot, nodePosition = position monde}.

#### `controller_couplings_fifthwheel.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)`

Hook : pour le noeud de sellette, passe à attached, mémorise le pivot, joue le son d'attache et prévient l'extension couplings. Masque l'indicateur.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id du véhicule remorque.
- `obj2nodeId` (*integer*) : cid du pivot.
- `attachForce` (*number*) : Reçoit en pratique `attachSpeed` de controller.lua (déduit du code) ; sert à l'agressivité du son.

#### `controller_couplings_fifthwheel.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook : pour le noeud de sellette, passe à detaching, mémorise le pivot quitté, joue le son de détache et prévient l'extension couplings.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id du véhicule remorque.
- `obj2nodeId` (*integer*) : cid du pivot.
- `breakForce` (*number*) : Force de rupture (non utilisée).

#### `controller_couplings_fifthwheel.onCouplerFound(nodeId, obj2id, obj2nodeId)`

Hook de coupleur trouvé, vide.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre véhicule.

#### `controller_couplings_fifthwheel.reset(jbeamData)`

Remet l'état à detached et vide les caches de pivots.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_couplings_fifthwheel.setFifthwheelIndicatorVisibility(visible)`

Affiche ou masque l'indicateur de debug de la sellette ici et sur les pivots de tous les véhicules (par clé).

- `visible` (*boolean*) : true pour afficher.

#### `controller_couplings_fifthwheel.updateGFX(dt)`

Chaque frame : met à jour les collisions et les délais de requêtes, interroge les pivots proches, gère la sortie de l'état detaching, déclenche l'attache externe vers le pivot le plus proche et publie l'electrics.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugDraw` | function|nil | nil par défaut ; devient la fonction de dessin du noeud de sellette quand l'indicateur est visible. |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `BeamEngine:` `queueAllObjectLua`
- `obj:` `attachExternalCoupler`, `detachCoupler`, `getNodePosition`, `getPosition`, `playSFXOnceCT`, `queueObjectLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/couplings/fifthwheel.lua`.*
