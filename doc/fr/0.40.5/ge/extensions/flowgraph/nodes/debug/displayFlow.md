# `flowgraph_nodes_debug_displayFlow`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/displayFlow")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Display Flow » (type simple, catégorie logic, tag util). Affiche une case cochée verte quand le flux atteint le nœud (considéré actif si le dernier flux date de moins de 5 frames). L'infobulle montre un taux de rafraîchissement estimé (1 / intervalle entre deux flux). Pin d'entrée : value (flow). Aucune sortie.

## Remarques

- C.todo du jeu : « Randomly bugs out when first starting the execution sometimes ».

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Éditeur : dessine la case cochée (active/inactive) et cumule le temps. | 33 |
| `C:drawTooltip()` | Éditeur : infobulle « N fps ». | 44 |
| `C:init()` | Initialise lastTime, time et lastUsedFrame. | 21 |
| `C:work()` | Mémorise le temps écoulé depuis le dernier flux et le numéro de frame courant (mgr.frameCount). | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua`.*
