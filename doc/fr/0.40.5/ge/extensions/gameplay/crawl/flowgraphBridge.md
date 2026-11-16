# `gameplay_crawl_flowgraphBridge`

*Fichier : `lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua` · VM : Game Engine (GE) · 326 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_flowgraphBridge` : `extensions.load("gameplay_crawl_flowgraphBridge")`, puis la globale `gameplay_crawl_flowgraphBridge`

Pont entre le mode crawl (franchissement lent de parcours) et les nœuds flowgraph des missions. Il charge un parcours depuis gameplay_crawl_saveSystem, le prépare (setupCrawl, avec téléportation au départ), démarre/arrête/réinitialise le crawl via gameplay_crawl_general et gameplay_crawl_utils, et expose l'état du crawl (temps, points, noeud courant, disqualification, récupérations), les informations du parcours et la gestion des pénalités et points de récupération. Contrairement à crawlFlowgraphBridge.lua, il ne garde pas d'état propre : il lit gameplay_crawl_general.activeTrail et cherche le crawler actif dans gameplay_crawl_utils.getAllCrawlStates().

## Exemple

```lua
local b = gameplay_crawl_flowgraphBridge
local trail = b.loadCrawlTrail(trailId)
if trail and b.setupCrawl(nil, trail) then
  b.startCrawl(nil, trail)
end
```

## Remarques

- Ordre d'appel attendu : loadCrawlTrail -> setupCrawl -> startCrawl. startCrawl échoue si setupCrawl n'a pas été appelé.
- setupCrawl téléporte le véhicule au départ (isFromMission = true).
- startCrawl : si un crawl actif n'a pas encore démarré (crawlStarted faux), reprend simplement son chronomètre (resumeCrawlTimer) au lieu de redémarrer.
- Si vehicleId est nil, startCrawl essaie le premier crawler de gameplay_crawl_general.crawlersData, puis le véhicule du joueur 0 ; setupCrawl utilise be:getPlayerVehicle(0).
- stopCrawl et resetCrawl passent force = true aux fonctions de utils.
- resetCrawl ne stoppe pas le crawl : il remet les données à zéro et téléporte au départ.
- Types de pénalité : boundaryViolation, drivingBackwards, gateTouch, vehicleReset, wrongDirection, skippedCheckpoint, vehicleFlippedUpright, dnf.
- Les hooks onCrawlStarted, onCrawlResultsShown et onCrawlPathnodeReached sont vides ici (ils existent pour que les nœuds flowgraph s'y abonnent via extensions.hook).

**Dépendances (chargées avant) :** `gameplay_crawl_saveSystem`, `gameplay_crawl_general`, `gameplay_crawl_utils`, `gameplay_crawl_boundary`, `gameplay_crawl_display`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_flowgraphBridge.applyPenalty(penaltyType)` | Applique une pénalité au crawler actif avec les points de gameplay_crawl_utils.infractionPoints[penaltyType]. Sans effet si aucun crawler actif ou si le type est inconnu. | 250 |
| `gameplay_crawl_flowgraphBridge.cleanup()` | Arrête le crawl actif s'il y en a un. | 319 |
| `gameplay_crawl_flowgraphBridge.getActiveCrawlerId()` | Retourne l'id du premier crawler dont l'état est actif. | 230 |
| `gameplay_crawl_flowgraphBridge.getAllStartingPositions()` | Liste toutes les positions de départ (saveSystem). | 238 |
| `gameplay_crawl_flowgraphBridge.getAllTrails()` | Liste tous les parcours (saveSystem). | 234 |
| `gameplay_crawl_flowgraphBridge.getCrawlEndData()` | Résumé du crawl du crawler actif. | 155 |
| `gameplay_crawl_flowgraphBridge.getCrawlRuntimeData()` | État en cours du crawl actif. | 177 |
| `gameplay_crawl_flowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName)` | Délègue à gameplay_crawl_utils.getDynamicObjectsFromPrefab. | 246 |
| `gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpoint()` | Dernier point de récupération du crawler actif. | 279 |
| `gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpointIndex()` | Indice du dernier point de récupération du crawler actif. | 288 |
| `gameplay_crawl_flowgraphBridge.getPenaltyTypes()` | Liste des types de pénalité. | 275 |
| `gameplay_crawl_flowgraphBridge.getPlayerTrailStats(trailId)` | Statistiques du joueur sur un parcours (saveSystem). | 242 |
| `gameplay_crawl_flowgraphBridge.getTrailInfo(trailId)` | Métadonnées d'un parcours (celui indiqué, sinon le parcours actif). | 200 |
| `gameplay_crawl_flowgraphBridge.isCrawlActive()` | Indique si un parcours est actif dans gameplay_crawl_general. | 226 |
| `gameplay_crawl_flowgraphBridge.loadCrawlTrail(trailId)` | Récupère un parcours par id depuis saveSystem. | 21 |
| `gameplay_crawl_flowgraphBridge.onCrawlPathnodeReached(eventData)` | Hook appelé quand un noeud du chemin est atteint : corps vide. *(interne)* *(hook)* | 312 |
| `gameplay_crawl_flowgraphBridge.onCrawlResultsShown(eventData)` | Hook appelé quand les résultats sont affichés : corps vide. *(interne)* *(hook)* | 309 |
| `gameplay_crawl_flowgraphBridge.onCrawlStarted()` | Hook appelé au démarrage d'un crawl : corps vide. *(interne)* *(hook)* | 306 |
| `gameplay_crawl_flowgraphBridge.resetCrawl()` | Réinitialise les données du crawler actif et téléporte son véhicule à la position de départ du parcours (spawn.safeTeleport). | 121 |
| `gameplay_crawl_flowgraphBridge.setRecoveryCheckpoint(checkpoint)` | Définit le point de récupération du crawler actif. | 297 |
| `gameplay_crawl_flowgraphBridge.setupCrawl(vehicleId, trail)` | Prépare un crawl : arrête l'éventuel crawl en cours, puis appelle gameplay_crawl_general.setupCrawl(trail, veh, true) (zone, chemin, départ, prefabs, téléportation au départ). | 36 |
| `gameplay_crawl_flowgraphBridge.startCrawl(vehicleId, trail)` | Démarre le crawl préparé (gameplay_crawl_general.startCrawlFlowgraph) ou reprend le chronomètre d'un crawl déjà prêt. | 66 |
| `gameplay_crawl_flowgraphBridge.stopCrawl()` | Arrête le crawl actif (gameplay_crawl_utils.stopCrawl(true)). | 112 |

### Détail des paramètres

#### `gameplay_crawl_flowgraphBridge.applyPenalty(penaltyType)`

Applique une pénalité au crawler actif avec les points de gameplay_crawl_utils.infractionPoints[penaltyType]. Sans effet si aucun crawler actif ou si le type est inconnu.

- `penaltyType` (*string*) : Un des types de getPenaltyTypes().

#### `gameplay_crawl_flowgraphBridge.getActiveCrawlerId()`

Retourne l'id du premier crawler dont l'état est actif.

- **renvoie** : integer|nil Id du véhicule.

#### `gameplay_crawl_flowgraphBridge.getAllStartingPositions()`

Liste toutes les positions de départ (saveSystem).

- **renvoie** : table Positions de départ.

#### `gameplay_crawl_flowgraphBridge.getAllTrails()`

Liste tous les parcours (saveSystem).

- **renvoie** : table Parcours.

#### `gameplay_crawl_flowgraphBridge.getCrawlEndData()`

Résumé du crawl du crawler actif.

- **renvoie** : table|nil {time, points, completed, pathnodesCompleted, pathnodeTimings, disqualified, recoveries} ; nil si aucun crawl actif.

#### `gameplay_crawl_flowgraphBridge.getCrawlRuntimeData()`

État en cours du crawl actif.

- **renvoie** : table|nil {currentTime, currentPathnodeIndex, points, isCompleted, disqualified, crawlerPosition, crawlerDirection, vehicleId} ; nil si aucun crawl actif.

#### `gameplay_crawl_flowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName)`

Délègue à gameplay_crawl_utils.getDynamicObjectsFromPrefab.

- `prefabId` (*any*) : Id du prefab.
- `dynamicName` (*string*) : Nom dynamique recherché.
- **renvoie** : table Objets trouvés (déduit du code).

#### `gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpoint()`

Dernier point de récupération du crawler actif.

- **renvoie** : table|nil Point de récupération (déduit du code) ; nil si aucun crawler actif.

#### `gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpointIndex()`

Indice du dernier point de récupération du crawler actif.

- **renvoie** : integer Indice, 0 si aucun crawler actif.

#### `gameplay_crawl_flowgraphBridge.getPenaltyTypes()`

Liste des types de pénalité.

- **renvoie** : string[] Noms des pénalités.

#### `gameplay_crawl_flowgraphBridge.getPlayerTrailStats(trailId)`

Statistiques du joueur sur un parcours (saveSystem).

- `trailId` (*string*) : Id du parcours.
- **renvoie** : table|nil Statistiques.

#### `gameplay_crawl_flowgraphBridge.getTrailInfo(trailId)`

Métadonnées d'un parcours (celui indiqué, sinon le parcours actif).

- `trailId` (*string|nil*) : Id du parcours.
- **renvoie** : table|nil {name, description, pathId, boundaryId, startingPositionId, pathReversed, rules, prefabs, metadata}.

#### `gameplay_crawl_flowgraphBridge.isCrawlActive()`

Indique si un parcours est actif dans gameplay_crawl_general.

- **renvoie** : boolean true si activeTrail existe.

#### `gameplay_crawl_flowgraphBridge.loadCrawlTrail(trailId)`

Récupère un parcours par id depuis saveSystem.

- `trailId` (*string*) : Id (chemin de fichier) du parcours.
- **renvoie** : table|nil Le parcours, ou nil si absent.

#### `gameplay_crawl_flowgraphBridge.onCrawlPathnodeReached(eventData)`

Hook appelé quand un noeud du chemin est atteint : corps vide.

- `eventData` (*table*) : Données de l'évènement.

#### `gameplay_crawl_flowgraphBridge.onCrawlResultsShown(eventData)`

Hook appelé quand les résultats sont affichés : corps vide.

- `eventData` (*table*) : Données de l'évènement.

#### `gameplay_crawl_flowgraphBridge.resetCrawl()`

Réinitialise les données du crawler actif et téléporte son véhicule à la position de départ du parcours (spawn.safeTeleport).

- **renvoie** : boolean true si réinitialisé et téléporté.

#### `gameplay_crawl_flowgraphBridge.setRecoveryCheckpoint(checkpoint)`

Définit le point de récupération du crawler actif.

- `checkpoint` (*any*) : Point de passage (déduit du code).
- **renvoie** : boolean false si aucun crawler actif, sinon le résultat de utils.setRecoveryCheckpoint.

#### `gameplay_crawl_flowgraphBridge.setupCrawl(vehicleId, trail)`

Prépare un crawl : arrête l'éventuel crawl en cours, puis appelle gameplay_crawl_general.setupCrawl(trail, veh, true) (zone, chemin, départ, prefabs, téléportation au départ).

- `vehicleId` (*integer|nil*) : Id du véhicule ; véhicule du joueur 0 si nil.
- `trail` (*table*) : Parcours à préparer.
- **renvoie** : boolean true si la préparation a réussi.

#### `gameplay_crawl_flowgraphBridge.startCrawl(vehicleId, trail)`

Démarre le crawl préparé (gameplay_crawl_general.startCrawlFlowgraph) ou reprend le chronomètre d'un crawl déjà prêt.

- `vehicleId` (*integer|nil*) : Id du véhicule.
- `trail` (*table|nil*) : Parcours ; sinon le parcours actif de general.
- **renvoie** : boolean true si le crawl est démarré.

#### `gameplay_crawl_flowgraphBridge.stopCrawl()`

Arrête le crawl actif (gameplay_crawl_utils.stopCrawl(true)).

- **renvoie** : boolean false s'il n'y avait pas de parcours actif.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : gameplay_crawl_saveSystem, general, utils, boundary, display. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua`.*
