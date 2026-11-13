# `flowgraph_nodes_ui_endScreen`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua` · VM : Game Engine (GE) · 335 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/endScreen")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « End Screen » (catégorie once_instant, singleActive) : affiche l'écran de fin d'un scénario avec boutons personnalisables (navigation UI 'scenario.end'). Entrées : « title », « text » (string ou table), « progress », « timeStr » (texte ou secondes -> MM:SS.ss), « successString », « failString », « failed », « medal », « autoPoints », « points », « maxPoints », « portraitSuccess », « portraitFail », « stats » (endStats), « change », « attempt », « progressKey ». Chaque option de bouton (liste modifiable, défaut « cont ») crée un pin d'entrée string (libellé) et un pin de sortie flux mis à true au clic. Boutons ajoutés automatiquement : Retry (data.includeRetryButton), Scénarios (data.includeScenarioButton) et « Start Next Mission » pour chaque mission suivante de l'activité.

## Remarques

- Showing two of these at the same time will break everything (todo du code).
- Bug : avec autoPoints, 'points + v.points or 0' et 'max + v.maxPoints or 0' ont une priorité d'opérateurs erronée (le 'or' s'applique à la somme), donc une statistique sans points donne une erreur d'addition avec nil.
- Si failed est vrai, la médaille est forcée à 'wood'.
- Le bloc missionData (progression, leaderboard, étoiles) n'est construit que si une activité est en cours et que le pin « change » est connecté.
- Un bloc commenté en fin de openDialogue référence une variable 'change' non définie.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Vide. | 167 |
| `C:_executionStarted()` | Remet tous les pins de sortie à false et open = false. | 63 |
| `C:_executionStopped()` | Ferme l'écran. | 163 |
| `C:_onDeserialized(nodeData)` | Restaure l'état du nœud depuis les données sauvegardées. | 158 |
| `C:_onSerialize(res)` | Écrit l'état du nœud dans la table de sauvegarde. | 154 |
| `C:buttonPushed(action)` | Appelé par l'UI quand un bouton est cliqué ; met à true le pin de sortie portant le nom du bouton (les autres à false) et ferme le dialogue. | 173 |
| `C:closeDialogue()` | Si l'écran est ouvert, navigue vers l'état UI 'play' et open = false. | 193 |
| `C:drawCustomProperties()` | Édition de la liste des boutons (renommer, supprimer si texte vide, add, rem). | 70 |
| `C:getCmd(action)` | Renvoie la commande Lua qui retrouve ce nœud et appelle buttonPushed(action). | 182 |
| `C:init()` | Initialise options, oldOptions, open = false et data.includeRetryButton = true. | 43 |
| `C:onClientEndMission()` | Hook : ferme l'écran à la fin du niveau. | 203 |
| `C:onNodeReset()` | Ferme l'écran et remet les sorties à false. | 323 |
| `C:onResetGameplay()` | Hook : ferme l'écran si le bouton Retry est actif. | 186 |
| `C:openDialogue()` | Assemble boutons, texte, temps, médaille, points, stats, portraits et données de mission puis navigue vers 'scenario.end'. | 207 |
| `C:postInit()` | Crée l'option « cont » (Continuer), les pins correspondants et les modèles du pin medal. | 51 |
| `C:updateButtons()` | Recrée les pins des boutons selon options en rétablissant les liens existants. | 105 |
| `C:workOnce()` | Ouvre l'écran de fin. | 330 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua`.*
