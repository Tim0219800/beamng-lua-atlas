# `flowgraph_nodes_gameplay_drift_setDriftData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftData.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/setDriftData")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Drift Data » (catégorie repeat_instant). Charge les données de drift (par exemple les zones de cascade) depuis un fichier (pin driftDataFile) via gameplay_drift_saveLoad.loadDriftData.

## Remarques

- Chemin résolu avec mgr:getRelativeAbsolutePath ; ignoré s'il est invalide.
- Appelé à chaque frame tant que le nœud est atteint.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Résout le chemin puis appelle gameplay_drift_saveLoad.loadDriftData(file). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftData.lua`.*
