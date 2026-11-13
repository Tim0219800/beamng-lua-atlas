# `flowgraph_nodes_ui_onBigmapStateChange`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua` · VM : Game Engine (GE) · 54 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/onBigmapStateChange")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Bigmap State Change » (catégorie repeat_instant) : détecte l'ouverture et la fermeture de la grande carte. Sorties impulsions : « enteredStart », « enteredEnd », « exitedStart », « exitedEnd » (début/fin de transition).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise les drapeaux. | 24 |
| `C:onActivateBigMapCallback()` | Hook : fin de l'ouverture de la carte. | 45 |
| `C:onBigmapStartTransition(activate, esc)` | Hook : début de transition ; activate vrai = entrée, faux = sortie. | 40 |
| `C:onDeactivateBigMapCallback()` | Hook : fin de la fermeture de la carte. | 48 |
| `C:work(args)` | Remet les impulsions à false et applique les drapeaux reçus. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua`.*
