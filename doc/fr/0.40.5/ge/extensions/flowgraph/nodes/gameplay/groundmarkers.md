# `flowgraph_nodes_gameplay_groundmarkers`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua` · VM : Game Engine (GE) · 139 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/groundmarkers")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Groundmarkers » (catégorie repeat_instant, dépend de core_groundMarkers). Crée des marqueurs au sol qui montrent le chemin vers une cible. Pins d'entrée : clear (impulsion de reset), target (nom de waypoint, position vec3 ou liste), color (déprécié), cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, threshold (seuil de changement de cible, 0.1). Appelle core_groundMarkers.setPath quand la cible change ; resetAll à l'arrêt.

## Remarques

- data.fadeStart = 100 et data.fadeEnd = 150 sont définis mais non utilisés dans ce fichier.
- Anciens pins pos, waypoint -> target et reset -> clear (legacyPins).

**Dépendances (chargées avant) :** `core_groundMarkers`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Oublie la dernière cible. | 134 |
| `C:_executionStopped()` | Appelle core_groundMarkers.resetAll(). | 128 |
| `C:hasNewTarget()` | Compare la cible du pin à la précédente (types, longueur, valeurs numériques avec le seuil threshold, chaînes). | 47 |
| `C:init(mgr, ...)` | Définit data.fadeStart et data.fadeEnd. | 34 |
| `C:work(args)` | Gère clear (resetAll) puis, si flow et target sont présents et la cible a changé, appelle core_groundMarkers.setPath(target, options). | 98 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua`.*
