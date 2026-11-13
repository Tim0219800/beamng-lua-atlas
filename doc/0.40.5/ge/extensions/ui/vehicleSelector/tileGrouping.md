# `ui_vehicleSelector_tileGrouping`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua` · VM : Game Engine (GE) · 166 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_tileGrouping` : `extensions.load("ui_vehicleSelector_tileGrouping")`, puis la globale `ui_vehicleSelector_tileGrouping`

Détermine dans quels groupes (sections de la grille) une config de véhicule apparaît selon le mode « Grouper par » du sélecteur : Type, Brand, Country, Config Type, Derby Class, Body Style, Source, ainsi que Years (par décennie) et Value (par tranche de prix). Ajoute aussi les groupes spéciaux Favoris et Récents. Utilisé par ui_vehicleSelector_tiles.

## Remarques

- Un groupe est une table {groupName, groupOrder} ; groupOrder -1 = Favoris, -2 = Récents, 999 = « Autre ». Pour Type, l'ordre vient de typeOrder (Car et Truck partagent « Cars and trucks »).
- Une config peut être dans plusieurs groupes : Years donne une entrée par décennie couverte, et Favoris/Récents s'ajoutent aux groupes normaux (sauf si showFavouritesMode ou showRecentMode vaut 'hidden').
- Tranches de Value : <10k (Misc), <20k, <50k, <100k, <250k, <500k, <1M, puis 1M+.
- getGroupsForConfig appelle groupModeFunctions[groupMode] (ou groupsForRange) sans vérification : un mode de groupe inconnu provoque une erreur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_tileGrouping.getConfigOrModelPropValue(config, prop)` | Lit une propriété sur la config, ou à défaut sur le modèle (core_vehicles.getModel). | 102 |
| `ui_vehicleSelector_tileGrouping.getGroupModeFunction(groupMode)` | Renvoie la fonction de groupement d'un mode non basé sur une plage. | 151 |
| `ui_vehicleSelector_tileGrouping.getGroupsForConfig(config, groupMode, displayData)` | Renvoie la liste des groupes d'une config pour un mode de regroupement, avec les groupes Favoris et Récents si applicable. La valeur absente est classée dans « Autre ». | 115 |
| `ui_vehicleSelector_tileGrouping.getRangeGroupingFunction(groupMode)` | Renvoie la fonction qui découpe une valeur en groupes pour Years ou Value. | 156 |
| `ui_vehicleSelector_tileGrouping.isRangeGroupMode(groupMode)` | Indique si le mode groupe par plage (Years, Value). | 146 |

### Détail des paramètres

#### `ui_vehicleSelector_tileGrouping.getConfigOrModelPropValue(config, prop)`

Lit une propriété sur la config, ou à défaut sur le modèle (core_vehicles.getModel).

- `config` (*table*) : Config (avec model_key).
- `prop` (*string*) : Nom de propriété.
- **renvoie** : any Valeur ou nil.

#### `ui_vehicleSelector_tileGrouping.getGroupModeFunction(groupMode)`

Renvoie la fonction de groupement d'un mode non basé sur une plage.

- `groupMode` (*string*) : Mode de groupement.
- **renvoie** : function|nil Fonction ou nil.

#### `ui_vehicleSelector_tileGrouping.getGroupsForConfig(config, groupMode, displayData)`

Renvoie la liste des groupes d'une config pour un mode de regroupement, avec les groupes Favoris et Récents si applicable. La valeur absente est classée dans « Autre ».

- `config` (*table*) : Config du véhicule.
- `groupMode` (*string*) : Mode de groupement (Type, Brand, Years, Value, ...).
- `displayData` (*table*) : Options d'affichage (showFavouritesMode, showRecentMode).
- **renvoie** : table[] Liste de {groupName, groupOrder, isFavouriteGroup?, isRecentGroup?}.

#### `ui_vehicleSelector_tileGrouping.getRangeGroupingFunction(groupMode)`

Renvoie la fonction qui découpe une valeur en groupes pour Years ou Value.

- `groupMode` (*string*) : 'Years' ou 'Value'.
- **renvoie** : function|nil Fonction ou nil.

#### `ui_vehicleSelector_tileGrouping.isRangeGroupMode(groupMode)`

Indique si le mode groupe par plage (Years, Value).

- `groupMode` (*string*) : Mode de groupement.
- **renvoie** : boolean true pour Years et Value.

## Champs

| Champ | Type | Description |
|---|---|---|
| `groupModeFunctions` | table<string, function> | Fonctions (valeur) -> groupName, groupOrder pour les modes non basés sur une plage : Type, Brand, Country, Config Type, Derby Class, Body Style, Source. |
| `isRange` | table<string, boolean> | Modes de groupement par plage : Years et Value. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua`.*
