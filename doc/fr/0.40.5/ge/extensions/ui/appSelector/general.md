# `ui_appSelector_general`

*Fichier : `lua/ge/extensions/ui/appSelector/general.lua` · VM : Game Engine (GE) · 761 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_appSelector_general` : `extensions.load("ui_appSelector_general")`, puis la globale `ui_appSelector_general`

Backend (`backendName = "appSelector"`) du sélecteur d'apps de l'interface, branché sur le composant générique GridSelector. Il liste les apps connues de `ui_apps.getUIAppsData()` sous forme de tuiles groupées par catégorie (Dashboard, Telemetry, General, Gameplay, Debug, puis les autres par ordre alphabétique), gère la recherche, le filtre par type, les options d'affichage (taille, contenu auxiliaire, enregistrées dans `/settings/appSelectorData.json`) et la fiche de détails avec le bouton « Ajouter au layout ». Utile pour comprendre comment l'écran d'édition des apps est alimenté ; peu utile directement à un moddeur.

## Remarques

- En menu simple (`Engine.UI.isSimpleMenu()`), les apps auxiliaires, celles à interactivité obligatoire (`required`) et celles de type Debug sont masquées du sélecteur.
- getTiles écarte aussi les apps `photomode == true` et, sauf option `includeAuxContent`, les apps auxiliaires.
- Le bouton « Ajouter au layout » (et le double-clic) déclenche le hook UI `appContainer:spawn` puis navigue vers la route `pause.hudApps.editlayout`.
- Les données sont recalculées au prochain accès après onModActivated, onModDeactivated ou onModManagerReady.
- setDisplayDataOption et resetDisplayDataToDefaults utilisent directement `displayDataInstance`, qui n'est créé que paresseusement par getDisplayDataInstance (appelé via getAppData) : appelées avant tout accès aux données, elles échoueraient sur nil.
- toggleFavourite, getManagementDetails, exploreFolder, goToMod, profilerFinish et closedFromUI sont des coquilles vides, présentes pour satisfaire l'API de GridSelector.

**Dépendances (chargées avant) :** `ui_apps`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_appSelector_general.clearAllFilters(requestId)` | Efface tous les filtres. | 487 |
| `ui_appSelector_general.closedFromUI()` | Fonction vide, présente pour l'API de GridSelector. *(interne)* | 756 |
| `ui_appSelector_general.emitDisplayDataSnapshot(requestId)` | Reconstruit l'instantané complet (tuiles, filtres, options, en-tête) et l'envoie à l'UI par `appSelectorDisplayDataSnapshot`. | 736 |
| `ui_appSelector_general.executeButton(buttonId, data)` | Exécute le callback d'un bouton de la fiche via le module de boutons. | 665 |
| `ui_appSelector_general.executeDoubleClick(details)` | Sur double-clic d'une tuile, exécute le bouton « Ajouter au layout » de l'app. | 690 |
| `ui_appSelector_general.exploreFolder(path)` | Sans effet : écrit seulement un message dans le log. | 680 |
| `ui_appSelector_general.getActiveFilters()` | Renvoie les filtres actuellement actifs. | 446 |
| `ui_appSelector_general.getAppData()` | Renvoie les données du sélecteur (apps, instance de filtres, liste de filtres, options d'affichage), en les (ré)initialisant si nécessaire. | 287 |
| `ui_appSelector_general.getDetails(details)` | Construit la fiche d'une app : titre, aperçu, description, spécifications (interactivité, version, types, dossier hors build shipping) et bouton « Ajouter au layout ». Renvoie un titre de secours si l'app est inconnue. | 565 |
| `ui_appSelector_general.getDisplayDataOptions()` | Renvoie les options d'affichage (taille des tuiles : list/tiny/small/medium/large/huge ; inclusion du contenu auxiliaire). | 496 |
| `ui_appSelector_general.getFilters()` | Renvoie les filtres disponibles (filtre de type « set » sur les types d'apps). | 441 |
| `ui_appSelector_general.getManagementDetails()` | Fonction facultative de l'API GridSelector : renvoie toujours `{buttons = {}}`. | 671 |
| `ui_appSelector_general.getScreenHeaderTitleAndPath(path)` | Construit le titre et le fil d'Ariane de l'écran (Menu, Édition des apps, Apps, puis « Filtré »/« Recherche : … » si besoin). | 530 |
| `ui_appSelector_general.getSearchText()` | Renvoie le texte de recherche courant. | 516 |
| `ui_appSelector_general.getTiles(path)` | Construit les groupes de tuiles d'apps (filtrés, triés : non auxiliaires d'abord puis par nom, groupés par catégorie). | 354 |
| `ui_appSelector_general.goToMod(modId)` | Sans effet : écrit seulement un message dans le log. | 685 |
| `ui_appSelector_general.onModActivated()` | Hook appelé quand un mod est activé : force le rechargement des données au prochain accès. *(interne)* *(hook)* | 301 |
| `ui_appSelector_general.onModDeactivated()` | Hook appelé quand un mod est désactivé : force le rechargement des données au prochain accès. *(interne)* *(hook)* | 300 |
| `ui_appSelector_general.onModManagerReady()` | Hook appelé quand le gestionnaire de mods est prêt : force le rechargement des données. *(interne)* *(hook)* | 302 |
| `ui_appSelector_general.onRouteMount(context, toRoute, fromRoute, data)` | Hook appelé par le routeur UI au montage de la route : attache à `data.appSelector` un instantané du sélecteur. *(interne)* *(hook)* | 751 |
| `ui_appSelector_general.profilerFinish()` | Fonction vide, présente pour l'API de GridSelector. *(interne)* | 755 |
| `ui_appSelector_general.requestDetails(item, requestId)` | Calcule la fiche d'une app et l'envoie à l'UI par le hook `appSelectorDetails`. | 653 |
| `ui_appSelector_general.resetDisplayDataToDefaults(requestId)` | Remet les options d'affichage à leurs valeurs par défaut. | 508 |
| `ui_appSelector_general.resetRangeFilter(filterKey, requestId)` | Réinitialise un filtre par intervalle. | 469 |
| `ui_appSelector_general.resetSetFilter(filterKey, requestId)` | Réinitialise un filtre de type « set ». | 478 |
| `ui_appSelector_general.resolveCurrentSelectorPath()` | Renvoie le chemin par défaut du sélecteur : `{keys = {"allApps"}}`. | 732 |
| `ui_appSelector_general.setDisplayDataOption(key, value, requestId)` | Modifie une option d'affichage et la sauvegarde. | 500 |
| `ui_appSelector_general.setSearchText(val, requestId)` | Définit le texte de recherche (comparé en minuscules au nom, au nom d'app et à la description traduits). | 521 |
| `ui_appSelector_general.toggleFavourite(itemDetails)` | Sans effet : les apps n'ont pas de favoris. Renvoie false. | 675 |
| `ui_appSelector_general.toggleFilter(filterKey, value, requestId)` | Active ou désactive une valeur d'un filtre. Si `requestId` est fourni, renvoie aussi un instantané à l'UI. | 451 |
| `ui_appSelector_general.updateRangeFilter(filterKey, min, max, requestId)` | Met à jour un filtre par intervalle (non utilisé par les filtres actuels, qui sont tous de type « set »). | 460 |

### Détail des paramètres

#### `ui_appSelector_general.clearAllFilters(requestId)`

Efface tous les filtres.

- `requestId` (*any|nil*) : Identifiant de requête côté UI.
- **renvoie** : any Résultat du module de filtres.

#### `ui_appSelector_general.emitDisplayDataSnapshot(requestId)`

Reconstruit l'instantané complet (tuiles, filtres, options, en-tête) et l'envoie à l'UI par `appSelectorDisplayDataSnapshot`.

- `requestId` (*any*) : Identifiant de requête côté UI.
- **renvoie** : boolean true si envoyé, false si la construction a échoué (erreur loggée).

#### `ui_appSelector_general.executeButton(buttonId, data)`

Exécute le callback d'un bouton de la fiche via le module de boutons.

- `buttonId` (*any*) : Identifiant du bouton.
- `data` (*any*) : Données transmises au callback.
- **renvoie** : any Retour du callback.

#### `ui_appSelector_general.executeDoubleClick(details)`

Sur double-clic d'une tuile, exécute le bouton « Ajouter au layout » de l'app.

- `details` (*table*) : Table contenant `appName`.

#### `ui_appSelector_general.exploreFolder(path)`

Sans effet : écrit seulement un message dans le log.

- `path` (*any*) : Chemin (loggé).

#### `ui_appSelector_general.getActiveFilters()`

Renvoie les filtres actuellement actifs.

- **renvoie** : table Filtres actifs.

#### `ui_appSelector_general.getAppData()`

Renvoie les données du sélecteur (apps, instance de filtres, liste de filtres, options d'affichage), en les (ré)initialisant si nécessaire.

- **renvoie** : table Table avec `apps`, `filterInstance`, `filterList`, `activeFilters`, `lockedFiltersByProp`, `displayData`.

#### `ui_appSelector_general.getDetails(details)`

Construit la fiche d'une app : titre, aperçu, description, spécifications (interactivité, version, types, dossier hors build shipping) et bouton « Ajouter au layout ». Renvoie un titre de secours si l'app est inconnue.

- `details` (*table*) : Table contenant `appName`.
- **renvoie** : table `{headerTitle, preview, description, specifications, buttonInfo, appName}`.

#### `ui_appSelector_general.getDisplayDataOptions()`

Renvoie les options d'affichage (taille des tuiles : list/tiny/small/medium/large/huge ; inclusion du contenu auxiliaire).

- **renvoie** : table Options d'affichage.

#### `ui_appSelector_general.getFilters()`

Renvoie les filtres disponibles (filtre de type « set » sur les types d'apps).

- **renvoie** : table Filtres du module de filtres.

#### `ui_appSelector_general.getManagementDetails()`

Fonction facultative de l'API GridSelector : renvoie toujours `{buttons = {}}`.

- **renvoie** : table `{buttons = {}}`.

#### `ui_appSelector_general.getScreenHeaderTitleAndPath(path)`

Construit le titre et le fil d'Ariane de l'écran (Menu, Édition des apps, Apps, puis « Filtré »/« Recherche : … » si besoin).

- `path` (*table*) : Chemin courant (non utilisé).
- **renvoie** : table `{title, pathSegments, isFiltered}`.

#### `ui_appSelector_general.getSearchText()`

Renvoie le texte de recherche courant.

- **renvoie** : string|nil Texte de recherche.

#### `ui_appSelector_general.getTiles(path)`

Construit les groupes de tuiles d'apps (filtrés, triés : non auxiliaires d'abord puis par nom, groupés par catégorie).

- `path` (*table*) : Chemin de navigation (non utilisé pour le contenu).
- **renvoie** : table<integer, table> Liste de `{label, tiles}`.

#### `ui_appSelector_general.goToMod(modId)`

Sans effet : écrit seulement un message dans le log.

- `modId` (*any*) : Id du mod (loggé).

#### `ui_appSelector_general.onRouteMount(context, toRoute, fromRoute, data)`

Hook appelé par le routeur UI au montage de la route : attache à `data.appSelector` un instantané du sélecteur.

- `context` (*any*) : Contexte de la route (non utilisé).
- `toRoute` (*any*) : Route d'arrivée (non utilisé).
- `fromRoute` (*any*) : Route de départ (non utilisé).
- `data` (*table*) : Données de route auxquelles l'instantané est ajouté.

#### `ui_appSelector_general.requestDetails(item, requestId)`

Calcule la fiche d'une app et l'envoie à l'UI par le hook `appSelectorDetails`.

- `item` (*table*) : Élément sélectionné (avec `appName`).
- `requestId` (*any*) : Identifiant de requête côté UI.
- **renvoie** : table Charge envoyée : `{backendName, requestId, item, details}`.

#### `ui_appSelector_general.resetDisplayDataToDefaults(requestId)`

Remet les options d'affichage à leurs valeurs par défaut.

- `requestId` (*any|nil*) : Identifiant de requête côté UI.
- **renvoie** : table Données d'affichage à jour.

#### `ui_appSelector_general.resetRangeFilter(filterKey, requestId)`

Réinitialise un filtre par intervalle.

- `filterKey` (*string*) : Nom du filtre.
- `requestId` (*any|nil*) : Identifiant de requête côté UI.
- **renvoie** : any Résultat du module de filtres.

#### `ui_appSelector_general.resetSetFilter(filterKey, requestId)`

Réinitialise un filtre de type « set ».

- `filterKey` (*string*) : Nom du filtre.
- `requestId` (*any|nil*) : Identifiant de requête côté UI.
- **renvoie** : any Résultat du module de filtres.

#### `ui_appSelector_general.resolveCurrentSelectorPath()`

Renvoie le chemin par défaut du sélecteur : `{keys = {"allApps"}}`.

- **renvoie** : table Chemin normalisé.

#### `ui_appSelector_general.setDisplayDataOption(key, value, requestId)`

Modifie une option d'affichage et la sauvegarde.

- `key` (*string*) : Clé de l'option (displaySize, includeAuxContent).
- `value` (*any*) : Nouvelle valeur.
- `requestId` (*any|nil*) : Identifiant de requête côté UI.
- **renvoie** : table Données d'affichage à jour.

#### `ui_appSelector_general.setSearchText(val, requestId)`

Définit le texte de recherche (comparé en minuscules au nom, au nom d'app et à la description traduits).

- `val` (*string*) : Texte recherché.
- `requestId` (*any|nil*) : Identifiant de requête côté UI.
- **renvoie** : any Résultat du module de filtres.

#### `ui_appSelector_general.toggleFavourite(itemDetails)`

Sans effet : les apps n'ont pas de favoris. Renvoie false.

- `itemDetails` (*table*) : Non utilisé.
- **renvoie** : boolean Toujours false.

#### `ui_appSelector_general.toggleFilter(filterKey, value, requestId)`

Active ou désactive une valeur d'un filtre. Si `requestId` est fourni, renvoie aussi un instantané à l'UI.

- `filterKey` (*string*) : Nom du filtre (par exemple "Type").
- `value` (*any*) : Valeur à basculer.
- `requestId` (*any|nil*) : Identifiant de requête côté UI.
- **renvoie** : any Résultat du module de filtres.

#### `ui_appSelector_general.updateRangeFilter(filterKey, min, max, requestId)`

Met à jour un filtre par intervalle (non utilisé par les filtres actuels, qui sont tous de type « set »).

- `filterKey` (*string*) : Nom du filtre.
- `min` (*number*) : Minimum.
- `max` (*number*) : Maximum.
- `requestId` (*any|nil*) : Identifiant de requête côté UI.
- **renvoie** : any Résultat du module de filtres.

## Champs

| Champ | Type | Description |
|---|---|---|
| `backendName` | string | Nom du backend : "appSelector". |
| `dependencies` | table<integer, string> | Extensions chargées avant : `{'ui_apps'}`. |

**Évènements UI (guihooks.trigger) :** `appContainer:spawn`, `appSelectorDetails`, `appSelectorDisplayDataSnapshot`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/appSelector/general.lua`.*
