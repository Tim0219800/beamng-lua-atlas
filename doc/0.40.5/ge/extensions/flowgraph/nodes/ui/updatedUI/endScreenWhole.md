# `flowgraph_nodes_ui_updatedUI_endScreenWhole`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua` · VM : Game Engine (GE) · 402 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole")` (fichier sous extensions/ mais pas une extension classique)

Nœud « EndScreen Whole » (couleur ui, singleActive). Version tout-en-un de l'écran de fin d'un scénario/mission : construit les boutons (missions suivantes, Retry, Continuer au début, Continuer ici, boutons personnalisés) et, si data.autoBuild (vrai par défaut), génère aussi l'en-tête, le panneau Results, les objectifs et notes puis termine la construction UI. Entrées : flow, reset, text, failed (caché), change, progressKey, customBtnsFirst (caché) et pins par bouton ; sorties : flow, build, retry, contStart, contHere et un flow par bouton.

## Remarques

- Le champ todo du nœud indique que deux nœuds de ce type simultanés cassent tout.
- L'auto-skip teste startingOptions.autoSkipStartScreen alors que EndScreen Begin teste autoSkipEndScreen (incohérence probable).
- Contrairement à EndScreen Begin, openDialogue accède à self.mgr.activity.setupModules sans vérifier que mgr.activity existe.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Appelé après le déclenchement du nœud ; corps vide (code commenté). | 167 |
| `C:_executionStarted()` | Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état du nœud. | 51 |
| `C:_executionStopped()` | Appelé à l'arrêt du projet ; ferme le dialogue. | 159 |
| `C:_onDeserialized(nodeData)` | Recharge les boutons personnalisés puis recrée les pins. | 154 |
| `C:_onSerialize(res)` | Sauvegarde la liste des boutons personnalisés (options). | 150 |
| `C:buttonPushed(action)` | Appelé quand un bouton est cliqué : met à true le pin de sortie du même nom que l'action, puis ferme le dialogue (navigation vers « play »). | 173 |
| `C:closeDialogue()` | Si construit, navigue vers « play ». | 195 |
| `C:drawCustomProperties()` | Dessine dans l'éditeur flowgraph la liste des boutons personnalisés (champ texte par bouton, boutons « add » et « rem »). Renvoie la raison de la modification (chaîne) ou nil. | 60 |
| `C:getCmd(action)` | Renvoie la commande Lua (chaîne) qui retrouve ce nœud via core_flowgraphManager.getManagerGraphNode et appelle buttonPushed(action) ; utilisable depuis l'UI. | 183 |
| `C:init()` | Initialise open, options, data.includeRetryButton=true, data.autoBuild=true et l'auto-skip. | 36 |
| `C:onClientEndMission()` | Hook appelé à la fin de la mission côté client ; ferme le dialogue. | 163 |
| `C:onNodeReset()` | Appelé quand le nœud est réinitialisé (pin reset ou reset du graphe). | 359 |
| `C:onResetGameplay()` | Hook de reset du gameplay ; si l'écran est ouvert et Retry inclus, ferme le dialogue et active le pin retry. | 187 |
| `C:openDialogue()` | Construit les boutons (voir EndScreen Begin) et, si autoBuild, remplit l'écran (en-tête, textPanel Results, objectifs, notes) puis appelle finishUIBuilding. | 204 |
| `C:postInit()` | Appelé juste après init, une fois les pins créés. | 46 |
| `C:updateButtons()` | Recrée les pins du nœud pour chaque nom de bouton de self.options : pin d'entrée string (libellé), pin d'entrée bool « <nom>_active » (caché, true par défaut) et pin de sortie flow. Reconnecte les liens existants quand le nom n'a pas changé. | 95 |
| `C:work()` | Gère reset, construit l'écran à la première frame de flow, active build une frame, et applique l'auto-skip (startingOptions.autoSkipStartScreen, 2 s) en arrêtant la mission. | 368 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onResetGameplay` — écouté par 5 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua`.*
