# `gameplay_crawl_crawlFlowgraphBridge`

*Fichier : `lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua` · VM : Game Engine (GE) · 314 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_crawlFlowgraphBridge` : `extensions.load("gameplay_crawl_crawlFlowgraphBridge")`, puis la globale `gameplay_crawl_crawlFlowgraphBridge`

Pont entre le mode « crawl » (franchissement lent de parcours à points de passage) et les nœuds flowgraph / missions. Il charge un parcours (trail) depuis gameplay_crawl_saveSystem, le configure (zone, chemin, position de départ, prefabs), démarre et arrête le crawl sur un véhicule via gameplay_crawl_general / gameplay_crawl_utils, et expose l'état courant (temps, points, noeud atteint, disqualification) et la liste des parcours. Un seul crawl actif à la fois, mémorisé dans bridgeState.

## Exemple

```lua
local trail = gameplay_crawl_crawlFlowgraphBridge.loadCrawlTrail(trailId)
if trail and gameplay_crawl_crawlFlowgraphBridge.configureCrawl(trail) then
  gameplay_crawl_crawlFlowgraphBridge.startCrawl()
end
```

## Remarques

- Ordre d'appel attendu : loadCrawlTrail -> configureCrawl -> startCrawl ; sans configureCrawl, startCrawl échoue (« No active trail configured »).
- startCrawl sans vehicleId utilise be:getPlayerVehicle(0).
- stopCrawl et resetCrawl vident l'état du pont (le parcours actif est oublié).
- Incohérence : getCrawlEndData lit state.isCompleting et state.events.disqualified (champ remis à false dès que l'évènement est traité, donc quasi toujours faux), tandis que getCrawlRuntimeData lit state.isCompleted ; la version flowgraphBridge.lua, plus récente, utilise state.isCompleted et state.isDisqualified. Ce fichier semble être une ancienne variante de flowgraphBridge.lua.
- Lorsque l'état du crawl n'existe plus ou n'est plus actif, getCrawlEndData et getCrawlRuntimeData retournent nil.
- getPenaltyTypes : boundaryViolation, drivingBackwards, gateTouch, vehicleReset, wrongDirection, skippedCheckpoint, vehicleFlippedUpright, dnf.
- Les logs des hooks utilisent eventData.time et eventData.points ; il faut donc fournir ces champs.

**Dépendances (chargées avant) :** `gameplay_crawl_saveSystem`, `gameplay_crawl_general`, `gameplay_crawl_utils`, `gameplay_crawl_boundary`, `gameplay_crawl_display`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_crawlFlowgraphBridge.applyPenalty(penaltyType)` | Applique une pénalité au crawler actif, avec le nombre de points défini dans gameplay_crawl_utils.infractionPoints. Sans effet si le crawl est inactif ou le type inconnu. | 243 |
| `gameplay_crawl_crawlFlowgraphBridge.cleanup()` | Arrête le crawl éventuel et vide l'état du pont. | 303 |
| `gameplay_crawl_crawlFlowgraphBridge.configureCrawl(trail)` | Prépare le crawl actif à partir d'un parcours : résout sa zone (boundaryId), son chemin (pathId) et sa position de départ (startingPositionId) ; la zone et le chemin sont obligatoires. | 32 |
| `gameplay_crawl_crawlFlowgraphBridge.getActiveCrawlerId()` | Retourne l'id du véhicule en crawl. | 223 |
| `gameplay_crawl_crawlFlowgraphBridge.getAllStartingPositions()` | Liste toutes les positions de départ connues de saveSystem. | 231 |
| `gameplay_crawl_crawlFlowgraphBridge.getAllTrails()` | Liste tous les parcours connus de saveSystem. | 227 |
| `gameplay_crawl_crawlFlowgraphBridge.getCrawlEndData()` | Retourne un résumé de fin de crawl pour le crawler actif. | 151 |
| `gameplay_crawl_crawlFlowgraphBridge.getCrawlRuntimeData()` | Retourne l'état en cours du crawl. | 171 |
| `gameplay_crawl_crawlFlowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName)` | Délègue à gameplay_crawl_utils.getDynamicObjectsFromPrefab : objets d'un prefab portant un nom dynamique donné. | 239 |
| `gameplay_crawl_crawlFlowgraphBridge.getLastRecoveryCheckpointIndex()` | Retourne l'indice du dernier point de récupération du crawler actif. | 271 |
| `gameplay_crawl_crawlFlowgraphBridge.getPenaltyTypes()` | Retourne la liste des types de pénalité. | 267 |
| `gameplay_crawl_crawlFlowgraphBridge.getPlayerTrailStats(trailId)` | Retourne les statistiques du joueur sur un parcours (saveSystem). | 235 |
| `gameplay_crawl_crawlFlowgraphBridge.getTrailInfo(trailId)` | Retourne les métadonnées d'un parcours (celui indiqué, sinon le parcours actif). | 193 |
| `gameplay_crawl_crawlFlowgraphBridge.isCrawlActive()` | Indique si un crawl est actif via ce pont. | 219 |
| `gameplay_crawl_crawlFlowgraphBridge.loadCrawlTrail(trailId)` | Récupère un parcours par id depuis saveSystem. | 16 |
| `gameplay_crawl_crawlFlowgraphBridge.onCrawlPathnodeReached(eventData)` | Hook appelé quand un noeud du chemin est atteint ; journalise indice et temps. *(interne)* *(hook)* | 295 |
| `gameplay_crawl_crawlFlowgraphBridge.onCrawlResultsShown(eventData)` | Hook appelé quand les résultats sont affichés ; journalise temps et points. *(interne)* *(hook)* | 291 |
| `gameplay_crawl_crawlFlowgraphBridge.onCrawlStarted()` | Hook appelé quand un crawl démarre ; journalise seulement. *(interne)* *(hook)* | 287 |
| `gameplay_crawl_crawlFlowgraphBridge.resetCrawl()` | Réinitialise les données du crawler, téléporte le véhicule à la position de départ du parcours (orientation du premier noeud du chemin si disponible, spawn.safeTeleport) puis arrête le crawl. | 102 |
| `gameplay_crawl_crawlFlowgraphBridge.setRecoveryCheckpoint(checkpoint)` | Définit le point de récupération du crawler actif. | 279 |
| `gameplay_crawl_crawlFlowgraphBridge.startCrawl(vehicleId)` | Démarre le crawl configuré sur un véhicule (gameplay_crawl_general.startCrawl) et marque le pont actif. | 59 |
| `gameplay_crawl_crawlFlowgraphBridge.stopCrawl()` | Arrête le crawl actif (gameplay_crawl_utils.stopCrawl) et réinitialise l'état du pont. | 86 |

### Détail des paramètres

#### `gameplay_crawl_crawlFlowgraphBridge.applyPenalty(penaltyType)`

Applique une pénalité au crawler actif, avec le nombre de points défini dans gameplay_crawl_utils.infractionPoints. Sans effet si le crawl est inactif ou le type inconnu.

- `penaltyType` (*string*) : Un des types de getPenaltyTypes().

#### `gameplay_crawl_crawlFlowgraphBridge.configureCrawl(trail)`

Prépare le crawl actif à partir d'un parcours : résout sa zone (boundaryId), son chemin (pathId) et sa position de départ (startingPositionId) ; la zone et le chemin sont obligatoires.

- `trail` (*table*) : Parcours (name, boundaryId, pathId, startingPositionId, prefabs).
- **renvoie** : boolean true si la configuration est valide.

#### `gameplay_crawl_crawlFlowgraphBridge.getActiveCrawlerId()`

Retourne l'id du véhicule en crawl.

- **renvoie** : integer|nil Id du véhicule, nil si aucun.

#### `gameplay_crawl_crawlFlowgraphBridge.getAllStartingPositions()`

Liste toutes les positions de départ connues de saveSystem.

- **renvoie** : table Positions de départ.

#### `gameplay_crawl_crawlFlowgraphBridge.getAllTrails()`

Liste tous les parcours connus de saveSystem.

- **renvoie** : table Parcours.

#### `gameplay_crawl_crawlFlowgraphBridge.getCrawlEndData()`

Retourne un résumé de fin de crawl pour le crawler actif.

- **renvoie** : table|nil {time, points, completed, pathnodesCompleted, pathnodeTimings, disqualified} ; nil si aucun crawl actif.

#### `gameplay_crawl_crawlFlowgraphBridge.getCrawlRuntimeData()`

Retourne l'état en cours du crawl.

- **renvoie** : table|nil {currentTime, currentPathnodeIndex, points, isCompleted, disqualified, crawlerPosition, crawlerDirection, vehicleId} ; nil si aucun crawl actif.

#### `gameplay_crawl_crawlFlowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName)`

Délègue à gameplay_crawl_utils.getDynamicObjectsFromPrefab : objets d'un prefab portant un nom dynamique donné.

- `prefabId` (*any*) : Id du prefab.
- `dynamicName` (*string*) : Nom dynamique recherché.
- **renvoie** : table Objets trouvés (déduit du code).

#### `gameplay_crawl_crawlFlowgraphBridge.getLastRecoveryCheckpointIndex()`

Retourne l'indice du dernier point de récupération du crawler actif.

- **renvoie** : integer Indice, 0 si aucun crawl actif.

#### `gameplay_crawl_crawlFlowgraphBridge.getPenaltyTypes()`

Retourne la liste des types de pénalité.

- **renvoie** : string[] Noms des pénalités.

#### `gameplay_crawl_crawlFlowgraphBridge.getPlayerTrailStats(trailId)`

Retourne les statistiques du joueur sur un parcours (saveSystem).

- `trailId` (*string|integer*) : Id du parcours.
- **renvoie** : table|nil Statistiques.

#### `gameplay_crawl_crawlFlowgraphBridge.getTrailInfo(trailId)`

Retourne les métadonnées d'un parcours (celui indiqué, sinon le parcours actif).

- `trailId` (*string|integer|nil*) : Id du parcours.
- **renvoie** : table|nil {name, description, pathId, boundaryId, startingPositionId, pathReversed, rules, prefabs, metadata}.

#### `gameplay_crawl_crawlFlowgraphBridge.isCrawlActive()`

Indique si un crawl est actif via ce pont.

- **renvoie** : boolean État actif.

#### `gameplay_crawl_crawlFlowgraphBridge.loadCrawlTrail(trailId)`

Récupère un parcours par id depuis saveSystem.

- `trailId` (*string|integer*) : Id du parcours (type exact déduit du code).
- **renvoie** : table|nil Le parcours, ou nil si l'id est manquant ou inconnu.

#### `gameplay_crawl_crawlFlowgraphBridge.onCrawlPathnodeReached(eventData)`

Hook appelé quand un noeud du chemin est atteint ; journalise indice et temps.

- `eventData` (*table*) : {pathnodeIndex, time}.

#### `gameplay_crawl_crawlFlowgraphBridge.onCrawlResultsShown(eventData)`

Hook appelé quand les résultats sont affichés ; journalise temps et points.

- `eventData` (*table*) : {time, points}.

#### `gameplay_crawl_crawlFlowgraphBridge.resetCrawl()`

Réinitialise les données du crawler, téléporte le véhicule à la position de départ du parcours (orientation du premier noeud du chemin si disponible, spawn.safeTeleport) puis arrête le crawl.

- **renvoie** : boolean true si la téléportation a eu lieu.

#### `gameplay_crawl_crawlFlowgraphBridge.setRecoveryCheckpoint(checkpoint)`

Définit le point de récupération du crawler actif.

- `checkpoint` (*any*) : Point de passage (déduit du code).
- **renvoie** : boolean false si aucun crawl actif ; sinon résultat de gameplay_crawl_utils.setRecoveryCheckpoint.

#### `gameplay_crawl_crawlFlowgraphBridge.startCrawl(vehicleId)`

Démarre le crawl configuré sur un véhicule (gameplay_crawl_general.startCrawl) et marque le pont actif.

- `vehicleId` (*integer|nil*) : Id du véhicule ; le véhicule du joueur 0 si nil.
- **renvoie** : boolean true si lancé.

#### `gameplay_crawl_crawlFlowgraphBridge.stopCrawl()`

Arrête le crawl actif (gameplay_crawl_utils.stopCrawl) et réinitialise l'état du pont.

- **renvoie** : boolean false s'il n'y avait pas de crawl actif.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : gameplay_crawl_saveSystem, general, utils, boundary, display. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua`.*
