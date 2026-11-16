# `ui_gridSelectorUtils_displayDataModule`

*Fichier : `lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua` · VM : Game Engine (GE) · 266 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gridSelectorUtils_displayDataModule` : `extensions.load("ui_gridSelectorUtils_displayDataModule")`, puis la globale `ui_gridSelectorUtils_displayDataModule`

Utilitaire des sélecteurs en grille : gère les options d'affichage (tri, filtres d'affichage, bascules…), la liste des favoris et celle des éléments récents, avec persistance JSON dans un fichier (par défaut /settings/gridSelectorData.json). Une option peut être liée à un réglage du jeu via `settingsKey`. Émet les hooks onGridSelectorDisplayDataChanged et onGridSelectorFavouriteToggled.

## Remarques

- Les données sont chargées paresseusement au premier accès (getDisplayData). Si la version du fichier est inférieure à targetVersion, `updateDisplayDataFunction(displayData, 0, targetVersion)` est appelée pour migrer.
- Les clés `showAuxContent` (valeur initiale = not shipping_build) et `showCareerContent` (forcée à false en build shipping) ont un traitement spécial à l'initialisation.
- Seules les options avec `save = true` sont réellement réécrites dans displayData lors de la sauvegarde ; resetDisplayDataToDefaults ne réinitialise aussi que ces options.
- Les favoris stockent l'horodatage os.time() ; les éléments récents sont limités à 100 (le plus récent en tête).
- Les options liées à `settingsKey` lisent et écrivent via settings.getValue/settings.setValue.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gridSelectorUtils_displayDataModule.create(dataFile, displayDataOptions, updateDisplayDataFunction, backendName, targetVersion)` | Crée une instance de gestion des données d'affichage, favoris et récents. | 4 |

### Détail des paramètres

#### `ui_gridSelectorUtils_displayDataModule.create(dataFile, displayDataOptions, updateDisplayDataFunction, backendName, targetVersion)`

Crée une instance de gestion des données d'affichage, favoris et récents.

- `dataFile` (*string|nil*) : Fichier JSON de sauvegarde, défaut /settings/gridSelectorData.json.
- `displayDataOptions` (*table[]|nil*) : Liste d'options { key, type, default, label, min, max, options, showInModes, description, hideInSimpleMenu, save, settingsKey }.
- `updateDisplayDataFunction` (*function|nil*) : Migration (displayData, ancienneVersion, nouvelleVersion) -> displayData.
- `backendName` (*string|nil*) : Nom transmis aux hooks, défaut "gridSelector".
- `targetVersion` (*integer|nil*) : Version courante du format de données, défaut 1.
- **renvoie** : table Instance (voir classes.instance).

## Classe `instance`

Objet renvoyé par create().

| Méthode | Description | Ligne |
|---|---|---|
| `instance:clearAllFavourites()` | Vide les favoris et sauvegarde. | dyn |
| `instance:clearAllRecentItems()` | Vide les récents et sauvegarde. | dyn |
| `instance:getDisplayData()` | Renvoie la table clé -> valeur des options, initialisée au premier appel. | dyn |
| `instance:getDisplayDataOptions()` | Renvoie la liste des options pour l'UI : label, key, type, min, max, value, options, showInModes, description, hideInSimpleMenu. La valeur de `searchText` est toujours nil (gérée par le module appelant). | dyn |
| `instance:getRecentItems()` | Renvoie une copie profonde de la liste des récents. | dyn |
| `instance:initializeDisplayData()` | Relit le fichier et reconstruit la table des options à partir des défauts, du fichier et des réglages liés. | dyn |
| `instance:isFavourite(itemKey)` | Renvoie l'horodatage du favori ou nil. | dyn |
| `instance:isRecentItem(itemKey)` | Renvoie la position dans la liste des récents, ou false. | dyn |
| `instance:resetDisplayDataToDefaults()` | Remet les options `save` à leur valeur par défaut, émet le hook pour chaque changement et sauvegarde. | dyn |
| `instance:setDisplayDataOption(key, value)` | Change une option (convertie en nombre si son type est number), émet onGridSelectorDisplayDataChanged(backendName, key, value), répercute sur le réglage lié et sauvegarde. Les valeurs nil ou "undefined" sont ignorées. | dyn |
| `instance:toggleFavourite(itemKey)` | Ajoute ou retire un favori, émet onGridSelectorFavouriteToggled(backendName, itemKey, estFavori) et sauvegarde. | dyn |
| `instance:trackRecentItem(itemKey)` | Place l'élément en tête des récents (max 100) et sauvegarde. | dyn |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGridSelectorDisplayDataChanged`
- `onGridSelectorFavouriteToggled`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gridSelectorUtils/displayDataModule.lua`.*
