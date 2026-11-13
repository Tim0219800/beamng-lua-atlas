# `flowgraph_nodes_ui_rtMessage`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/rtMessage.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/rtMessage")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « RT Message » (catégorie repeat_instant, tags ui/text) : affiche un message en temps réel (hook 'ScenarioRealtimeDisplay'). Entrées : « message » (any ou table translationObject {txt, context}), « clear » (impulsion). Le message doit être effacé manuellement ; il est aussi effacé à l'arrêt du graphe.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Efface le message temps réel. | 25 |
| `C:init()` | Vide. | 22 |
| `C:work()` | Efface ou affiche le message selon 'clear' et le flux d'entrée. | 30 |

**Évènements UI (guihooks.trigger) :** `ScenarioRealtimeDisplay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/rtMessage.lua`.*
