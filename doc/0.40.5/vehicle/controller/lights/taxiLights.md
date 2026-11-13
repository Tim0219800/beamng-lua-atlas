# `controller_lights_taxiLights`

*Fichier : `lua/vehicle/controller/lights/taxiLights.lua` · VM : Véhicule · 85 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `lights/taxiLights` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire pour l'enseigne de taxi (type "auxiliary"). Il mémorise un état parmi available, occupied, reserved, offDuty (défaut), driverDistress et expose chaque état comme une valeur electrics nommée "<nomContrôleur>_<état>" valant 1 pour l'état actif et 0 pour les autres.

## Remarques

- Aucune clé jbeam n'est lue. Les noms electrics dépendent du nom du contrôleur (M.name).
- setTaxiState ne valide pas l'état passé : une valeur inconnue éteint toutes les sorties.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_lights_taxiLights.getState()` | Renvoie l'état pour la sauvegarde. | 57 |
| `controller_lights_taxiLights.getTaxiState()` | Renvoie l'état courant. | 35 |
| `controller_lights_taxiLights.init(jbeamData)` | Initialise l'état offDuty et les noms d'electrics. *(interne)* | 43 |
| `controller_lights_taxiLights.reset(jbeamData)` | Remet l'état offDuty. *(interne)* | 39 |
| `controller_lights_taxiLights.setState(data)` | Restaure l'état renvoyé par getState (si valide). | 62 |
| `controller_lights_taxiLights.setTaxiState(state)` | Change l'état de l'enseigne. | 31 |
| `controller_lights_taxiLights.updateGFX(dt)` | Écrit les valeurs electrics 0/1 de chaque état. *(interne)* | 24 |

### Détail des paramètres

#### `controller_lights_taxiLights.getState()`

Renvoie l'état pour la sauvegarde.

- **renvoie** : table Table d'état (réutilisée).

#### `controller_lights_taxiLights.getTaxiState()`

Renvoie l'état courant.

- **renvoie** : string État de l'enseigne.

#### `controller_lights_taxiLights.init(jbeamData)`

Initialise l'état offDuty et les noms d'electrics.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_lights_taxiLights.reset(jbeamData)`

Remet l'état offDuty.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_lights_taxiLights.setState(data)`

Restaure l'état renvoyé par getState (si valide).

- `data` (*table|nil*) : Table d'état.

#### `controller_lights_taxiLights.setTaxiState(state)`

Change l'état de l'enseigne.

- `state` (*string*) : "available", "occupied", "reserved", "offDuty" ou "driverDistress".

#### `controller_lights_taxiLights.updateGFX(dt)`

Écrit les valeurs electrics 0/1 de chaque état.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/lights/taxiLights.lua`.*
