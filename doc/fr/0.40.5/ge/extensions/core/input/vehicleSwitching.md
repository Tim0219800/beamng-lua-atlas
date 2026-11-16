# `core_input_vehicleSwitching`

*Fichier : `lua/ge/extensions/core/input/vehicleSwitching.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_input_vehicleSwitching` : `extensions.load("core_input_vehicleSwitching")`, puis la globale `core_input_vehicleSwitching`

Extension GE `core_input_vehicleSwitching` : implémente le passage au véhicule suivant/précédent (touches de changement de véhicule). Il peut suivre un ordre personnalisé (liste d'ids définie par setVehicleOrder) ou parcourir tous les véhicules actifs utilisables, en ignorant le 'unicycle', les véhicules playerUsable == false et ceux que gameplay_seatOccupants refuse. En multijoueur, la demande est déléguée à multiplayer_vehicleSync.

## Exemple

```lua
-- passer au véhicule suivant pour le joueur 0
core_input_vehicleSwitching.switchCycleVehicle(0, 1)
-- imposer un ordre
core_input_vehicleSwitching.setVehicleOrder({idA, idB, idC})
```

## Remarques

- dir : +1 = suivant, -1 = précédent (le calcul utilise dir * step avec modulo).
- Si un ordre personnalisé est défini mais que le joueur n'est pas dans la liste (et aucun lastIndex), ou qu'aucune cible valide n'existe, l'ordre est supprimé (vehicleOrder = nil) et on retombe sur le comportement par défaut. L'ordre n'est donc valable qu'une fois.
- Hooks émis lors d'un changement : trackNewVeh, onVehicleSwitchPerformendByUser (faute de frappe 'Performend' dans le nom du hook, à utiliser tel quel), onVehicleCycleSwitchPerformedByUser(dir, player, vehId).
- Incohérences : lastIndex vaut toujours -1 et n'est jamais modifié ; dans applySwitchCycleVehicle, be est utilisé (be:getPlayerVehicleID) avant le test `if be`.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_input_vehicleSwitching.applySwitchCycleVehicle(player, dir)` | Effectue réellement le changement : cherche la cible (ordre personnalisé puis ordre par défaut), appelle be:enterVehicle et émet les hooks. | 50 |
| `core_input_vehicleSwitching.setVehicleOrder(order)` | Définit l'ordre personnalisé de parcours des véhicules (liste d'ids). nil pour revenir à l'ordre par défaut. | 8 |
| `core_input_vehicleSwitching.switchCycleVehicle(player, dir)` | Point d'entrée : change de véhicule pour le joueur. En multijoueur (multiplayer_vehicleSync présent), envoie requestSwitchCycleVehicle ; sinon appelle applySwitchCycleVehicle. | 89 |

### Détail des paramètres

#### `core_input_vehicleSwitching.applySwitchCycleVehicle(player, dir)`

Effectue réellement le changement : cherche la cible (ordre personnalisé puis ordre par défaut), appelle be:enterVehicle et émet les hooks.

- `player` (*integer|nil*) : Indice du joueur, défaut 0 ; -1 = ignoré.
- `dir` (*integer*) : +1 suivant, -1 précédent.

#### `core_input_vehicleSwitching.setVehicleOrder(order)`

Définit l'ordre personnalisé de parcours des véhicules (liste d'ids). nil pour revenir à l'ordre par défaut.

- `order` (*integer[]|nil*) : Ids de véhicules.

#### `core_input_vehicleSwitching.switchCycleVehicle(player, dir)`

Point d'entrée : change de véhicule pour le joueur. En multijoueur (multiplayer_vehicleSync présent), envoie requestSwitchCycleVehicle ; sinon appelle applySwitchCycleVehicle.

- `player` (*integer|nil*) : Indice du joueur, défaut 0 ; -1 = ignoré.
- `dir` (*integer*) : +1 suivant, -1 précédent.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleCycleSwitchPerformedByUser`
- `onVehicleSwitchPerformendByUser` — écouté par 1 module(s)
- `trackNewVeh`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`, `getObject`, `getObjectCount`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/input/vehicleSwitching.lua`.*
