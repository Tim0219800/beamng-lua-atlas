# `flowgraph_nodes_ui_missionPopup`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua` · VM : Game Engine (GE) · 127 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/missionPopup")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Popup » (catégorie par défaut, once + singleActive) : affiche un popup d'information que seul le bouton ferme (ui_popup.openPopupEntries, type 'info'). Entrées : flow, « reset » (impulsion), « title », « text » (string ou table traduisible), « buttonText » (défaut 'ui.scenarios.start.start'). Sortie : flow, mis à true à la fermeture. Dépend de core_input_bindings et ui_popup.

## Remarques

- Showing two popups at once les met en file d'attente (todo du code).
- _executionStarted est défini deux fois (la dernière définition remplace la première et ne remet pas open/done à zéro).
- onFilteredInputChanged est vide.

**Dépendances (chargées avant) :** `core_input_bindings`, `ui_popup`

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet sorties et état à zéro. | 30 |
| `C:_executionStopped()` | Ferme le popup s'il est ouvert et réinitialise l'état. | 50 |
| `C:closeDialogue()` | Ferme le popup tutoriel si ouvert. | 67 |
| `C:getPopupId()` | Renvoie l'identifiant unique du popup (manager, graphe, nœud). | 63 |
| `C:init()` | open = false, done = false. | 25 |
| `C:onClientEndMission()` | Hook : réinitialise open et _active. | 103 |
| `C:onFilteredInputChanged(devName, action, value)` | Hook d'entrée filtrée ; corps vide. | 99 |
| `C:onIntroPopupCareerClosed(id)` | Hook : popup fermé (id) ; si c'est celui de ce nœud, met le flux de sortie à true. | 91 |
| `C:openDialogue()` | Ouvre le popup avec titre, texte et libellé du bouton. | 75 |
| `C:postInit()` | Vide. | 39 |
| `C:reset()` | Remet done, open et _active à false. | 57 |
| `C:work()` | Gère le reset ; ouvre le popup quand le flux d'entrée est actif et qu'il n'est pas déjà ouvert. | 108 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua`.*
