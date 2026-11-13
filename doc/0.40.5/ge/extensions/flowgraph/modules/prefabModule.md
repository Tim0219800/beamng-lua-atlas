# `flowgraph_modules_prefabModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/prefabModule.lua` · VM : Game Engine (GE) · 340 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/prefabModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 50) qui fait apparaître, suit et supprime des prefabs (groupes d'objets de scène .prefab.json) pendant un projet. À l'ajout d'un prefab, il recense tous les objets enfants par classe, mémorise les transformations des véhicules, détecte si des colliders ou des waypoints / routes (navgraph) sont contenus, puis recharge la collision (be:reloadCollision) et le navgraph (map.reset) au bon moment. À l'arrêt, il supprime tous les prefabs non marqués dontDelete.

## Remarques

- spawnPrefab résout <nom>/<nom>.prefab.json relativement au projet, place le prefab en (0,0,0), canSave = false, dans MissionGroup.
- Pendant un chargement de niveau, les rechargements passent par mgr.modules.level:delayOrInstantFunction ; sinon ils sont faits dans afterTrigger via des drapeaux.
- Si un BeamNGGameplayArea fait partie du prefab, collision et navgraph sont rechargés immédiatement (contournement 'hacky' commenté dans le code).
- Les objets non-véhicule portant un Name génèrent un avertissement : utiliser Internal Name. Les véhicules nommés 'clone...' aussi.
- moreData accepte skipCollisionReload et skipNavgraphReload.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_prefabModule.addPrefab(id, moreData)` | Suit un prefab existant de la scène : recense ses enfants, ses véhicules, détecte colliders et navgraph et programme les rechargements nécessaires. (assignée dynamiquement) | dyn |
| `flowgraph_modules_prefabModule.afterTrigger()` | Appelé après le tick du graphe : recharge la collision et reconstruit le navgraph (map.reset, sauf pendant un chargement) si les drapeaux sont levés. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_prefabModule.clear()` | Vide prefabs, flags et sortedIds. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_prefabModule.deletePrefab(id, force)` | Supprime le prefab (sauf dontDelete sans force), le retire du suivi et programme un rechargement de collision s'il en contenait. (assignée dynamiquement) | dyn |
| `flowgraph_modules_prefabModule.executionStopped()` | Appelé à l'arrêt du projet : supprime tous les prefabs suivis non marqués dontDelete, recharge collision et navgraph si nécessaire, puis appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_prefabModule.getPrefab(id)` | Renvoie les données du prefab suivi, ou une table vide. (assignée dynamiquement) | dyn |
| `flowgraph_modules_prefabModule.getVehicleIdsForPrefab(id)` | Renvoie les ids de véhicules contenus dans le prefab, triés. (assignée dynamiquement) | dyn |
| `flowgraph_modules_prefabModule.init()` | Crée les tables prefabs, sortedIds, flags puis appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_prefabModule.originalVehicleTransforms(data)` | Calcule {pos, rot, up} de chaque véhicule (BeamNGVehicle) du prefab et les ajoute au module vehicle du manager. (assignée dynamiquement) | dyn |
| `flowgraph_modules_prefabModule.restoreVehiclePositions(id)` | Replace les véhicules du prefab à leur position et rotation d'origine et réinitialise la physique et les déformations. (assignée dynamiquement) | dyn |
| `flowgraph_modules_prefabModule.setKeepPrefab(id, keep)` | Marque le prefab comme à conserver à l'arrêt du projet (dontDelete). Avertit si le prefab n'est pas suivi. (assignée dynamiquement) | dyn |
| `flowgraph_modules_prefabModule.setUnpackVehiclesBeforeDeletion(id, set)` | Indique si les véhicules doivent être extraits avant la suppression du prefab. (assignée dynamiquement) | dyn |
| `flowgraph_modules_prefabModule.spawnPrefab(fileName)` | Crée un prefab depuis <nom>.prefab.json (chemin relatif au projet), l'ajoute à MissionGroup et le suit via addPrefab. (assignée dynamiquement) | dyn |
| `flowgraph_modules_prefabModule.unpackPrefabAndDelete(id, obj)` | Éclate le prefab (obj:explode), supprime le prefab puis réinsère ses véhicules dans MissionGroup à leur position courante avant de supprimer le groupe restant. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_prefabModule.addPrefab(id, moreData)`

Suit un prefab existant de la scène : recense ses enfants, ses véhicules, détecte colliders et navgraph et programme les rechargements nécessaires. (assignée dynamiquement)

- `id` (*integer*) : id du prefab dans la scène
- `moreData` (*table|nil*) : champs copiés dans les données ; skipCollisionReload, skipNavgraphReload

#### `flowgraph_modules_prefabModule.deletePrefab(id, force)`

Supprime le prefab (sauf dontDelete sans force), le retire du suivi et programme un rechargement de collision s'il en contenait. (assignée dynamiquement)

- `id` (*integer*) : id du prefab
- `force` (*boolean|nil*) : ignorer dontDelete

#### `flowgraph_modules_prefabModule.getPrefab(id)`

Renvoie les données du prefab suivi, ou une table vide. (assignée dynamiquement)

- `id` (*integer*) : id du prefab
- **renvoie** : table données du prefab

#### `flowgraph_modules_prefabModule.getVehicleIdsForPrefab(id)`

Renvoie les ids de véhicules contenus dans le prefab, triés. (assignée dynamiquement)

- `id` (*integer*) : id du prefab
- **renvoie** : integer[] ids

#### `flowgraph_modules_prefabModule.originalVehicleTransforms(data)`

Calcule {pos, rot, up} de chaque véhicule (BeamNGVehicle) du prefab et les ajoute au module vehicle du manager. (assignée dynamiquement)

- `data` (*table*) : données du prefab, avec allChildrenIds
- **renvoie** : table<integer, table> transformations par id de véhicule

#### `flowgraph_modules_prefabModule.restoreVehiclePositions(id)`

Replace les véhicules du prefab à leur position et rotation d'origine et réinitialise la physique et les déformations. (assignée dynamiquement)

- `id` (*integer*) : id du prefab

#### `flowgraph_modules_prefabModule.setKeepPrefab(id, keep)`

Marque le prefab comme à conserver à l'arrêt du projet (dontDelete). Avertit si le prefab n'est pas suivi. (assignée dynamiquement)

- `id` (*integer*) : id du prefab
- `keep` (*boolean*) : conserver

#### `flowgraph_modules_prefabModule.setUnpackVehiclesBeforeDeletion(id, set)`

Indique si les véhicules doivent être extraits avant la suppression du prefab. (assignée dynamiquement)

- `id` (*integer*) : id du prefab
- `set` (*boolean*) : extraire les véhicules

#### `flowgraph_modules_prefabModule.spawnPrefab(fileName)`

Crée un prefab depuis <nom>.prefab.json (chemin relatif au projet), l'ajoute à MissionGroup et le suit via addPrefab. (assignée dynamiquement)

- `fileName` (*string*) : nom du prefab (sans extension)
- **renvoie** : integer id de l'objet prefab

#### `flowgraph_modules_prefabModule.unpackPrefabAndDelete(id, obj)`

Éclate le prefab (obj:explode), supprime le prefab puis réinsère ses véhicules dans MissionGroup à leur position courante avant de supprimer le groupe restant. (assignée dynamiquement)

- `id` (*integer*) : id du prefab
- `obj` (*userdata*) : objet prefab de la scène

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:addPrefab(id, moreData)` |  | 152 |
| `C:afterTrigger()` |  | 20 |
| `C:clear()` |  | 14 |
| `C:deletePrefab(id, force)` |  | 284 |
| `C:executionStopped()` |  | 307 |
| `C:getPrefab(id)` |  | 135 |
| `C:getVehicleIdsForPrefab(id)` |  | 239 |
| `C:init()` |  | 7 |
| `C:originalVehicleTransforms(data)` |  | 92 |
| `C:restoreVehiclePositions(id)` |  | 225 |
| `C:setKeepPrefab(id, keep)` |  | 277 |
| `C:setUnpackVehiclesBeforeDeletion(id, set)` |  | 271 |
| `C:spawnPrefab(fileName)` |  | 139 |
| `C:unpackPrefabAndDelete(id, obj)` |  | 248 |

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `be:` `reloadCollision`
- `obj:` `at`, `delete`, `explode`, `getChildrenObjectIds`, `getClassName`, `getId`, `isSubClassOf`, `size`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/prefabModule.lua`.*
