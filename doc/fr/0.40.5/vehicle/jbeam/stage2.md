# `v`

*Fichier : `lua/vehicle/jbeam/stage2.lua` · VM : Véhicule · 617 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `v`

Deuxième étape du chargement d'un véhicule, côté VM véhicule : prend les données jbeam déjà assemblées par le jeu (stage 1, dans la VM du jeu) et les « pousse » dans la physique C++ en appelant obj:setNode, obj:setBeam, obj:setWheel, obj:addRail, obj:addSlidenode, obj:setTorsionbar, obj:setTriangle, obj:setReferenceNodes puis obj:finishLoading. main.lua le charge en globale `v` (v = require('jbeam/stage2')) : après loadVehicleStage2, `v.data` contient les données du véhicule (nodes, beams, wheels, hydros, powertrain, refNodes, input, information…), et `v.config` la configuration (pièces, peintures, additionalVehicleData…). C'est donc la source de toutes les lectures de jbeam par les autres modules.

## Exemple

```lua
-- dans un module du véhicule (après le spawn) :
for _, node in pairs(v.data.nodes) do print(node.name, node.cid, node.pos.x) end
local wheelLock = v.data.input and v.data.input.steeringWheelLock
local partConfig = v.config.parts
```

## Remarques

- Ordre d'envoi à la physique (pushToPhysics) : obj:requestReset(RESET_PHYSICS), puis noeuds, poutres, roues, rails, slidenodes, torsionhydros, torsionbars, triangles de collision, noeuds de référence, enfin obj:finishLoading(). Chaque élément reçoit un champ `cid` (identifiant côté C++) assigné par les setXxx.
- Types de poutres (valeurs définies en C, ne pas modifier) : normal 0, anisotropic 1, bounded 2, pressured 3, lbeam 4, broken 5, support 7. Types de noeud : normal 0, fixed 1, noncollidable 2.
- Défauts utiles : beamStrength = vehicle.options.beamStrength ou math.huge (incassable) ; une beamStrength sous forme de chaîne est acceptée si elle représente un nombre. Un triangle dégénéré est signalé par un log d'erreur. Si les noeuds de référence (refNodes[0]) manquent, des noeuds fictifs (ref 0, back 1, left 2, up 0) sont installés avec un log d'erreur.
- loadVehicleStage2 marque vdata.format = 'parsed', publie M.data, M.config et, pour compatibilité, M.vehicleDirectory = M.data.vehicleDirectory, mesure le temps de chargement (log 'Vehicle loading took: … ms').
- Ce module ne s'exécute qu'une fois par spawn (appelé par main.lua:init). Les modifications de v.data après coup ne sont pas renvoyées à la physique C++ : elles n'affectent que les modules Lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `v.loadVehicleStage2(vdataStage1)` | Envoie les données jbeam à la physique (noeuds, poutres, roues, rails, slidenodes, torsions, triangles, noeuds de référence) puis publie v.data et v.config. Appelée une fois par main.lua:init avec les données de spawn décodées. *(interne)* | 590 |

### Détail des paramètres

#### `v.loadVehicleStage2(vdataStage1)`

Envoie les données jbeam à la physique (noeuds, poutres, roues, rails, slidenodes, torsions, triangles, noeuds de référence) puis publie v.data et v.config. Appelée une fois par main.lua:init avec les données de spawn décodées.

- `vdataStage1` (*table*) : Table de spawn {vdata = données jbeam assemblées, config = configuration du véhicule}.
- **renvoie** : table|nil vdata (les données du véhicule) en cas de succès ; nil si vdata n'est pas une table.

## Appels vers le moteur (C++)

- `obj:` `addRail`, `addRailLink`, `addSlidenode`, `addWheelNode`, `finishLoading`, `getWheel`, `requestReset`, `setBeam`, `setBeamAnisotropic`, `setBeamBounded`, `setBeamDeformationTriggerRatio`, `setBeamLbeam`, `setBeamPressured`, `setNode`, `setNodePair2WheelId`, `setReferenceNodes`, `setTorsionbar`, `setTriangle`, `setWheel`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/jbeam/stage2.lua`.*
