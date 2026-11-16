# `flowgraph_nodes_gameplay_traffic_signals_trafficSignalsSettings`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/trafficSignalsSettings.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/trafficSignalsSettings")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Traffic Signals Settings » (once_instant, dépend de core_trafficSignals). Pins : signalsActive (core_trafficSignals.setActive) et simpleLights (debugLevel 1 si vrai, sinon 0 : visuels simples des états). À l'arrêt, réactive les signaux et remet debugLevel à 0.

**Dépendances (chargées avant) :** `core_trafficSignals`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Réactive les signaux et remet core_trafficSignals.debugLevel à 0. | 23 |
| `C:workOnce(args)` | Applique signalsActive et simpleLights si non nil. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/trafficSignalsSettings.lua`.*
