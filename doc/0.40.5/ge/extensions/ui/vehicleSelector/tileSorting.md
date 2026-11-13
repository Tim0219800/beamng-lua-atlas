# `ui_vehicleSelector_tileSorting`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/tileSorting.lua` · VM : Game Engine (GE) · 181 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_tileSorting` : `extensions.load("ui_vehicleSelector_tileSorting")`, puis la globale `ui_vehicleSelector_tileSorting`

Fonctions de tri des tuiles du sélecteur de véhicules selon le mode « Trier par » : Name, Value, Years, Weight, Top Speed, Power, Weight/Power, 0-60 mph, 0-100 km/h, Config Type. Chaque comparateur départage les égalités par nom, en plaçant « Autre » en dernier.

## Remarques

- Les comparateurs sont de type table.sort : fonction (a, b) -> boolean, sur des tuiles ou configs (champs Name/name/label, Value, Years, Weight, ...).
- Sens de tri : Weight, Top Speed, Power, Value, Years sont croissants. Weight/Power et les temps 0-60 mph / 0-100 km/h sont triés en ordre décroissant de la valeur (d'après le code : `>`), les valeurs absentes valant math.huge.
- Config Type suit l'ordre fixe Factory, Service, Race, Drift, Rally, Police, Custom, Powerglow, Other... ; les types inconnus passent après.
- Un sortMode inconnu (y compris 'Automatic') retombe sur le tri par nom.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_tileSorting.getSortFunction(sortMode)` | Renvoie le comparateur d'un mode de tri ; par défaut le tri par nom. | 150 |
| `ui_vehicleSelector_tileSorting.sortByConfigTypeName(a, b)` | Compare par type de config selon l'ordre prédéfini, puis par nom. | 171 |
| `ui_vehicleSelector_tileSorting.sortByNameButOtherAlwaysLast(a, b)` | Compare par nom (Name, name ou label) ; l'élément nommé comme le libellé « Autre » (traduit) est toujours placé en dernier. | 159 |
| `ui_vehicleSelector_tileSorting.sortByValue(a, b)` | Compare par prix (Value, ou sa borne min si c'est une plage), puis par nom. | 163 |
| `ui_vehicleSelector_tileSorting.sortByYears(a, b)` | Compare par année (Years, ou sa borne min), puis par nom ; année absente = math.huge. | 167 |
| `ui_vehicleSelector_tileSorting.sortGroup(group, sortMode)` | Trie les tuiles d'un groupe (group.tiles) en place selon le mode de tri. | 176 |
| `ui_vehicleSelector_tileSorting.sortTiles(tiles, sortMode)` | Trie une liste de tuiles en place avec le comparateur du mode. | 154 |

### Détail des paramètres

#### `ui_vehicleSelector_tileSorting.getSortFunction(sortMode)`

Renvoie le comparateur d'un mode de tri ; par défaut le tri par nom.

- `sortMode` (*string*) : Name, Value, Years, Weight, Top Speed, Power, Weight/Power, 0-60 mph, 0-100 km/h ou Config Type.
- **renvoie** : function Comparateur (a, b) -> boolean.

#### `ui_vehicleSelector_tileSorting.sortByConfigTypeName(a, b)`

Compare par type de config selon l'ordre prédéfini, puis par nom.

- `a` (*table*) : Premier élément.
- `b` (*table*) : Second élément.
- **renvoie** : boolean true si a doit précéder b.

#### `ui_vehicleSelector_tileSorting.sortByNameButOtherAlwaysLast(a, b)`

Compare par nom (Name, name ou label) ; l'élément nommé comme le libellé « Autre » (traduit) est toujours placé en dernier.

- `a` (*table*) : Premier élément.
- `b` (*table*) : Second élément.
- **renvoie** : boolean true si a doit précéder b.

#### `ui_vehicleSelector_tileSorting.sortByValue(a, b)`

Compare par prix (Value, ou sa borne min si c'est une plage), puis par nom.

- `a` (*table*) : Premier élément.
- `b` (*table*) : Second élément.
- **renvoie** : boolean true si a doit précéder b.

#### `ui_vehicleSelector_tileSorting.sortByYears(a, b)`

Compare par année (Years, ou sa borne min), puis par nom ; année absente = math.huge.

- `a` (*table*) : Premier élément.
- `b` (*table*) : Second élément.
- **renvoie** : boolean true si a doit précéder b.

#### `ui_vehicleSelector_tileSorting.sortGroup(group, sortMode)`

Trie les tuiles d'un groupe (group.tiles) en place selon le mode de tri.

- `group` (*table*) : Groupe avec un champ tiles.
- `sortMode` (*string*) : Mode de tri.

#### `ui_vehicleSelector_tileSorting.sortTiles(tiles, sortMode)`

Trie une liste de tuiles en place avec le comparateur du mode.

- `tiles` (*table[]*) : Tuiles à trier.
- `sortMode` (*string*) : Mode de tri.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/tileSorting.lua`.*
