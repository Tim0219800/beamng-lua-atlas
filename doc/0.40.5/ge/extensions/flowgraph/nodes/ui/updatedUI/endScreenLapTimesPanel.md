# `flowgraph_nodes_ui_updatedUI_endScreenLapTimesPanel`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenLapTimesPanel.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenLapTimesPanel")` (fichier sous extensions/ mais pas une extension classique)

Nœud « EndScreen Lap Times » (repeat_instant, couleur ui). Affiche dans l'écran de fin les temps au tour d'un véhicule. Entrées : flow, race (table de données de course contenant states[vehId]), vehId (number, véhicule ; par défaut le véhicule du joueur 0). Sortie : flow (chainFlow).

## Remarques

- Si vehId est donné mais ne correspond à aucun objet, ou si race.states n'a pas d'entrée pour ce véhicule, addLaptimesForVehicle reçoit nil.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Retrouve le véhicule (scenetree.findObjectById(vehId) ou getPlayerVehicle(0)) puis, si race est fourni, ajoute les tours de race.states[veh:getID()] via modules.ui:addLaptimesForVehicle. | 24 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenLapTimesPanel.lua`.*
