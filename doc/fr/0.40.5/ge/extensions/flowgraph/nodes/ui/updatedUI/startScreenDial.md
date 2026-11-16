# `flowgraph_nodes_ui_updatedUI_startScreenDial`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua` · VM : Game Engine (GE) · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenDial")` (fichier sous extensions/ mais pas une extension classique)

Nœud « StartScreen Drag Dial » (repeat_instant, couleur ui). Ajoute à l'écran de démarrage le panneau de réglage du dial d'une course de dragster (le gagnant est celui qui termine au plus près de son dial sans le dépasser). Entrée flow ; sorties flow (chainFlow) et dials (table de {label, key, value, disabled, racerId}).

## Remarques

- Le log d'avertissement utilise logTag, non défini dans ce fichier (nil).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Prépare le panneau {type='dragDial', header='Dial Setup', ...}. | 22 |
| `C:onDialSetByDialPanel(dial)` | Appelé quand le joueur modifie un dial dans le panneau ; met à jour la valeur de l'entrée de même label et republie dials. | 58 |
| `C:work()` | Lit gameplay_drag_dragBridge.getData() ; pour chaque coureur crée une entrée de dial (valeur timers.dial.value ou 12 par défaut, désactivée si le coureur n'est pas jouable), ajoute le panneau à l'UI et publie la liste sur le pin dials. Sans données, logue un avertissement et ne fait rien d'autre. | 34 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua`.*
