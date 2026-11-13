# `flowgraph_nodes_gameplay_race_fileRace`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua` · VM : Game Engine (GE) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/fileRace")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « File Race » (tag scenario, pas de catégorie définie). Gère une course complète à partir d'un pathData (nœud File Path) : crée un objet gameplay/race/race au premier flux, lui donne le chemin, le départ lancé (rolling), le nombre de tours (seulement si le chemin est fermé, sinon 1), le mode IA automatique, l'app hotlapping, le debug draw et le son des waypoints, puis appelle race:onUpdate(dtSim) à chaque frame (sauf si la pin idle a du flux). Le nombre de véhicules est réglable dans l'éditeur (pins vehId_1…vehId_N). Sorties : flow, active, complete, vehicleChanged, raceData, aiPath (navgraphPath pour Follow Waypoints) et time (durée totale à la fin, pour vehId_1).

## Remarques

- Options data : useHotlappingApp (true), useDebugDraw (false), useWaypointAudio (true).
- Seuls les véhicules existants (getObjectByID) sont passés à race:setVehicleIds.
- Les pins complete, active et time ne reflètent que l'état du véhicule vehId_1.
- Pins hasSecVeh/changeVeh/primVehId/secVehId : permettent de basculer une seule fois sur un véhicule secondaire via race:changeRaceVehicle.
- Les anciennes pins vehID, vehId et vehID_1 sont redirigées vers vehId_1 (legacyPins).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet à zéro race, started et vehicleChanged. | 103 |
| `C:_executionStopped()` | Appelle race:stopRace() si une course existe, puis l'oublie. | 109 |
| `C:_onDeserialized(res)` | Relit count (défaut 1) et recrée les pins. | 99 |
| `C:_onSerialize(res)` | Sauvegarde count dans la table de sérialisation. | 95 |
| `C:drawCustomProperties()` | Champ éditeur « Vehicle Count » qui ajoute ou retire des pins vehId_i. | 59 |
| `C:drawMiddle(builder, style)` | Affiche « Started » ou « Stopped » dans le nœud. | 115 |
| `C:init(mgr, ...)` | Initialise l'état (started, race, count = 1) et les options data. | 45 |
| `C:postInit()` | Crée les pins vehId_i selon self.count. | 55 |
| `C:updatePins(old, new)` | Passe le nombre de pins vehId_i de old à new : supprime les pins en trop (et leurs liens) ou en crée de nouvelles. | 77 |
| `C:work(args)` | Gère reset, démarre la course au premier flux, la met à jour chaque frame et renseigne les pins de sortie. | 120 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua`.*
