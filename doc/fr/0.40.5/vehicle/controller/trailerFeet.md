# `controller_trailerFeet`

*Fichier : `lua/vehicle/controller/trailerFeet.lua` · VM : Véhicule · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `trailerFeet` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire pour les béquilles de remorque : écrit un electric (« feet » par défaut) à une valeur « attachée » quand un coupleur de ce véhicule s'accroche à un AUTRE véhicule et à une valeur « détachée » quand il s'en détache. L'electric sert à animer/rétracter les béquilles.

## Remarques

- Clés jbeam lues : electricsName ("feet"), attachedValue (1), detachedValue (0), startValue (0, valeur initiale).
- Les coupleurs accrochés au même véhicule (obj2id == obj:getId()) sont ignorés.
- Piège : l'expression `jbeamData.attachedValue or 1` donne 1 si la valeur jbeam est false, mais 0 est une valeur valide en Lua donc OK ; attention seulement aux valeurs nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_trailerFeet.init(jbeamData)` | Lit la configuration et initialise l'electric à startValue. *(interne)* | 26 |
| `controller_trailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)` | Hook appelé par le moteur quand un coupleur s'accroche ; si l'autre objet est un autre véhicule, passe l'electric à attachedValue. *(interne)* *(hook)* | 14 |
| `controller_trailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)` | Hook appelé quand un coupleur se détache ; si l'autre objet est un autre véhicule, passe l'electric à detachedValue. *(interne)* *(hook)* | 20 |

### Détail des paramètres

#### `controller_trailerFeet.init(jbeamData)`

Lit la configuration et initialise l'electric à startValue.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_trailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId)`

Hook appelé par le moteur quand un coupleur s'accroche ; si l'autre objet est un autre véhicule, passe l'electric à attachedValue.

- `nodeId` (*integer*) : Nœud coupleur de ce véhicule.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : Nœud de l'autre véhicule.

#### `controller_trailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce)`

Hook appelé quand un coupleur se détache ; si l'autre objet est un autre véhicule, passe l'electric à detachedValue.

- `nodeId` (*integer*) : Nœud coupleur de ce véhicule.
- `obj2id` (*integer*) : Id de l'autre véhicule.
- `obj2nodeId` (*integer*) : Nœud de l'autre véhicule.
- `breakForce` (*number*) : Force de rupture (non utilisée).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/trailerFeet.lua`.*
