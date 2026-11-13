# `gameplay_missions_vehicleFilterResolver`

*Fichier : `lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua` · VM : Game Engine (GE) · 249 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_vehicleFilterResolver` : `extensions.load("gameplay_missions_vehicleFilterResolver")`, puis la globale `gameplay_missions_vehicleFilterResolver`

Transforme une configuration de filtre de véhicules de mission (filterData : liste blanche/noire, réglages de probabilité, ajouts et retraits manuels, maxVehicles) en liste plate de couples modèle/configuration. S'appuie sur util/configListGenerator pour obtenir les véhicules éligibles.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_vehicleFilterResolver.hasAnyConfiguration(filterData)` | Indique si filterData contient une contrainte réelle : liste blanche ou noire non vide, probabilitySettings, manualAdditions, manualRemovals ou maxVehicles > 0. | 172 |
| `gameplay_missions_vehicleFilterResolver.resolveFilteredConfigs(filterData)` | Résout filterData en liste {model, config, name}. Applique le filtre de base, les probabilitySettings (qui remplacent le résultat s'ils trouvent des véhicules), la limite maxVehicles, les retraits manuels (clés 'modèle/config') puis ajoute les ajouts manuels non déjà présents, sans doublon. allowAuxiliaryVehicles et allowLoadedTrailers contrôlent l'éligibilité. | 189 |

### Détail des paramètres

#### `gameplay_missions_vehicleFilterResolver.hasAnyConfiguration(filterData)`

Indique si filterData contient une contrainte réelle : liste blanche ou noire non vide, probabilitySettings, manualAdditions, manualRemovals ou maxVehicles > 0.

- `filterData` (*table|any*) : Données de filtre ; tout non-table donne false.
- **renvoie** : boolean true si le filtre contraint l'ensemble de véhicules.

#### `gameplay_missions_vehicleFilterResolver.resolveFilteredConfigs(filterData)`

Résout filterData en liste {model, config, name}. Applique le filtre de base, les probabilitySettings (qui remplacent le résultat s'ils trouvent des véhicules), la limite maxVehicles, les retraits manuels (clés 'modèle/config') puis ajoute les ajouts manuels non déjà présents, sans doublon. allowAuxiliaryVehicles et allowLoadedTrailers contrôlent l'éligibilité.

- `filterData` (*table|any*) : Champs lus : allowAuxiliaryVehicles, allowLoadedTrailers, baseFilter, probabilitySettings, maxVehicles, manualRemovals, manualAdditions.
- **renvoie** : table[] Liste de {model = string, config = string, name = string} (vide si filterData n'est pas une table).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua`.*
