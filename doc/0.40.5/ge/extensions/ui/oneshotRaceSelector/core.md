# `ui_oneshotRaceSelector_core`

*Fichier : `lua/ge/extensions/ui/oneshotRaceSelector/core.lua` · VM : Game Engine (GE) · 246 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_oneshotRaceSelector_core` : `extensions.load("ui_oneshotRaceSelector_core")`, puis la globale `ui_oneshotRaceSelector_core`

Socle commun des back-ends ui_gridSelector pour les trois sélecteurs « oneshot race » (quickraceSelector, lightRunnerSelector, busRouteSelector). Il fournit la recherche texte, la persistance des options d'affichage, des filtres vides, la construction du titre et du fil d'Ariane, et le dispatch de getDetails selon la forme du chemin (niveaux ou éléments d'un niveau : pistes/routes). Le formatage des tuiles et des détails est laissé à un « descriptor » passé à createBackend.

## Exemple

```lua
local backend = ui_oneshotRaceSelector_core.createBackend(descriptor)
local tiles = backend.getTiles({keys = {}})
```

## Remarques

- difficultyLabel divise la valeur par 25 (arrondi inférieur) : 0-24 facile, 25-49 moyen, 50-74 difficile, 75-99 très difficile ; au-delà de 99 (clé 4+) renvoie nil.
- Le back-end renvoyé ne gère ni filtres, ni boutons, ni favoris : getFilters renvoie des listes vides, executeButton/executeDoubleClick renvoient nil, toggleFavourite renvoie false.
- Les options d'affichage sont sauvegardées dans /settings/<backendName>Data.json (une seule option : displaySize, défaut medium).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_oneshotRaceSelector_core.createBackend(descriptor)` | Construit un back-end gridSelector à partir d'un descriptor. Le back-end expose findLevel, findMiddle, getTiles, getFilters, getActiveFilters, getSearchText/setSearchText, getDisplayDataOptions/setDisplayDataOption/resetDisplayDataToDefaults, getScreenHeaderTitleAndPath, getDetails, getManagementDetails, executeButton, executeDoubleClick, toggleFavourite, profilerFinish et closedFromUI. Contrat du descriptor : backendName (string) ; middlePathKey ("tracks" ou "routes", path.keys[1] du niveau de détail) ; levelListTitleKey et middleListTitleKey (ids de traduction) ; getLevels() ; findLevel(levelName) optionnel (sinon recherche sur level.levelName) ; getMiddleItems(level) ; middleName(middle) ; levelDisplayName(level) et middleDisplayName(middle) (déjà traduits) ; levelToTile(level) ; middleToTile(middle, levelName) ; getLevelDetails(level) ; getMiddleDetails(middle, levelName). | 42 |
| `ui_oneshotRaceSelector_core.difficultyLabel(value)` | Convertit une valeur de difficulté numérique (0-99) en libellé traduit (facile/moyen/difficile/très difficile) via _tr. Renvoie nil si la valeur n'est pas numérique ou hors des quatre paliers. | 23 |

### Détail des paramètres

#### `ui_oneshotRaceSelector_core.createBackend(descriptor)`

Construit un back-end gridSelector à partir d'un descriptor. Le back-end expose findLevel, findMiddle, getTiles, getFilters, getActiveFilters, getSearchText/setSearchText, getDisplayDataOptions/setDisplayDataOption/resetDisplayDataToDefaults, getScreenHeaderTitleAndPath, getDetails, getManagementDetails, executeButton, executeDoubleClick, toggleFavourite, profilerFinish et closedFromUI. Contrat du descriptor : backendName (string) ; middlePathKey ("tracks" ou "routes", path.keys[1] du niveau de détail) ; levelListTitleKey et middleListTitleKey (ids de traduction) ; getLevels() ; findLevel(levelName) optionnel (sinon recherche sur level.levelName) ; getMiddleItems(level) ; middleName(middle) ; levelDisplayName(level) et middleDisplayName(middle) (déjà traduits) ; levelToTile(level) ; middleToTile(middle, levelName) ; getLevelDetails(level) ; getMiddleDetails(middle, levelName).

- `descriptor` (*table*) : Table décrivant le mode (voir desc pour le contrat complet).
- **renvoie** : table Back-end utilisable par ui_gridSelector.

#### `ui_oneshotRaceSelector_core.difficultyLabel(value)`

Convertit une valeur de difficulté numérique (0-99) en libellé traduit (facile/moyen/difficile/très difficile) via _tr. Renvoie nil si la valeur n'est pas numérique ou hors des quatre paliers.

- `value` (*number|string|nil*) : Difficulté ; le palier est floor(value / 25).
- **renvoie** : string|nil Libellé traduit, ou nil.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/oneshotRaceSelector/core.lua`.*
