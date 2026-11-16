# `flowgraph_nodes_career_onMissionRunstateChanged`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/onMissionRunstateChanged")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Mission Start/Stop » (catégorie repeat_instant, couleur/icône ui). Détecte quand le joueur démarre (hook onMissionStartWithFade) ou arrête (onAnyMissionChanged avec l'état 'stopped') une mission. Sorties en impulsion : started et stopped.

## Remarques

- work() remet à faux seulement started ; stopped n'est jamais remis à faux explicitement après avoir été levé (probable oubli). Une sortie « abandoned » est commentée.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée la table de drapeaux. | 22 |
| `C:onAnyMissionChanged(newState, mission)` | Hook : lève stopped quand le nouvel état est 'stopped'. | 39 |
| `C:onMissionStartWithFade(data)` | Hook : lève started. | 35 |
| `C:work(args)` | Chaque frame : started à faux, applique puis efface les drapeaux. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua`.*
