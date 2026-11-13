# `flowgraph_nodes_ui_buttons_setMultipleButtonsProperty`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua` · VM : Game Engine (GE) · 113 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Multiple Buttons Property » (catégorie repeat_instant) : même chose que Set Button Property pour plusieurs boutons. Pour chaque i : entrées « buttonId_i », « label_i », « active_i », « order_i », « style_i ». Seules les propriétés non nil sont appliquées.

## Remarques

- La valeur par défaut de label_i est « Button » : le libellé est donc réécrit à chaque frame tant que le pin garde cette valeur.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(res)` | Restaure l'état du nœud depuis les données sauvegardées. | 107 |
| `C:_onSerialize(res)` | Écrit l'état du nœud dans la table de sauvegarde. | 103 |
| `C:drawCustomProperties()` | Dessine le panneau de propriétés personnalisé de l'éditeur ; renvoie une chaîne décrivant la modification (pour l'historique d'annulation) ou nil. | 31 |
| `C:drawMiddle(builder, style)` | Dessine la zone centrale du nœud dans l'éditeur flowgraph. | 27 |
| `C:init()` | count = 1. | 23 |
| `C:updatePins(old, new)` | Ajuste le nombre de groupes de 5 pins d'entrée (buttonId, label, active, order, style). | 48 |
| `C:work()` | Pour chaque i dont le bouton existe, applique les propriétés non nil. | 89 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua`.*
