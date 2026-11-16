# `ui_freeroamSelector_general`

*Fichier : `lua/ge/extensions/ui/freeroamSelector/general.lua` · VM : Game Engine (GE) · 847 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_freeroamSelector_general` : `extensions.load("ui_freeroamSelector_general")`, puis la globale `ui_freeroamSelector_general`

Backend « freeroamSelector » du sélecteur en grille (gridSelector) : l'écran où l'on choisit un niveau et un point d'apparition pour le mode libre. Il collecte les tuiles via le hook onGameplaySelectorGetTiles (en gardant celles dont validBackends contient freeroamSelector), gère filtres (source, taille de carte, région), recherche, favoris, récents et options d'affichage (sauvegardées dans /settings/freeroamSelectorData.json), construit les détails des tuiles via onGameplaySelectorGetDetails et renvoie des instantanés à l'interface par guihooks. Il connaît aussi les routes de l'assistant freeroam (niveau, véhicule, options, multijoueur) en menu et en pause.

## Exemple

```lua
-- ouvrir le sélecteur pour choisir un point d'apparition et recevoir le choix
ui_freeroamSelector_general.openFreeroamSelectorForFreeroamConfigurator(function(levelName, spawnPointName)
  log('I', 'mod', levelName .. ' / ' .. tostring(spawnPointName))
end)
```

## Remarques

- Les tuiles et filtres sont recalculés au prochain accès quand gameplayDataChanged est vrai : cela arrive sur onModActivated, onModDeactivated, onModManagerReady, onModManagerStateChanged, onSettingsChanged et onLanguageChanged.
- Filtres définis : source (official, mod), mapSize (paliers 0, 1024², 2048², 4096², 8192², 16384² ; l'aire du niveau est comparée aux paliers) et region. La recherche texte porte sur le nom, le niveau, les valeurs de propriétés traduites et le hook de filtre éventuel de la tuile (item.filterHook).
- Options d'affichage : groupMode, clusterMode, displaySize (list, tiny, small, medium, large, huge ; sauvegardée), showAuxContent (sauvegardée), sorting, showRecentMode, showFavouritesMode et defaultFreeroamAction (« startFreeroam » ou « configureFreeroam », défaut « configureFreeroam », sauvegardée). La version des données est 13.
- Plusieurs fonctions acceptent un requestId optionnel : s'il est fourni, un instantané est émis par freeroamSelectorDisplayDataSnapshot pour que l'interface Vue ignore les réponses périmées.
- Le chemin racine par défaut est { keys = {"allFreeroam"} }, alors que les fils d'Ariane utilisent « allGameplay » : tiles.getTiles traite tout chemin inconnu comme allGameplay, donc le résultat est identique.
- getDisplayDataOptions, setDisplayDataOption, resetDisplayDataToDefaults et updateFilterData n'appellent pas ensureInstances : ils supposent que les instances ont déjà été créées (par getGameplayData, getDisplayData…), sinon erreur sur nil.
- exploreFolder et goToMod ne font que journaliser (TODO) ; getManagementDetails renvoie toujours { buttons = {} } et profilerFinish ne fait rien.
- Dans getScreenHeaderTitleAndPath, string.format("%s", clusterKey, groupKey, groupName) reçoit des arguments en trop (ignorés).
- Le champ M.displayDataInstance est aussi exposé après la première initialisation.

**Dépendances (chargées avant) :** `ui_gameplaySelector_tiles`, `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_freeroamSelector_general.clearAllFilters(requestId)` | Efface tous les filtres. Émet un instantané si requestId est fourni. | 446 |
| `ui_freeroamSelector_general.closedFromUI()` | Appelé quand l'interface ferme le sélecteur : vide les boutons de détails personnalisés et le chemin racine personnalisé, puis émet le hook onFreeroamSelectorClosed. *(interne)* | 643 |
| `ui_freeroamSelector_general.emitDisplayDataSnapshot(requestId)` | Reconstruit l'instantané de la vue courante (ui_gridSelector.getSelectorSnapshot, sous pcall) et l'envoie à l'interface par l'évènement freeroamSelectorDisplayDataSnapshot avec le requestId. Journalise une erreur et renvoie false en cas d'échec. | 733 |
| `ui_freeroamSelector_general.executeButton(buttonId, additionalData)` | Exécute le bouton de détails d'identifiant donné via le buttonModule. | 758 |
| `ui_freeroamSelector_general.executeDoubleClick(item)` | Exécute le bouton marqué isDoubleClickAction des détails d'une tuile (ou l'unique bouton s'il n'y en a qu'un). | 770 |
| `ui_freeroamSelector_general.exitCallback()` | Ne fait rien. *(interne)* | 767 |
| `ui_freeroamSelector_general.exploreFolder(path)` | Journalise seulement le chemin (non implémenté). | 783 |
| `ui_freeroamSelector_general.getActiveFilters()` | Renvoie les filtres actifs. | 488 |
| `ui_freeroamSelector_general.getCustomDetailsButtons()` | Renvoie les boutons de détails personnalisés (utilisé par levelTiles). | 754 |
| `ui_freeroamSelector_general.getDetails(item)` | Construit les détails d'une tuile en émettant le hook onGameplaySelectorGetDetails (les générateurs de tuiles y ajoutent leur bloc) et renvoie le premier bloc. | 652 |
| `ui_freeroamSelector_general.getDisplayData()` | Renvoie les options d'affichage courantes (crée les instances si besoin). | 429 |
| `ui_freeroamSelector_general.getDisplayDataOptions()` | Renvoie la définition des options d'affichage. Les instances doivent déjà exister. | 544 |
| `ui_freeroamSelector_general.getFilters()` | Renvoie la définition des filtres (liste, filtres verrouillés) après avoir chargé les données. | 483 |
| `ui_freeroamSelector_general.getGameplayData()` | Renvoie les données du sélecteur (tuiles filtrées par validBackends, filtres, options d'affichage), les recalcule si les mods, les réglages ou la langue ont changé, et les crée à la première demande. | 382 |
| `ui_freeroamSelector_general.getManagementDetails()` | Renvoie toujours { buttons = {} } (TODO dans le code). | 762 |
| `ui_freeroamSelector_general.getScreenHeaderTitleAndPath(path)` | Construit le titre de l'écran et le fil d'Ariane (menu, sélecteur freeroam, éventuel segment de filtres ou recherche, niveau ou groupe courant). Utilise customRootPath s'il a été défini par openFreeroamSelectorForFreeroamConfigurator. | 566 |
| `ui_freeroamSelector_general.getSearchText()` | Renvoie le texte de recherche courant. | 531 |
| `ui_freeroamSelector_general.getTiles(path)` | Renvoie les groupes de tuiles pour un chemin, via ui_gameplaySelector_tiles.getTiles. Efface le libellé du premier groupe s'il vaut « freeroam ». | 403 |
| `ui_freeroamSelector_general.getUiData()` | Renvoie les données du sélecteur : items, displayData, filterList, activeFilters, lockedFiltersByProp et backendName. Charge les tuiles si nécessaire. | 330 |
| `ui_freeroamSelector_general.goToMod(modId)` | Journalise seulement l'id du mod (non implémenté). | 788 |
| `ui_freeroamSelector_general.isFavourite(itemKey)` | Indique si une tuile est en favori. | 455 |
| `ui_freeroamSelector_general.isRecent(itemKey)` | Indique si une tuile fait partie des éléments récents. | 469 |
| `ui_freeroamSelector_general.onLanguageChanged()` | Hook appelé quand la langue change : marque les données comme à recalculer. *(interne)* *(hook)* | 400 |
| `ui_freeroamSelector_general.onModActivated()` | Hook appelé quand un mod est activé : marque les données comme à recalculer. *(interne)* *(hook)* | 396 |
| `ui_freeroamSelector_general.onModDeactivated()` | Hook appelé quand un mod est désactivé : marque les données comme à recalculer. *(interne)* *(hook)* | 395 |
| `ui_freeroamSelector_general.onModManagerReady()` | Hook appelé quand le gestionnaire de mods est prêt : marque les données comme à recalculer. *(interne)* *(hook)* | 397 |
| `ui_freeroamSelector_general.onModManagerStateChanged()` | Hook appelé quand l'état du gestionnaire de mods change : marque les données comme à recalculer. *(interne)* *(hook)* | 398 |
| `ui_freeroamSelector_general.onSettingsChanged()` | Hook appelé quand les réglages changent : marque les données comme à recalculer. *(interne)* *(hook)* | 399 |
| `ui_freeroamSelector_general.openFreeroamSelector()` | Efface les filtres, règle groupMode sur « system » et clusterMode sur « automatic », active le filtre système « freeroam » et navigue vers la route « menu.gameplay ». | 794 |
| `ui_freeroamSelector_general.openFreeroamSelectorForFreeroamConfigurator(callback)` | Ouvre le sélecteur pour choisir un point d'apparition : installe un bouton « Select spawnpoint » dont le callback reçoit (levelName, spawnPointName), définit un fil d'Ariane propre, navigue vers « menu.freeroamselector » et émet le hook onFreeroamSelectorOpen. | 817 |
| `ui_freeroamSelector_general.openFromPause()` | Ouvre l'assistant freeroam depuis le menu pause, sur l'étape configurée dans le réglage freeroamSetupDefaultStep (level par défaut ; level, vehicle, options ou multiplayer), avec returnRoute = « pause ». | 809 |
| `ui_freeroamSelector_general.passesFilters(item)` | Indique si une tuile passe les filtres, la recherche et l'option showAuxContent ; une tuile isCareerOnly est refusée tant que displayData.showCareerContent est faux. | 413 |
| `ui_freeroamSelector_general.profilerFinish()` | Ne fait rien (TODO dans le code). *(interne)* | 639 |
| `ui_freeroamSelector_general.requestDetails(item, requestId)` | Construit les détails d'une tuile et les envoie à l'interface par l'évènement freeroamSelectorDetails, avec backendName, requestId, item et details. | 665 |
| `ui_freeroamSelector_general.resetDisplayDataToDefaults(requestId)` | Remet les options d'affichage à leurs valeurs par défaut. Émet un instantané si requestId est fourni. | 556 |
| `ui_freeroamSelector_general.resetRangeFilter(filterKey, requestId)` | Réinitialise un filtre de plage. Émet un instantané si requestId est fourni. | 515 |
| `ui_freeroamSelector_general.resetSetFilter(filterKey, requestId)` | Réinitialise un filtre à choix multiples. Émet un instantané si requestId est fourni. | 523 |
| `ui_freeroamSelector_general.resolveCurrentSelectorPath()` | Renvoie le chemin de la vue courante, ou le chemin racine par défaut { keys = {"allFreeroam"} } si aucun n'a été mémorisé. | 719 |
| `ui_freeroamSelector_general.setCurrentSelectorPath(path)` | Mémorise le chemin de la vue visible, pour que emitDisplayDataSnapshot reconstruise l'instantané sur le bon chemin. Un chemin invalide est ignoré ; nil revient au chemin racine. | 705 |
| `ui_freeroamSelector_general.setCustomDetailsButtons(buttons)` | Remplace les boutons de détails par une liste personnalisée (nil la vide). Chaque bouton a callback(levelName, spawnPointName, key) et meta (label, icon, primary, isDoubleClickAction, trackRecent). | 750 |
| `ui_freeroamSelector_general.setDisplayDataOption(key, value, requestId)` | Définit une option d'affichage et renvoie les données d'affichage à jour. Émet un instantané si requestId est fourni. Utilisé par exemple par levelTiles.setAlwaysShowDialogue. | 548 |
| `ui_freeroamSelector_general.setSearchText(text, requestId)` | Définit le texte de recherche. Émet un instantané si requestId est fourni. | 535 |
| `ui_freeroamSelector_general.toggleFavourite(itemDetails)` | Bascule le statut de favori d'une tuile et renvoie le nouvel état. | 461 |
| `ui_freeroamSelector_general.toggleFilter(filterKey, value, requestId)` | Active ou désactive une valeur de filtre. Émet un instantané si requestId est fourni. | 499 |
| `ui_freeroamSelector_general.trackRecent(itemKey)` | Enregistre une tuile comme récemment utilisée. | 475 |
| `ui_freeroamSelector_general.updateDisplayData(key, value)` | Modifie une option d'affichage (displayDataInstance.setDisplayDataOption). | 435 |
| `ui_freeroamSelector_general.updateFilterData(key, value)` | Met à jour une donnée interne du module de filtres (filterInstance.updateData). | 441 |
| `ui_freeroamSelector_general.updateFilters(newFilters)` | Applique directement une table complète filterByProp, par exemple pour restaurer l'état sauvegardé de l'assistant sans rejouer les clics. Les filtres verrouillés sont conservés. | 495 |
| `ui_freeroamSelector_general.updateRangeFilter(filterKey, min, max, requestId)` | Fixe les bornes d'un filtre de plage. Émet un instantané si requestId est fourni. | 507 |

### Détail des paramètres

#### `ui_freeroamSelector_general.clearAllFilters(requestId)`

Efface tous les filtres. Émet un instantané si requestId est fourni.

- `requestId` (*any|nil*) : Identifiant de requête de l'interface.

#### `ui_freeroamSelector_general.emitDisplayDataSnapshot(requestId)`

Reconstruit l'instantané de la vue courante (ui_gridSelector.getSelectorSnapshot, sous pcall) et l'envoie à l'interface par l'évènement freeroamSelectorDisplayDataSnapshot avec le requestId. Journalise une erreur et renvoie false en cas d'échec.

- `requestId` (*any*) : Identifiant de requête de l'interface.
- **renvoie** : boolean true si l'évènement a été envoyé.

#### `ui_freeroamSelector_general.executeButton(buttonId, additionalData)`

Exécute le bouton de détails d'identifiant donné via le buttonModule.

- `buttonId` (*any*) : Identifiant du bouton.
- `additionalData` (*any*) : Données supplémentaires passées au callback.
- **renvoie** : any Résultat de buttonInstance.executeButton.

#### `ui_freeroamSelector_general.executeDoubleClick(item)`

Exécute le bouton marqué isDoubleClickAction des détails d'une tuile (ou l'unique bouton s'il n'y en a qu'un).

- `item` (*table*) : Données showDetails de la tuile.

#### `ui_freeroamSelector_general.exploreFolder(path)`

Journalise seulement le chemin (non implémenté).

- `path` (*string*) : Chemin de dossier.

#### `ui_freeroamSelector_general.getActiveFilters()`

Renvoie les filtres actifs.

- **renvoie** : table Filtres actifs.

#### `ui_freeroamSelector_general.getCustomDetailsButtons()`

Renvoie les boutons de détails personnalisés (utilisé par levelTiles).

- **renvoie** : table Liste de boutons, vide par défaut.

#### `ui_freeroamSelector_general.getDetails(item)`

Construit les détails d'une tuile en émettant le hook onGameplaySelectorGetDetails (les générateurs de tuiles y ajoutent leur bloc) et renvoie le premier bloc.

- `item` (*table*) : Données showDetails de la tuile.
- **renvoie** : table|nil Bloc de détails, nil si aucun générateur n'a répondu.

#### `ui_freeroamSelector_general.getDisplayData()`

Renvoie les options d'affichage courantes (crée les instances si besoin).

- **renvoie** : table Valeurs d'options par clé.

#### `ui_freeroamSelector_general.getDisplayDataOptions()`

Renvoie la définition des options d'affichage. Les instances doivent déjà exister.

- **renvoie** : table Options d'affichage.

#### `ui_freeroamSelector_general.getFilters()`

Renvoie la définition des filtres (liste, filtres verrouillés) après avoir chargé les données.

- **renvoie** : table Résultat de filterInstance.getFilters().

#### `ui_freeroamSelector_general.getGameplayData()`

Renvoie les données du sélecteur (tuiles filtrées par validBackends, filtres, options d'affichage), les recalcule si les mods, les réglages ou la langue ont changé, et les crée à la première demande.

- **renvoie** : table Table items, filterList, activeFilters, lockedFiltersByProp, displayData.

#### `ui_freeroamSelector_general.getManagementDetails()`

Renvoie toujours { buttons = {} } (TODO dans le code).

- **renvoie** : table Table avec buttons vide.

#### `ui_freeroamSelector_general.getScreenHeaderTitleAndPath(path)`

Construit le titre de l'écran et le fil d'Ariane (menu, sélecteur freeroam, éventuel segment de filtres ou recherche, niveau ou groupe courant). Utilise customRootPath s'il a été défini par openFreeroamSelectorForFreeroamConfigurator.

- `path` (*table*) : Chemin courant { keys = {...} }.
- **renvoie** : table Table title, isFiltered, pathSegments.

#### `ui_freeroamSelector_general.getSearchText()`

Renvoie le texte de recherche courant.

- **renvoie** : string|nil Texte saisi.

#### `ui_freeroamSelector_general.getTiles(path)`

Renvoie les groupes de tuiles pour un chemin, via ui_gameplaySelector_tiles.getTiles. Efface le libellé du premier groupe s'il vaut « freeroam ».

- `path` (*table*) : Chemin de navigation { keys = {...} }.
- **renvoie** : table[] Groupes de tuiles.

#### `ui_freeroamSelector_general.getUiData()`

Renvoie les données du sélecteur : items, displayData, filterList, activeFilters, lockedFiltersByProp et backendName. Charge les tuiles si nécessaire.

- **renvoie** : table Table de données d'interface.

#### `ui_freeroamSelector_general.goToMod(modId)`

Journalise seulement l'id du mod (non implémenté).

- `modId` (*string*) : Identifiant du mod.

#### `ui_freeroamSelector_general.isFavourite(itemKey)`

Indique si une tuile est en favori.

- `itemKey` (*string*) : Clé de la tuile.
- **renvoie** : boolean true si favori.

#### `ui_freeroamSelector_general.isRecent(itemKey)`

Indique si une tuile fait partie des éléments récents.

- `itemKey` (*string*) : Clé de la tuile.
- **renvoie** : boolean true si récente.

#### `ui_freeroamSelector_general.openFreeroamSelectorForFreeroamConfigurator(callback)`

Ouvre le sélecteur pour choisir un point d'apparition : installe un bouton « Select spawnpoint » dont le callback reçoit (levelName, spawnPointName), définit un fil d'Ariane propre, navigue vers « menu.freeroamselector » et émet le hook onFreeroamSelectorOpen.

- `callback` (*function*) : Fonction appelée avec levelName et spawnPointName lors du choix.

#### `ui_freeroamSelector_general.passesFilters(item)`

Indique si une tuile passe les filtres, la recherche et l'option showAuxContent ; une tuile isCareerOnly est refusée tant que displayData.showCareerContent est faux.

- `item` (*table*) : Tuile testée.
- **renvoie** : boolean true si la tuile est affichée.

#### `ui_freeroamSelector_general.requestDetails(item, requestId)`

Construit les détails d'une tuile et les envoie à l'interface par l'évènement freeroamSelectorDetails, avec backendName, requestId, item et details.

- `item` (*table*) : Données showDetails de la tuile.
- `requestId` (*any*) : Identifiant de requête de l'interface.
- **renvoie** : table Le payload envoyé.

#### `ui_freeroamSelector_general.resetDisplayDataToDefaults(requestId)`

Remet les options d'affichage à leurs valeurs par défaut. Émet un instantané si requestId est fourni.

- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : table Données d'affichage.

#### `ui_freeroamSelector_general.resetRangeFilter(filterKey, requestId)`

Réinitialise un filtre de plage. Émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : any Résultat de filterInstance.resetRangeFilter.

#### `ui_freeroamSelector_general.resetSetFilter(filterKey, requestId)`

Réinitialise un filtre à choix multiples. Émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : any Résultat de filterInstance.resetSetFilter.

#### `ui_freeroamSelector_general.resolveCurrentSelectorPath()`

Renvoie le chemin de la vue courante, ou le chemin racine par défaut { keys = {"allFreeroam"} } si aucun n'a été mémorisé.

- **renvoie** : table Copie du chemin.

#### `ui_freeroamSelector_general.setCurrentSelectorPath(path)`

Mémorise le chemin de la vue visible, pour que emitDisplayDataSnapshot reconstruise l'instantané sur le bon chemin. Un chemin invalide est ignoré ; nil revient au chemin racine.

- `path` (*table|nil*) : Chemin { keys = {...} } (clés chaînes non vides).

#### `ui_freeroamSelector_general.setCustomDetailsButtons(buttons)`

Remplace les boutons de détails par une liste personnalisée (nil la vide). Chaque bouton a callback(levelName, spawnPointName, key) et meta (label, icon, primary, isDoubleClickAction, trackRecent).

- `buttons` (*table|nil*) : Liste de boutons.

#### `ui_freeroamSelector_general.setDisplayDataOption(key, value, requestId)`

Définit une option d'affichage et renvoie les données d'affichage à jour. Émet un instantané si requestId est fourni. Utilisé par exemple par levelTiles.setAlwaysShowDialogue.

- `key` (*string*) : Clé de l'option.
- `value` (*any*) : Valeur.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : table Données d'affichage.

#### `ui_freeroamSelector_general.setSearchText(text, requestId)`

Définit le texte de recherche. Émet un instantané si requestId est fourni.

- `text` (*string*) : Texte de recherche.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : any Résultat de filterInstance.setSearchText.

#### `ui_freeroamSelector_general.toggleFavourite(itemDetails)`

Bascule le statut de favori d'une tuile et renvoie le nouvel état.

- `itemDetails` (*table*) : Table avec le champ key.
- **renvoie** : boolean Nouvel état de favori.

#### `ui_freeroamSelector_general.toggleFilter(filterKey, value, requestId)`

Active ou désactive une valeur de filtre. Émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `value` (*any*) : Valeur de l'option.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : any Résultat de filterInstance.toggleFilter.

#### `ui_freeroamSelector_general.trackRecent(itemKey)`

Enregistre une tuile comme récemment utilisée.

- `itemKey` (*string*) : Clé de la tuile.

#### `ui_freeroamSelector_general.updateDisplayData(key, value)`

Modifie une option d'affichage (displayDataInstance.setDisplayDataOption).

- `key` (*string*) : Clé de l'option.
- `value` (*any*) : Nouvelle valeur.

#### `ui_freeroamSelector_general.updateFilterData(key, value)`

Met à jour une donnée interne du module de filtres (filterInstance.updateData).

- `key` (*string*) : Clé de donnée.
- `value` (*any*) : Valeur.

#### `ui_freeroamSelector_general.updateFilters(newFilters)`

Applique directement une table complète filterByProp, par exemple pour restaurer l'état sauvegardé de l'assistant sans rejouer les clics. Les filtres verrouillés sont conservés.

- `newFilters` (*table*) : Forme filterByProp.
- **renvoie** : any Résultat de filterInstance.updateFilters.

#### `ui_freeroamSelector_general.updateRangeFilter(filterKey, min, max, requestId)`

Fixe les bornes d'un filtre de plage. Émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `min` (*number*) : Borne basse.
- `max` (*number*) : Borne haute.
- `requestId` (*any|nil*) : Identifiant de requête.
- **renvoie** : any Résultat de filterInstance.updateRangeFilter.

## Champs

| Champ | Type | Description |
|---|---|---|
| `backendName` | string | Nom du backend : « freeroamSelector ». |
| `dependencies` | string[] | Extensions chargées avant celle-ci : ui_gameplaySelector_tiles et core_locales. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onFreeroamSelectorClosed`
- `onFreeroamSelectorOpen`
- `onGameplaySelectorGetDetails` — écouté par 5 module(s)
- `onGameplaySelectorGetTiles` — écouté par 5 module(s)

**Évènements UI (guihooks.trigger) :** `freeroamSelectorDetails`, `freeroamSelectorDisplayDataSnapshot`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/freeroamSelector/general.lua`.*
