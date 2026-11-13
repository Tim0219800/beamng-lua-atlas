# `flowgraph_modules_levelModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/levelModule.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/levelModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 100) qui synchronise les actions d'un projet avec le chargement d'un niveau. Il permet de différer une fonction jusqu'à la fin du chargement (delayOrInstantFunction) et de recharger la collision (be:reloadCollision) après le chargement d'un niveau ou à la fin du tick quand un prefab est chargé.

## Remarques

- Le test de chargement se fait par core_gamestate.loading(). Le champ isLoadingLevel est commenté et inutilisé.
- beginLoadingLevel est vide.
- uniqueFuns est créé et vidé mais jamais utilisé ; la liste prefabs n'est que remplie.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_levelModule.afterTrigger()` | Appelé après le tick du graphe : si reloadCollisionOnAfterTrigger est vrai, appelle be:reloadCollision(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_levelModule.beginLoadingLevel()` | Prévu pour signaler le début d'un chargement de niveau (corps vide). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_levelModule.clear()` | Vide les tables et remet les drapeaux reloadCollisionOnLevelLoading / reloadCollisionOnAfterTrigger à false. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_levelModule.delayOrInstantFunction(fun)` | Exécute fun tout de suite si aucun niveau n'est en chargement, sinon la met en file jusqu'à finishedLevelLoading. (assignée dynamiquement) | dyn |
| `flowgraph_modules_levelModule.executionStopped()` | Appelé à l'arrêt du projet : appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_levelModule.finishedLevelLoading()` | À appeler à la fin du chargement du niveau : recharge la collision si demandé, exécute puis vide les fonctions différées. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_levelModule.init()` | Crée les tables funs, uniqueFuns et prefabs, initialise les drapeaux de rechargement de collision puis appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_levelModule.prefabLoaded(id)` | Signale qu'un prefab a été chargé : demande un rechargement de collision (à la fin du chargement du niveau si en cours, sinon après le tick) et mémorise l'id. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_levelModule.delayOrInstantFunction(fun)`

Exécute fun tout de suite si aucun niveau n'est en chargement, sinon la met en file jusqu'à finishedLevelLoading. (assignée dynamiquement)

- `fun` (*function*) : fonction sans argument

#### `flowgraph_modules_levelModule.prefabLoaded(id)`

Signale qu'un prefab a été chargé : demande un rechargement de collision (à la fin du chargement du niveau si en cours, sinon après le tick) et mémorise l'id. (assignée dynamiquement)

- `id` (*integer*) : id de l'objet prefab

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:afterTrigger()` |  | 41 |
| `C:beginLoadingLevel()` |  | 25 |
| `C:clear()` |  | 16 |
| `C:delayOrInstantFunction(fun)` | this function will delay another function until finishedLevelLoading is called, or will call it instantly if not level is being loaded. | 49 |
| `C:executionStopped()` |  | 66 |
| `C:finishedLevelLoading()` |  | 29 |
| `C:init()` |  | 7 |
| `C:prefabLoaded(id)` |  | 57 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/levelModule.lua`.*
