# `flowgraph_nodes_input_blacklistActionFilter`

*Fichier : `lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua` · VM : Game Engine (GE) · 100 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/input/blacklistActionFilter")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Input Actions by Filters » (once_instant, dépend de core_input_actionFilter ; recommandé pour les missions). Comme « Set Input Actions » mais la liste est construite à partir de modèles d'actions (core_input_actionFilter.getActionTemplates) cochés dans les propriétés ; par défaut : vehicleTeleporting, vehicleMenues, physicsControls, aiControls, vehicleSwitching, freeCam, funStuff, walkingMode. Pins : block, ignoreUnrestriced, id (entrée et sortie).

**Dépendances (chargées avant) :** `core_input_actionFilter`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Restaure les réglages propres au nœud à partir des données sauvegardées. | 58 |
| `C:_onSerialize(res)` | Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe. | 54 |
| `C:drawCustomProperties()` | Dessine une case à cocher par modèle d'actions, avec le nombre d'actions en infobulle. | 32 |
| `C:drawMiddle(builder, style)` | Renomme le nœud en Block/Allow Input Actions by Filters si block est codé en dur. | 65 |
| `C:init()` | Active les modèles par défaut. | 25 |
| `C:workOnce()` | Crée la liste via core_input_actionFilter.createActionTemplate(modèles actifs), l'enregistre puis bloque ou autorise les actions. | 74 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua`.*
