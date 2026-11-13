# `flowgraph_nodes_activity_activityResetPrefabs`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/activityResetPrefabs.lua` · VM : Game Engine (GE) · 20 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/activityResetPrefabs")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Activity Reset Prefab » (catégorie once_p_duration, tag activity). Remet à leur position d'origine les véhicules contenus dans tous les prefabs chargés par l'activité associée, via gameplay_missions_missionManager.resetActivityPrefabVehicles. Aucun pin personnalisé.

## Remarques

- Passe self.mgr.activity sans vérification : sans activité associée, la valeur est nil.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle resetActivityPrefabVehicles pour l'activité du graphe. | 16 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/activityResetPrefabs.lua`.*
