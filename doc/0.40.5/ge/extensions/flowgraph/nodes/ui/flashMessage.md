# `flowgraph_nodes_ui_flashMessage`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/flashMessage.lua` · VM : Game Engine (GE) · 42 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/flashMessage")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Flash Message » (catégorie repeat_instant, durée) : affiche un message au centre de l'écran via scenario/scenariohelper.flashUiMessage. Entrées : flow, « message » (any), « duration » (3 s), « instant » (caché, efface les précédents), « biggerText » (caché, vrai). Sortie : flow. Nécessite un layout UI qui contient l'app des messages.

## Remarques

- Les tables sont transmises telles quelles, le reste est converti avec tostring.
- work() renvoie le message à chaque frame où le flux est actif.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Charge scenario/scenariohelper. | 25 |
| `C:work()` | Si 'instant', envoie 'ScenarioFlashMessageClear', puis affiche le message et recopie le flux d'entrée en sortie. | 29 |

**Évènements UI (guihooks.trigger) :** `ScenarioFlashMessageClear`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/flashMessage.lua`.*
