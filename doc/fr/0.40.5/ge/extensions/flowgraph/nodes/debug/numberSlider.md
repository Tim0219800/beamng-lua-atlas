# `flowgraph_nodes_debug_numberSlider`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua` · VM : Game Engine (GE) · 108 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/numberSlider")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Number Slider » (catégorie provider, tag util). Fournit jusqu'à cinq nombres réglables à la souris, avec des plages différentes : a [-1, 1], b [0, 1], c [0, 10], d [0, 100], e [0, 1000] (modifiables via data.aMin/aMax, bMin/bMax…). Seule la sortie a est visible par défaut ; b à e sont cachées. Les curseurs sont dans le nœud (pour les pins visibles) et dans le panneau de propriétés. Valeurs sauvegardées avec le graphe.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Restaure les valeurs a à e (0 par défaut). | 98 |
| `C:_onSerialize(res)` | Sauvegarde les valeurs a à e. | 88 |
| `C:drawCustomProperties()` | Dessine les cinq curseurs dans le panneau de propriétés. | 48 |
| `C:drawMiddle(builder, style)` | Éditeur : dessine les curseurs des pins non cachés. | 58 |
| `C:init()` | Définit les plages par défaut et les valeurs initiales à 0. | 25 |
| `C:work()` | Copie les valeurs des curseurs vers les pins a à e. | 80 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua`.*
