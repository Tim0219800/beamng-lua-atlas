# `flowgraph_nodes_ui_buttons_simpleMultipleButtons`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua` · VM : Game Engine (GE) · 174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Simple Multiple Buttons » (catégorie once_instant) : version multi-boutons de Simple Button. Pour chaque i : entrées « hideWhenDone_i », « label_i », « order_i », « style_i » ; sorties « clicked_i » (impulsion), « complete_i », « incomplete_i » (cachées), « buttonId_i ». Le nombre de boutons se règle dans les propriétés.

## Remarques

- Bug : workOnce lit self.pinIn.active (pin inexistant, erreur) pour chaque bouton.
- Contrairement à Simple Button, les sorties s'appellent complete_i / incomplete_i (pas used/unused).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Initialise hiddenAfterDone/hiddenAfterReset à false pour chaque bouton. | 34 |
| `C:_onDeserialized(res)` | Restaure l'état du nœud depuis les données sauvegardées. | 168 |
| `C:_onSerialize(res)` | Écrit l'état du nœud dans la table de sauvegarde. | 164 |
| `C:drawCustomProperties()` | Dessine le panneau de propriétés personnalisé de l'éditeur ; renvoie une chaîne décrivant la modification (pour l'historique d'annulation) ou nil. | 43 |
| `C:drawMiddle(builder, style)` | Zone centrale vide. | 30 |
| `C:init()` | count = 1. | 26 |
| `C:onNodeReset()` | Désactive chaque bouton une fois et remet hiddenAfterDone à false. | 123 |
| `C:updatePins(old, new)` | Ajuste le nombre de groupes de pins (4 entrées, 4 sorties par bouton). | 60 |
| `C:work()` | Pour chaque bouton, met à jour clicked/complete/incomplete et le désactive si hideWhenDone et complété. | 146 |
| `C:workOnce()` | Crée tous les boutons et écrit leurs id (voir notes : bug). | 135 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua`.*
