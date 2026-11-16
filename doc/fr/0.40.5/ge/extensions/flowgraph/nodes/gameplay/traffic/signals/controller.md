# `flowgraph_nodes_gameplay_traffic_signals_controller`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua` · VM : Game Engine (GE) · 94 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/controller")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Signal Controller » (repeat_instant). Lit un contrôleur de feux (signalControllerData) : signalType, stateCount, duration (totalDuration) et, pour chaque état i (nombre réglable), stateName_i et stateDuration_i ('none' et 0 si absent).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(res)` | Restaure les réglages propres au nœud à partir des données sauvegardées. | 74 |
| `C:_onSerialize(res)` | Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe. | 70 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 32 |
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 24 |
| `C:postInit()` | Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques). | 28 |
| `C:updatePins(old, new)` | Ajoute ou retire les pins stateName_i / stateDuration_i et supprime leurs liens. | 50 |
| `C:work(args)` | Recopie type, nombre d'états, durée totale et nom/durée de chaque état sur les sorties. | 79 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua`.*
