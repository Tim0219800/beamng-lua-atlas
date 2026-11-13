# `flowgraph_nodes_gameplay_traffic_signals_instanceSettings`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceSettings.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/instanceSettings")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Signal Instance Settings » (once_instant). Règle une instance de feu : sequence (setSequence par id), controller (setController par id), active (setActive), stateIndex (setStrictState ; 0 pour réinitialiser). Seuls les pins non nil sont appliqués.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Applique séquence, contrôleur, activation et état forcé à l'instance. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceSettings.lua`.*
