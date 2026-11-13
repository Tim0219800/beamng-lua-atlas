# `flowgraph_nodes_vehicle_spawnVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua` · VM : Game Engine (GE) · 244 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/spawnVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Spawn Vehicle » : crée un véhicule (`core_vehicles.spawnNewVehicle` ou `replaceVehicle` si `replacePlayer`), attend qu'il soit prêt puis expose son id. Pins d'entrée : `flow`, `reset` (impulsion, supprime et réinitialise), `model` (défaut 'pickup'), `config` (string ou table, défaut 'vehicles/pickup/d15_4wd_A.pc'), `pos` (vec3), `rot` (quat), et cachés `licenseText`, `color` (couleur ou nom de peinture), `randomColor`, `name`, `replacePlayer`, `keepCamera`, `keepVehicle`, `keepOnReset`. Sorties : `flow` (une fois chargé), `loaded` (impulsion), `vehId`. Machine à états `state` : 1 spawn, 2 attente `ready`, 3 sortie, 4 maintien, 5 échec.

## Remarques

- Échec de spawn : réessaie chaque seconde pendant 10 s, puis log E, passe en état 5 et, si le flowgraph est lié à une activité, abandonne la mission avec fondu.
- La rotation fournie est multipliée par `quat(0,0,1,0)` (180°).
- Couleur aléatoire désactivée pour les configs de type Police ou Service.
- `autoEnterVehicle` = non `keepCamera`.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise l'état et les sorties au démarrage. | 93 |
| `C:_executionStopped()` | Réinitialise l'état et la référence au véhicule. | 85 |
| `C:drawMiddle(builder, style)` | Affichage central du nœud, vide. | 237 |
| `C:getCmd(action)` | Construit une commande Lua pour appeler `buttonPushed(action)` sur ce nœud depuis une autre VM (déduit du code). | 233 |
| `C:init()` | Constructeur ; état 1, sortie `flow` false. | 55 |
| `C:onSpawnFailed()` | Appelé quand le spawn échoue : programme un nouvel essai (1 s) ou abandonne après 10 s. | 62 |
| `C:postInit()` | Marque le pin `color` avec `colorSetup = {vehicleColor = true}`. | 79 |
| `C:resetSpawnRetry()` | Remet à zéro le minuteur et le temps cumulé d'échecs de spawn. | 50 |
| `C:work()` | Machine à états du spawn (voir module) ; gère aussi le `reset`. | 103 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua`.*
