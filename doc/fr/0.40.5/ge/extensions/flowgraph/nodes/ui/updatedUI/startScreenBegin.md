# `flowgraph_nodes_ui_updatedUI_startScreenBegin`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua` · VM : Game Engine (GE) · 126 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin")` (fichier sous extensions/ mais pas une extension classique)

Nœud « StartScreen Begin » (couleur ui). Commence la construction de l'écran de démarrage d'une mission : à la première frame avec flow actif, il appelle modules.ui:startUIBuilding('startScreen'), ajoute l'en-tête (nom du projet), fixe le texte du bouton Start et, si simple est vrai, passe l'écran en mode simple. Entrées : flow, reset (impulsion), triggerStart (impulsion, simule un clic sur Start), startButtonText (string, défaut « ui.scenarios.start.start »), simple (bool). Sorties : flow (true une fois le bouton Start cliqué), build (chainFlow, une frame pour chaîner les panneaux). Se termine avec un nœud « Screen Finish ».

## Remarques

- Le code de repli par minuterie (started/startTime) et le hook onUILayoutLoaded sont commentés dans le fichier.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet à zéro started/done/built et l'auto-skip au démarrage du projet. | 25 |
| `C:_executionStopped()` | Appelé à l'arrêt du projet ; appelle closeDialogue (sans effet réel). | 34 |
| `C:closeDialogue()` | Ne fait rien en pratique : la navigation vers « play » est commentée. | 42 |
| `C:onClientEndMission()` | Hook de fin de mission côté client ; appelle closeDialogue. | 38 |
| `C:onNodeReset()` | Appelé quand le nœud est réinitialisé (pin reset ou reset du graphe). | 48 |
| `C:startFromUi()` | Simule le clic sur Start : met done=true, émet le hook onUIStartButtonClicked, navigue vers l'écran « play » et efface modules.ui.uiLayout. | 107 |
| `C:work()` | Gère reset, construit l'écran au premier flow, active build une frame, publie done sur le pin flow de sortie, déclenche startFromUi si triggerStart est reçu, et applique l'auto-skip (startingOptions.autoSkipStartScreen, après 2 s de temps réel). | 60 |
| `C:workOnce()` | Variante exécutée une seule fois par le moteur flowgraph (corps vide ici). | 57 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUIStartButtonClicked` — écouté par 2 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua`.*
