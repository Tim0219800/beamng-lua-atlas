# `flowgraph_nodes_gameplay_race_raceNodeReached`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceNodeReached.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceNodeReached")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Pathnode Reached » (catégorie logic, tag scenario). Laisse passer le flux quand un véhicule atteint un pathnode de la course (events.pathnodeReached). Sorties fixes : flow et nodeName (nom du pathnode atteint). Le moddeur peut ajouter des pins de sortie string ou number : leur valeur est lue dans les customFields du pathnode (même nom et même type).

## Remarques

- Quand aucun pathnode n'est atteint, flow vaut false et nodeName et les pins personnalisées valent nil.
- work() indexe race.states[vehId] sans test : un véhicule absent de la course provoque une erreur.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Vide. | 41 |
| `C:init(mgr, ...)` | Active allowCustomOutPins et savePins, data.detailed = false. | 35 |
| `C:work(args)` | Lit les events du véhicule et remplit flow, nodeName et les pins personnalisées. | 45 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceNodeReached.lua`.*
