# `flowgraph_nodes_ui_startScreen`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua` · VM : Game Engine (GE) · 183 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/startScreen")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Start Screen » (catégorie par défaut, once + singleActive) : affiche l'écran de démarrage d'un scénario (navigation UI 'scenario.start'). Entrées : flow, « reset », « layout » (portrait, htmlOnly, popup), « title », « text » (string ou multiTranslationObject), « buttonText » (défaut 'ui.scenarios.start.start'), « portraitImg », « showProgress » (progression de la mission), « progressKey ». Sortie : flow mis à true quand le joueur lance.

## Remarques

- Showing two of these at the same time will break everything (todo du code).
- _executionStarted est défini deux fois (la deuxième définition remplace la première, sans open/done).
- Ancien format : _onDeserialized convertit hardcodedPins.portraitMode en layout portrait/htmlOnly.

**Dépendances (chargées avant) :** `core_input_bindings`

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Sorties à false, _active = false. | 34 |
| `C:_executionStopped()` | Ferme et réinitialise. | 58 |
| `C:_onDeserialized(data)` | Convertit l'ancien format portraitMode en layout. | 174 |
| `C:buttonPushed(action)` | Met à true la sortie du bouton ; les autres à false. | 71 |
| `C:closeDialogue()` | Marque l'écran comme fermé. | 81 |
| `C:closed()` | done = true, _active = false. | 136 |
| `C:getCmd(action)` | Renvoie la commande Lua qui rappelle buttonPushed(action). | 77 |
| `C:init()` | open = false, done = false. | 29 |
| `C:onClientEndMission()` | Hook : ferme l'écran. | 152 |
| `C:onFilteredInputChanged(devName, action, value)` | Hook d'entrée filtrée ; corps vide. | 141 |
| `C:onScenarioUIReady(state)` | Hook : l'UI est prête ; renvoie les données mémorisées via 'ScenarioChange' si l'écran est actif. | 130 |
| `C:openDialogue()` | Prépare les données et navigue vers 'scenario.start'. | 90 |
| `C:postInit()` | Modèles de layout. | 43 |
| `C:reset()` | Remet done, open et _active à false. | 65 |
| `C:started()` | Ferme l'écran et met le flux de sortie à true. | 145 |
| `C:work()` | Gère reset ; ouvre l'écran quand le flux d'entrée est actif. | 156 |

**Évènements UI (guihooks.trigger) :** `ScenarioChange`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua`.*
