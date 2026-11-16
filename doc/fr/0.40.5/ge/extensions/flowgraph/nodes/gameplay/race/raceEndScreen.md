# `flowgraph_nodes_gameplay_race_raceEndScreen`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua` · VM : Game Engine (GE) · 330 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceEndScreen")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race End Screen » (pas de catégorie définie). Affiche l'écran de fin de course (route UI scenario.quickrace.end) avec des boutons personnalisables. Entrées : flow, reset (impulsion), title, text (string ou table), vehId (véhicule dont on montre les stats détaillées), stats (table 'endStats'), plus une pin string par bouton défini dans l'éditeur (le libellé ; vide = bouton omis). Sorties : une pin flow par bouton, vraie pour celui cliqué. Le premier bouton non-retry est actif par défaut. Les temps détaillés viennent de core_hotlapping.getTimeInfo() et les meilleurs scores de state.raceComepleteHighscores.

## Remarques

- Options data : includeRetryButton (true, déclenche extensions.hook('onResetGameplay')) et includeScenarioButton (false, ajoute le bouton 'openScenarios').
- Par défaut un seul bouton 'cont' est créé, avec le libellé « Continue ».
- Le nom d'état « raceComepleteHighscores » (faute de frappe) est celui utilisé dans tout le code des nœuds de highscores.
- Le code contient un reste de commentaire fermé par « ]] » dans openDialogue (code commenté mal nettoyé).
- Le clic d'un bouton exécute une commande Lua retrouvant le nœud via core_flowgraphManager.getManagerGraphNode(mgrId, graphId, nodeId).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Vide. | 154 |
| `C:_executionStarted()` | Met toutes les sorties à false et remet open/done à false. | 47 |
| `C:_executionStopped()` | Ferme le dialogue s'il est ouvert et réinitialise l'état. | 147 |
| `C:_onDeserialized(nodeData)` | Relit options puis appelle updateButtons. | 142 |
| `C:_onSerialize(res)` | Sauvegarde la liste options. | 138 |
| `C:buttonPushed(action)` | Appelé par le clic d'un bouton : met à vrai la sortie du bouton, ferme le dialogue et marque done. | 165 |
| `C:closeDialogue()` | Navigue vers la route UI 'play' et marque l'écran fermé. | 184 |
| `C:closed()` | Marque done = true (fermeture signalée par l'UI). | 306 |
| `C:drawCustomProperties()` | Panneau éditeur : renommer, supprimer, ajouter (« add ») ou retirer (« rem ») des boutons. | 56 |
| `C:getCmd(action)` | Construit la chaîne de commande Lua exécutée par l'UI pour appeler buttonPushed(action). | 173 |
| `C:init()` | Initialise l'état (open, done, options) et les options data. | 31 |
| `C:onClientEndMission()` | Hook de fin de mission : marque open = false. | 194 |
| `C:onResetGameplay()` | Hook : si l'écran est ouvert avec le bouton Retry, le ferme et marque done (log d'information). | 177 |
| `C:openDialogue()` | Construit les boutons et les stats (titre, temps détaillés, highscores) puis navigue vers scenario.quickrace.end. | 212 |
| `C:postInit()` | Crée le bouton par défaut 'cont' avec le libellé « Continue ». | 40 |
| `C:reset()` | Remet done et open à false. | 160 |
| `C:updateButtons()` | Recrée les pins d'entrée string et de sortie flow pour chaque bouton de self.options en préservant les liens existants. | 91 |
| `C:work()` | Gère reset et ouvre le dialogue au premier flux tant que done est faux. | 311 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua`.*
