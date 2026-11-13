# `controller_hydraulics_hydraulicTrailerFeet`

*Fichier : `lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua` · VM : Véhicule · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `hydraulics/hydraulicTrailerFeet` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire pour les béquilles hydrauliques d'une remorque (type "auxiliary"). Il mémorise la position du vérin quand la remorque est attelée et détachée (par réglage manuel) et ramène automatiquement les béquilles à la bonne position lors d'un attelage ou dételage, en écrivant la direction de vérin dans electrics (directionElectricsName du vérin).

## Remarques

- Clés jbeam (défaut) : powertrainHydroName (nom du vérin, obligatoire : erreur Lua si introuvable), attachedDefaultPosition (0), detachedDefaultPosition (1), startValue (0, valeur initiale de la commande de direction).
- États internes : detached, attached, detachedMoveFeet, attachedMoveFeet. Les mouvements manuels (|entrée| > 0.05) mémorisent la position courante pour l'état en cours.
- Les hooks onCouplerAttached/onCouplerDetached ne réagissent que si l'autre objet (obj2id) est différent de ce véhicule.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_hydraulics_hydraulicTrailerFeet.getState()` | Renvoie l'état (positions mémorisées, entrée manuelle, état d'attelage). | 95 |
| `controller_hydraulics_hydraulicTrailerFeet.init(jbeamData)` | Retrouve le vérin et initialise les positions et états. *(interne)* | 73 |
| `controller_hydraulics_hydraulicTrailerFeet.moveFeet(input)` | Commande manuelle des béquilles : -1 à 1 (la direction est écrite dans electrics). Interrompt un déplacement automatique en cours. | 27 |
| `controller_hydraulics_hydraulicTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)` | Hook appelé par le moteur quand un coupleur du véhicule s'attache ; lance le mouvement vers la position « attaché » si l'autre objet est un autre véhicule. *(interne)* *(hook)* | 61 |
| `controller_hydraulics_hydraulicTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook appelé quand un coupleur se détache ; lance le mouvement vers la position « détaché ». *(interne)* *(hook)* | 67 |
| `controller_hydraulics_hydraulicTrailerFeet.setState(data)` | Restaure l'état renvoyé par getState. | 103 |
| `controller_hydraulics_hydraulicTrailerFeet.updateGFX(dt)` | Écrit la direction du vérin (manuelle ou automatique vers la position mémorisée). *(interne)* | 36 |

### Détail des paramètres

#### `controller_hydraulics_hydraulicTrailerFeet.getState()`

Renvoie l'état (positions mémorisées, entrée manuelle, état d'attelage).

- **renvoie** : table Table d'état (réutilisée).

#### `controller_hydraulics_hydraulicTrailerFeet.init(jbeamData)`

Retrouve le vérin et initialise les positions et états.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_hydraulics_hydraulicTrailerFeet.moveFeet(input)`

Commande manuelle des béquilles : -1 à 1 (la direction est écrite dans electrics). Interrompt un déplacement automatique en cours.

- `input` (*number*) : Entrée de direction -1..1.

#### `controller_hydraulics_hydraulicTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)`

Hook appelé par le moteur quand un coupleur du véhicule s'attache ; lance le mouvement vers la position « attaché » si l'autre objet est un autre véhicule.

- `nodeId` (*integer*) : Nœud de ce véhicule.
- `obj2id` (*integer*) : Id du véhicule partenaire.
- `obj2nodeId` (*integer*) : Nœud du partenaire.

#### `controller_hydraulics_hydraulicTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook appelé quand un coupleur se détache ; lance le mouvement vers la position « détaché ».

- `nodeId` (*integer*) : Nœud de ce véhicule.
- `obj2id` (*integer*) : Id du véhicule partenaire.
- `obj2nodeId` (*integer*) : Nœud du partenaire.
- `breakForce` (*number*) : Force de rupture (non utilisée).

#### `controller_hydraulics_hydraulicTrailerFeet.setState(data)`

Restaure l'état renvoyé par getState.

- `data` (*table|nil*) : Table d'état.

#### `controller_hydraulics_hydraulicTrailerFeet.updateGFX(dt)`

Écrit la direction du vérin (manuelle ou automatique vers la position mémorisée).

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua`.*
