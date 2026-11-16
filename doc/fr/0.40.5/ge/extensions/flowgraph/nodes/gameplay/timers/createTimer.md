# `flowgraph_nodes_gameplay_timers_createTimer`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/timers/createTimer")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Create Timer » (catégorie once_instant). Crée un timer via le module timer du flowgraph. Entrées : duration (défaut 5 s), ref (caché ; dtSim temps de simulation, dtReal temps réel, dtRaw temps brut). Sortie : timerId, à passer à Get Timer / Set Timer Property.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud. | 18 |
| `C:postInit()` | Définit les valeurs prédéfinies du pin ref (dtSim, dtReal, dtRaw). | 22 |
| `C:workOnce()` | Appelle self.mgr.modules.timer:addTimer({duration, mode=ref}) et publie l'id sur timerId. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua`.*
