# `flowgraph_nodes_gameplay_race_raceDisqualify`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceDisqualify.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceDisqualify")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Disqualify » (catégorie repeat_instant, tag scenario). Disqualifie un véhicule d'une course en appelant raceData:abortRace(vehId). Entrées : raceData et vehId.

## Remarques

- work() n'a aucune garde : une pin raceData vide provoque une erreur Lua.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 22 |
| `C:work()` | Appelle abortRace(vehId) sur la course reçue. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceDisqualify.lua`.*
