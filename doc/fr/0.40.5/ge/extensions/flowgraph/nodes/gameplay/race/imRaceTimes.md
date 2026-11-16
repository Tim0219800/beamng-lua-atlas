# `flowgraph_nodes_gameplay_race_imRaceTimes`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/imRaceTimes.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/imRaceTimes")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Race Times » (catégorie repeat_instant, tag scenario). Dessine en imgui les temps de course d'un véhicule en appelant race:inDrawTimes(vehId, im, detailed) sur l'objet raceData reçu. Entrées : raceData (table 'raceData') et vehId (number). Si la fonction renvoie vrai (clic dans l'UI), l'option data.detailed est basculée.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Vide : aucun dessin dans le corps du nœud. | 26 |
| `C:init(mgr, ...)` | Initialise data.detailed à false. | 22 |
| `C:work(args)` | Si raceData est présent, dessine les temps du véhicule et bascule le mode détaillé quand inDrawTimes renvoie vrai. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/imRaceTimes.lua`.*
