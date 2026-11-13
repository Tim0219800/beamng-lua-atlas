# `freeroam_bigMapPoiProvider`

*Fichier : `lua/ge/extensions/freeroam/bigMapPoiProvider.lua` · VM : Game Engine (GE) · 717 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_bigMapPoiProvider` : `extensions.load("freeroam_bigMapPoiProvider")`, puis la globale `freeroam_bigMapPoiProvider`

Fournisseur de données pour la grande carte : transforme les POI bruts (missions, garages, stations-service, concessionnaires, points de départ, drift, drag, crawl, véhicules du joueur, livraison…) en une structure prête pour l'interface (poiData), des groupes (groupData : rating_, type_, distance_, difficulty_, branch_, missionType_…) et des filtres prédéfinis (freeroam ou carrière). Gère aussi l'état de visibilité de chaque groupe et envoie le tout à l'interface par le hook UI BigmapMissionData. Un moddeur qui ajoute des POI les voit apparaître via gameplay_rawPois ; ce module décide dans quel groupe ils tombent.

## Exemple

```lua
-- masquer le groupe des stations-service puis renvoyer les données à la grande carte
freeroam_bigMapPoiProvider.setGroupVisibility('type_gasStation', false)
freeroam_bigMapPoiProvider.sendCurrentLevelMissionsToBigmap()
```

## Remarques

- Les visibilités de groupes sont stockées en mémoire seulement ; un groupe inconnu est considéré visible (getGroupVisibility renvoie vrai sauf si la valeur est false). Les groupes par défaut sont initialisés à visible à la première construction des groupes.
- Les données (cachedGroupData, cachedPoiData, cachedFilters) sont reconstruites par sendCurrentLevelMissionsToBigmap ; les accesseurs getCached* la déclenchent si le cache est invalide.
- Bug : sendCurrentLevelMissionsToBigmap appelle d'abord invalidateCache() puis teste isCacheValid(), donc le cache n'est jamais réutilisé : tout est recalculé à chaque appel (et gameplay_rawPois.clear() est appelé dans buildPoiDataCache).
- Bug/incohérence : le tri par distance est neutralisé (distance fixée à 10, calcul commenté), donc tous les POI sont dans le groupe distance_veryClose.
- sendMissionLocationsToMinimap ne fait que mettre le drapeau sendToMinimap à false ; elle n'envoie rien à la minicarte. forceSend, onClientStartMission et requestMissionLocationsForMinimap le remettent à true. clearMissionsFromMinimap envoie NavigationStaticMarkers avec une liste vide.
- Les fonctions de formatage et de construction supposent que les modules career_* (career_career, career_branches, career_modules_tutorial, career_modules_testDrive, career_modules_delivery_general) existent comme globales.
- Filtres : en carrière -> careerPois, un filtre par domaine (domain_<id>) et delivery si le mode livraison est actif ; en freeroam -> missionsByType, freeroamActivities, freeroamPois.
- gameMode envoyé à l'interface : 'freeroam' par défaut, 'career' si la carrière est active, 'mission' si une mission est au premier plan (priorité à ce dernier).

**Dépendances (chargées avant) :** `gameplay_missions_missions`, `freeroam_bigMapMode`, `gameplay_rawPois`, `gameplay_playmodeMarkers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_bigMapPoiProvider.clearMissionsFromMinimap()` | Vide les marqueurs de missions de la minicarte (hook UI NavigationStaticMarkers avec la clé 'missions' et une liste vide) si un niveau est chargé. | 158 |
| `freeroam_bigMapPoiProvider.forceSend()` | Marque le drapeau sendToMinimap à true : le prochain onPreRender rappellera sendMissionLocationsToMinimap. Sert aussi de onClientStartMission et requestMissionLocationsForMinimap. | 10 |
| `freeroam_bigMapPoiProvider.formatMissionForBigmap(elemData)` | Convertit une mission en table pour l'interface : id, icône, nom, description, miniature, aperçus, difficulté, voyage rapide disponible/débloqué, progression, classement (rating), clé de classement, etc. | 199 |
| `freeroam_bigMapPoiProvider.formatPoiForBigmap(poi)` | Convertit un POI non mission en table pour l'interface (id, icône issue de bigmapMarker.cardIcon ou du type, nom, description, miniature, aperçus, voyage rapide, canSetRoute, agrégats). Le voyage rapide n'est disponible qu'hors carrière ou pendant le tutoriel de carrière. | 177 |
| `freeroam_bigMapPoiProvider.getActiveGroupIds()` | Clés des groupes actuellement visibles (selon l'état mémorisé). | 77 |
| `freeroam_bigMapPoiProvider.getAllActiveGroupPoiIds()` | Ids des POI appartenant aux groupes visibles des filtres du cache (reconstruit si besoin). Un POI présent dans plusieurs groupes apparaît plusieurs fois. | 96 |
| `freeroam_bigMapPoiProvider.getAllGroupIds()` | Clés de tous les groupes connus (visibles ou non). | 88 |
| `freeroam_bigMapPoiProvider.getCachedFilters()` | Filtres de la grande carte (freeroam ou carrière), reconstruits si le cache est invalide. | 143 |
| `freeroam_bigMapPoiProvider.getCachedGroupData()` | Groupes indexés par clé (label, icon, elements, visible, groupKey), reconstruits si le cache est invalide. | 127 |
| `freeroam_bigMapPoiProvider.getCachedPoiData()` | Données formatées des POI indexées par id, chacune avec filterData (groupTags, sortingValues). | 135 |
| `freeroam_bigMapPoiProvider.getGroupVisibility(groupKey)` | Indique si un groupe est visible (vrai par défaut si inconnu). | 63 |
| `freeroam_bigMapPoiProvider.invalidateCache()` | Efface le cache de groupes, POI et filtres ; il sera reconstruit à la prochaine demande. | 45 |
| `freeroam_bigMapPoiProvider.onClientStartMission()` | Hook appelé au démarrage d'un niveau : équivaut à forceSend(). *(interne)* *(hook)* | 10 |
| `freeroam_bigMapPoiProvider.onPreRender(dtReal, dtSim)` | Hook appelé à chaque image : si l'état de jeu a des marqueurs de mode de jeu et qu'un niveau est chargé et que sendToMinimap est vrai, appelle sendMissionLocationsToMinimap (qui remet le drapeau à false). *(interne)* *(hook)* | 702 |
| `freeroam_bigMapPoiProvider.requestMissionLocationsForMinimap()` | Demande un nouvel envoi des positions de missions à la minicarte (équivaut à forceSend). | 10 |
| `freeroam_bigMapPoiProvider.resetAllGroupsToVisible()` | Remet tous les groupes connus à visible. | 120 |
| `freeroam_bigMapPoiProvider.sendCurrentLevelMissionsToBigmap()` | Reconstruit tout (groupes, POI, filtres), détermine gameMode et règles (canSetRoute), appelle freeroam_bigMapMode.setOnlyIdsVisible avec les POI des groupes visibles, puis envoie le tout à l'interface via guihooks.trigger('BigmapMissionData', data). | 643 |
| `freeroam_bigMapPoiProvider.sendMissionLocationsToMinimap()` | Remet le drapeau interne sendToMinimap à false ; n'envoie en réalité rien (corps réduit à ce drapeau). | 153 |
| `freeroam_bigMapPoiProvider.setGroupVisibility(groupKey, isVisible)` | Définit la visibilité d'un groupe ; l'effet n'apparaît qu'après un nouvel envoi à la grande carte. | 58 |
| `freeroam_bigMapPoiProvider.toggleGroupVisibility(groupKey)` | Inverse la visibilité d'un groupe (la mise à jour de la grande carte est commentée dans le code). | 68 |

### Détail des paramètres

#### `freeroam_bigMapPoiProvider.formatMissionForBigmap(elemData)`

Convertit une mission en table pour l'interface : id, icône, nom, description, miniature, aperçus, difficulté, voyage rapide disponible/débloqué, progression, classement (rating), clé de classement, etc.

- `elemData` (*table*) : Données du POI de mission (utilise missionId et idInCluster).
- **renvoie** : table|nil Table formatée, nil si la mission n'existe pas.

#### `freeroam_bigMapPoiProvider.formatPoiForBigmap(poi)`

Convertit un POI non mission en table pour l'interface (id, icône issue de bigmapMarker.cardIcon ou du type, nom, description, miniature, aperçus, voyage rapide, canSetRoute, agrégats). Le voyage rapide n'est disponible qu'hors carrière ou pendant le tutoriel de carrière.

- `poi` (*table*) : POI brut de gameplay_rawPois avec markerInfo.bigmapMarker.
- **renvoie** : table Table formatée pour la grande carte.

#### `freeroam_bigMapPoiProvider.getActiveGroupIds()`

Clés des groupes actuellement visibles (selon l'état mémorisé).

- **renvoie** : string[] Clés de groupes visibles.

#### `freeroam_bigMapPoiProvider.getAllActiveGroupPoiIds()`

Ids des POI appartenant aux groupes visibles des filtres du cache (reconstruit si besoin). Un POI présent dans plusieurs groupes apparaît plusieurs fois.

- **renvoie** : string[] Ids de POI.

#### `freeroam_bigMapPoiProvider.getAllGroupIds()`

Clés de tous les groupes connus (visibles ou non).

- **renvoie** : string[] Clés de groupes.

#### `freeroam_bigMapPoiProvider.getCachedFilters()`

Filtres de la grande carte (freeroam ou carrière), reconstruits si le cache est invalide.

- **renvoie** : table[] Liste de filtres {key, icon, title, groups}.

#### `freeroam_bigMapPoiProvider.getCachedGroupData()`

Groupes indexés par clé (label, icon, elements, visible, groupKey), reconstruits si le cache est invalide.

- **renvoie** : table<string, table> Données des groupes.

#### `freeroam_bigMapPoiProvider.getCachedPoiData()`

Données formatées des POI indexées par id, chacune avec filterData (groupTags, sortingValues).

- **renvoie** : table<string, table> POI formatés.

#### `freeroam_bigMapPoiProvider.getGroupVisibility(groupKey)`

Indique si un groupe est visible (vrai par défaut si inconnu).

- `groupKey` (*string*) : Clé du groupe, par ex. 'type_garage'.
- **renvoie** : boolean true si visible.

#### `freeroam_bigMapPoiProvider.onPreRender(dtReal, dtSim)`

Hook appelé à chaque image : si l'état de jeu a des marqueurs de mode de jeu et qu'un niveau est chargé et que sendToMinimap est vrai, appelle sendMissionLocationsToMinimap (qui remet le drapeau à false).

- `dtReal` (*number*) : Temps réel écoulé (s).
- `dtSim` (*number*) : Temps de simulation écoulé (s).

#### `freeroam_bigMapPoiProvider.setGroupVisibility(groupKey, isVisible)`

Définit la visibilité d'un groupe ; l'effet n'apparaît qu'après un nouvel envoi à la grande carte.

- `groupKey` (*string*) : Clé du groupe.
- `isVisible` (*boolean*) : true pour afficher.

#### `freeroam_bigMapPoiProvider.toggleGroupVisibility(groupKey)`

Inverse la visibilité d'un groupe (la mise à jour de la grande carte est commentée dans le code).

- `groupKey` (*string*) : Clé du groupe.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_missions_missions, freeroam_bigMapMode, gameplay_rawPois, gameplay_playmodeMarkers. |

**Évènements UI (guihooks.trigger) :** `BigmapMissionData`, `NavigationStaticMarkers`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/bigMapPoiProvider.lua`.*
