# `ui_gameplaySelector_tileSorting`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/tileSorting.lua` · VM : Game Engine (GE) · 292 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_tileSorting` : `extensions.load("ui_gameplaySelector_tileSorting")`, puis la globale `ui_gameplaySelector_tileSorting`

Tri centralisé des tuiles du sélecteur de gameplay. Fournit quatre modes (Name, System, GameplayAutomatic, Date), la conversion des valeurs de l'UI ('name', 'automatic', 'date', 'system') vers ces modes et un repli sur 'Name' pour toute valeur invalide (avec un log d'avertissement).

## Exemple

```lua
ui_gameplaySelector_tileSorting.sortTilesFromUIValue(tiles, 'date')
```

## Remarques

- Ordre des systèmes (SYSTEM_ORDER) : freeroam 1, quickStartExperiences 2, challenges 3, scenarios 4, scenariosMultiplayer 5, campaigns 6, 'Other...' 7 ; système inconnu = 999 (dans GameplayAutomatic).
- Name : tri alphabétique sur Name, name ou label ; l'élément dont le nom vaut _tr('ui.menu.gridSelector.other') passe toujours en dernier.
- GameplayAutomatic : tuiles issues d'un clustering d'abord (par nom), puis ordre des systèmes, puis non-auxiliaires avant auxiliaires, puis propriété order (absente = math.huge), puis nom.
- Date : plus récent d'abord ; sans date en dernier ; à égalité, tri par nom.
- Bug : sortByGameplayAutomatic utilise OTHER_PLACEHOLDER, variable globale jamais définie (nil), donc un système absent donne nil ; l'effet est le même que 999 car SYSTEM_ORDER[nil] vaut nil.
- Bug : la branche « Challenges » compare avec une majuscule alors que le système s'appelle 'challenges' ; elle n'est donc jamais prise (le tri par carrière compareCareerStatus est inutilisé).
- Dans sortBySystem, un système inconnu est placé après les systèmes connus ; si les deux sont inconnus et différents, la fonction renvoie false.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_tileSorting.convertUIValueToSortMode(uiValue)` | Convertit une valeur de l'UI en mode interne ; 'Name' si nil, non-chaîne ou inconnue (avec avertissement). | 246 |
| `ui_gameplaySelector_tileSorting.getSortFunction(sortMode)` | Renvoie la fonction de comparaison d'un mode. Mode invalide ou inconnu : log d'avertissement et repli sur 'Name'. | 227 |
| `ui_gameplaySelector_tileSorting.isValidSortMode(sortMode)` | Indique si le mode de tri existe. | 242 |
| `ui_gameplaySelector_tileSorting.sortByDate(a, b)` | Comparateur par date décroissante ; sans date en dernier ; nom en cas d'égalité. | 282 |
| `ui_gameplaySelector_tileSorting.sortByGameplayAutomatic(a, b)` | Comparateur multicritère : clusters, système, auxiliaire, order, nom. | 278 |
| `ui_gameplaySelector_tileSorting.sortByNameButOtherAlwaysLast(a, b)` | Comparateur alphabétique, l'élément « Autre » étant toujours en dernier. | 270 |
| `ui_gameplaySelector_tileSorting.sortBySystem(a, b)` | Comparateur par ordre de système, puis par nom à système égal. | 274 |
| `ui_gameplaySelector_tileSorting.sortGroup(group, sortMode)` | Trie group.tiles sur place avec le mode donné. | 287 |
| `ui_gameplaySelector_tileSorting.sortTiles(tiles, sortMode)` | Trie la liste de tuiles sur place (table.sort) avec le mode interne donné. | 265 |
| `ui_gameplaySelector_tileSorting.sortTilesFromUIValue(tiles, uiSortValue)` | Trie la liste de tuiles sur place à partir d'une valeur de l'UI. | 260 |

### Détail des paramètres

#### `ui_gameplaySelector_tileSorting.convertUIValueToSortMode(uiValue)`

Convertit une valeur de l'UI en mode interne ; 'Name' si nil, non-chaîne ou inconnue (avec avertissement).

- `uiValue` (*string|nil*) : 'name', 'automatic', 'date' ou 'system'.
- **renvoie** : string Mode interne.

#### `ui_gameplaySelector_tileSorting.getSortFunction(sortMode)`

Renvoie la fonction de comparaison d'un mode. Mode invalide ou inconnu : log d'avertissement et repli sur 'Name'.

- `sortMode` (*string*) : 'Name', 'System', 'GameplayAutomatic' ou 'Date'.
- **renvoie** : function function(a, b) -> boolean utilisable par table.sort.

#### `ui_gameplaySelector_tileSorting.isValidSortMode(sortMode)`

Indique si le mode de tri existe.

- `sortMode` (*string*) : Mode interne.
- **renvoie** : boolean true si valide.

#### `ui_gameplaySelector_tileSorting.sortByDate(a, b)`

Comparateur par date décroissante ; sans date en dernier ; nom en cas d'égalité.

- `a` (*table*) : Tuile ou item (champ date).
- `b` (*table*) : Tuile ou item.
- **renvoie** : boolean true si a doit précéder b.

#### `ui_gameplaySelector_tileSorting.sortByGameplayAutomatic(a, b)`

Comparateur multicritère : clusters, système, auxiliaire, order, nom.

- `a` (*table*) : Tuile ou item (isClustered, system, isAuxiliary, order, name).
- `b` (*table*) : Tuile ou item.
- **renvoie** : boolean true si a doit précéder b.

#### `ui_gameplaySelector_tileSorting.sortByNameButOtherAlwaysLast(a, b)`

Comparateur alphabétique, l'élément « Autre » étant toujours en dernier.

- `a` (*table*) : Tuile ou item.
- `b` (*table*) : Tuile ou item.
- **renvoie** : boolean true si a doit précéder b.

#### `ui_gameplaySelector_tileSorting.sortBySystem(a, b)`

Comparateur par ordre de système, puis par nom à système égal.

- `a` (*table*) : Tuile ou item (champ system).
- `b` (*table*) : Tuile ou item (champ system).
- **renvoie** : boolean true si a doit précéder b.

#### `ui_gameplaySelector_tileSorting.sortGroup(group, sortMode)`

Trie group.tiles sur place avec le mode donné.

- `group` (*table*) : Groupe contenant une liste tiles.
- `sortMode` (*string*) : Mode interne.

#### `ui_gameplaySelector_tileSorting.sortTiles(tiles, sortMode)`

Trie la liste de tuiles sur place (table.sort) avec le mode interne donné.

- `tiles` (*table[]*) : Tuiles à trier (modifiée).
- `sortMode` (*string*) : Mode interne.

#### `ui_gameplaySelector_tileSorting.sortTilesFromUIValue(tiles, uiSortValue)`

Trie la liste de tuiles sur place à partir d'une valeur de l'UI.

- `tiles` (*table[]*) : Tuiles à trier (modifiée).
- `uiSortValue` (*string|nil*) : Valeur de tri de l'UI.

## Champs

| Champ | Type | Description |
|---|---|---|
| `SORT_MODE_TO_UI` | table<string, string> | Correspondance inverse, calculée au chargement. |
| `SYSTEM_ORDER` | table<string, integer> | Rang de chaque système de gameplay pour le tri. |
| `UI_TO_SORT_MODE` | table<string, string> | Correspondance valeur UI -> mode interne (name, automatic, date, system). |
| `VALID_SORT_MODES` | string[] | {'Name', 'System', 'GameplayAutomatic', 'Date'}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/tileSorting.lua`.*
