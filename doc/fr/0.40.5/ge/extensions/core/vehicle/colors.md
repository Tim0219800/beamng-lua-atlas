# `core_vehicle_colors`

*Fichier : `lua/ge/extensions/core/vehicle/colors.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_colors` : `extensions.load("core_vehicle_colors")`, puis la globale `core_vehicle_colors`

Extension GE `core_vehicle_colors` : change en direct la couleur ou la peinture d'un des 3 emplacements de peinture du véhicule configuré (core_vehicle_configTarget), met à jour les meshes via core_vehicle_manager.liveUpdateVehicleColors, puis enregistre les peintures dans la config via core_vehicle_partmgmt.setConfigPaints (sans respawn). Utilisé par l'UI de configuration du véhicule.

## Exemple

```lua
-- Peinture complète sur l'emplacement 1 du véhicule du joueur
core_vehicle_colors.setVehiclePaint(1, createVehiclePaint({x=0.8,y=0.1,z=0.1,w=1}, {0.5,0.5,0.8,0.1}))
-- Couleur depuis une chaîne 'r g b a metallic roughness clearcoat clearcoatRoughness' (alpha de 0 à 2)
core_vehicle_colors.setVehicleColor(0, '0.8 0.1 0.1 2 0.5 0.5 0.8 0.1')
```

## Remarques

- setVehicleColor prend un index JS (base 0) alors que setVehiclePaint prend un index Lua (base 1).
- colorStringToColorTable fait planter la fonction (erreur d'arithmétique sur nil) si la chaîne contient moins de 4 nombres.
- Le 4e composant de la chaîne couleur va de 0 à 2 ; il est ramené à 0..1 par colorStringToColorTable puis remultiplié par 2 dans updateVehicleDataPaint avant createVehiclePaint.

**Dépendances (chargées avant) :** `core_vehicle_configTarget`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_colors.colorStringToColorTable(colorString)` | Convertit une chaîne 'r g b a [...]' (nombres séparés par des espaces) en tableau de nombres ; le 4e élément (0..2) est ramené à 0..1 (multiplié par 0.5 et borné). | 9 |
| `core_vehicle_colors.onVehicleSpawned(vehId)` | Hook : un véhicule apparaît. Recopie ses 3 couleurs réelles (veh.color, colorPalette0, colorPalette1 + données métalliques) dans vehicleData.config.paints, arrondies à 4 décimales, pour que la config reflète la peinture réelle. *(interne)* *(hook)* | 73 |
| `core_vehicle_colors.setVehicleColor(index, colorString, objID)` | Définit la couleur d'un emplacement de peinture depuis une chaîne (8 nombres : r g b a puis 4 valeurs métalliques), met à jour le véhicule en direct et enregistre toutes les peintures dans la config. | 36 |
| `core_vehicle_colors.setVehiclePaint(index, paint, objID)` | Applique une table de peinture à un emplacement, met à jour le véhicule en direct et enregistre les peintures dans la config. | 53 |

### Détail des paramètres

#### `core_vehicle_colors.colorStringToColorTable(colorString)`

Convertit une chaîne 'r g b a [...]' (nombres séparés par des espaces) en tableau de nombres ; le 4e élément (0..2) est ramené à 0..1 (multiplié par 0.5 et borné).

- `colorString` (*string|nil*) : ex. '0.5 0.2 0.1 1.2'
- **renvoie** : number[]|nil tableau de nombres ; nil si colorString est nil

#### `core_vehicle_colors.onVehicleSpawned(vehId)`

Hook : un véhicule apparaît. Recopie ses 3 couleurs réelles (veh.color, colorPalette0, colorPalette1 + données métalliques) dans vehicleData.config.paints, arrondies à 4 décimales, pour que la config reflète la peinture réelle.

- `vehId` (*integer*) : véhicule

#### `core_vehicle_colors.setVehicleColor(index, colorString, objID)`

Définit la couleur d'un emplacement de peinture depuis une chaîne (8 nombres : r g b a puis 4 valeurs métalliques), met à jour le véhicule en direct et enregistre toutes les peintures dans la config.

- `index` (*integer*) : emplacement de peinture, base 0 (0 à 2)
- `colorString` (*string*) : 'r g b a metallic roughness clearcoat clearcoatRoughness'
- `objID` (*integer|nil*) : véhicule ; nil = cible de configuration ou joueur 0

#### `core_vehicle_colors.setVehiclePaint(index, paint, objID)`

Applique une table de peinture à un emplacement, met à jour le véhicule en direct et enregistre les peintures dans la config.

- `index` (*integer*) : emplacement de peinture, base 1 (1 à 3)
- `paint` (*table*) : peinture {baseColor, metallic, roughness, clearcoat, clearcoatRoughness}
- `objID` (*integer|nil*) : véhicule ; nil = cible de configuration ou joueur 0

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'core_vehicle_configTarget'} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/colors.lua`.*
