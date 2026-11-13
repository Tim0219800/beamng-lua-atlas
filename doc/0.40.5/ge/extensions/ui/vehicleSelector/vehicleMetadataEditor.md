# `ui_vehicleSelector_vehicleMetadataEditor`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/vehicleMetadataEditor.lua` · VM : Game Engine (GE) · 14 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_vehicleMetadataEditor` : `extensions.load("ui_vehicleSelector_vehicleMetadataEditor")`, puis la globale `ui_vehicleSelector_vehicleMetadataEditor`

Ébauche d'éditeur de métadonnées de véhicule pour le sélecteur. Le module est quasi vide : sa seule fonction renvoie des valeurs fixes. Sa référence dans les dépendances de ui_vehicleSelector_general est commentée.

## Remarques

- getVehicleMetadataDetails ignore son paramètre data et renvoie toujours {name = 'Default Vehicle Name', description = 'Default vehicle description', type = 'Car'} : c'est un espace réservé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_vehicleMetadataEditor.getVehicleMetadataDetails(data)` | Renvoie des métadonnées factices de véhicule (nom, description, type), quel que soit l'argument. | 4 |

### Détail des paramètres

#### `ui_vehicleSelector_vehicleMetadataEditor.getVehicleMetadataDetails(data)`

Renvoie des métadonnées factices de véhicule (nom, description, type), quel que soit l'argument.

- `data` (*any*) : Ignoré.
- **renvoie** : table {name, description, type} avec des valeurs par défaut fixes.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/vehicleMetadataEditor.lua`.*
