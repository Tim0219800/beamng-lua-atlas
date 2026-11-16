# `flowgraph_nodes_util_loadProject`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/loadProject.lua` · VM : Game Engine (GE) · 55 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/loadProject")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Load Project » (once_p_duration). Charge un projet flowgraph par nom (chemin relatif à flowgraphEditor/, extension .flow.json facultative) et l'exécute. Entrées : filepath, startNextFrame (démarre à la frame suivante au lieu d'immédiatement). Quand le projet parent s'arrête, le projet cible est arrêté et supprimé (data.destroyTargetOnStop, true par défaut).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Arrête la cible (setRunning(false)) et la retire à la frame suivante via core_flowgraphManager.removeNextFrame si destroyTargetOnStop. | 32 |
| `C:init(mgr, ...)` | Active destroyTargetOnStop et vide la cible. | 21 |
| `C:postInit()` | Limite le sélecteur de fichier du pin filepath aux fichiers .flow.json. | 25 |
| `C:workOnce()` | Résout le chemin (essaie le nom brut, +.flow.json, flowgraphEditor/<nom>.flow.json), charge le gestionnaire (core_flowgraphManager.loadManager) puis le démarre tout de suite ou à la frame suivante. | 41 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/loadProject.lua`.*
