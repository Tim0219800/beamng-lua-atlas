# `flowgraph_nodes_debug_miniGraph`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/miniGraph.lua` · VM : Game Engine (GE) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/miniGraph")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Mini Graph » (catégorie repeat_instant, tags util/draw/table/data). Petit graphe (200x60) dans le nœud qui trace une seule valeur number au fil des frames (100 derniers points). Paramètres dans data : scaleMin/scaleMax (0..1 par défaut), autoScale (vrai : l'échelle s'étend avec les valeurs) et stop (vrai : arrête l'enregistrement). Entrée : value (number).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Éditeur : dessine la courbe (PlotMultiLines). | 48 |
| `C:init()` | Initialise les données et paramètres. | 23 |
| `C:work()` | Ajoute la valeur (0 si nil) à la série, met à jour l'échelle et retire le plus ancien point au-delà de la taille max, sauf si data.stop. | 34 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/miniGraph.lua`.*
