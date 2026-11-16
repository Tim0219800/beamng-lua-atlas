# `flowgraph_nodes_gameplay_missionDefaults`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/missionDefaults.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/missionDefaults")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Mission Defaults » (catégorie provider). Fournit des valeurs par défaut communes aux missions : markerInactive (couleur RGBA orange clair {232,132,52}/255), markerActive (couleur RGBA vert clair {156,229,61}/255, pour les marqueurs 3D du nœud Parking Markers) et fadeTransitionTime (0.75 s). Les valeurs sont posées une seule fois au démarrage de l'exécution.

## Remarques

- Les descriptions des pins disent « Inactive » pour les deux couleurs (copier-coller dans le code), markerActive est bien la couleur verte.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Écrit les valeurs des trois pins de sortie au démarrage du graphe. | 23 |
| `C:init()` | Désactive clearOutPinsOnStart pour que les sorties gardent leurs valeurs. | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/missionDefaults.lua`.*
