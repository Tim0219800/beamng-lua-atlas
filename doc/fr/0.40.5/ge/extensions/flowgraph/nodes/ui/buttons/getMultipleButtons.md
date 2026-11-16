# `flowgraph_nodes_ui_buttons_getMultipleButtons`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua` · VM : Game Engine (GE) · 100 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/buttons/getMultipleButtons")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Multiple Buttons » (catégorie repeat_instant) : surveille plusieurs boutons créés auparavant. Pour chaque i (nombre réglé dans les propriétés, 'Button Ids') : entrée « buttonId_i » (number), sorties « clicked_i » (impulsion) et « buttonId_i » (number, la sortie du même nom que l'entrée).

## Remarques

- Le pin de sortie buttonId_i n'est jamais écrit par work(), seule 'clicked_i' est mise à jour.
- Le nombre est sauvegardé dans 'count'.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(res)` | Restaure l'état du nœud depuis les données sauvegardées. | 94 |
| `C:_onSerialize(res)` | Écrit l'état du nœud dans la table de sauvegarde. | 90 |
| `C:drawCustomProperties()` | Dessine le panneau de propriétés personnalisé de l'éditeur ; renvoie une chaîne décrivant la modification (pour l'historique d'annulation) ou nil. | 29 |
| `C:drawMiddle(builder, style)` | Dessine la zone centrale du nœud dans l'éditeur flowgraph. | 25 |
| `C:init()` | count = 1. | 21 |
| `C:updatePins(old, new)` | Ajuste le nombre de triplets (entrée buttonId_i, sorties clicked_i et buttonId_i) en supprimant liens et pins en trop ou en créant les nouveaux. | 46 |
| `C:work()` | Pour chaque i, lit le bouton buttonId_i et recopie button.clicked sur « clicked_i ». | 78 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua`.*
