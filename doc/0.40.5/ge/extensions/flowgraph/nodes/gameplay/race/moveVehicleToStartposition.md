# `flowgraph_nodes_gameplay_race_moveVehicleToStartposition`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua` · VM : Game Engine (GE) · 86 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Move Veh to Start Position » (catégorie repeat_instant, tags scenario et race). Déplace (et répare par défaut) un véhicule sur une position de départ d'un pathData. Choix de la position : pin id si fournie, sinon selon reverse/rolling parmi defaultStartPosition, reverseStartPosition, rollingStartPosition, rollingReverseStartPosition ; la pin name, si renseignée, prend le dessus (findStartPositionByName). Entrées : vehId, name, lowPrecision, pathData, id, reverse, rolling, repair. Sorties : pos (vec3), rot (quat), exists (bool).

## Remarques

- Si la position est introuvable, un avertissement est loggé (mgr:logEvent) et exists reste faux.
- Dans le code, la pin repair contient la faute « hidde = true » : elle n'est donc pas cachée.
- L'ancienne pin vehID est redirigée vers vehId (legacyPins).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Oublie le chemin mémorisé. | 40 |
| `C:init(mgr, ...)` | Initialise self.path et désactive clearOutPinsOnStart. | 35 |
| `C:work(args)` | Choisit la position de départ, appelle sp:moveResetVehicleTo(vehId, lowPrecision, repair) et écrit pos/rot en sortie. | 44 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua`.*
