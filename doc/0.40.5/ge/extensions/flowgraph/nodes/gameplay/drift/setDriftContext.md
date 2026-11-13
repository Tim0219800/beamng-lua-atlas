# `flowgraph_nodes_gameplay_drift_setDriftContext`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftContext.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/drift/setDriftContext")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Drift Context » (catégorie repeat_instant). Définit le contexte de drift, qui fixe un jeu de règles et d'affichage, via gameplay_drift_general.setContext. Pin d'entrée : driftContext (string ; l'aide du pin cite stopped, inChallenge, inFreeroam).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle gameplay_drift_general.setContext(driftContext). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftContext.lua`.*
