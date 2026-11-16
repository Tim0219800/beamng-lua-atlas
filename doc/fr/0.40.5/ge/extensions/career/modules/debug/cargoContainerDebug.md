# `career_modules_debug_cargoContainerDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua` · VM : Game Engine (GE) · 373 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_cargoContainerDebug` : `extensions.load("career_modules_debug_cargoContainerDebug")`, puis la globale `career_modules_debug_cargoContainerDebug`

Outil de debug « Vehicle > Cargo Containers ». Interroge tous les véhicules actifs (core_vehicleBridge.requestValue 'getCargoContainers'), affiche leurs conteneurs de cargaison (volume, densité, capacité, cluster de nœuds) et permet d'y envoyer volume/densité ou de les remplir à un débit réglable (flow rate). Peut être ouvert hors carrière.

## Exemple

```lua
extensions.load("career/modules/debug/cargoContainerDebug")
career_modules_debug_cargoContainerDebug.show()
```

## Remarques

- Débit de remplissage : volume += flowRate * maxRate * dt (litres), borné à [0, capacity].
- drawFlowRate peut pousser/retirer l'actionMap 'Refueling'.
- Faute de frappe probable : container.currenDensity (au lieu de currentDensity) est lu pour initialiser la densité, qui vaut donc toujours 1 par défaut.
- onInstabilityDetected est le même handler que onVehicleDestroyed.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_cargoContainerDebug.drawDebugMenu(dt)` | Dessine la fenêtre 'Cargo Container Debug' : bouton de rafraîchissement, flow rate, et pour chaque véhicule updateVehicle puis drawVehicle (supprime ceux qui n'existent plus). *(interne)* | 320 |
| `career_modules_debug_cargoContainerDebug.drawFlowRate(dt)` | Dessine les curseurs Flow Rate (0..1) et Max Fill Rate (L/s), la case d'actionMap 'Refueling', et applique le remplissage aux conteneurs marqués. *(interne)* | 279 |
| `career_modules_debug_cargoContainerDebug.drawVehicle(data)` | Dessine en ImGui le tableau d'un véhicule et de ses conteneurs avec champs de saisie volume/densité et case de remplissage au débit. *(interne)* | 101 |
| `career_modules_debug_cargoContainerDebug.getData()` | Demande à chaque véhicule actif la liste de ses conteneurs et remplit M.vehCargoData quand tous ont répondu (asynchrone). Renvoie une table vide si core_vehicleBridge est absent. | 19 |
| `career_modules_debug_cargoContainerDebug.onChangeFlowRate(factor)` | Hook (ex. action d'entrée) qui fixe le flow rate, borné à [0, 1]. *(hook)* | 315 |
| `career_modules_debug_cargoContainerDebug.onInstabilityDetected(id)` | Hook : même traitement que onVehicleDestroyed. *(interne)* *(hook)* | 364 |
| `career_modules_debug_cargoContainerDebug.onVehicleDestroyed(id)` | Hook : retire les données du véhicule détruit. *(interne)* *(hook)* | 364 |
| `career_modules_debug_cargoContainerDebug.onVehicleResetted(id)` | Hook : retire les données du véhicule réinitialisé et force un nouveau getData. *(interne)* *(hook)* | 357 |
| `career_modules_debug_cargoContainerDebug.show()` | Ouvre l'outil hors carrière : branche drawDebugMenu sur onUpdate (hookUpdate) et lance getData. | 351 |
| `career_modules_debug_cargoContainerDebug.updateVehicle(data)` | Rafraîchit les données d'un véhicule : cluster de nœuds (si la génération a changé), position du véhicule et de chaque conteneur. Renvoie false si le véhicule n'existe plus. | 75 |

### Détail des paramètres

#### `career_modules_debug_cargoContainerDebug.drawDebugMenu(dt)`

Dessine la fenêtre 'Cargo Container Debug' : bouton de rafraîchissement, flow rate, et pour chaque véhicule updateVehicle puis drawVehicle (supprime ceux qui n'existent plus).

- `dt` (*number*) : Delta de temps.

#### `career_modules_debug_cargoContainerDebug.drawFlowRate(dt)`

Dessine les curseurs Flow Rate (0..1) et Max Fill Rate (L/s), la case d'actionMap 'Refueling', et applique le remplissage aux conteneurs marqués.

- `dt` (*number*) : Delta de temps en secondes.

#### `career_modules_debug_cargoContainerDebug.drawVehicle(data)`

Dessine en ImGui le tableau d'un véhicule et de ses conteneurs avec champs de saisie volume/densité et case de remplissage au débit.

- `data` (*table*) : Entrée de vehCargoData.

#### `career_modules_debug_cargoContainerDebug.getData()`

Demande à chaque véhicule actif la liste de ses conteneurs et remplit M.vehCargoData quand tous ont répondu (asynchrone). Renvoie une table vide si core_vehicleBridge est absent.

- **renvoie** : table|nil {} si core_vehicleBridge est absent, sinon rien.

#### `career_modules_debug_cargoContainerDebug.onChangeFlowRate(factor)`

Hook (ex. action d'entrée) qui fixe le flow rate, borné à [0, 1].

- `factor` (*number*) : Nouveau facteur de débit.

#### `career_modules_debug_cargoContainerDebug.onInstabilityDetected(id)`

Hook : même traitement que onVehicleDestroyed.

- `id` (*integer*) : Id du véhicule.

#### `career_modules_debug_cargoContainerDebug.onVehicleDestroyed(id)`

Hook : retire les données du véhicule détruit.

- `id` (*integer*) : Id du véhicule.

#### `career_modules_debug_cargoContainerDebug.onVehicleResetted(id)`

Hook : retire les données du véhicule réinitialisé et force un nouveau getData.

- `id` (*integer*) : Id du véhicule.

#### `career_modules_debug_cargoContainerDebug.updateVehicle(data)`

Rafraîchit les données d'un véhicule : cluster de nœuds (si la génération a changé), position du véhicule et de chaque conteneur. Renvoie false si le véhicule n'existe plus.

- `data` (*table*) : Entrée de vehCargoData.
- **renvoie** : boolean false si le véhicule est introuvable.

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Vehicle > Cargo Containers'. |
| `debugOrder` | number | Ordre de tri dans la fenêtre de debug (11). |
| `vehCargoData` | table[] | Liste, triée par vehId, des véhicules avec leurs conteneurs : {vehId, name, containers, vehPos, clusterGeneration…}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua`.*
