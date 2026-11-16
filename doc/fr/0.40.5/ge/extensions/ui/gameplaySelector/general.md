# `ui_gameplaySelector_general`

*Fichier : `lua/ge/extensions/ui/gameplaySelector/general.lua` · VM : Game Engine (GE) · 1189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gameplaySelector_general` : `extensions.load("ui_gameplaySelector_general")`, puis la globale `ui_gameplaySelector_general`

Backend « gameplaySelector » du sélecteur en grille : l'écran qui liste missions, scénarios, campagnes, expériences de démarrage rapide et sélecteurs de rallye. Il collecte les tuiles par le hook onGameplaySelectorGetTiles (validBackends doit contenir gameplaySelector), gère filtres, recherche, favoris, récents et options d'affichage (sauvegardées dans /settings/gameplaySelectorData.json), construit les détails via onGameplaySelectorGetDetails et envoie à l'interface des instantanés (GameplaySelectorDataLoaded, gameplaySelectorDisplayDataSnapshot, gameplaySelectorDetails). Il applique aussi des préréglages selon la route (menu.gameplay, menu.rallySelector, menu.experiencesSelector) et gère la navigation vers les « clusters ».

## Exemple

```lua
-- ouvrir le sélecteur de rallye (applique les filtres rallyStage et rallyLoop)
ui_gameplaySelector_general.openRallySelector()
```

## Remarques

- Routes gérées : menu.gameplay (et menu.gameplay.type pour un cluster), menu.rallySelector, menu.experiencesSelector (et menu.experiencesSelector.type). Pour le rallye, groupMode et clusterMode viennent de groupModeRally (défaut « type ») et clusterModeRally (défaut « none ») ; pour les expériences, groupMode vaut « system » et clusterMode « automatic ».
- Les préréglages de route (GAMEPLAY_ROUTE_PRESETS) effacent filtres et recherche puis activent le système quickStartExperiences (expériences) ou les types bigMap.missionLabels.rallyStage et rallyLoop (rallye).
- Au montage d'une route, le chargement lourd passe par util_asyncBulkLoader.loadGameplaySelector ; l'instantané n'est émis qu'à la fin (hook asyncGameplaySelectorLoadComplete) et seulement si la route courante est toujours celle demandée. Sans asyncBulkLoader, ou s'il répond « alreadyLoaded », l'instantané est émis tout de suite.
- Les données sont recalculées au prochain accès après onModActivated, onModDeactivated, onModManagerReady, onModManagerStateChanged ou onSettingsChanged. Contrairement au backend freeroam, onLanguageChanged n'est pas écouté ici.
- Plusieurs fonctions acceptent un requestId optionnel : s'il est fourni, un instantané est émis pour que l'interface ignore les réponses périmées. clearAllFilters n'a pas ce paramètre.
- Options d'affichage : groupMode, clusterMode, groupModeRally, clusterModeRally, displaySize, showAuxContent, showCareerContent (faux par défaut), sorting, showRecentMode, showFavouritesMode, defaultFreeroamAction. La version des données est 12.
- Le filtre « system » propose des valeurs rapides : quickStartExperiences, challenges, scenarios, scenariosMultiplayer et, hors menu simplifié, campaigns.
- Débogage laissé dans le code : navigateToCluster et onClusterRouteMount appellent dump(), et les étapes du montage asynchrone écrivent avec print().
- Incohérences dans le filtrage de plage : le test « not type(propVal) == 'number' » est toujours faux à cause de la priorité de not (il faudrait type(propVal) ~= 'number'), et une affectation propVal = item[propKey] est répétée sans effet dans la création des filtres.
- exploreFolder, goToMod, closedFromUI, exitCallback et profilerFinish sont des coquilles (journal ou TODO) ; getManagementDetails renvoie toujours { buttons = {} }.
- Le champ M.displayDataInstance est exposé après la première initialisation.

**Dépendances (chargées avant) :** `ui_gameplaySelector_tiles`, `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gameplaySelector_general.asyncGameplaySelectorLoadComplete()` | Hook de fin du chargement asynchrone (util_asyncBulkLoader). Émet l'instantané GameplaySelectorDataLoaded de la route en attente, sauf si l'utilisateur a changé de route entre-temps. *(interne)* | 1070 |
| `ui_gameplaySelector_general.clearAllFilters()` | Efface tous les filtres. | 641 |
| `ui_gameplaySelector_general.closedFromUI()` | Appelé quand l'interface ferme le sélecteur. Ne fait rien pour l'instant (TODO). *(interne)* | 821 |
| `ui_gameplaySelector_general.emitDisplayDataSnapshot(requestId)` | Reconstruit l'instantané de la vue courante (groupes, filtres, options d'affichage, détails de gestion, texte de recherche, en-tête) et l'envoie par l'évènement gameplaySelectorDisplayDataSnapshot avec le requestId. Renvoie false et journalise une erreur en cas d'échec. | 1107 |
| `ui_gameplaySelector_general.executeButton(buttonId, additionalData)` | Exécute le bouton de détails d'identifiant donné via le buttonModule. | 837 |
| `ui_gameplaySelector_general.executeDoubleClick(item)` | Exécute le bouton marqué isDoubleClickAction des détails d'une tuile (ou l'unique bouton s'il n'y en a qu'un). | 850 |
| `ui_gameplaySelector_general.exitCallback()` | Ne fait rien (TODO). *(interne)* | 846 |
| `ui_gameplaySelector_general.exploreFolder(path)` | Journalise seulement le chemin (non implémenté). | 862 |
| `ui_gameplaySelector_general.getActiveFilters()` | Renvoie les filtres actifs. | 676 |
| `ui_gameplaySelector_general.getDetails(item)` | Construit les détails d'une tuile en émettant le hook onGameplaySelectorGetDetails et renvoie le premier bloc. | 827 |
| `ui_gameplaySelector_general.getDisplayData(routeName)` | Renvoie les options d'affichage effectives, adaptées à la route (rallye ou expériences). | 626 |
| `ui_gameplaySelector_general.getDisplayDataOptions(routeName)` | Renvoie la définition des options d'affichage adaptée à la route : masque groupMode et clusterMode en mode rallye ou expériences, et masque groupModeRally et clusterModeRally ailleurs. | 725 |
| `ui_gameplaySelector_general.getFilters()` | Renvoie la définition des filtres après avoir chargé les données. | 671 |
| `ui_gameplaySelector_general.getGameplayData()` | Renvoie les données du sélecteur (tuiles dont validBackends contient gameplaySelector, filtres, options d'affichage), les recalcule si les mods ou les réglages ont changé, et les crée à la première demande. | 487 |
| `ui_gameplaySelector_general.getManagementDetails()` | Renvoie toujours { buttons = {} } (TODO dans le code). | 841 |
| `ui_gameplaySelector_general.getScreenHeaderTitleAndPath(path)` | Construit le titre de l'écran et le fil d'Ariane (menu, sélecteur de gameplay, segment de filtres ou recherche, cluster ou page découverte). Ajoute « (filtré) » au titre si des filtres ou une recherche sont actifs. | 746 |
| `ui_gameplaySelector_general.getSearchText()` | Renvoie le texte de recherche courant. | 712 |
| `ui_gameplaySelector_general.getTiles(path, routeName)` | Renvoie les groupes de tuiles pour un chemin, via ui_gameplaySelector_tiles.getTiles. | 510 |
| `ui_gameplaySelector_general.getUiData(routeName)` | Renvoie les données du sélecteur : items, displayData (adaptées à la route : rallye ou expériences), filterList, activeFilters, lockedFiltersByProp et backendName. Charge les tuiles si nécessaire. | 440 |
| `ui_gameplaySelector_general.goToMod(modId)` | Journalise seulement l'id du mod (non implémenté). | 867 |
| `ui_gameplaySelector_general.isFavourite(itemKey)` | Indique si une tuile est en favori. | 647 |
| `ui_gameplaySelector_general.isGameplayDataLoaded()` | Indique si les données ont déjà été construites et sont à jour. | 498 |
| `ui_gameplaySelector_general.isRecent(itemKey)` | Indique si une tuile fait partie des éléments récents. | 659 |
| `ui_gameplaySelector_general.navigateToCluster(input)` | Prépare puis ouvre l'écran d'un cluster de tuiles. Calcule les clés du chemin (gotoPath, keys ou la table elle-même) et un titre, mémorise la sélection en attente et navigue vers menu.gameplay.type (ou menu.experiencesSelector.type depuis le sélecteur d'expériences). | 582 |
| `ui_gameplaySelector_general.onClusterRouteEnter(context, toRoute, fromRoute, data)` | Hook de route appelé à l'entrée dans une route de cluster. Promeut la sélection préparée par navigateToCluster, sinon retombe sur le cluster par défaut. *(interne)* *(hook)* | 1130 |
| `ui_gameplaySelector_general.onClusterRouteMount(context, toRoute, fromRoute, data)` | Hook de route appelé au montage d'une route de cluster. Démarre le chargement asynchrone avec les clés et le titre du cluster actif. *(interne)* *(hook)* | 1142 |
| `ui_gameplaySelector_general.onModActivated()` | Hook appelé quand un mod est activé : marque les données comme à recalculer. *(interne)* *(hook)* | 504 |
| `ui_gameplaySelector_general.onModDeactivated()` | Hook appelé quand un mod est désactivé : marque les données comme à recalculer. *(interne)* *(hook)* | 503 |
| `ui_gameplaySelector_general.onModManagerReady()` | Hook appelé quand le gestionnaire de mods est prêt : marque les données comme à recalculer. *(interne)* *(hook)* | 505 |
| `ui_gameplaySelector_general.onModManagerStateChanged()` | Hook appelé quand l'état du gestionnaire de mods change : marque les données comme à recalculer. *(interne)* *(hook)* | 506 |
| `ui_gameplaySelector_general.onRouteMount(context, toRoute, fromRoute, data)` | Hook de route appelé au montage d'une route racine du sélecteur. Réinitialise la sélection de cluster, mémorise la route active et démarre le chargement asynchrone avec le chemin allGameplay. *(interne)* *(hook)* | 1122 |
| `ui_gameplaySelector_general.onSettingsChanged()` | Hook appelé quand les réglages changent : marque les données comme à recalculer. *(interne)* *(hook)* | 507 |
| `ui_gameplaySelector_general.openExperiencesSelector()` | Ouvre menu.experiencesSelector avec le filtre système quickStartExperiences. | 1184 |
| `ui_gameplaySelector_general.openGameplaySelector()` | Applique le préréglage de la route menu.gameplay (efface filtres et recherche) puis y navigue. | 1176 |
| `ui_gameplaySelector_general.openRallySelector()` | Ouvre menu.rallySelector avec les filtres de type rallyStage et rallyLoop. | 1180 |
| `ui_gameplaySelector_general.passesFilters(item)` | Indique si une tuile passe les filtres et la recherche ; une tuile isCareerOnly est refusée tant que displayData.showCareerContent est faux. | 610 |
| `ui_gameplaySelector_general.profilerFinish()` | Ne fait rien (TODO dans le code). *(interne)* | 817 |
| `ui_gameplaySelector_general.requestDetails(item, requestId)` | Construit les détails d'une tuile et les envoie à l'interface par l'évènement gameplaySelectorDetails avec backendName, requestId, item et details. | 596 |
| `ui_gameplaySelector_general.resetDisplayDataToDefaults(requestId)` | Remet les options d'affichage à leurs valeurs par défaut. Émet un instantané si requestId est fourni. | 737 |
| `ui_gameplaySelector_general.resetRangeFilter(filterKey, requestId)` | Réinitialise un filtre de plage. Émet un instantané si requestId est fourni. | 696 |
| `ui_gameplaySelector_general.resetSetFilter(filterKey, requestId)` | Réinitialise un filtre à choix multiples. Émet un instantané si requestId est fourni. | 704 |
| `ui_gameplaySelector_general.resolveClusterTitle(clusterTitle)` | Renvoie le titre du cluster actif, sinon clusterTitle s'il est une chaîne non vide, sinon nil. | 1158 |
| `ui_gameplaySelector_general.resolveCurrentSelectorPath()` | Renvoie le chemin de la vue courante : celui du cluster actif, sinon le chemin racine { keys = {"allGameplay"} }. | 1092 |
| `ui_gameplaySelector_general.setDisplayDataOption(key, value, requestId)` | Définit une option d'affichage et renvoie les données d'affichage à jour. Émet un instantané si requestId est fourni. | 729 |
| `ui_gameplaySelector_general.setSearchText(text, requestId)` | Définit le texte de recherche. Émet un instantané si requestId est fourni. | 716 |
| `ui_gameplaySelector_general.toggleFavourite(itemDetails)` | Bascule le statut de favori d'une tuile et renvoie le nouvel état. | 652 |
| `ui_gameplaySelector_general.toggleFilter(filterKey, value, requestId)` | Active ou désactive une valeur de filtre. Émet un instantané si requestId est fourni. | 680 |
| `ui_gameplaySelector_general.trackRecent(itemKey)` | Enregistre une tuile comme récemment utilisée. | 664 |
| `ui_gameplaySelector_general.updateDisplayData(key, value)` | Modifie une option d'affichage (displayDataInstance.setDisplayDataOption). | 631 |
| `ui_gameplaySelector_general.updateFilterData(key, value)` | Met à jour une donnée interne du module de filtres (filterInstance.updateData). | 636 |
| `ui_gameplaySelector_general.updateRangeFilter(filterKey, min, max, requestId)` | Fixe les bornes d'un filtre de plage. Émet un instantané si requestId est fourni. | 688 |

### Détail des paramètres

#### `ui_gameplaySelector_general.emitDisplayDataSnapshot(requestId)`

Reconstruit l'instantané de la vue courante (groupes, filtres, options d'affichage, détails de gestion, texte de recherche, en-tête) et l'envoie par l'évènement gameplaySelectorDisplayDataSnapshot avec le requestId. Renvoie false et journalise une erreur en cas d'échec.

- `requestId` (*any*) : Identifiant de requête de l'interface.
- **renvoie** : boolean true si l'évènement a été envoyé.

#### `ui_gameplaySelector_general.executeButton(buttonId, additionalData)`

Exécute le bouton de détails d'identifiant donné via le buttonModule.

- `buttonId` (*any*) : Identifiant du bouton.
- `additionalData` (*any*) : Données supplémentaires passées au callback.
- **renvoie** : any Résultat de buttonInstance.executeButton.

#### `ui_gameplaySelector_general.executeDoubleClick(item)`

Exécute le bouton marqué isDoubleClickAction des détails d'une tuile (ou l'unique bouton s'il n'y en a qu'un).

- `item` (*table*) : Données showDetails de la tuile.

#### `ui_gameplaySelector_general.exploreFolder(path)`

Journalise seulement le chemin (non implémenté).

- `path` (*string*) : Chemin de dossier.

#### `ui_gameplaySelector_general.getActiveFilters()`

Renvoie les filtres actifs.

- **renvoie** : table Filtres actifs.

#### `ui_gameplaySelector_general.getDetails(item)`

Construit les détails d'une tuile en émettant le hook onGameplaySelectorGetDetails et renvoie le premier bloc.

- `item` (*table*) : Données showDetails de la tuile.
- **renvoie** : table|nil Bloc de détails, nil si aucun générateur n'a répondu.

#### `ui_gameplaySelector_general.getDisplayData(routeName)`

Renvoie les options d'affichage effectives, adaptées à la route (rallye ou expériences).

- `routeName` (*string|nil*) : Nom de la route.
- **renvoie** : table Valeurs d'options par clé.

#### `ui_gameplaySelector_general.getDisplayDataOptions(routeName)`

Renvoie la définition des options d'affichage adaptée à la route : masque groupMode et clusterMode en mode rallye ou expériences, et masque groupModeRally et clusterModeRally ailleurs.

- `routeName` (*string|nil*) : Nom de la route (par défaut la route active).
- **renvoie** : table[] Options visibles.

#### `ui_gameplaySelector_general.getFilters()`

Renvoie la définition des filtres après avoir chargé les données.

- **renvoie** : table Résultat de filterInstance.getFilters().

#### `ui_gameplaySelector_general.getGameplayData()`

Renvoie les données du sélecteur (tuiles dont validBackends contient gameplaySelector, filtres, options d'affichage), les recalcule si les mods ou les réglages ont changé, et les crée à la première demande.

- **renvoie** : table Table items, filterList, activeFilters, lockedFiltersByProp, displayData.

#### `ui_gameplaySelector_general.getManagementDetails()`

Renvoie toujours { buttons = {} } (TODO dans le code).

- **renvoie** : table Table avec buttons vide.

#### `ui_gameplaySelector_general.getScreenHeaderTitleAndPath(path)`

Construit le titre de l'écran et le fil d'Ariane (menu, sélecteur de gameplay, segment de filtres ou recherche, cluster ou page découverte). Ajoute « (filtré) » au titre si des filtres ou une recherche sont actifs.

- `path` (*table*) : Chemin courant { keys = {...} }.
- **renvoie** : table Table title, isFiltered, pathSegments.

#### `ui_gameplaySelector_general.getSearchText()`

Renvoie le texte de recherche courant.

- **renvoie** : string|nil Texte saisi.

#### `ui_gameplaySelector_general.getTiles(path, routeName)`

Renvoie les groupes de tuiles pour un chemin, via ui_gameplaySelector_tiles.getTiles.

- `path` (*table*) : Chemin de navigation { keys = {...} }.
- `routeName` (*string|nil*) : Nom de la route.
- **renvoie** : table[] Groupes de tuiles.

#### `ui_gameplaySelector_general.getUiData(routeName)`

Renvoie les données du sélecteur : items, displayData (adaptées à la route : rallye ou expériences), filterList, activeFilters, lockedFiltersByProp et backendName. Charge les tuiles si nécessaire.

- `routeName` (*string|nil*) : Nom de la route, pour adapter groupMode et clusterMode.
- **renvoie** : table Table de données d'interface.

#### `ui_gameplaySelector_general.goToMod(modId)`

Journalise seulement l'id du mod (non implémenté).

- `modId` (*string*) : Identifiant du mod.

#### `ui_gameplaySelector_general.isFavourite(itemKey)`

Indique si une tuile est en favori.

- `itemKey` (*string*) : Clé de la tuile.
- **renvoie** : boolean true si favori.

#### `ui_gameplaySelector_general.isGameplayDataLoaded()`

Indique si les données ont déjà été construites et sont à jour.

- **renvoie** : boolean|nil Vrai si chargées et non invalidées (nil ou false sinon).

#### `ui_gameplaySelector_general.isRecent(itemKey)`

Indique si une tuile fait partie des éléments récents.

- `itemKey` (*string*) : Clé de la tuile.
- **renvoie** : boolean true si récente.

#### `ui_gameplaySelector_general.navigateToCluster(input)`

Prépare puis ouvre l'écran d'un cluster de tuiles. Calcule les clés du chemin (gotoPath, keys ou la table elle-même) et un titre, mémorise la sélection en attente et navigue vers menu.gameplay.type (ou menu.experiencesSelector.type depuis le sélecteur d'expériences).

- `input` (*table*) : Table de tuile ou de chemin : gotoPath, keys, ou liste de clés ; name, label ou title pour le titre.
- **renvoie** : any Résultat de ui_router.navigate.

#### `ui_gameplaySelector_general.onClusterRouteEnter(context, toRoute, fromRoute, data)`

Hook de route appelé à l'entrée dans une route de cluster. Promeut la sélection préparée par navigateToCluster, sinon retombe sur le cluster par défaut.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table|nil*) : Route de départ.
- `data` (*table*) : Données de route.

#### `ui_gameplaySelector_general.onClusterRouteMount(context, toRoute, fromRoute, data)`

Hook de route appelé au montage d'une route de cluster. Démarre le chargement asynchrone avec les clés et le titre du cluster actif.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*table*) : Route d'arrivée (name utilisé).
- `fromRoute` (*table|nil*) : Route de départ.
- `data` (*table*) : Données de route.

#### `ui_gameplaySelector_general.onRouteMount(context, toRoute, fromRoute, data)`

Hook de route appelé au montage d'une route racine du sélecteur. Réinitialise la sélection de cluster, mémorise la route active et démarre le chargement asynchrone avec le chemin allGameplay.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*table*) : Route d'arrivée (name utilisé).
- `fromRoute` (*table|nil*) : Route de départ.
- `data` (*table*) : Données de route (non utilisées).

#### `ui_gameplaySelector_general.passesFilters(item)`

Indique si une tuile passe les filtres et la recherche ; une tuile isCareerOnly est refusée tant que displayData.showCareerContent est faux.

- `item` (*table*) : Tuile testée.
- **renvoie** : boolean true si la tuile est affichée.

#### `ui_gameplaySelector_general.requestDetails(item, requestId)`

Construit les détails d'une tuile et les envoie à l'interface par l'évènement gameplaySelectorDetails avec backendName, requestId, item et details.

- `item` (*table*) : Données showDetails de la tuile.
- `requestId` (*any*) : Identifiant de requête de l'interface.
- **renvoie** : table Le payload envoyé.

#### `ui_gameplaySelector_general.resetDisplayDataToDefaults(requestId)`

Remet les options d'affichage à leurs valeurs par défaut. Émet un instantané si requestId est fourni.

- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : table Données d'affichage.

#### `ui_gameplaySelector_general.resetRangeFilter(filterKey, requestId)`

Réinitialise un filtre de plage. Émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : any Résultat de filterInstance.resetRangeFilter.

#### `ui_gameplaySelector_general.resetSetFilter(filterKey, requestId)`

Réinitialise un filtre à choix multiples. Émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : any Résultat de filterInstance.resetSetFilter.

#### `ui_gameplaySelector_general.resolveClusterTitle(clusterTitle)`

Renvoie le titre du cluster actif, sinon clusterTitle s'il est une chaîne non vide, sinon nil.

- `clusterTitle` (*string|nil*) : Titre de repli.
- **renvoie** : string|nil Titre résolu.

#### `ui_gameplaySelector_general.resolveCurrentSelectorPath()`

Renvoie le chemin de la vue courante : celui du cluster actif, sinon le chemin racine { keys = {"allGameplay"} }.

- **renvoie** : table Chemin { keys = {...} }.

#### `ui_gameplaySelector_general.setDisplayDataOption(key, value, requestId)`

Définit une option d'affichage et renvoie les données d'affichage à jour. Émet un instantané si requestId est fourni.

- `key` (*string*) : Clé de l'option.
- `value` (*any*) : Valeur.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : table Données d'affichage.

#### `ui_gameplaySelector_general.setSearchText(text, requestId)`

Définit le texte de recherche. Émet un instantané si requestId est fourni.

- `text` (*string*) : Texte de recherche.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : any Résultat de filterInstance.setSearchText.

#### `ui_gameplaySelector_general.toggleFavourite(itemDetails)`

Bascule le statut de favori d'une tuile et renvoie le nouvel état.

- `itemDetails` (*table*) : Table avec le champ key.
- **renvoie** : boolean Nouvel état de favori.

#### `ui_gameplaySelector_general.toggleFilter(filterKey, value, requestId)`

Active ou désactive une valeur de filtre. Émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `value` (*any*) : Valeur de l'option.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : any Résultat de filterInstance.toggleFilter.

#### `ui_gameplaySelector_general.trackRecent(itemKey)`

Enregistre une tuile comme récemment utilisée.

- `itemKey` (*string*) : Clé de la tuile.

#### `ui_gameplaySelector_general.updateDisplayData(key, value)`

Modifie une option d'affichage (displayDataInstance.setDisplayDataOption).

- `key` (*string*) : Clé de l'option.
- `value` (*any*) : Nouvelle valeur.

#### `ui_gameplaySelector_general.updateFilterData(key, value)`

Met à jour une donnée interne du module de filtres (filterInstance.updateData).

- `key` (*string*) : Clé de donnée.
- `value` (*any*) : Valeur.

#### `ui_gameplaySelector_general.updateRangeFilter(filterKey, min, max, requestId)`

Fixe les bornes d'un filtre de plage. Émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `min` (*number*) : Borne basse.
- `max` (*number*) : Borne haute.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : any Résultat de filterInstance.updateRangeFilter.

## Champs

| Champ | Type | Description |
|---|---|---|
| `backendName` | string | Nom du backend : « gameplaySelector ». |
| `dependencies` | string[] | Extensions chargées avant celle-ci : ui_gameplaySelector_tiles et core_locales. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplaySelectorGetDetails` — écouté par 5 module(s)
- `onGameplaySelectorGetTiles` — écouté par 5 module(s)

**Évènements UI (guihooks.trigger) :** `GameplaySelectorDataLoaded`, `gameplaySelectorDetails`, `gameplaySelectorDisplayDataSnapshot`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gameplaySelector/general.lua`.*
