# `career_modules_debug_vehicleSpawn`

*Fichier : `lua/ge/extensions/career/modules/debug/vehicleSpawn.lua` · VM : Game Engine (GE) · 131 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_vehicleSpawn` : `extensions.load("career_modules_debug_vehicleSpawn")`, puis la globale `career_modules_debug_vehicleSpawn`

Outil de debug « Vehicle Spawn » : ajoute un marqueur de point d'intérêt au parking 'debugParking' de west_coast_usa (facilities.sites.json) dont la fenêtre de détail propose de faire apparaître un véhicule ou une remorque 'loués' (sunburst/race_M, boxutility/loaded_200), éventuellement ajoutés à l'inventaire (owned = false). spawnVehicle enchaîne fondu au noir, spawn, initPartConditions, attente puis fondu retour via util_stepHandler.

## Exemple

```lua
career_modules_debug_vehicleSpawn.spawnVehicle('boxutility', 'loaded_200', true)
```

## Remarques

- Dépend de gameplay_sites_sitesManager.
- Le chemin /levels/west_coast_usa/facilities.sites.json est en dur : l'outil ne fonctionne que sur cette carte.
- buttonPressed appelle buttonOptions[i], table qui n'est jamais remplie dans ce fichier (les boutons passent par luaCallback).

**Dépendances (chargées avant) :** `gameplay_sites_sitesManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_vehicleSpawn.buttonPressed(i)` | Exécute buttonOptions[i]() ; cette table n'est jamais remplie dans le module. *(interne)* | 81 |
| `career_modules_debug_vehicleSpawn.drawDebugMenu()` | À la première frame charge les sites de west_coast_usa et récupère 'debugParking' ; dessine la fenêtre 'Vehicle Spawn' avec un bouton 'Spawn and rent a vehicle' (sunburst/race_M, ajouté à l'inventaire). *(interne)* | 30 |
| `career_modules_debug_vehicleSpawn.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook de la liste de POI : si le parking 'debugParking' est chargé, ajoute un élément 'debugVehicleSpawn' avec un marqueur de parking (path, pos, rot, scl). *(interne)* *(hook)* | 15 |
| `career_modules_debug_vehicleSpawn.onPoiDetailPromptOpening(elemData, promptData)` | Hook : si l'élément est 'debugVehicleSpawn', ajoute à promptData un bouton 'Open Debug Menu' qui affiche un dialogue (guihooks 'showConfirmationDialog') avec trois choix de spawn. *(interne)* *(hook)* | 85 |
| `career_modules_debug_vehicleSpawn.spawnVehicle(model, config, addToInventory)` | Fait apparaître un véhicule avec fondu au noir, initialise ses part conditions, attend la réponse du véhicule (ping) puis fait le fondu retour ; si addToInventory est vrai, l'ajoute à l'inventaire avec owned = false. | 48 |

### Détail des paramètres

#### `career_modules_debug_vehicleSpawn.buttonPressed(i)`

Exécute buttonOptions[i]() ; cette table n'est jamais remplie dans le module.

- `i` (*integer*) : Index du bouton.

#### `career_modules_debug_vehicleSpawn.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook de la liste de POI : si le parking 'debugParking' est chargé, ajoute un élément 'debugVehicleSpawn' avec un marqueur de parking (path, pos, rot, scl).

- `levelIdentifier` (*string*) : Identifiant du niveau.
- `elements` (*table[]*) : Liste de POI à compléter.

#### `career_modules_debug_vehicleSpawn.onPoiDetailPromptOpening(elemData, promptData)`

Hook : si l'élément est 'debugVehicleSpawn', ajoute à promptData un bouton 'Open Debug Menu' qui affiche un dialogue (guihooks 'showConfirmationDialog') avec trois choix de spawn.

- `elemData` (*table[]*) : Éléments POI concernés.
- `promptData` (*table[]*) : Liste de boutons du prompt à compléter.

#### `career_modules_debug_vehicleSpawn.spawnVehicle(model, config, addToInventory)`

Fait apparaître un véhicule avec fondu au noir, initialise ses part conditions, attend la réponse du véhicule (ping) puis fait le fondu retour ; si addToInventory est vrai, l'ajoute à l'inventaire avec owned = false.

- `model` (*string*) : Modèle JBeam (ex. 'sunburst').
- `config` (*string*) : Nom de configuration (ex. 'race_M').
- `addToInventory` (*boolean|nil*) : Ajoute le véhicule à l'inventaire (non possédé).

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string | 'Vehicle Spawn'. |
| `debugOrder` | number | Ordre de tri (12). |
| `dependencies` | string[] | {"gameplay_sites_sitesManager"}. |

**Évènements UI (guihooks.trigger) :** `showConfirmationDialog`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

**Charge les extensions :** `util_stepHandler`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/vehicleSpawn.lua`.*
