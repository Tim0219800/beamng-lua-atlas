# `flowgraph_nodes_debug_multiFlow`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/multiFlow.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/multiFlow")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Multi Flow » (type simple, catégorie logic), nœud de test avec quatre entrées flow a, b, c, d. Affiche dans le nœud une case par entrée (vert, jaune, rouge, magenta) cochée si l'entrée a du flux ; si data.logOnWork est vrai, imprime leurs valeurs à chaque exécution.

## Remarques

- C.todo du jeu : « Maybe merge this with displayFlow node ».

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Éditeur : dessine quatre cases cochées selon l'état des pins. | 37 |
| `C:init()` | Met data.logOnWork à faux. | 24 |
| `C:work()` | Si data.logOnWork, imprime l'état des quatre entrées. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/multiFlow.lua`.*
