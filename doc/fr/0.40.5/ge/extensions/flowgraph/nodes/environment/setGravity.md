# `flowgraph_nodes_environment_setGravity`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/setGravity")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Gravity » (catégorie dynamic_instant). Règle la gravité globale (pin value, en m/s², 0 par défaut) via core_environment.setGravity. La gravité d'origine est mémorisée au démarrage du graphe et restaurée à l'arrêt (data.restoreGravity).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Mémorise la gravité actuelle. | 23 |
| `C:_executionStopped()` | Restaure la gravité mémorisée si data.restoreGravity est vrai. | 26 |
| `C:init(mgr)` | Définit data.restoreGravity = true. | 19 |
| `C:work()` | En mode repeat, réapplique la gravité à chaque frame seulement si le pin value est utilisé (branché). | 37 |
| `C:workOnce()` | Applique la gravité du pin value une fois. | 33 |

## Appels vers le moteur (C++)

- `core_environment.` `getGravity`, `setGravity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua`.*
