# `flowgraph_nodes_gameplay_drift_driftVeh`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftVeh.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/driftVeh")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Drift Veh » (catégorie repeat_instant, drift). Définit le véhicule de référence du module drift ; sans id précisé, le véhicule joueur est utilisé. Entrées : setVehId (impulsion) et vehId. Sortie : vehId courant (gameplay_drift_drift.getVehId()).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Sur impulsion setVehId appelle gameplay_drift_drift.setVehId(vehId) ; écrit toujours l'id courant en sortie. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftVeh.lua`.*
