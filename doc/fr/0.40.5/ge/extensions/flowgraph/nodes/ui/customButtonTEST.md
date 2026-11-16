# `flowgraph_nodes_ui_customButtonTEST`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua` · VM : Game Engine (GE) · 78 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/customButtonTEST")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Custom Button TEST » (catégorie once_instant, description « TEST ») : nœud d'essai qui affiche un bouton « Click me! » via le hook UI 'CustomFGButtons'. Sortie « btn_1 » (flux) mise à true quand le bouton est cliqué. Ne pas utiliser en production.

## Remarques

- Nœud de test : openDialogue/closeDialogue référencent self.open mais workOnce n'ouvre pas via openDialogue ; self.open reste false, donc le dialogue n'est pas fermé à l'arrêt.
- Dépend de core_input_bindings.

**Dépendances (chargées avant) :** `core_input_bindings`

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | open = false. | 25 |
| `C:_executionStopped()` | Ferme le dialogue s'il est ouvert. | 29 |
| `C:buttonPushed(action)` | Met à true le pin de sortie correspondant au bouton cliqué, les autres à false. | 35 |
| `C:closeDialogue()` | Envoie une liste vide à 'CustomFGButtons' (cache les boutons). | 45 |
| `C:getCmd(action)` | Construit la commande Lua rappelant buttonPushed(action) sur ce nœud. | 41 |
| `C:init()` | open = false. | 21 |
| `C:onNodeReset()` | Ferme le dialogue s'il est ouvert. | 60 |
| `C:openDialogue()` | Envoie le bouton « Click me! » à l'UI et met done = true. | 49 |
| `C:workOnce()` | Envoie le bouton « Click me! » à l'UI (guihooks 'CustomFGButtons'). | 66 |

**Évènements UI (guihooks.trigger) :** `CustomFGButtons`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua`.*
