# `flowgraph_modules_foreachModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/foreachModule.lua` · VM : Game Engine (GE) · 30 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/foreachModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 1000, donc exécuté en dernier) réservé aux graphes enfants créés par une boucle foreach. Il ne contient que les champs parentGraphId, key et value, que le nœud foreach renseigne pour l'enfant. Toutes ses méthodes d'exécution sont vides.

## Remarques

- afterTrigger, executionStopped et executionStarted sont vides (un log de debug est commenté).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_foreachModule.afterTrigger()` | Appelé après le tick du graphe (ne fait rien). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_foreachModule.clear()` | Remet parentGraphId, key et value à nil. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_foreachModule.executionStarted()` | Appelé au démarrage du projet (ne fait rien). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_foreachModule.executionStopped()` | Appelé à l'arrêt du projet (ne fait rien). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_foreachModule.init()` | Appelé à la création du module : appelle clear(). (assignée dynamiquement) *(interne)* | dyn |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:afterTrigger()` |  | 18 |
| `C:clear()` |  | 11 |
| `C:executionStarted()` |  | 26 |
| `C:executionStopped()` |  | 22 |
| `C:init()` |  | 7 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/foreachModule.lua`.*
