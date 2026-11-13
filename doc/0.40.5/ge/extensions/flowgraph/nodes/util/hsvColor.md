# `flowgraph_nodes_util_hsvColor`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/hsvColor")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Color HSV » (catégorie simple). Crée une couleur à partir de teinte, saturation, valeur (0 à 1) et alpha. Sortie : color = table {r, g, b, a}. Valeurs par défaut si l'entrée est vide : h=0, s=1, v=1, a=1.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:HSVtoRGB(h, s, v)` | Convertit HSV en table {r, g, b} via la fonction globale HSVtoRGB ; la teinte est ramenée dans [0,1[ et s, v sont bornés à [0,1]. | 27 |
| `C:init()` | Ne fait rien. | 23 |
| `C:work()` | Calcule la couleur et écrit {r, g, b, alpha} dans color. | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua`.*
