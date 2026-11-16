# `ui_vehicleSelector_general`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/general.lua` · VM : Game Engine (GE) · 2046 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_general` : `extensions.load("ui_vehicleSelector_general")`, puis la globale `ui_vehicleSelector_general`

Module central du sélecteur de véhicules (backend « vehicleSelector » de ui_gridSelector). Il construit les données UI (modèles, configs, filtres), gère les options d'affichage persistées (/settings/vehicleSelectorData.json), les filtres, la recherche, les favoris et véhicules récents, puis ouvre le sélecteur dans différents contextes (freeroam, garage, défi, configurateur, pause) en changeant les boutons et la racine du fil d'Ariane. Il pilote aussi le cycle de vie des routes pause/garage (liste racine et page détail d'un véhicule) et envoie les instantanés à l'interface. La plupart des fonctions de filtre et de détail délèguent à filterModule, displayDataModule, ui_vehicleSelector_tiles et ui_vehicleSelector_detailsInteraction.

## Exemple

```lua
-- ouvrir le sélecteur depuis un script et récupérer le choix
ui_vehicleSelector_general.openVehicleSelectorForChallenge(function(model, config, extra)
  if model then log('I', '', model .. ' / ' .. tostring(config)) end
end)
```

## Remarques

- Les instances displayData et filtres sont créées à la demande (setupInstances / ensureInstances) ; la version de format des options d'affichage est 11.
- Les données UI (getUiData) sont reconstruites quand vehicleDataChanged vaut true (mod activé ou désactivé, gestionnaire de mods, changement de langue, clearCache).
- Filtres : propriétés autorisées = Drivetrain, Config Type, Body Style, Transmission, Weight, Top Speed, 0-100 km/h, 0-60 mph, Power, Torque, Weight/Power, Years, Value, Brand, Country, Region, Source, Type, Derby Class, Performance Class, Off-Road Score, Propulsion, Fuel Type, Induction Type, Commercial Class. Les filtres de plage sont Value, Weight, Top Speed, 0-100 km/h, 0-60 mph, Power, Torque, Weight/Power, Off-Road Score, Years ; Region est un filtre de type dictionnaire.
- Les configs 'Powerglow' sont exclues sauf en mode de restriction 'lightRunner' (seulement Powerglow, Car ou Truck). Le mode 'busRoute' ne garde que Body Style = Bus et Commercial Class = Transit Bus.
- Le mode spawnOnly est remis à false en quittant la famille de routes du sélecteur, et à la fermeture (closedFromUI).
- La plupart des fonctions qui acceptent un requestId émettent ensuite un instantané 'vehicleSelectorDisplayDataSnapshot' ; sans requestId (nil) rien n'est émis.
- Bug probable : dans vehiclePassesFilters, le test de plage `not type(propVal) == 'number'` est toujours faux (priorité de `not`), il ne protège donc pas des valeurs non numériques.
- Bug probable : vehiclePassesFilters lit config.infoFilename sans vérifier que config existe (le code prévoit pourtant le cas « pas de config » juste avant) : erreur si showCustomPCFiles est désactivé et config nil.
- M.getDisplayData est défini deux fois (même comportement). Le champ M.p est un faux profileur (start, add, finish vides) ; profilerFinish ne fait rien car M.p.timer n'existe pas.
- Traces de débogage laissées : navigateToVehicle fait des dump(), et le callback de openVehicleSelectorForFreeroamModal dump ses 4 arguments.

**Dépendances (chargées avant) :** `core_vehicles`, `ui_vehicleSelector_detailsInteraction`, `ui_vehicleSelector_tiles`, `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_general.asyncVehicleLoadComplete()` | Hook appelé par util_asyncBulkLoader quand le chargement asynchrone des véhicules est fini : construit et émet l'instantané en attente (VehicleSelectorDataLoaded), sauf si la route a changé entre-temps. *(interne)* | 1819 |
| `ui_vehicleSelector_general.calculateActiveFilters(...)` | Recalcule la liste des filtres actifs (délègue au module de filtres). | 934 |
| `ui_vehicleSelector_general.clearAllFilters(...)` | Efface tous les filtres non verrouillés. | 925 |
| `ui_vehicleSelector_general.clearCache()` | Force la reconstruction des données UI et des options d'affichage au prochain accès. | 747 |
| `ui_vehicleSelector_general.clearDrilldownSelectorState()` | Réinitialise la sélection de véhicule en attente ou active et le chemin posé par setCurrentSelectorPath, pour qu'un nouvel instantané ne se reconstruise pas sur un ancien véhicule. | 1491 |
| `ui_vehicleSelector_general.clearLockedFilters(...)` | Supprime tous les verrous de filtres. | 933 |
| `ui_vehicleSelector_general.closedFromUI()` | À appeler à la fermeture du sélecteur : réinitialise racine du fil d'Ariane, spawn-only, état du détail, filtres verrouillés, boutons, callback de sortie, puis émet le hook onVehicleSelectorClosed. | 832 |
| `ui_vehicleSelector_general.consumeFocusSearchOnOpen()` | Renvoie puis remet à false l'indicateur « focaliser la recherche à l'ouverture » posé par openFromPause. | 1377 |
| `ui_vehicleSelector_general.createFilters(...)` | Construit la liste des filtres UI (types range ou set) à partir d'une liste de configs, selon la liste blanche de propriétés. | 937 |
| `ui_vehicleSelector_general.emitDisplayDataSnapshot(requestId)` | Reconstruit l'instantané du sélecteur pour le chemin courant et l'envoie par 'vehicleSelectorDisplayDataSnapshot'. | 2020 |
| `ui_vehicleSelector_general.emptyProfiler()` | Crée un faux profileur dont start, add et finish ne font rien. | 588 |
| `ui_vehicleSelector_general.executeButton(...)` | Délègue à detailsInteraction.executeButton. | 972 |
| `ui_vehicleSelector_general.executeDoubleClick(...)` | Délègue à detailsInteraction.executeDoubleClick. | 973 |
| `ui_vehicleSelector_general.getActiveFilters(...)` | Délègue au module de filtres : renvoie les filtres actifs. | 850 |
| `ui_vehicleSelector_general.getDefaultVehicleInfo()` | Lit et met en cache settings/default.pc (véhicule par défaut hérité). | 766 |
| `ui_vehicleSelector_general.getDefaultVehicleTile()` | Construit la tuile du « Legacy default.pc » pour la grille, à partir du modèle indiqué par settings/default.pc. | 780 |
| `ui_vehicleSelector_general.getDetails(...)` | Délègue à detailsInteraction.getDetails : détails et boutons d'un élément. | 970 |
| `ui_vehicleSelector_general.getDisplayData(...)` | Renvoie les options d'affichage effectives. En contexte freeroam, showRecentMode prend la valeur de showRecentModeFreeroamSelector. | 860 |
| `ui_vehicleSelector_general.getDisplayDataOptions(...)` | Renvoie la liste des options d'affichage proposées à l'UI, en masquant showRecentMode ou showRecentModeFreeroamSelector selon le contexte. | 863 |
| `ui_vehicleSelector_general.getFilters(...)` | Initialise les données UI si besoin puis renvoie les filtres (filterList, filterByProp, lockedFiltersByProp). | 849 |
| `ui_vehicleSelector_general.getManagementDetails(...)` | Délègue à detailsInteraction.getManagementDetails. | 971 |
| `ui_vehicleSelector_general.getRecentVehicles()` | Renvoie la liste des véhicules récents. | 955 |
| `ui_vehicleSelector_general.getScreenHeaderTitleAndPath(path)` | Calcule le titre d'en-tête et les segments du fil d'Ariane selon le chemin courant, les filtres actifs et la recherche. Les titres sont suffixés « (filtré) » si un filtre ou une recherche est actif, et remplacés par « Spawn Vehicle » en mode spawn-only. | 979 |
| `ui_vehicleSelector_general.getSearchText(...)` | Renvoie le texte de recherche courant (module de filtres). | 851 |
| `ui_vehicleSelector_general.getTiles(...)` | Délègue à ui_vehicleSelector_tiles.getTiles. | 859 |
| `ui_vehicleSelector_general.getUiData()` | Renvoie les données UI du sélecteur (models, configs, filterList, filterByProp, lockedFiltersByProp, activeFilters, displayData, displayInfo), en les recalculant si nécessaire. | 818 |
| `ui_vehicleSelector_general.getValidFilters(...)` | Renvoie les filtres valides préparés (délègue au module de filtres). | 936 |
| `ui_vehicleSelector_general.goToMod(...)` | Délègue à detailsInteraction.goToMod : ouvre la page du mod. | 969 |
| `ui_vehicleSelector_general.isFavourite(model, config)` | Indique si le couple modèle/config est en favori. | 940 |
| `ui_vehicleSelector_general.isFilterLocked(...)` | Indique si un filtre est verrouillé. | 930 |
| `ui_vehicleSelector_general.isFreeroamVehicleSelectorContext()` | Vrai si la route UI courante est l'un des écrans du sélecteur de véhicules du freeroam ou de l'assistant freeroam (freeroamLevels.vehicles, freeroamWizard.vehicles et variantes menu./pause.). | 632 |
| `ui_vehicleSelector_general.isOpenedFromGarage()` | Indique si le sélecteur a été ouvert depuis le garage. | 1098 |
| `ui_vehicleSelector_general.isRecentVehicle(model, config)` | Indique si le couple modèle/config figure parmi les véhicules récents. | 945 |
| `ui_vehicleSelector_general.isSpawnOnly()` | Indique si le mode spawn-only est actif. | 46 |
| `ui_vehicleSelector_general.lockFilter(...)` | Verrouille un filtre pour que l'utilisateur ne puisse pas le modifier (délègue au module de filtres). | 928 |
| `ui_vehicleSelector_general.lockFilterMode(...)` | Verrouille un filtre en mode inclusion (délègue au module de filtres). | 931 |
| `ui_vehicleSelector_general.lockFilterModeExclusive(...)` | Verrouille un filtre en mode exclusif avec la liste de valeurs autorisées (délègue au module de filtres). | 932 |
| `ui_vehicleSelector_general.navigateToVehicle(tile, options)` | Passe de la grille à la page détail d'un véhicule : mémorise la sélection (chemin, titre, modèle, config) et navigue vers la route enfant correspondant à la route racine courante (pause ou garage). | 1843 |
| `ui_vehicleSelector_general.onLanguageChanged()` | Hook : la langue change ; force le rechargement (libellés traduits). *(interne)* *(hook)* | 751 |
| `ui_vehicleSelector_general.onModActivated()` | Hook : un mod est activé ; force le rechargement des données du sélecteur. *(interne)* *(hook)* | 735 |
| `ui_vehicleSelector_general.onModDeactivated()` | Hook : un mod est désactivé ; force le rechargement des données du sélecteur. *(interne)* *(hook)* | 731 |
| `ui_vehicleSelector_general.onModManagerReady()` | Hook : le gestionnaire de mods est prêt ; force le rechargement des données. *(interne)* *(hook)* | 739 |
| `ui_vehicleSelector_general.onModManagerStateChanged()` | Hook : l'état du gestionnaire de mods a changé ; force le rechargement des données. *(interne)* *(hook)* | 743 |
| `ui_vehicleSelector_general.onRootRouteEnter(context, toRoute, fromRoute, data)` | Hook de route : entrée dans un écran racine du sélecteur (pause, garage) ; efface l'état de détail. *(interne)* *(hook)* | 1936 |
| `ui_vehicleSelector_general.onRootRouteLeave(context, toRoute, fromRoute, data)` | Hook de route : sortie d'un écran racine ; remet spawn-only à false hors de la famille, et si ouvert depuis le garage efface verrous et filtres. *(interne)* *(hook)* | 1972 |
| `ui_vehicleSelector_general.onRootRouteMount(context, toRoute, fromRoute, data)` | Hook de route : montage d'un écran racine ; lance le chargement asynchrone puis l'émission de l'instantané pour le chemin de la route (par défaut allModels). *(interne)* *(hook)* | 1941 |
| `ui_vehicleSelector_general.onVehicleRouteEnter(context, toRoute, fromRoute, data)` | Hook de route : entrée dans la page détail d'un véhicule. Promeut la sélection en attente en sélection active. *(interne)* *(hook)* | 1904 |
| `ui_vehicleSelector_general.onVehicleRouteLeave(context, toRoute, fromRoute, data)` | Hook de route : sortie de la page détail ; remet spawn-only à false si la destination est hors de la famille du sélecteur. *(interne)* *(hook)* | 1967 |
| `ui_vehicleSelector_general.onVehicleRouteMount(context, toRoute, fromRoute, data)` | Hook de route : montage de la page détail ; lance le chargement asynchrone puis l'émission de l'instantané du chemin de la sélection active. *(interne)* *(hook)* | 1915 |
| `ui_vehicleSelector_general.onfilechanged(filename, type)` | Hook de surveillance de fichiers : oublie le cache de settings/default.pc quand ce fichier change. *(interne)* | 759 |
| `ui_vehicleSelector_general.openFromPause(routeName, options)` | Ouvre le sélecteur depuis le menu pause. Refusé (renvoie false) si une session de première conduite active n'autorise pas vehicleManagement. | 1345 |
| `ui_vehicleSelector_general.openVehicleSelectorForChallenge(callback, routeName, options)` | Ouvre le sélecteur pour choisir un véhicule adverse. Sauf options.unrestricted, props et remorques sont exclus par un verrou sur le filtre Type. Le callback reçoit (model, config, additionalData) à la sélection, et aucun argument à la sortie. | 1258 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroam()` | Ouvre le sélecteur plein écran du menu (route 'menu.vehiclesnew') avec boutons de gestion et boutons freeroam, puis émet onVehicleSelectorOpen. | 1103 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroamConfigurator(callback)` | Ouvre le sélecteur pour le configurateur freeroam (route 'menu.vehiclesnew'). Le callback reçoit (model, config, additionalData) et le véhicule est enregistré comme récent. | 1315 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroamModal()` | Ouvre le sélecteur en mode « modal » : un bouton « Select Vehicle » (et la sortie) renvoient vers 'menu.freeroamselector'. Boutons de gestion désactivés. | 1228 |
| `ui_vehicleSelector_general.openVehicleSelectorForFreeroamWithMod(modId)` | Comme openVehicleSelectorForFreeroam, mais filtre la source sur un mod donné. | 1119 |
| `ui_vehicleSelector_general.openVehicleSelectorForGarage(showOwnedOnly)` | Ouvre le sélecteur depuis le garage (routes 'garage.mycars' ou 'garage.vehicles'). Un bouton « Charger » remplace le véhicule actuel (ou entre dans un véhicule d'inventaire de carrière), enregistre le récent, puis revient au garage. Verrouille la source (Custom, Mod, Career ou BeamNG - Official). | 1137 |
| `ui_vehicleSelector_general.passesFilters(...)` | Indique si un élément passe les filtres et la recherche (délègue au module de filtres). | 938 |
| `ui_vehicleSelector_general.profilerFinish(tag)` | Termine ou marque une étape du profileur M.p. Sans effet avec le faux profileur par défaut. | 1087 |
| `ui_vehicleSelector_general.requestDetails(item, requestId)` | Calcule les détails d'une tuile (via getDetails) et les envoie à l'UI par 'vehicleSelectorDetails'. Les tuiles de cluster sans showDetails sont ignorées (avertissement loggé). | 1647 |
| `ui_vehicleSelector_general.resetDisplayDataToDefaults(requestId)` | Remet les options d'affichage à leurs valeurs par défaut. | 874 |
| `ui_vehicleSelector_general.resetRangeFilter(filterKey, requestId)` | Remet un filtre de plage à ses bornes complètes ; émet un instantané si requestId est fourni. | 911 |
| `ui_vehicleSelector_general.resetSetFilter(filterKey, requestId)` | Remet un filtre de type ensemble à son état par défaut ; émet un instantané si requestId est fourni. | 918 |
| `ui_vehicleSelector_general.resolveCurrentSelectorPath()` | Renvoie le chemin courant : chemin posé par setCurrentSelectorPath, sinon celui de la sélection active, sinon {keys = {'allModels'}}. | 2004 |
| `ui_vehicleSelector_general.resolveSelectedVehicleTitle(paramTitle)` | Renvoie le titre du véhicule sélectionné (sélection active) pour le titre dynamique de la route, sinon le titre passé en paramètre. | 2036 |
| `ui_vehicleSelector_general.setCurrentSelectorPath(path)` | Enregistre un chemin de sélecteur choisi par un assistant, utilisé par emitDisplayDataSnapshot. nil l'efface ; accepte {keys = {...}} ou une liste directe. | 1982 |
| `ui_vehicleSelector_general.setCustomDetailsButtons(...)` | Délègue à detailsInteraction.setCustomDetailsButtons. | 976 |
| `ui_vehicleSelector_general.setDetailsButtonForFreeroam(...)` | Délègue à detailsInteraction.setDetailsButtonForFreeroam. | 975 |
| `ui_vehicleSelector_general.setDisplayDataOption(key, value, requestId)` | Modifie une option d'affichage (persistée si save=true) ; émet un instantané si requestId est fourni. | 866 |
| `ui_vehicleSelector_general.setManagementButtonsEnabled(...)` | Délègue à detailsInteraction.setManagementButtonsEnabled. | 974 |
| `ui_vehicleSelector_general.setSearchText(text, requestId)` | Définit le texte de recherche ; émet un instantané si requestId est fourni. | 852 |
| `ui_vehicleSelector_general.setSpawnOnly(value)` | Active le mode « faire apparaître seulement » ; toute valeur autre que true le désactive. | 41 |
| `ui_vehicleSelector_general.setVehicleRestrictionMode(restrictionMode)` | Définit une restriction dure de type de véhicule appliquée en plus des filtres : 'lightRunner', 'busRoute' ou nil (aucune). | 35 |
| `ui_vehicleSelector_general.setupValidFilters(...)` | Prépare la liste des filtres valides pour un passage de filtrage (délègue au module de filtres). | 935 |
| `ui_vehicleSelector_general.toggleFavourite(itemDetails)` | Ajoute ou retire un véhicule des favoris (clé 'modèle/config'). Pour settings/default.pc, bascule plutôt l'option includeDefaultConfigInFavourites. | 882 |
| `ui_vehicleSelector_general.toggleFilter(filterKey, value, requestId)` | Active ou désactive une valeur d'un filtre de type ensemble ; émet un instantané si requestId est fourni. | 897 |
| `ui_vehicleSelector_general.trackRecentVehicle(model, config)` | Enregistre le couple modèle/config comme véhicule récent. | 950 |
| `ui_vehicleSelector_general.unlockFilter(...)` | Déverrouille un filtre (délègue au module de filtres). | 929 |
| `ui_vehicleSelector_general.updateFilters(...)` | Délègue à filterInstance.updateFilters. | 896 |
| `ui_vehicleSelector_general.updateRangeFilter(filterKey, min, max, requestId)` | Définit les bornes d'un filtre de plage ; émet un instantané si requestId est fourni. | 904 |

### Détail des paramètres

#### `ui_vehicleSelector_general.calculateActiveFilters(...)`

Recalcule la liste des filtres actifs (délègue au module de filtres).

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.clearAllFilters(...)`

Efface tous les filtres non verrouillés.

- `...` (*any*) : Transmis à filterInstance.clearAllFilters.

#### `ui_vehicleSelector_general.clearLockedFilters(...)`

Supprime tous les verrous de filtres.

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.consumeFocusSearchOnOpen()`

Renvoie puis remet à false l'indicateur « focaliser la recherche à l'ouverture » posé par openFromPause.

- **renvoie** : boolean true si la recherche doit être focalisée.

#### `ui_vehicleSelector_general.createFilters(...)`

Construit la liste des filtres UI (types range ou set) à partir d'une liste de configs, selon la liste blanche de propriétés.

- `...` (*table*) : Liste de configs (premier argument), transmise à createVehicleFilters.
- **renvoie** : table[] Données de filtres pour l'UI.
- **renvoie** : table Valeurs trouvées par propriété.

#### `ui_vehicleSelector_general.emitDisplayDataSnapshot(requestId)`

Reconstruit l'instantané du sélecteur pour le chemin courant et l'envoie par 'vehicleSelectorDisplayDataSnapshot'.

- `requestId` (*any|nil*) : Identifiant renvoyé dans le payload.
- **renvoie** : boolean false si la reconstruction a échoué.

#### `ui_vehicleSelector_general.emptyProfiler()`

Crée un faux profileur dont start, add et finish ne font rien.

- **renvoie** : table Objet {start, add, finish}.

#### `ui_vehicleSelector_general.executeButton(...)`

Délègue à detailsInteraction.executeButton.

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.executeDoubleClick(...)`

Délègue à detailsInteraction.executeDoubleClick.

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.getActiveFilters(...)`

Délègue au module de filtres : renvoie les filtres actifs.

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.getDefaultVehicleInfo()`

Lit et met en cache settings/default.pc (véhicule par défaut hérité).

- **renvoie** : table|nil Contenu du fichier, ou nil s'il est absent ou illisible.

#### `ui_vehicleSelector_general.getDefaultVehicleTile()`

Construit la tuile du « Legacy default.pc » pour la grille, à partir du modèle indiqué par settings/default.pc.

- **renvoie** : table|nil Tuile, ou nil si fichier ou modèle introuvable.

#### `ui_vehicleSelector_general.getDetails(...)`

Délègue à detailsInteraction.getDetails : détails et boutons d'un élément.

- `...` (*any*) : itemDetails.

#### `ui_vehicleSelector_general.getDisplayData(...)`

Renvoie les options d'affichage effectives. En contexte freeroam, showRecentMode prend la valeur de showRecentModeFreeroamSelector.

- `...` (*any*) : 
- **renvoie** : table Table des options d'affichage (groupMode, sortMode, clusterMode, expandGroups, displaySize, ...).

#### `ui_vehicleSelector_general.getDisplayDataOptions(...)`

Renvoie la liste des options d'affichage proposées à l'UI, en masquant showRecentMode ou showRecentModeFreeroamSelector selon le contexte.

- `...` (*any*) : 
- **renvoie** : table[] Définitions d'options (key, label, type, options...).

#### `ui_vehicleSelector_general.getFilters(...)`

Initialise les données UI si besoin puis renvoie les filtres (filterList, filterByProp, lockedFiltersByProp).

- `...` (*any*) : Transmis à filterInstance.getFilters.
- **renvoie** : table Données de filtres.

#### `ui_vehicleSelector_general.getManagementDetails(...)`

Délègue à detailsInteraction.getManagementDetails.

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.getRecentVehicles()`

Renvoie la liste des véhicules récents.

- **renvoie** : table[] Liste de {model, config}.

#### `ui_vehicleSelector_general.getScreenHeaderTitleAndPath(path)`

Calcule le titre d'en-tête et les segments du fil d'Ariane selon le chemin courant, les filtres actifs et la recherche. Les titres sont suffixés « (filtré) » si un filtre ou une recherche est actif, et remplacés par « Spawn Vehicle » en mode spawn-only.

- `path` (*table|nil*) : Chemin {keys = {...}} ; keys[1] vaut allModels, configsForModel ou configsForBrandSubModelOrModel.
- **renvoie** : table {title, isFiltered, pathSegments}.

#### `ui_vehicleSelector_general.getSearchText(...)`

Renvoie le texte de recherche courant (module de filtres).

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.getTiles(...)`

Délègue à ui_vehicleSelector_tiles.getTiles.

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.getUiData()`

Renvoie les données UI du sélecteur (models, configs, filterList, filterByProp, lockedFiltersByProp, activeFilters, displayData, displayInfo), en les recalculant si nécessaire.

- **renvoie** : table Données UI.

#### `ui_vehicleSelector_general.getValidFilters(...)`

Renvoie les filtres valides préparés (délègue au module de filtres).

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.goToMod(...)`

Délègue à detailsInteraction.goToMod : ouvre la page du mod.

- `...` (*any*) : modId.

#### `ui_vehicleSelector_general.isFavourite(model, config)`

Indique si le couple modèle/config est en favori.

- `model` (*string*) : Clé du modèle.
- `config` (*string*) : Clé de la config.
- **renvoie** : boolean true si favori.

#### `ui_vehicleSelector_general.isFilterLocked(...)`

Indique si un filtre est verrouillé.

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.isFreeroamVehicleSelectorContext()`

Vrai si la route UI courante est l'un des écrans du sélecteur de véhicules du freeroam ou de l'assistant freeroam (freeroamLevels.vehicles, freeroamWizard.vehicles et variantes menu./pause.).

- **renvoie** : boolean true en contexte freeroam.

#### `ui_vehicleSelector_general.isOpenedFromGarage()`

Indique si le sélecteur a été ouvert depuis le garage.

- **renvoie** : boolean true depuis le garage.

#### `ui_vehicleSelector_general.isRecentVehicle(model, config)`

Indique si le couple modèle/config figure parmi les véhicules récents.

- `model` (*string*) : Clé du modèle.
- `config` (*string*) : Clé de la config.
- **renvoie** : boolean true si récent.

#### `ui_vehicleSelector_general.isSpawnOnly()`

Indique si le mode spawn-only est actif.

- **renvoie** : boolean État du mode.

#### `ui_vehicleSelector_general.lockFilter(...)`

Verrouille un filtre pour que l'utilisateur ne puisse pas le modifier (délègue au module de filtres).

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.lockFilterMode(...)`

Verrouille un filtre en mode inclusion (délègue au module de filtres).

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.lockFilterModeExclusive(...)`

Verrouille un filtre en mode exclusif avec la liste de valeurs autorisées (délègue au module de filtres).

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.navigateToVehicle(tile, options)`

Passe de la grille à la page détail d'un véhicule : mémorise la sélection (chemin, titre, modèle, config) et navigue vers la route enfant correspondant à la route racine courante (pause ou garage).

- `tile` (*table*) : Tuile cliquée (config ou cluster).
- `options` (*table|nil*) : Transmis à ui_router.navigate (par ex. {preferredScope = 'auxillary'}).

#### `ui_vehicleSelector_general.onRootRouteEnter(context, toRoute, fromRoute, data)`

Hook de route : entrée dans un écran racine du sélecteur (pause, garage) ; efface l'état de détail.

- `context` (*any*) : Contexte de cycle de vie.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de route.

#### `ui_vehicleSelector_general.onRootRouteLeave(context, toRoute, fromRoute, data)`

Hook de route : sortie d'un écran racine ; remet spawn-only à false hors de la famille, et si ouvert depuis le garage efface verrous et filtres.

- `context` (*any*) : Contexte de cycle de vie.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de route.

#### `ui_vehicleSelector_general.onRootRouteMount(context, toRoute, fromRoute, data)`

Hook de route : montage d'un écran racine ; lance le chargement asynchrone puis l'émission de l'instantané pour le chemin de la route (par défaut allModels).

- `context` (*any*) : Contexte de cycle de vie.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de route.

#### `ui_vehicleSelector_general.onVehicleRouteEnter(context, toRoute, fromRoute, data)`

Hook de route : entrée dans la page détail d'un véhicule. Promeut la sélection en attente en sélection active.

- `context` (*any*) : Contexte de cycle de vie.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de route.

#### `ui_vehicleSelector_general.onVehicleRouteLeave(context, toRoute, fromRoute, data)`

Hook de route : sortie de la page détail ; remet spawn-only à false si la destination est hors de la famille du sélecteur.

- `context` (*any*) : Contexte de cycle de vie.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de route.

#### `ui_vehicleSelector_general.onVehicleRouteMount(context, toRoute, fromRoute, data)`

Hook de route : montage de la page détail ; lance le chargement asynchrone puis l'émission de l'instantané du chemin de la sélection active.

- `context` (*any*) : Contexte de cycle de vie.
- `toRoute` (*table*) : Route d'arrivée.
- `fromRoute` (*table*) : Route de départ.
- `data` (*any*) : Données de route.

#### `ui_vehicleSelector_general.onfilechanged(filename, type)`

Hook de surveillance de fichiers : oublie le cache de settings/default.pc quand ce fichier change.

- `filename` (*string*) : Fichier modifié.
- `type` (*string*) : Type de changement.

#### `ui_vehicleSelector_general.openFromPause(routeName, options)`

Ouvre le sélecteur depuis le menu pause. Refusé (renvoie false) si une session de première conduite active n'autorise pas vehicleManagement.

- `routeName` (*string|nil*) : Route à ouvrir, par défaut 'pause.vehicleSelector'.
- `options` (*table|nil*) : options.spawnOnly (booléen) et options.focusSearch (focalise la recherche à l'ouverture).
- **renvoie** : boolean false si refusé, sinon true.

#### `ui_vehicleSelector_general.openVehicleSelectorForChallenge(callback, routeName, options)`

Ouvre le sélecteur pour choisir un véhicule adverse. Sauf options.unrestricted, props et remorques sont exclus par un verrou sur le filtre Type. Le callback reçoit (model, config, additionalData) à la sélection, et aucun argument à la sortie.

- `callback` (*function|nil*) : Fonction appelée avec la sélection ou sans argument si on quitte.
- `routeName` (*string|nil*) : Route UI à ouvrir, par défaut 'mission.control.vehicleSelector'.
- `options` (*table|nil*) : options.unrestricted = true pour effacer tous les filtres.

#### `ui_vehicleSelector_general.openVehicleSelectorForFreeroamConfigurator(callback)`

Ouvre le sélecteur pour le configurateur freeroam (route 'menu.vehiclesnew'). Le callback reçoit (model, config, additionalData) et le véhicule est enregistré comme récent.

- `callback` (*function*) : Appelée avec la sélection.

#### `ui_vehicleSelector_general.openVehicleSelectorForFreeroamWithMod(modId)`

Comme openVehicleSelectorForFreeroam, mais filtre la source sur un mod donné.

- `modId` (*string*) : Identifiant du mod (via getModById).

#### `ui_vehicleSelector_general.openVehicleSelectorForGarage(showOwnedOnly)`

Ouvre le sélecteur depuis le garage (routes 'garage.mycars' ou 'garage.vehicles'). Un bouton « Charger » remplace le véhicule actuel (ou entre dans un véhicule d'inventaire de carrière), enregistre le récent, puis revient au garage. Verrouille la source (Custom, Mod, Career ou BeamNG - Official).

- `showOwnedOnly` (*boolean|nil*) : true pour n'afficher que les véhicules possédés (Custom, Mod, Career).

#### `ui_vehicleSelector_general.passesFilters(...)`

Indique si un élément passe les filtres et la recherche (délègue au module de filtres).

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.profilerFinish(tag)`

Termine ou marque une étape du profileur M.p. Sans effet avec le faux profileur par défaut.

- `tag` (*string|nil*) : Étiquette de l'étape ; vide ou 'undefined' = fin.

#### `ui_vehicleSelector_general.requestDetails(item, requestId)`

Calcule les détails d'une tuile (via getDetails) et les envoie à l'UI par 'vehicleSelectorDetails'. Les tuiles de cluster sans showDetails sont ignorées (avertissement loggé).

- `item` (*table*) : Tuile avec showDetails = {model, config}, ou directement {model, config}.
- `requestId` (*any|nil*) : Identifiant de requête renvoyé dans le payload.
- **renvoie** : table|nil Payload {backendName, requestId, item, details}, ou nil.

#### `ui_vehicleSelector_general.resetDisplayDataToDefaults(requestId)`

Remet les options d'affichage à leurs valeurs par défaut.

- `requestId` (*any|nil*) : Identifiant pour l'instantané de retour.
- **renvoie** : table Options d'affichage après remise à zéro.

#### `ui_vehicleSelector_general.resetRangeFilter(filterKey, requestId)`

Remet un filtre de plage à ses bornes complètes ; émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `requestId` (*any|nil*) : Identifiant pour l'instantané de retour.

#### `ui_vehicleSelector_general.resetSetFilter(filterKey, requestId)`

Remet un filtre de type ensemble à son état par défaut ; émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `requestId` (*any|nil*) : Identifiant pour l'instantané de retour.

#### `ui_vehicleSelector_general.resolveCurrentSelectorPath()`

Renvoie le chemin courant : chemin posé par setCurrentSelectorPath, sinon celui de la sélection active, sinon {keys = {'allModels'}}.

- **renvoie** : table {keys = string[]}.

#### `ui_vehicleSelector_general.resolveSelectedVehicleTitle(paramTitle)`

Renvoie le titre du véhicule sélectionné (sélection active) pour le titre dynamique de la route, sinon le titre passé en paramètre.

- `paramTitle` (*string|nil*) : Titre de repli.
- **renvoie** : string|nil Titre trouvé.

#### `ui_vehicleSelector_general.setCurrentSelectorPath(path)`

Enregistre un chemin de sélecteur choisi par un assistant, utilisé par emitDisplayDataSnapshot. nil l'efface ; accepte {keys = {...}} ou une liste directe.

- `path` (*table|nil*) : Chemin.

#### `ui_vehicleSelector_general.setCustomDetailsButtons(...)`

Délègue à detailsInteraction.setCustomDetailsButtons.

- `...` (*any*) : Liste de boutons personnalisés.

#### `ui_vehicleSelector_general.setDetailsButtonForFreeroam(...)`

Délègue à detailsInteraction.setDetailsButtonForFreeroam.

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.setDisplayDataOption(key, value, requestId)`

Modifie une option d'affichage (persistée si save=true) ; émet un instantané si requestId est fourni.

- `key` (*string*) : Clé de l'option.
- `value` (*any*) : Nouvelle valeur.
- `requestId` (*any|nil*) : Identifiant de requête UI pour l'instantané de retour.
- **renvoie** : table Options d'affichage après modification.

#### `ui_vehicleSelector_general.setManagementButtonsEnabled(...)`

Délègue à detailsInteraction.setManagementButtonsEnabled.

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.setSearchText(text, requestId)`

Définit le texte de recherche ; émet un instantané si requestId est fourni.

- `text` (*string*) : Texte recherché.
- `requestId` (*any|nil*) : Identifiant pour l'instantané de retour.

#### `ui_vehicleSelector_general.setSpawnOnly(value)`

Active le mode « faire apparaître seulement » ; toute valeur autre que true le désactive.

- `value` (*boolean|nil*) : true pour activer.

#### `ui_vehicleSelector_general.setVehicleRestrictionMode(restrictionMode)`

Définit une restriction dure de type de véhicule appliquée en plus des filtres : 'lightRunner', 'busRoute' ou nil (aucune).

- `restrictionMode` (*string|nil*) : 'lightRunner', 'busRoute' ou nil.

#### `ui_vehicleSelector_general.setupValidFilters(...)`

Prépare la liste des filtres valides pour un passage de filtrage (délègue au module de filtres).

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.toggleFavourite(itemDetails)`

Ajoute ou retire un véhicule des favoris (clé 'modèle/config'). Pour settings/default.pc, bascule plutôt l'option includeDefaultConfigInFavourites.

- `itemDetails` (*table*) : Table avec les champs model et config.
- **renvoie** : boolean true si l'élément est maintenant favori.

#### `ui_vehicleSelector_general.toggleFilter(filterKey, value, requestId)`

Active ou désactive une valeur d'un filtre de type ensemble ; émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `value` (*any*) : Valeur à basculer.
- `requestId` (*any|nil*) : Identifiant pour l'instantané de retour.

#### `ui_vehicleSelector_general.trackRecentVehicle(model, config)`

Enregistre le couple modèle/config comme véhicule récent.

- `model` (*string*) : Clé du modèle.
- `config` (*string*) : Clé de la config.

#### `ui_vehicleSelector_general.unlockFilter(...)`

Déverrouille un filtre (délègue au module de filtres).

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.updateFilters(...)`

Délègue à filterInstance.updateFilters.

- `...` (*any*) : Transmis tels quels.

#### `ui_vehicleSelector_general.updateRangeFilter(filterKey, min, max, requestId)`

Définit les bornes d'un filtre de plage ; émet un instantané si requestId est fourni.

- `filterKey` (*string*) : Nom du filtre.
- `min` (*number*) : Borne basse.
- `max` (*number*) : Borne haute.
- `requestId` (*any|nil*) : Identifiant pour l'instantané de retour.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_vehicles, ui_vehicleSelector_detailsInteraction, ui_vehicleSelector_tiles, core_locales. |
| `p` | table | Profileur factice (emptyProfiler) avec start, add et finish sans effet. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSelectorClosed`
- `onVehicleSelectorOpen`

**Évènements UI (guihooks.trigger) :** `VehicleSelectorDataLoaded`, `gridSelectorRefreshAll`, `vehicleSelectorDetails`, `vehicleSelectorDisplayDataSnapshot`

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/general.lua`.*
