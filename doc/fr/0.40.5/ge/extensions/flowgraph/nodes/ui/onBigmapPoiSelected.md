# `flowgraph_nodes_ui_onBigmapPoiSelected`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/onBigmapPoiSelected")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Bigmap Poi » (catégorie repeat_instant) : détecte la sélection d'un point d'intérêt sur la grande carte. Sorties : « selected » et « deselected » (impulsions), « poiId » (string), « navigated » et « denavigated » (impulsions), « pos » (vec3 navigué). Alimenté par les hooks onPoiSelectedFromBigmap et onSetBigmapNavFocus.

## Remarques

- Les impulsions durent une frame : work() les remet à false puis applique les drapeaux reçus.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise les drapeaux et la position. | 26 |
| `C:onPoiSelectedFromBigmap(poiId)` | Hook : POI sélectionné (poiId) ou nil si désélectionné. | 45 |
| `C:onSetBigmapNavFocus(pos)` | Hook : navigation vers pos, ou nil si annulée. | 54 |
| `C:work(args)` | Remet les impulsions à false, applique les drapeaux enregistrés par les hooks puis les vide et écrit poiId et pos. | 31 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua`.*
