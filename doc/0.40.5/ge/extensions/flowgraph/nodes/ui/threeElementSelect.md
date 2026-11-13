# `flowgraph_nodes_ui_threeElementSelect`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua` · VM : Game Engine (GE) · 152 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/threeElementSelect")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Three Element Select » (catégorie par défaut, once + singleActive) : laisse le joueur choisir entre trois éléments (navigation UI 'menu.threeElementSelect'). Entrées : flow, « reset », « description », puis pour i = 1..3 : « veh<i>image », « veh<i>name », « veh<i>desc ». Sorties : « pick1 », « pick2 », « pick3 ».

## Remarques

- Showing two of these at the same time will break everything (todo du code).
- started() met self.pinOut.flow à true, mais ce nœud n'a pas de pin de sortie « flow » (erreur si appelée).

**Dépendances (chargées avant) :** `core_input_bindings`

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Sorties à false, _active = false. | 44 |
| `C:_executionStopped()` | Ferme et réinitialise. | 63 |
| `C:buttonPushed(action)` | Met à true la sortie pick choisie, les autres à false. | 76 |
| `C:closeDialogue()` | Marque l'écran comme fermé. | 86 |
| `C:closed()` | done = true. | 114 |
| `C:getCmd(action)` | Renvoie la commande Lua qui rappelle buttonPushed(action). | 82 |
| `C:init()` | open = false, done = false. | 39 |
| `C:onClientEndMission()` | Hook : réinitialise open et _active. | 127 |
| `C:openDialogue()` | Construit les trois éléments (image, nom, description, code du bouton) et navigue vers 'menu.threeElementSelect'. | 91 |
| `C:postInit()` | Vide. | 53 |
| `C:reset()` | Remet done, open et _active à false. | 70 |
| `C:started()` | Ferme l'écran puis écrit pinOut.flow (voir notes). | 120 |
| `C:work()` | Gère reset ; ouvre l'écran quand le flux d'entrée est actif. | 132 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua`.*
