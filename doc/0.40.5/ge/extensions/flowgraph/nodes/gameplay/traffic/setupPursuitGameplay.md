# `flowgraph_nodes_gameplay_traffic_setupPursuitGameplay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupPursuitGameplay.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/setupPursuitGameplay")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Setup Pursuit Gameplay » (once_instant). Configure un gameplay de poursuite via gameplay_police.setupPursuitGameplay(suspectId, policeIds, {pursuitMode, preventAutoStart}). suspectId par défaut : véhicule joueur ; mainPoliceId (si fourni) remplace la liste policeIds. Sorties success/fail. En cas de succès, marque suspect et polices ignoreForceTeleport pour que le « scatter » du trafic ne les téléporte pas.

## Remarques

- Si policeIds est nil (pas de pin relié) et succès, `ipairs(policeIds)` provoque une erreur Lua.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Lance le setup de poursuite, écrit success/fail et positionne ignoreForceTeleport sur les véhicules concernés. | 25 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupPursuitGameplay.lua`.*
