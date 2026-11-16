# `flowgraph_nodes_ui_missionEndScreen`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua` · VM : Game Engine (GE) · 316 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/missionEndScreen")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Mission End Screen » (catégorie once_instant, singleActive) : écran de fin de mission avec boutons par défaut et personnalisés (navigation UI 'scenario.end'). Entrées : « text » (string ou table), « failed », « change », « progressKey », « customBtnsFirst » (boutons perso avant ceux par défaut). Sorties : « retry », « contStart » (continuer au début de la mission), « contHere » (continuer ici ; en carrière seulement avec son véhicule), plus un pin d'entrée (libellé), un pin « <nom>_active » (bool caché) et un pin de sortie flux par bouton personnalisé. Boutons par défaut : missions suivantes, Retry, Continuer au début (ou Scénarios), Continuer ici.

## Remarques

- Showing two of these at the same time will break everything (todo du code).
- openDialogue lit career_career.isActive() sans vérifier que career_career existe (isTutorial) : erreur si l'extension carrière n'est pas chargée.
- En tutoriel de carrière, seuls les boutons « Continuer ici » restent.
- Au retry, onResetGameplay met « retry » à true avant de fermer.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Vide. | 153 |
| `C:_executionStarted()` | Sorties à false, open = false. | 43 |
| `C:_executionStopped()` | Ferme l'écran. | 149 |
| `C:_onDeserialized(nodeData)` | Restaure options. | 144 |
| `C:_onSerialize(res)` | Sauvegarde options. | 140 |
| `C:buttonPushed(action)` | Met à true le pin de sortie du bouton cliqué (sans remettre les autres à false) et ferme l'écran. | 159 |
| `C:closeDialogue()` | Si ouvert, navigue vers 'play'. | 181 |
| `C:drawCustomProperties()` | Édition de la liste des boutons personnalisés. | 50 |
| `C:getCmd(action)` | Renvoie la commande Lua qui rappelle buttonPushed(action). | 169 |
| `C:init()` | Options vides et includeRetryButton = true. | 31 |
| `C:onClientEndMission()` | Hook : ferme l'écran. | 191 |
| `C:onNodeReset()` | Ferme l'écran et remet les sorties à false. | 304 |
| `C:onResetGameplay()` | Hook : met retry à true et ferme l'écran si Retry est activé. | 173 |
| `C:openDialogue()` | Construit la liste de boutons et les données de mission, puis navigue vers 'scenario.end'. | 195 |
| `C:postInit()` | Crée les pins des options. | 38 |
| `C:updateButtons()` | Recrée les pins (texte, actif, sortie) par option en rétablissant les liens. | 85 |
| `C:workOnce()` | Ouvre l'écran de fin. | 311 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua`.*
