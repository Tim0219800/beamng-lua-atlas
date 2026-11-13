# `flowgraph_nodes_ui_selectButtons`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua` · VM : Game Engine (GE) · 224 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/selectButtons")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Select Buttons » (catégorie once_instant, once + singleActive) : dialogue de choix avec plusieurs boutons (ui_missionInfo.openDialogue). Entrées : « title », « description » (string ou multiTranslationObject), « altMode » (dialogue en bas de l'écran, caché), « hideApps » (cache les apps, caché), et pour chaque option (défaut accept / decline) un pin d'entrée string (libellé ; vide = ignoré) et un pin de sortie flux mis à true au clic.

## Remarques

- Showing two of these at the same time will break everything (todo du code).
- _executionStarted est défini deux fois (même corps).
- Si le flux d'entrée tombe à false alors que le dialogue est ouvert, il est fermé.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Ferme le dialogue si le flux d'entrée est false. | 164 |
| `C:_executionStarted()` | Remet les sorties à false. | 39 |
| `C:_executionStopped()` | Ferme le dialogue s'il est ouvert. | 158 |
| `C:_onDeserialized(nodeData)` | Restaure options. | 147 |
| `C:_onSerialize(res)` | Sauvegarde options. | 143 |
| `C:buttonPushed(action)` | Met à true la sortie du bouton cliqué (les autres à false) et ferme le dialogue. | 169 |
| `C:closeDialogue()` | Ferme le dialogue (ui_missionInfo) et réaffiche les apps si masquées. | 182 |
| `C:drawCustomProperties()` | Édition de la liste des boutons. | 45 |
| `C:getCmd(action)` | Renvoie la commande Lua qui rappelle buttonPushed(action). | 178 |
| `C:init()` | Options {accept, decline}, count = 1. | 27 |
| `C:onNodeReset()` | Ferme le dialogue et remet les sorties à false. | 209 |
| `C:openDialogue()` | Construit les boutons et ouvre le dialogue ; masque les apps si hideApps. | 192 |
| `C:postInit()` | Crée les pins des options. | 35 |
| `C:updateButtons()` | Recrée les pins par option en rétablissant les liens. | 94 |
| `C:workOnce()` | Ouvre le dialogue. | 218 |

**Évènements UI (guihooks.trigger) :** `ShowApps`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua`.*
