# `flowgraph_nodes_gameplay_drift_driftReset`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftReset.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/driftReset")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Reset Drift » (catégorie repeat_instant, drift). Remet à zéro scores et systèmes : gameplay_drift_general.reset() puis mgr.modules.drift:resetModule(). Aucun pin déclaré.

## Remarques

- Catégorie repeat_instant sans pin : les deux appels sont refaits à chaque frame tant que le nœud est atteint.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle gameplay_drift_general.reset() et resetModule() du module drift. | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftReset.lua`.*
