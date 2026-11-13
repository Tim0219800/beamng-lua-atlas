# `telemetry_trackers_career`

*Fichier : `lua/ge/extensions/telemetry/trackers/career.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_career` : `extensions.load("telemetry_trackers_career")`, puis la globale `telemetry_trackers_career`

Suiveur de télémétrie du mode carrière : mesure la durée pendant laquelle une carrière est jouée (activité « careerActive » avec l'état de la sauvegarde à l'ouverture : argent, beamXP, bons, nombre de véhicules, nouvelle sauvegarde, tutoriel) et enregistre les véhicules achetés (vehicleAddedToInventory) et vendus (vehicleSold). Il passe par telemetry_core.startActivity/endActivity/addEvent.

## Remarques

- Extension en déchargement manuel ; lors d'un rechargement Lua, onExtensionUnloaded ferme l'activité en cours (sinon elle n'aurait pas de durée).
- onBeforeVehicleSell ne fait rien si l'inventaire ne contient pas inventoryId.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_career.onBeforeVehicleSell(data)` | Hook appelé avant la vente d'un véhicule : enregistre modèle, nom et prix de vente. *(interne)* *(hook)* | 56 |
| `telemetry_trackers_career.onCareerActive(active, newSave)` | Hook appelé quand la carrière devient active ou inactive : démarre ou termine l'activité careerActive (avec les attributs du joueur au démarrage). *(interne)* *(hook)* | 24 |
| `telemetry_trackers_career.onExtensionLoaded()` | Hook appelé au chargement : passe l'extension en déchargement manuel. *(interne)* *(hook)* | 70 |
| `telemetry_trackers_career.onExtensionUnloaded()` | Hook appelé au déchargement : un rechargement Lua détruit les suiveurs sans onExit, donc l'activité carrière est fermée ici aussi. *(interne)* *(hook)* | 18 |
| `telemetry_trackers_career.onVehicleAddedToInventory(data)` | Hook appelé à l'ajout d'un véhicule à l'inventaire : enregistre modèle, nom et prix d'achat. *(interne)* *(hook)* | 42 |

### Détail des paramètres

#### `telemetry_trackers_career.onBeforeVehicleSell(data)`

Hook appelé avant la vente d'un véhicule : enregistre modèle, nom et prix de vente.

- `data` (*table*) : Contient inventoryId et price.

#### `telemetry_trackers_career.onCareerActive(active, newSave)`

Hook appelé quand la carrière devient active ou inactive : démarre ou termine l'activité careerActive (avec les attributs du joueur au démarrage).

- `active` (*boolean*) : true si la carrière démarre.
- `newSave` (*boolean*) : true si c'est une nouvelle sauvegarde.

#### `telemetry_trackers_career.onVehicleAddedToInventory(data)`

Hook appelé à l'ajout d'un véhicule à l'inventaire : enregistre modèle, nom et prix d'achat.

- `data` (*table*) : Contient vehicleInfo (model_key, Name) et purchaseData (prices).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/career.lua`.*
