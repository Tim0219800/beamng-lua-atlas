# `controller_linearActuators_linearActuatorTrailerFeet`

*Fichier : `lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua` · VM : Véhicule · 154 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `linearActuators/linearActuatorTrailerFeet` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire pour les béquilles d'une remorque à actionneur linéaire électrique (type "auxiliary"). Même logique que hydraulics/hydraulicTrailerFeet : il mémorise les positions du vérin à l'état attelé et détaché et ramène les béquilles automatiquement à l'attelage ou au dételage, en écrivant la commande du moteur dans electrics. La différence : l'actionneur est un dispositif powertrain et on peut filtrer sur un nœud de coupleur précis.

## Remarques

- Clés jbeam (défaut) : linearActuatorName (nom du dispositif, obligatoire), motorThrottleElectricsName (nom de la valeur electrics de commande ; sinon déduit de motorName ou du dispositif de propulsion de l'actionneur via motor.electricsThrottleName), motorName, attachedDefaultPosition (0), detachedDefaultPosition (1), couplerNodeName (nom du nœud de coupleur à écouter ; sans lui, aucun hook de coupleur ne déclenche car nodeId == nil échoue), startValue (0).
- Positions en ratio d'extension 0..1 (actuator.currentExtendPercent). La commande est -1/0/1.
- Les hooks onCouplerAttached/onCouplerDetached ne réagissent que si l'autre objet est un autre véhicule ET si nodeId correspond au couplerNodeName.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_linearActuators_linearActuatorTrailerFeet.getState()` | Renvoie l'état (positions, entrée manuelle, état d'attelage). | 110 |
| `controller_linearActuators_linearActuatorTrailerFeet.init(jbeamData)` | Retrouve l'actionneur et le nom electrics de commande, initialise positions et états. *(interne)* | 74 |
| `controller_linearActuators_linearActuatorTrailerFeet.moveFeet(input)` | Commande manuelle des béquilles, -1 à 1 ; interrompt un mouvement automatique. | 28 |
| `controller_linearActuators_linearActuatorTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)` | Hook appelé par le moteur à l'attelage ; lance le mouvement vers la position « attaché ». *(interne)* *(hook)* | 62 |
| `controller_linearActuators_linearActuatorTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook appelé au dételage ; lance le mouvement vers la position « détaché ». *(interne)* *(hook)* | 68 |
| `controller_linearActuators_linearActuatorTrailerFeet.setState(data)` | Restaure l'état renvoyé par getState. | 118 |
| `controller_linearActuators_linearActuatorTrailerFeet.updateGFX(dt)` | Écrit la commande moteur (manuelle ou automatique vers la position mémorisée). *(interne)* | 37 |

### Détail des paramètres

#### `controller_linearActuators_linearActuatorTrailerFeet.getState()`

Renvoie l'état (positions, entrée manuelle, état d'attelage).

- **renvoie** : table Table d'état (réutilisée).

#### `controller_linearActuators_linearActuatorTrailerFeet.init(jbeamData)`

Retrouve l'actionneur et le nom electrics de commande, initialise positions et états.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_linearActuators_linearActuatorTrailerFeet.moveFeet(input)`

Commande manuelle des béquilles, -1 à 1 ; interrompt un mouvement automatique.

- `input` (*number*) : Entrée de direction -1..1.

#### `controller_linearActuators_linearActuatorTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)`

Hook appelé par le moteur à l'attelage ; lance le mouvement vers la position « attaché ».

- `nodeId` (*integer*) : Nœud de ce véhicule.
- `obj2id` (*integer*) : Id du véhicule partenaire.
- `obj2nodeId` (*integer*) : Nœud du partenaire.

#### `controller_linearActuators_linearActuatorTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook appelé au dételage ; lance le mouvement vers la position « détaché ».

- `nodeId` (*integer*) : Nœud de ce véhicule.
- `obj2id` (*integer*) : Id du véhicule partenaire.
- `obj2nodeId` (*integer*) : Nœud du partenaire.
- `breakForce` (*number*) : Force de rupture (non utilisée).

#### `controller_linearActuators_linearActuatorTrailerFeet.setState(data)`

Restaure l'état renvoyé par getState.

- `data` (*table|nil*) : Table d'état.

#### `controller_linearActuators_linearActuatorTrailerFeet.updateGFX(dt)`

Écrit la commande moteur (manuelle ou automatique vers la position mémorisée).

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua`.*
