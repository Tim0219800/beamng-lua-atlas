# `flowgraph_nodes_gameplay_dragRace_dragTimes`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua` · VM : Game Engine (GE) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/dragTimes")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Drag Race Times » (catégorie repeat_instant). Donne en temps réel les chronos d'un véhicule (pin vehId) depuis gameplay_drag_dragBridge.getTimers. postInit crée dynamiquement, pour chaque chrono (reactionTime, dial, time_60, time_330, time_1_8, time_1000, time_1_4, velAt_1_8, velAt_1_4), un pin de sortie number et un pin flow_<id> (impulsion quand le chrono est enregistré). Sortie fixe : timer.

## Remarques

- Les distances des chronos sont en mètres (60 ft = 18.288, 1/4 mile = 402.336).
- Le pin « timer » est déclaré dans pinSchema, mais seuls les chronos du bridge ayant isSet vrai et type différent de 'timer' alimentent les pins flow_/valeur.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide. | 42 |
| `C:postInit()` | Crée les pins flow_<id> et number <id> pour chaque chrono. | 34 |
| `C:updateInfos()` | Récupère les chronos du véhicule via le bridge ; signale une erreur de nœud si vehId est absent ou inconnu. | 45 |
| `C:work()` | Appelle updateInfos et recopie les chronos définis vers les pins. | 70 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua`.*
