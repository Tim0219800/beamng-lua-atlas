# `flowgraph_nodes_gameplay_race_raceData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceData.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceData")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Data » (catégorie repeat_instant, tag scenario). Expose des données de course pour un véhicule (raceData.states[vehId]) : formattedTime (temps formaté via race:raceTime, calculé seulement si la pin est utilisée), recoveriesUsed, placement et isOnRoad (vrai tant que le véhicule est dans les limites du chemin IA ; un seul tick à faux est masqué).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Chaque frame : lit l'état du véhicule dans la course et remplit les quatre pins de sortie. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceData.lua`.*
