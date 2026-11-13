# `ui_gridSelector`

*Fichier : `lua/ge/extensions/ui/gridSelector.lua` · VM : Game Engine (GE) · 503 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gridSelector` : `extensions.load("ui_gridSelector")`, puis la globale `ui_gridSelector`

Façade unique entre l'interface (UI Vue) et les sélecteurs en grille (véhicules, gameplay, apps, freeroam, course rapide, light runner, lignes de bus). Chaque appel reçoit le nom du backend en premier argument et est redirigé (dispatch) vers l'extension `ui_<nom>_general` correspondante. Le module normalise les chemins, les groupes de tuiles, les filtres, les données d'affichage, l'en-tête et les détails de gestion avant de les renvoyer à l'UI, et fournit des valeurs de repli pour les méthodes optionnelles absentes d'un backend.

## Exemple

```lua
local snap = ui_gridSelector.getSelectorSnapshot('vehicleSelector', {keys = {}})
for _, group in ipairs(snap.groups) do log('I', 'x', #group.tiles) end
```

## Remarques

- Noms de backend valides : vehicleSelector, gameplaySelector, appSelector, freeroamSelector, quickraceSelector, lightRunnerSelector, busRouteSelector. Un autre nom donne une erreur de log et nil.
- Un chemin (path) est normalisé en { keys = {...} } : accepte { keys = {...} } ou un tableau de segments (string, number, boolean convertis en string). Tout autre chose donne { keys = {} } avec un avertissement.
- Contrat backend : méthodes requises getTiles, getFilters, getSearchText, setSearchText, getDisplayDataOptions, setDisplayDataOption, resetDisplayDataToDefaults, getScreenHeaderTitleAndPath, getDetails. Méthodes optionnelles avec repli : getManagementDetails, executeButton, executeDoubleClick, toggleFavourite, requestClusterTiles, requestDetails, clearAllFilters, closedFromUI, profilerFinish.
- getActiveFilters, toggleFilter, updateRangeFilter, resetRangeFilter, resetSetFilter et exitCallback sont transmises au backend mais n'ont PAS de repli : si le backend ne les définit pas, une erreur est loguée et nil est renvoyé.
- Le commentaire placé avant M.toggleFavourite dans le code (exploreFolder/goToMod commentés) est du code désactivé ; exploreFolder et goToMod sont en réalité définies plus bas dans le fichier.
- Une tuile sans `key` reçoit une clé générée `__missingTileKey_<backend>_<n>`.

**Dépendances (chargées avant) :** `ui_vehicleSelector_general`, `ui_gameplaySelector_general`, `ui_appSelector_general`, `ui_freeroamSelector_general`, `ui_quickraceSelector_general`, `ui_lightRunnerSelector_general`, `ui_busRouteSelector_general`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gridSelector.clearAllFilters(backendName, ...)` | Efface tous les filtres (optionnel, repli : false). | 415 |
| `ui_gridSelector.closedFromUI(backendName, ...)` | Notifie le backend que l'écran a été fermé depuis l'UI (optionnel, repli : nil). | 428 |
| `ui_gridSelector.executeButton(backendName, ...)` | Exécute un bouton d'action du panneau de détails (optionnel, repli : nil). | 432 |
| `ui_gridSelector.executeDoubleClick(backendName, ...)` | Exécute l'action de double-clic sur une tuile (optionnel, repli : nil). | 435 |
| `ui_gridSelector.exitCallback(backendName, ...)` | Appelle exitCallback du backend (sans repli). | 434 |
| `ui_gridSelector.exploreFolder(_backendName, path)` | Ouvre un dossier dans l'explorateur de fichiers du système (Engine.Platform.exploreFolder). | 495 |
| `ui_gridSelector.getActiveFilters(backendName, ...)` | Renvoie les filtres actifs du backend (sans repli). | 410 |
| `ui_gridSelector.getBackendByName(backendName)` | Renvoie la table de l'extension backend associée au nom donné, ou nil si le nom est inconnu. | 64 |
| `ui_gridSelector.getDetails(backendName, ...)` | Renvoie les détails de l'élément sélectionné (requis). | 430 |
| `ui_gridSelector.getDisplayDataOptions(backendName, ...)` | Renvoie les options d'affichage (tri, regroupement, etc.) du backend (requis). | 419 |
| `ui_gridSelector.getFilters(backendName, ...)` | Renvoie les filtres du backend (requis). | 409 |
| `ui_gridSelector.getInitialData(backendName, path)` | Alias de getSelectorSnapshot. | 481 |
| `ui_gridSelector.getManagementDetails(backendName, ...)` | Renvoie les boutons/détails de gestion (optionnel, repli : { buttons = {} }). | 433 |
| `ui_gridSelector.getScreenHeaderTitleAndPath(backendName, path, ...)` | Renvoie le titre et les segments de chemin de l'en-tête d'écran pour le chemin donné (requis). | 423 |
| `ui_gridSelector.getSearchText(backendName, ...)` | Renvoie le texte de recherche courant du backend (requis). | 416 |
| `ui_gridSelector.getSelectorRefresh(backendName, path, options)` | Alias de getSelectorSnapshotSlices. | 440 |
| `ui_gridSelector.getSelectorSnapshot(backendName, path)` | Renvoie un instantané complet (toutes les tranches) du sélecteur pour un chemin. | 481 |
| `ui_gridSelector.getSelectorSnapshotSlices(backendName, path, options)` | Construit une charge utile contenant seulement les tranches demandées : tiles (groups + defaultFocusKey), filters, displayData, searchText, managementDetails, header. Si aucune tranche n'est activée, toutes le sont. | 440 |
| `ui_gridSelector.getTiles(backendName, path, ...)` | Demande les tuiles au backend pour un chemin et renvoie un tableau de groupes normalisé (groupes et tuiles non-tables ignorés, copie superficielle, clé générée si manquante). | 399 |
| `ui_gridSelector.goToMod(_backendName, modId)` | Navigue l'UI vers la page de détails d'un mod (route menu.mods.details). | 499 |
| `ui_gridSelector.profilerFinish(backendName, ...)` | Notifie le backend de la fin d'un profilage (optionnel, repli : nil). | 427 |
| `ui_gridSelector.requestClusterTiles(backendName, path, ...)` | Demande au backend les tuiles d'un cluster (méthode optionnelle, repli : nil). | 404 |
| `ui_gridSelector.requestDetails(backendName, ...)` | Demande au backend de préparer les détails d'un élément (optionnel, repli : nil). | 431 |
| `ui_gridSelector.resetDisplayDataToDefaults(backendName, ...)` | Remet les options d'affichage aux valeurs par défaut (requis). | 421 |
| `ui_gridSelector.resetRangeFilter(backendName, ...)` | Réinitialise un filtre de plage côté backend (sans repli). | 413 |
| `ui_gridSelector.resetSetFilter(backendName, ...)` | Réinitialise un filtre à ensemble de valeurs côté backend (sans repli). | 414 |
| `ui_gridSelector.setDisplayDataOption(backendName, ...)` | Modifie une option d'affichage du backend (requis). | 420 |
| `ui_gridSelector.setSearchText(backendName, ...)` | Définit le texte de recherche du backend (requis). | 417 |
| `ui_gridSelector.toggleFavourite(backendName, ...)` | Bascule l'état favori d'un élément (optionnel, repli : false). | 438 |
| `ui_gridSelector.toggleFilter(backendName, ...)` | Active ou désactive un filtre côté backend (sans repli). | 411 |
| `ui_gridSelector.updateRangeFilter(backendName, ...)` | Met à jour un filtre de plage côté backend (sans repli). | 412 |

### Détail des paramètres

#### `ui_gridSelector.clearAllFilters(backendName, ...)`

Efface tous les filtres (optionnel, repli : false).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.
- **renvoie** : boolean|any false si non implémenté.

#### `ui_gridSelector.closedFromUI(backendName, ...)`

Notifie le backend que l'écran a été fermé depuis l'UI (optionnel, repli : nil).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.executeButton(backendName, ...)`

Exécute un bouton d'action du panneau de détails (optionnel, repli : nil).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.executeDoubleClick(backendName, ...)`

Exécute l'action de double-clic sur une tuile (optionnel, repli : nil).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.exitCallback(backendName, ...)`

Appelle exitCallback du backend (sans repli).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.exploreFolder(_backendName, path)`

Ouvre un dossier dans l'explorateur de fichiers du système (Engine.Platform.exploreFolder).

- `_backendName` (*string*) : Ignoré.
- `path` (*string*) : Chemin du dossier.

#### `ui_gridSelector.getActiveFilters(backendName, ...)`

Renvoie les filtres actifs du backend (sans repli).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.
- **renvoie** : any Filtres actifs.

#### `ui_gridSelector.getBackendByName(backendName)`

Renvoie la table de l'extension backend associée au nom donné, ou nil si le nom est inconnu.

- `backendName` (*string*) : vehicleSelector, gameplaySelector, appSelector, freeroamSelector, quickraceSelector, lightRunnerSelector ou busRouteSelector
- **renvoie** : table|nil Le module backend (ex. ui_vehicleSelector_general).

#### `ui_gridSelector.getDetails(backendName, ...)`

Renvoie les détails de l'élément sélectionné (requis).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.
- **renvoie** : any Détails fournis par le backend.

#### `ui_gridSelector.getDisplayDataOptions(backendName, ...)`

Renvoie les options d'affichage (tri, regroupement, etc.) du backend (requis).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.
- **renvoie** : table Options d'affichage.

#### `ui_gridSelector.getFilters(backendName, ...)`

Renvoie les filtres du backend (requis).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.
- **renvoie** : table Données de filtres du backend.

#### `ui_gridSelector.getInitialData(backendName, path)`

Alias de getSelectorSnapshot.

- `backendName` (*string*) : Nom du backend.
- `path` (*table|nil*) : Chemin.
- **renvoie** : table Instantané complet.

#### `ui_gridSelector.getManagementDetails(backendName, ...)`

Renvoie les boutons/détails de gestion (optionnel, repli : { buttons = {} }).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.
- **renvoie** : table { buttons = {...}, ... }.

#### `ui_gridSelector.getScreenHeaderTitleAndPath(backendName, path, ...)`

Renvoie le titre et les segments de chemin de l'en-tête d'écran pour le chemin donné (requis).

- `backendName` (*string*) : Nom du backend.
- `path` (*table|nil*) : Chemin à normaliser.
- `...` (*any*) : Arguments transmis.
- **renvoie** : table { title, pathSegments }.

#### `ui_gridSelector.getSearchText(backendName, ...)`

Renvoie le texte de recherche courant du backend (requis).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.
- **renvoie** : string Texte de recherche.

#### `ui_gridSelector.getSelectorRefresh(backendName, path, options)`

Alias de getSelectorSnapshotSlices.

- `backendName` (*string*) : Nom du backend.
- `path` (*table|nil*) : Chemin.
- `options` (*table|nil*) : Tranches.
- **renvoie** : table Voir getSelectorSnapshotSlices.

#### `ui_gridSelector.getSelectorSnapshot(backendName, path)`

Renvoie un instantané complet (toutes les tranches) du sélecteur pour un chemin.

- `backendName` (*string*) : Nom du backend.
- `path` (*table|nil*) : Chemin.
- **renvoie** : table Voir getSelectorSnapshotSlices. La tuile par défaut (forceAutoFocus ou isDefaultSelected) donne defaultFocusKey.

#### `ui_gridSelector.getSelectorSnapshotSlices(backendName, path, options)`

Construit une charge utile contenant seulement les tranches demandées : tiles (groups + defaultFocusKey), filters, displayData, searchText, managementDetails, header. Si aucune tranche n'est activée, toutes le sont.

- `backendName` (*string*) : Nom du backend.
- `path` (*table|nil*) : Chemin à normaliser.
- `options` (*table<string, boolean>|nil*) : Tranches à inclure (clé = true).
- **renvoie** : table { backendName, path, groups?, defaultFocusKey?, filters?, displayData?, searchText?, managementDetails?, header? }.

#### `ui_gridSelector.getTiles(backendName, path, ...)`

Demande les tuiles au backend pour un chemin et renvoie un tableau de groupes normalisé (groupes et tuiles non-tables ignorés, copie superficielle, clé générée si manquante).

- `backendName` (*string*) : Nom du backend.
- `path` (*table|nil*) : Chemin { keys = {...} } ou tableau de segments.
- `...` (*any*) : Arguments supplémentaires transmis au backend.
- **renvoie** : table[] Liste de groupes { tiles = {...}, ... }.

#### `ui_gridSelector.goToMod(_backendName, modId)`

Navigue l'UI vers la page de détails d'un mod (route menu.mods.details).

- `_backendName` (*string*) : Ignoré.
- `modId` (*string*) : Identifiant du mod.

#### `ui_gridSelector.profilerFinish(backendName, ...)`

Notifie le backend de la fin d'un profilage (optionnel, repli : nil).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.requestClusterTiles(backendName, path, ...)`

Demande au backend les tuiles d'un cluster (méthode optionnelle, repli : nil).

- `backendName` (*string*) : Nom du backend.
- `path` (*table|nil*) : Chemin à normaliser.
- `...` (*any*) : Arguments transmis.
- **renvoie** : any Résultat du backend.

#### `ui_gridSelector.requestDetails(backendName, ...)`

Demande au backend de préparer les détails d'un élément (optionnel, repli : nil).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.resetDisplayDataToDefaults(backendName, ...)`

Remet les options d'affichage aux valeurs par défaut (requis).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.resetRangeFilter(backendName, ...)`

Réinitialise un filtre de plage côté backend (sans repli).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.resetSetFilter(backendName, ...)`

Réinitialise un filtre à ensemble de valeurs côté backend (sans repli).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.setDisplayDataOption(backendName, ...)`

Modifie une option d'affichage du backend (requis).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.setSearchText(backendName, ...)`

Définit le texte de recherche du backend (requis).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis (texte).

#### `ui_gridSelector.toggleFavourite(backendName, ...)`

Bascule l'état favori d'un élément (optionnel, repli : false).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.
- **renvoie** : boolean|any false si non implémenté.

#### `ui_gridSelector.toggleFilter(backendName, ...)`

Active ou désactive un filtre côté backend (sans repli).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

#### `ui_gridSelector.updateRangeFilter(backendName, ...)`

Met à jour un filtre de plage côté backend (sans repli).

- `backendName` (*string*) : Nom du backend.
- `...` (*any*) : Arguments transmis.

## Champs

| Champ | Type | Description |
|---|---|---|
| `BackendContract` | table | Décrit le contrat attendu des backends : `requiredMethods` (liste de noms) et `optionalMethods` (liste de noms). |
| `dependencies` | table<integer, string> | Extensions backend chargées avant ce module (les sept `ui_*Selector_general`). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gridSelector.lua`.*
