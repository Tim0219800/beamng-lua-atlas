# `controller_advancedCouplerControl`

*Fichier : `lua/vehicle/controller/advancedCouplerControl.lua` · VM : Véhicule · 570 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `advancedCouplerControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire qui pilote un groupe de verrous locaux (portes, trappes, hayons, loquets) formés de paires de noeuds du même véhicule, via `obj:attachLocalCoupler`. Il suit l'état du groupe (attached, coupling, autoCoupling, detached, broken, desyncedAttached, desyncedDetached), joue les sons d'attache/détache, applique une force d'ouverture ou de fermeture pendant une courte durée, enregistre les groupes de casse des coupleurs auprès de `beamstate`, et publie deux electrics `<nom>_attached` et `<nom>_notAttached` (1/0). On l'instancie une fois par groupe, avec un `name` unique.

## Exemple

```lua
local door = controller.getControllerSafe("doorLatchFL")
door.toggleGroup()
print(door.getGroupState())
```

## Remarques

- Clés jbeam du groupe : `groupType` ("default", "autoCoupling", "manualClose", "manualCloseMultiPoint" ; défaut "default"), `couplerNodes` (table d'en-tête avec colonnes cid1, cid2, forceCid1, forceCid2, autoCouplingStrength (40000), autoCouplingRadius (0.01), autoCouplingLockRadius (0.005), autoCouplingSpeed (0.2), couplingStartRadius, breakGroup), `soundNode_nodes` (premier noeud), `attachSoundEvent`, `detachSoundEvent`, `breakSoundEvent`, `attachSoundVolume`, `detachSoundVolume`, `breakSoundVolume`, `openForceMagnitude` (100), `openForceDuration` (0.2 s), `closeForceMagnitude` (100), `closeForceDuration` (0.3 s), `openForceConditions` (table d'en-tête : advancedCouplerControlName, requiredStates), `attachUIMessage`, `attachingUIMessage`, `detachUIMessage`, `latchTriggerElectricName`, `unlatchTriggerElectricName`.
- `cid2` peut être une table de plusieurs noeuds seulement en mode manualCloseMultiPoint (sinon seul le premier est utilisé avec une erreur loguée) ; le noeud le plus proche est alors choisi.
- Les noms de noeuds sont résolus par `beamstate.nodeNameMap` ; une paire dont un noeud est introuvable est ignorée avec un avertissement.
- toggleGroupConditional attend des conditions {nomContrôleur, étatInterdit, messageErreur}.
- Les sons ne sont autorisés que 0,1 s après le reset (évite les sons au spawn).
- Anomalie : dans onCouplerAttached, le message UI d'attache est conditionné par `detachUIMessage` (et non `attachUIMessage`), donc il n'apparaît que si les deux sont définis.
- onCouplerFound et onGameplayEvent sont exportés mais vides ; resetSounds et initSounds aussi.
- L'état est sauvegardé sous la clé `<nom>_groupState` ; setState essaie de reproduire l'état (impulsion d'attache, détache ou rupture de tous les couples).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_advancedCouplerControl.detachGroup()` | Détache toutes les paires du groupe, déclenche la force d'ouverture si toutes les `openForceConditions` (états requis d'autres groupes) sont remplies et affiche `detachUIMessage`. Ne fait rien si le groupe est déjà détaché ou en autoCoupling. | 175 |
| `controller_advancedCouplerControl.getGroupState()` | Renvoie l'état du groupe. | 377 |
| `controller_advancedCouplerControl.getState()` | Renvoie l'état du groupe sous la clé `<nom>_groupState`. | 512 |
| `controller_advancedCouplerControl.init(jbeamData)` | Construit le groupe à partir du jbeam (paires de noeuds, sons, forces, messages), enregistre les groupes de casse de coupleurs, lance les attaches initiales et synchronise l'état. *(interne)* | 412 |
| `controller_advancedCouplerControl.initSounds(jbeamData)` | Vide ; présent pour le cycle de vie. *(interne)* | 409 |
| `controller_advancedCouplerControl.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)` | Hook : une paire du groupe s'est attachée. Met à jour l'état, joue le son d'attache (volume lié à la force) et annule les forces en cours quand tout le groupe est attaché. *(interne)* *(hook)* | 331 |
| `controller_advancedCouplerControl.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook : une paire du groupe s'est détachée. État `detached` si breakForce <= 0, sinon `broken` ; remet en file le verrou automatique et joue le son de détache. *(interne)* *(hook)* | 357 |
| `controller_advancedCouplerControl.onCouplerFound(nodeId, obj2id, obj2nodeId)` | Hook de controller.lua quand un coupleur proche est trouvé ; vide ici. *(interne)* *(hook)* | 323 |
| `controller_advancedCouplerControl.onGameplayEvent(eventName, ...)` | Hook d'évènement de gameplay, vide dans ce contrôleur. *(interne)* *(hook)* | 374 |
| `controller_advancedCouplerControl.reset(jbeamData)` | Remet tous les verrous à l'état détaché, relance les attaches initiales (`couplingStartRadius`) et ré-enregistre les groupes de casse. *(interne)* | 390 |
| `controller_advancedCouplerControl.resetSounds(jbeamData)` | Vide ; présent pour le cycle de vie. *(interne)* | 387 |
| `controller_advancedCouplerControl.setState(data)` | Tente de reproduire un état sauvegardé (attache, détache ou rupture de toutes les paires). | 517 |
| `controller_advancedCouplerControl.toggleGroup()` | Ouvre ou ferme le groupe selon son état. Ignoré tant qu'une force d'ouverture ou de fermeture est en cours. | 211 |
| `controller_advancedCouplerControl.toggleGroupConditional(conditions)` | Comme toggleGroup, mais d'abord vérifie des conditions sur d'autres contrôleurs advancedCouplerControl ; si l'un est dans l'état interdit, affiche le message d'erreur et ne fait rien. | 223 |
| `controller_advancedCouplerControl.tryAttachGroupImpulse()` | Tente de refermer le groupe : selon groupType, relance les attaches locales des paires détachées, déclenche le message `attachingUIMessage` et une force de fermeture de `closeForceDuration`. Sans effet si le groupe est déjà attaché. | 144 |
| `controller_advancedCouplerControl.updateGFX(dt)` | Chaque frame : gère le délai des sons, les déclencheurs electrics de verrouillage/déverrouillage, les verrous automatiques en attente, la recherche du noeud cid2 le plus proche en mode multipoint, et applique les forces d'ouverture/fermeture. *(interne)* | 254 |

### Détail des paramètres

#### `controller_advancedCouplerControl.getGroupState()`

Renvoie l'état du groupe.

- **renvoie** : string "attached", "coupling", "autoCoupling", "detached", "broken", "desyncedAttached" ou "desyncedDetached".

#### `controller_advancedCouplerControl.getState()`

Renvoie l'état du groupe sous la clé `<nom>_groupState`.

- **renvoie** : table<string, string> Table d'état.

#### `controller_advancedCouplerControl.init(jbeamData)`

Construit le groupe à partir du jbeam (paires de noeuds, sons, forces, messages), enregistre les groupes de casse de coupleurs, lance les attaches initiales et synchronise l'état.

- `jbeamData` (*table*) : Données jbeam du groupe.

#### `controller_advancedCouplerControl.initSounds(jbeamData)`

Vide ; présent pour le cycle de vie.

- `jbeamData` (*table*) : Non utilisé.

#### `controller_advancedCouplerControl.onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce)`

Hook : une paire du groupe s'est attachée. Met à jour l'état, joue le son d'attache (volume lié à la force) et annule les forces en cours quand tout le groupe est attaché.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre côté.
- `attachForce` (*number*) : Reçoit en pratique l'argument `attachSpeed` de controller.lua (déduit du code) ; sert à l'agressivité du son.

#### `controller_advancedCouplerControl.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook : une paire du groupe s'est détachée. État `detached` si breakForce <= 0, sinon `broken` ; remet en file le verrou automatique et joue le son de détache.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre côté.
- `breakForce` (*number*) : Force de rupture (0 = détachement normal).

#### `controller_advancedCouplerControl.onCouplerFound(nodeId, obj2id, obj2nodeId)`

Hook de controller.lua quand un coupleur proche est trouvé ; vide ici.

- `nodeId` (*integer*) : cid du noeud local.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : cid du noeud de l'autre véhicule.

#### `controller_advancedCouplerControl.onGameplayEvent(eventName, ...)`

Hook d'évènement de gameplay, vide dans ce contrôleur.

- `eventName` (*string*) : Nom de l'évènement.
- `...` (*any*) : Arguments de l'évènement.

#### `controller_advancedCouplerControl.reset(jbeamData)`

Remet tous les verrous à l'état détaché, relance les attaches initiales (`couplingStartRadius`) et ré-enregistre les groupes de casse.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_advancedCouplerControl.resetSounds(jbeamData)`

Vide ; présent pour le cycle de vie.

- `jbeamData` (*table*) : Non utilisé.

#### `controller_advancedCouplerControl.setState(data)`

Tente de reproduire un état sauvegardé (attache, détache ou rupture de toutes les paires).

- `data` (*table|nil*) : Table contenant `<nom>_groupState`.

#### `controller_advancedCouplerControl.toggleGroupConditional(conditions)`

Comme toggleGroup, mais d'abord vérifie des conditions sur d'autres contrôleurs advancedCouplerControl ; si l'un est dans l'état interdit, affiche le message d'erreur et ne fait rien.

- `conditions` (*table[]*) : Liste de {nomContrôleur, étatInterdit, messageErreur?}.

#### `controller_advancedCouplerControl.updateGFX(dt)`

Chaque frame : gère le délai des sons, les déclencheurs electrics de verrouillage/déverrouillage, les verrous automatiques en attente, la recherche du noeud cid2 le plus proche en mode multipoint, et applique les forces d'ouverture/fermeture.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `applyForceTime`, `attachLocalCoupler`, `detachCoupler`, `nodeLength`, `playSFXOnceCT`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/advancedCouplerControl.lua`.*
