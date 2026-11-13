# `flowgraph_nodes_util_randomColor`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/randomColor.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/randomColor")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Random Color » (repeat_instant, icône casino). Fournit une couleur aléatoire {r, g, b, a} à chaque frame. Entrées : cuteColor (couleurs très saturées seulement), randomAlpha (alpha aléatoire, sinon 1). Sortie : color.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Génère une couleur : en mode cuteColor via HSVtoRGB avec teinte aléatoire et saturation/valeur entre 0,7 et 1 ; sinon trois composantes aléatoires. | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/randomColor.lua`.*
