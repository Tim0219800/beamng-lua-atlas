# `flowgraph_nodes_gameplay_drift_setDriftBounds`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftBounds.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/setDriftBounds")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Drift Bounds » (catégorie repeat_instant, drift). Utilise un fichier de sites (pin sitesPath) pour créer les limites de la mission de drift via gameplay_drift_bounds.setBounds.

## Remarques

- Le chemin est résolu avec mgr:getRelativeAbsolutePath ; rien n'est fait s'il est invalide.
- Appelé à chaque frame tant que le nœud est atteint.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Résout le chemin du fichier de sites puis appelle gameplay_drift_bounds.setBounds(file). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftBounds.lua`.*
