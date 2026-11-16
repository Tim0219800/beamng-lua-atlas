# `flowgraph_nodes_gameplay_drift_driftTightDrift`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftTightDrift.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/driftTightDrift")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Drift Through Detected » (catégorie repeat_instant, drift). Détecte les zones de drift serré : émet tightDrift (impulsion) et tightDriftScore quand le callback tight du module drift du flowgraph est actif (ttl > 0).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Lit mgr.modules.drift:getCallBacks().tight et renseigne tightDrift et tightDriftScore. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftTightDrift.lua`.*
