# `freeroam_vueBigMap`

*Fichier : `lua/ge/extensions/freeroam/vueBigMap.lua` · VM : Game Engine (GE) · 1037 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_vueBigMap` : `extensions.load("freeroam_vueBigMap")`, puis la globale `freeroam_vueBigMap`

Backend Lua de la grande carte (big map) en interface Vue : prépare pour l'UI la liste des points d'intérêt (POI : missions, garages, stations, concessions, dragstrips, points de départ, véhicule du joueur…), les filtres et les groupes de la liste latérale, l'état de jeu, et relaie les actions de l'UI (sélection, survol, navigation, panoramique, exécution d'actions de POI) vers freeroam_bigMapMode. Les données sont mises en cache à l'ouverture (enterBigMap) et libérées à la fermeture (exitBigMap). Les appels côté UI se font par bngApi.engineLua (voir le commentaire d'en-tête du fichier) ; Lua -> Vue passe par guihooks.trigger('showPoiDetails', {poiIds, ignoreReduction}). Dépend de gameplay_missions_missions, freeroam_bigMapMode, gameplay_rawPois, gameplay_missions_missionScreen. Global : freeroam_vueBigMap.

## Exemple

```lua
freeroam_vueBigMap.enterBigMap({isMenuBigmap = true})
local groups = freeroam_vueBigMap.getGroups()
freeroam_vueBigMap.toggleFilterSectionById('everything')
freeroam_vueBigMap.exitBigMap()
```

## Remarques

- Structure des filtres : sections {key, icon, label, groups = {{key, label, icon, elementCount, visible}}}. Les groupes (getGroups) ne contiennent que les groupes visibles et non vides, avec elementIds (ids de POI) et label traduit.
- Icônes par type de POI : spawnPoint=fastTravel, garage=garage01, gasStation=fuelPump, dealership=carDealer, logisticsParking/logisticsOffice=boxTruckFast, computer=screen, driftSpot=drift01, dragstrip=drag02, crawl=rockCrawling02, playerVehicle=carStarred, other=info.
- Les actions de POI sont enregistrées avec addAction(callback, meta) (renvoie meta.actionId) et exécutées par executeAction(actionId) / executePoiAction ; clearActionFunctions les vide à la sortie de la carte (exitBigMap).
- setPoiListDisplayMode accepte 'hidden', 'tree' ou 'simple' (réglage poiListDisplayMode), sinon renvoie 'invalid_mode'.
- selectPoiFromList/navigateToPoi/panToPoi traitent les chaînes « undefined » et « null » (envoyées par l'UI) comme nil.
- Dans onPoiSelectedFromBigmap, ignoreNextReductionFlag est remis à false avant d'être passé dans `ignoreReduction` du hook showPoiDetails, qui reçoit donc toujours false.
- Le champ gameStateInfoCache.gameMode vaut 'mission' quand une mission est au premier plan (gameplay_missions_missionManager.getForegroundMissionId()).

**Dépendances (chargées avant) :** `gameplay_missions_missions`, `freeroam_bigMapMode`, `gameplay_rawPois`, `gameplay_missions_missionScreen`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_vueBigMap.addAction(callback, meta)` | Enregistre un callback d'action et renvoie la table meta enrichie de actionId. | 134 |
| `freeroam_vueBigMap.clearActionFunctions()` | Vide la table des actions. | 129 |
| `freeroam_vueBigMap.enterBigMap(options)` | Ouvre la grande carte : délègue à freeroam_bigMapMode.enterBigMap (instant), génère les caches POI/filtres/groupes et applique la visibilité des POI. | 809 |
| `freeroam_vueBigMap.executeAction(actionId)` | Exécute le callback d'une action ; log d'erreur si inconnue. | 144 |
| `freeroam_vueBigMap.executePoiAction(actionId)` | Exécute une action de POI enregistrée (voir executeAction). | 992 |
| `freeroam_vueBigMap.exitBigMap()` | Ferme la grande carte (freeroam_bigMapMode.exitBigMap(true)), vide les caches et les actions. | 830 |
| `freeroam_vueBigMap.getAndClearPendingAutoSelectPoiId()` | Récupère puis vide l'id de POI à sélectionner automatiquement demandé à l'ouverture de la carte, depuis freeroam_bigMapMode. | 996 |
| `freeroam_vueBigMap.getFilters()` | Sections de filtres, chaque groupe avec son état `visible` courant. | 850 |
| `freeroam_vueBigMap.getFreeActionId()` | Incrémente et renvoie un nouvel identifiant d'action. | 123 |
| `freeroam_vueBigMap.getGameStateInfo()` | Informations d'état de jeu pour la liste de POI, avec poiListDisplayMode (réglage, 'tree' par défaut). | 907 |
| `freeroam_vueBigMap.getGroups()` | Groupes pour la liste de POI : sections et groupes visibles non vides. | 862 |
| `freeroam_vueBigMap.getPoiData()` | Données complètes des POI par id (nom, aperçu, agrégats, actions disponibles), générées si le cache est invalide. | 843 |
| `freeroam_vueBigMap.hoverPoiFromList(poiId, active)` | Met en surbrillance le marqueur du POI survolé dans la liste. | 985 |
| `freeroam_vueBigMap.navigateToPoi(poiId)` | Calcule un itinéraire vers le POI (freeroam_bigMapMode.navigateToMission). | 951 |
| `freeroam_vueBigMap.onPoiSelectedFromBigmap(poiId)` | Appelé par la carte quand un POI y est sélectionné : envoie à l'UI showPoiDetails avec les ids de POI regroupés sous la souris (freeroam_bigMapMarkers.getIdsFromHoveredPoiId) ou liste vide. *(interne)* *(hook)* | 967 |
| `freeroam_vueBigMap.panToPoi(poiId)` | Centre la vue de la carte sur le POI. | 959 |
| `freeroam_vueBigMap.selectPoiFromList(poiId, isCollapsedMode)` | Sélectionne un POI depuis la liste (freeroam_bigMapMode.selectPoi) ou désélectionne si id nul. | 935 |
| `freeroam_vueBigMap.setPoiListDisplayMode(mode)` | Règle le mode d'affichage de la liste ('hidden', 'tree', 'simple') dans les réglages. | 1002 |
| `freeroam_vueBigMap.setVisibleIds()` | Calcule les ids de POI des groupes visibles et appelle freeroam_bigMapMode.setOnlyIdsVisible. | 918 |
| `freeroam_vueBigMap.toggleFilterSectionById(sectionId)` | Affiche tous les groupes (sectionId 'everything') ou uniquement ceux de la section donnée. | 95 |
| `freeroam_vueBigMap.toggleFiltersByIds(filterIds)` | Rend visibles uniquement les groupes dont les clés sont données (tous les autres sont masqués) et met à jour la visibilité sur la carte. | 85 |

### Détail des paramètres

#### `freeroam_vueBigMap.addAction(callback, meta)`

Enregistre un callback d'action et renvoie la table meta enrichie de actionId.

- `callback` (*function*) : Fonction à appeler.
- `meta` (*table|nil*) : Métadonnées (label, etc.).
- **renvoie** : table meta avec actionId.

#### `freeroam_vueBigMap.enterBigMap(options)`

Ouvre la grande carte : délègue à freeroam_bigMapMode.enterBigMap (instant), génère les caches POI/filtres/groupes et applique la visibilité des POI.

- `options` (*table|nil*) : {controllerUsed?: boolean, isMenuBigmap?: boolean, ignoreUiStateChange?: boolean} ; ignoreUiStateChange vaut isMenuBigmap par défaut ; les action maps sont ignorées si controllerUsed et isMenuBigmap.

#### `freeroam_vueBigMap.executeAction(actionId)`

Exécute le callback d'une action ; log d'erreur si inconnue.

- `actionId` (*integer*) : Identifiant.
- **renvoie** : string 'success' ou 'error'.

#### `freeroam_vueBigMap.executePoiAction(actionId)`

Exécute une action de POI enregistrée (voir executeAction).

- `actionId` (*integer*) : Identifiant d'action.

#### `freeroam_vueBigMap.getAndClearPendingAutoSelectPoiId()`

Récupère puis vide l'id de POI à sélectionner automatiquement demandé à l'ouverture de la carte, depuis freeroam_bigMapMode.

- **renvoie** : string|nil Id de POI.

#### `freeroam_vueBigMap.getFilters()`

Sections de filtres, chaque groupe avec son état `visible` courant.

- **renvoie** : table[] Sections de filtres.

#### `freeroam_vueBigMap.getFreeActionId()`

Incrémente et renvoie un nouvel identifiant d'action.

- **renvoie** : integer Identifiant.

#### `freeroam_vueBigMap.getGameStateInfo()`

Informations d'état de jeu pour la liste de POI, avec poiListDisplayMode (réglage, 'tree' par défaut).

- **renvoie** : table État.

#### `freeroam_vueBigMap.getGroups()`

Groupes pour la liste de POI : sections et groupes visibles non vides.

- **renvoie** : table[] Sections {key, icon, title, groups[{key, label, icon, elementIds, visible, openByDefault}]}.

#### `freeroam_vueBigMap.getPoiData()`

Données complètes des POI par id (nom, aperçu, agrégats, actions disponibles), générées si le cache est invalide.

- **renvoie** : table POI par id.

#### `freeroam_vueBigMap.hoverPoiFromList(poiId, active)`

Met en surbrillance le marqueur du POI survolé dans la liste.

- `poiId` (*string*) : Id du POI.
- `active` (*boolean*) : Survol actif.
- **renvoie** : string 'success'
- **renvoie** : boolean active

#### `freeroam_vueBigMap.navigateToPoi(poiId)`

Calcule un itinéraire vers le POI (freeroam_bigMapMode.navigateToMission).

- `poiId` (*string|nil*) : Id du POI.
- **renvoie** : string 'success'

#### `freeroam_vueBigMap.onPoiSelectedFromBigmap(poiId)`

Appelé par la carte quand un POI y est sélectionné : envoie à l'UI showPoiDetails avec les ids de POI regroupés sous la souris (freeroam_bigMapMarkers.getIdsFromHoveredPoiId) ou liste vide.

- `poiId` (*string|nil*) : Id du POI sélectionné.

#### `freeroam_vueBigMap.panToPoi(poiId)`

Centre la vue de la carte sur le POI.

- `poiId` (*string|nil*) : Id du POI.
- **renvoie** : string 'success'

#### `freeroam_vueBigMap.selectPoiFromList(poiId, isCollapsedMode)`

Sélectionne un POI depuis la liste (freeroam_bigMapMode.selectPoi) ou désélectionne si id nul.

- `poiId` (*string|nil*) : Id du POI ('undefined'/'null' = aucun).
- `isCollapsedMode` (*boolean|nil*) : Si faux, la prochaine réduction de groupe est ignorée.
- **renvoie** : string 'success'

#### `freeroam_vueBigMap.setPoiListDisplayMode(mode)`

Règle le mode d'affichage de la liste ('hidden', 'tree', 'simple') dans les réglages.

- `mode` (*string*) : Mode.
- **renvoie** : string 'success' ou 'invalid_mode'.

#### `freeroam_vueBigMap.toggleFilterSectionById(sectionId)`

Affiche tous les groupes (sectionId 'everything') ou uniquement ceux de la section donnée.

- `sectionId` (*string*) : Clé de section ou 'everything'.

#### `freeroam_vueBigMap.toggleFiltersByIds(filterIds)`

Rend visibles uniquement les groupes dont les clés sont données (tous les autres sont masqués) et met à jour la visibilité sur la carte.

- `filterIds` (*string[]*) : Clés de groupes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `actionFunctions` | table<integer, function> | Callbacks des actions de POI, par identifiant. |
| `actionIdCounter` | integer | Compteur d'identifiants d'actions de POI. |
| `dependencies` | string[] | Extensions chargées avant. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBigmapBuildCustomGroupStructures` — écouté par 1 module(s)
- `onBigmapBuildGroupData` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `showPoiDetails`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/vueBigMap.lua`.*
