# `flowgraph_nodes_states_transitionStack`

*Fichier : `lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/states/transitionStack")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Get Transition Variables » du stategraph. Lit les variables passées par le noeud « Transition » de l'état précédent (pile transitionStack de l'état démarré) et les expose sur ses pins de sortie personnalisés ; le flow d'entrée est recopié en sortie.

## Remarques

- work écrase aussi pinOut.flow avec nil via la boucle (self._stack['flow']) avant de le réécrire à la fin : sans conséquence.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Oublie la pile à l'arrêt. | 47 |
| `C:drawCustomProperties()` | Prépare les modèles de pins si besoin. | 90 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du noeud dans l'éditeur. | 98 |
| `C:hideProperties()` | Libère le cache de modèles de pins. | 94 |
| `C:init()` | savePins = true, allowCustomOutPins = true. | 37 |
| `C:makePinTemplates()` | Construit les modèles de pins comme le noeud transition. | 60 |
| `C:onStateStarted(state)` | Hook : à l'entrée dans l'état, mémorise state.transitionStack. | 42 |
| `C:work()` | Copie _stack[nom] sur chaque pin de sortie et recopie flow. | 51 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua`.*
