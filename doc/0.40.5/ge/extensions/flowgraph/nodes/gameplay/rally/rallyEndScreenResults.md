# `flowgraph_nodes_gameplay_rally_rallyEndScreenResults`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyEndScreenResults.lua` · VM : Game Engine (GE) · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallyEndScreenResults")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally End Screen Results » (catégorie repeat_instant, couleur rally, icône ui). Ajoute à l'écran de fin de mission des panneaux de texte : la tentative formatée (change.formattedAttempt), le texte de fin de la mission (missionTypeData.endScreenText) et un texte supplémentaire (pin text, ex. résultat avec médaille), plus optionnellement les objectifs et les notes (includeObjectives, includeRatings via mgr.modules.ui). Titre : missionTypeData.outroTitleText, sinon 'ui.missions.results.title' ; il n'est affiché que sur le premier panneau. Entrées : flow, text (string ou table), change, includeObjectives, includeRatings. Sortie : flow.

## Remarques

- Le texte supplémentaire est ignoré s'il a la même clé de traduction que le texte de la mission.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame : recopie flow et ajoute les éléments UI (textPanel, objectifs, notes) au module ui du flowgraph. | 36 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyEndScreenResults.lua`.*
