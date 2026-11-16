# `flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « File Traffic Signals » (once_p_duration, dépend de core_trafficSignals). Charge un fichier de feux de signalisation (core_trafficSignals.loadSignals(file)), ou celui du niveau si data.useDefaultFileFromLevel (défaut true) et pas de fichier. Active la simulation (setActive(true, true)) et sort signalsData. Erreur de nœud si le chargement échoue. À l'arrêt, recharge le fichier par défaut de la carte.

**Dépendances (chargées avant) :** `core_trafficSignals`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Vide la sortie et recharge le fichier de signaux par défaut de la carte. | 47 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 35 |
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 24 |
| `C:onNodeReset()` | Vide la sortie signalsData. | 43 |
| `C:postInit()` | Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques). | 29 |
| `C:work()` | Au premier appel, charge les signaux, active la simulation et publie core_trafficSignals.getData() sur signalsData. | 54 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua`.*
