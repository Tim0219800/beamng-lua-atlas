# `gameplay_crawl_general`

*Fichier : `lua/ge/extensions/gameplay/crawl/general.lua` · VM : Game Engine (GE) · 519 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_general` : `extensions.load("gameplay_crawl_general")`, puis la globale `gameplay_crawl_general`

Cœur du mode crawl (franchissement lent de parcours) côté freeroam/carrière : garde le parcours actif (activeTrail : trail, zone, chemin copié, départ, prefabs) et la liste des données de crawlers, prépare un parcours (setupCrawl, avec inversion éventuelle du chemin), démarre le crawl en freeroam ou depuis un flowgraph, et appelle gameplay_crawl_utils.updateCrawl à chaque image. Il fournit aussi les points d'intérêt (marqueurs de départ, carte), les fenêtres d'activité, le dessin de la zone sur la minimap et enregistre les scores à la fin. Il gère le cas multi-joueur local (multiseat).

## Exemple

```lua
gameplay_crawl_general.startCrawlFreeroam(trail, be:getPlayerVehicle(0))
```

## Remarques

- Un seul parcours actif à la fois (M.activeTrail). Si trail.pathReversed est vrai, le chemin est copié, inversé et chaque rotation est tournée de 180 degrés autour de Z ; la position de départ devient trail.startingPositionIdReversed, ou le premier noeud inversé (rayon 10 m).
- Les parcours apparaissent dans le jeu seulement si la carrière est active ou si le réglage enableCrawlInFreeroam est vrai (onGetRawPoiListForLevel).
- En multiseat, entrer dans la zone de départ lance automatiquement le crawl, sauf si un mode de jeu multiseat est actif ou si les parcours diffèrent.
- M.crawlersData et sa copie locale pointent vers la même table ; clear la vide avec table.clear, il faut donc ne pas réassigner la variable.
- Quand un véhicule est changé ou détruit en freeroam (parcours non issu d'une mission), son crawler est nettoyé ; le parcours est vidé quand plus aucun crawler n'existe.
- onCrawlResultsShown enregistre le score (temps, points) via saveSystem.addNewPlayerScore.
- Hooks émis : onCrawlStarted({trail = trail}).

**Dépendances (chargées avant) :** `gameplay_crawl_saveSystem`, `gameplay_crawl_utils`, `gameplay_crawl_boundary`, `gameplay_crawl_display`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_general.clear(force)` | Décharge les prefabs du parcours actif, oublie le parcours, nettoie gameplay_crawl_utils et vide crawlersData. | 38 |
| `gameplay_crawl_general.onActivityAcceptGatherData(elemData, activityData)` | Hook de la fenêtre d'activité : pour un POI 'crawl', ajoute une fiche (distance, dénivelé positif/négatif, meilleurs points, meilleur temps, tentatives) et un bouton « Jouer » qui lance startCrawlFreeroam sur le véhicule du joueur. *(interne)* *(hook)* | 302 |
| `gameplay_crawl_general.onActivityIndexVisible(data)` | Hook appelé quand une activité est visible/masquée dans l'index : prépare le parcours et ses marqueurs de chemin pour un POI crawl, ou nettoie si data est nil. *(interne)* *(hook)* | 385 |
| `gameplay_crawl_general.onAnyMissionChanged(status, id)` | Hook appelé au changement d'état d'une mission : nettoie tout si elle passe à 'stopped'. *(interne)* *(hook)* | 464 |
| `gameplay_crawl_general.onCrawlCleared()` | Hook émis par utils.clear() à chaque fin de crawl : vide crawlersData et efface les POI bruts pour réafficher le marqueur de départ. *(interne)* *(hook)* | 470 |
| `gameplay_crawl_general.onCrawlResultsShown(eventData)` | Hook appelé à l'affichage des résultats : enregistre le temps et les points du joueur pour le parcours actif. *(interne)* *(hook)* | 480 |
| `gameplay_crawl_general.onDrawOnMinimap(td)` | Hook appelé pour dessiner sur la minimap : dessine la zone du parcours actif. *(interne)* *(hook)* | 424 |
| `gameplay_crawl_general.onExtensionLoaded()` | Hook appelé au chargement : nettoie l'état et crée les dossiers de sauvegarde du joueur. *(interne)* *(hook)* | 433 |
| `gameplay_crawl_general.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook de collecte des points d'intérêt d'un niveau : ajoute pour chaque parcours (dossier /levels/<niveau>/crawls/) un POI de type 'crawl' avec déclencheur invisible, marqueur de départ et marqueur de carte (nom, miniature, meilleurs points) tant qu'aucun parcours n'est actif. *(interne)* *(hook)* | 229 |
| `gameplay_crawl_general.onMPSessionChanged(old, new)` | Hook appelé au changement de session multijoueur : charge gameplay_crawl_freeroamMultiplayer au début de session et le décharge à la fin. *(interne)* *(hook)* | 492 |
| `gameplay_crawl_general.onSerialize()` | Hook appelé avant rechargement des extensions : nettoie l'état. *(interne)* *(hook)* | 438 |
| `gameplay_crawl_general.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image : fait avancer le crawl actif (gameplay_crawl_utils.updateCrawl). *(interne)* *(hook)* | 209 |
| `gameplay_crawl_general.onVehicleDestroyed(vehId)` | Hook appelé quand un véhicule est détruit : retire son crawler (parcours hors mission). *(interne)* *(hook)* | 453 |
| `gameplay_crawl_general.onVehicleSwitched(oldId, newId, player)` | Hook appelé au changement de véhicule contrôlé : retire le crawler de l'ancien véhicule (parcours hors mission) et nettoie s'il n'en reste aucun. *(interne)* *(hook)* | 442 |
| `gameplay_crawl_general.setupCrawl(trail, veh, isFromMission)` | Prépare un parcours : arrête le crawl précédent, résout zone, chemin et départ depuis saveSystem, gère l'inversion, crée les données du crawler, charge les prefabs et, si isFromMission, téléporte le véhicule à la position de départ. | 49 |
| `gameplay_crawl_general.startCrawlFlowgraph(trail, veh)` | Démarre un crawl depuis un flowgraph. Si le même parcours (même nom) est déjà préparé, le réutilise ; sinon appelle setupCrawl(trail, veh, true). Émet onCrawlStarted. | 169 |
| `gameplay_crawl_general.startCrawlFreeroam(trail, veh)` | Démarre un crawl en freeroam. En multiseat avec le même parcours déjà actif, ajoute simplement le véhicule au crawl ; sinon prépare le parcours puis lance gameplay_crawl_utils.startCrawl, émet onCrawlStarted et efface les POI bruts. | 131 |

### Détail des paramètres

#### `gameplay_crawl_general.clear(force)`

Décharge les prefabs du parcours actif, oublie le parcours, nettoie gameplay_crawl_utils et vide crawlersData.

- `force` (*boolean|nil*) : Transmis à gameplay_crawl_utils.clear.

#### `gameplay_crawl_general.onActivityAcceptGatherData(elemData, activityData)`

Hook de la fenêtre d'activité : pour un POI 'crawl', ajoute une fiche (distance, dénivelé positif/négatif, meilleurs points, meilleur temps, tentatives) et un bouton « Jouer » qui lance startCrawlFreeroam sur le véhicule du joueur.

- `elemData` (*table*) : Données des éléments sélectionnés.
- `activityData` (*table*) : Liste de fiches à compléter.

#### `gameplay_crawl_general.onActivityIndexVisible(data)`

Hook appelé quand une activité est visible/masquée dans l'index : prépare le parcours et ses marqueurs de chemin pour un POI crawl, ou nettoie si data est nil.

- `data` (*table|nil*) : Données du POI (type, trailId) ; nil quand l'index se ferme.

#### `gameplay_crawl_general.onAnyMissionChanged(status, id)`

Hook appelé au changement d'état d'une mission : nettoie tout si elle passe à 'stopped'.

- `status` (*string*) : État de la mission.
- `id` (*any*) : Mission concernée.

#### `gameplay_crawl_general.onCrawlResultsShown(eventData)`

Hook appelé à l'affichage des résultats : enregistre le temps et les points du joueur pour le parcours actif.

- `eventData` (*table*) : {time, points}.

#### `gameplay_crawl_general.onDrawOnMinimap(td)`

Hook appelé pour dessiner sur la minimap : dessine la zone du parcours actif.

- `td` (*table*) : Objet de dessin de la minimap.

#### `gameplay_crawl_general.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook de collecte des points d'intérêt d'un niveau : ajoute pour chaque parcours (dossier /levels/<niveau>/crawls/) un POI de type 'crawl' avec déclencheur invisible, marqueur de départ et marqueur de carte (nom, miniature, meilleurs points) tant qu'aucun parcours n'est actif.

- `levelIdentifier` (*string*) : Nom du niveau.
- `elements` (*table*) : Liste de POI à compléter.

#### `gameplay_crawl_general.onMPSessionChanged(old, new)`

Hook appelé au changement de session multijoueur : charge gameplay_crawl_freeroamMultiplayer au début de session et le décharge à la fin.

- `old` (*any*) : Ancienne session (nil/false si aucune).
- `new` (*any*) : Nouvelle session.

#### `gameplay_crawl_general.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image : fait avancer le crawl actif (gameplay_crawl_utils.updateCrawl).

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `gameplay_crawl_general.onVehicleDestroyed(vehId)`

Hook appelé quand un véhicule est détruit : retire son crawler (parcours hors mission).

- `vehId` (*integer*) : Id du véhicule.

#### `gameplay_crawl_general.onVehicleSwitched(oldId, newId, player)`

Hook appelé au changement de véhicule contrôlé : retire le crawler de l'ancien véhicule (parcours hors mission) et nettoie s'il n'en reste aucun.

- `oldId` (*integer*) : Id de l'ancien véhicule.
- `newId` (*integer*) : Id du nouveau véhicule.
- `player` (*integer*) : Index du joueur.

#### `gameplay_crawl_general.setupCrawl(trail, veh, isFromMission)`

Prépare un parcours : arrête le crawl précédent, résout zone, chemin et départ depuis saveSystem, gère l'inversion, crée les données du crawler, charge les prefabs et, si isFromMission, téléporte le véhicule à la position de départ.

- `trail` (*table*) : Parcours (boundaryId, pathId, startingPositionId, pathReversed, prefabs, name).
- `veh` (*userdata*) : Objet véhicule.
- `isFromMission` (*boolean|nil*) : Vrai si lancé par une mission/flowgraph.
- **renvoie** : boolean false si zone ou chemin manquent ou si trail/veh est nil.

#### `gameplay_crawl_general.startCrawlFlowgraph(trail, veh)`

Démarre un crawl depuis un flowgraph. Si le même parcours (même nom) est déjà préparé, le réutilise ; sinon appelle setupCrawl(trail, veh, true). Émet onCrawlStarted.

- `trail` (*table*) : Parcours à lancer.
- `veh` (*userdata*) : Objet véhicule.
- **renvoie** : boolean true si le crawl a démarré.

#### `gameplay_crawl_general.startCrawlFreeroam(trail, veh)`

Démarre un crawl en freeroam. En multiseat avec le même parcours déjà actif, ajoute simplement le véhicule au crawl ; sinon prépare le parcours puis lance gameplay_crawl_utils.startCrawl, émet onCrawlStarted et efface les POI bruts.

- `trail` (*table*) : Parcours à lancer.
- `veh` (*userdata*) : Objet véhicule.

## Champs

| Champ | Type | Description |
|---|---|---|
| `activeTrail` | table|nil | Parcours actif : {trail, boundary, path, startingPosition, prefabs, isFromMission} ; nil si aucun. |
| `crawlersData` | table<integer, table> | Liste des données de crawler (créées par gameplay_crawl_utils.setupCrawlerData) du parcours actif. |
| `dependencies` | table<integer, string> | Extensions chargées avant : gameplay_crawl_saveSystem, utils, boundary, display. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCrawlStarted` — écouté par 6 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`

**Charge les extensions :** `gameplay_crawl_freeroamMultiplayer`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/general.lua`.*
