# `gameplay_crawl_utils`

*Fichier : `lua/ge/extensions/gameplay/crawl/utils.lua` · VM : Game Engine (GE) · 2071 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_utils` : `extensions.load("gameplay_crawl_utils")`, puis la globale `gameplay_crawl_utils`

Moteur d'exécution du mode crawl (franchissement lent d'un parcours à points de passage). Il garde l'état de chaque crawler (crawlStates, indexé par id de véhicule) : noeud courant, noeuds franchis ou sautés, chrono, points de pénalité, évènements, point de récupération, disqualification. À chaque image, updateCrawl avance le chrono, lit la position du véhicule, détecte les noeuds atteints (test 2D sur le centre de la boîte englobante, avec contrôle de direction si le noeud a une rotation), vérifie la zone limite (gameplay_crawl_boundary), les infractions (marche arrière, touche de portes dynamiques) et le seuil de DNF. Il gère aussi les marqueurs 3D des portes (partagés ou par joueur en écran partagé), le tracé en pointillés d'aperçu, le chargement des prefabs du parcours, l'intégration à core_lapTimes et les réinitialisations de véhicule. Le barème est dans infractionPoints.

## Exemple

```lua
gameplay_crawl_utils.setDebugDraw(true)  -- affiche chemin, zone et départ du parcours actif
```

## Remarques

- Barème par défaut (points, plus bas = meilleur) : drivingBackwards 1, vehicleFlippedUpright 5, gateTouch 10, vehicleReset 10, boundaryViolation 10, wrongDirection 10, skippedCheckpoint 10, dnf 50, gateCleared -2, bonusGateCleared -15. Le total ne descend jamais sous 0.
- DNF : atteint quand points >= trail.rules.dnfPointLimit (si > 0) sinon 50. trail.rules.penalties == false désactive toutes les pénalités (hasPenalties).
- Cooldowns (s) : drivingBackwards 5, boundaryViolation 3. Marche arrière : produit scalaire vitesse/direction (2D) < -0.5 ; pénalité après distance cumulée > 2.
- Franchissement d'un noeud : le centre de la boîte englobante (bbCenter) doit être dans le rayon (4.0 m par défaut) en XY ; si le noeud a une rotation, le véhicule doit regarder et (au-dessus de 1 m/s) rouler dans la direction (produit scalaire > 0.5). Seuls les noeuds courant-1 à courant+1 sont testés ; sauter un noeud (hors bonus) coûte skippedCheckpoint par noeud sauté. Sans pénalités, on ne peut avancer que dans l'ordre (sauf bonus).
- Un crawl terminé (dernier noeud) déclenche onCrawlResultsShown, débloque le succès CHALLENGE_CRAWL, et le crawler est retiré 3 s plus tard (completionDelay) sauf s'il vient d'une mission.
- Réinitialisation du véhicule : avec trail.rules.recovery.mode == 'lastGate', la touche de reset renvoie au dernier noeud franchi (ou au départ) avec la pénalité vehicleReset (recoverToLastGate) ; sinon, un téléport détecté (> 1 m) hors mission entraîne un DNF immédiat, et en mission une pénalité vehicleFlippedUpright.
- L'extension remplace commands.dropPlayerAtCameraNoReset pour compter une réinitialisation ; la fonction d'origine est restaurée dans onExtensionUnloaded.
- Modes des marqueurs : inactive, final, skipped, current, bonus, recovery, finished (priorité d'agrégation pour une caméra partagée : finished > bonus = recovery > current > skipped > final > inactive).
- Bug probable : calculatePathStats ne tient pas compte de pathReversed (la boucle réassigne l'indice local i sans effet) et le cache est indexé par pathId seul ; gain et perte d'altitude ne sont donc pas échangés pour un parcours inversé.
- Incohérence : si core_lapTimes n'est pas encore chargé quand ce fichier est lu, la variable locale core_lapTimes reste nil pour toute la session.
- drawMarkers lit la globale photoModeOpen, supposée définie ailleurs.
- Hooks émis : onCrawlPenaltyScoreChanged({crawlerId, penaltyScore, oldPenaltyScore}), onCrawlPathnodeReached({crawlerId, pathnodeId, pathnodeIndex, time, pathnodeTimings}), onCrawlResultsShown({crawlerId, time, points}), onCrawlDisqualified({crawlerId}), showDisqualifiedMessage({crawlerId, time}), onCrawlCleared().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_utils.activateCrawlMarkers()` | Active le premier marqueur ('current') du chemin actif et quitte le mode aperçu. | 540 |
| `gameplay_crawl_utils.applyPenalty(crawlerId, penaltyType, points)` | Ajoute des points au crawler (négatifs = bonus ; total borné à 0), émet onCrawlPenaltyScoreChanged et consigne l'évènement. Sans effet si le crawler est inactif ou si les pénalités sont désactivées. | 231 |
| `gameplay_crawl_utils.calculatePathStats(pathId, pathReversed)` | Calcule distance totale et dénivelé d'un chemin (par pas de 5 m) et met le résultat en cache. | 1741 |
| `gameplay_crawl_utils.clear(force)` | Efface les marqueurs, décharge les prefabs, supprime tous les états de crawlers, remet gameplay_crawl_general.activeTrail à nil, émet onCrawlCleared et efface les messages. Sans force, ne fait rien si un crawl de mission est actif. | 397 |
| `gameplay_crawl_utils.clearCrawler(crawlerId)` | Retire un crawler (ses marqueurs par joueur et son état). | 372 |
| `gameplay_crawl_utils.clearMarkers()` | Supprime tous les marqueurs de portes et quitte le mode aperçu. | 359 |
| `gameplay_crawl_utils.drawMarkers(dtReal, dtSim, dtRaw)` | Met à jour et affiche les marqueurs de portes (masqués en mode photo). Appelée par onPreRender. *(interne)* | 1623 |
| `gameplay_crawl_utils.getActiveCrawlerId()` | Retourne l'id du premier crawler actif trouvé. | 1902 |
| `gameplay_crawl_utils.getAllCrawlStates()` | Retourne la table interne de tous les états (indexés par id de véhicule), sans copie. | 1898 |
| `gameplay_crawl_utils.getCrawlState(crawlerId)` | Retourne l'état complet d'un crawler : active, trail, crawlerData, currentPathnodeIndex, completedPathnodes, skippedPathnodes, pathnodeTimings, eventLog, currentTime, isCompleted, completionStartTime, events, crawlStarted, lastRecoveryCheckpoint, lastRecoveryCheckpointIndex, lastReachedPathnodeIndex, isDisqualified, recoveryCount, isFromMission, raceData. | 1862 |
| `gameplay_crawl_utils.getCrawlerDirection(crawlerId)` | Retourne l'orientation du véhicule réduite à son lacet (rotation autour de Z). | 1874 |
| `gameplay_crawl_utils.getCrawlerPosition(crawlerId)` | Retourne la dernière position connue d'un crawler (référence vers un vec3 mis à jour en continu). | 1866 |
| `gameplay_crawl_utils.getDottedPath()` | Retourne les points du tracé en pointillés d'aperçu. | 1915 |
| `gameplay_crawl_utils.getDynamicObjectsFromPrefab(prefabId, dynamicName)` | Liste les ids des enfants d'un prefab dont un champ dynamique a pour valeur dynamicName. | 288 |
| `gameplay_crawl_utils.getLastRecoveryCheckpoint(crawlerId)` | Retourne le dernier point de récupération franchi par un crawler actif. | 1919 |
| `gameplay_crawl_utils.getLastRecoveryCheckpointIndex(crawlerId)` | Retourne l'indice du dernier point de récupération d'un crawler actif. | 1932 |
| `gameplay_crawl_utils.hasPenalties(crawlerId)` | Indique si le parcours du crawler applique des pénalités (vrai sauf si trail.rules.penalties == false). | 225 |
| `gameplay_crawl_utils.isDebugDrawEnabled()` | Indique si l'overlay de debug est actif. | 1737 |
| `gameplay_crawl_utils.isPreviewMode()` | Indique si les marqueurs sont en mode aperçu (avant le démarrage du crawl). | 1911 |
| `gameplay_crawl_utils.loadPrefabs(prefabFileList)` | Fait apparaître les prefabs du parcours (canSave = false, ajoutés à MissionGroup), empêche l'entrée automatique dans les véhicules, repère les objets portant le champ dynamique 'crawlDynamic' (portes qui coûtent gateTouch si touchées), recharge les collisions puis crée les drapeaux de la zone limite (espacement 5 m). | 313 |
| `gameplay_crawl_utils.onBoundaryViolation(crawlerId)` | Applique la pénalité boundaryViolation et affiche le message, sauf pendant le délai de 3 s. Appelée par gameplay_crawl_boundary.checkBoundary. *(interne)* *(hook)* | 1550 |
| `gameplay_crawl_utils.onDrawOnMinimap(td)` | Hook de dessin de la minimap : dessine les marqueurs de portes (ceux du joueur 0 en écran partagé). *(interne)* *(hook)* | 1660 |
| `gameplay_crawl_utils.onExtensionUnloaded()` | Hook appelé au déchargement : restaure commands.dropPlayerAtCameraNoReset. *(interne)* *(hook)* | 2063 |
| `gameplay_crawl_utils.onPreRender(dtReal, dtSim, dtRaw)` | Hook appelé avant le rendu : affiche les marqueurs, l'aperçu en pointillés (en mode aperçu), le guidage en pause et l'overlay de debug. *(interne)* *(hook)* | 1713 |
| `gameplay_crawl_utils.onSpawnCCallback(objId)` | Hook appelé quand un objet est créé : pendant le chargement des prefabs, désactive l'entrée automatique dans le véhicule créé. *(interne)* *(hook)* | 1830 |
| `gameplay_crawl_utils.onSplitScreenChanged(enabled, _playerCount, _layoutId, layoutMode)` | Hook appelé au changement d'écran partagé : reconstruit les marqueurs (par joueur en mode 'split', sinon partagés). *(interne)* *(hook)* | 1672 |
| `gameplay_crawl_utils.onVehicleFlippedUpright(crawlerId)` | Applique la pénalité vehicleFlippedUpright et affiche le message. *(interne)* *(hook)* | 1431 |
| `gameplay_crawl_utils.onVehicleReset(crawlerId, isGateRecovery)` | Compte une récupération du véhicule. Avec isGateRecovery : pénalité vehicleReset et délai de 5 s sans pénalité de marche arrière ; sinon, en mission : pénalité vehicleFlippedUpright ; hors mission : pénalité dnf (seuil du parcours), donc disqualification. *(hook)* | 1440 |
| `gameplay_crawl_utils.recoverToLastGate(crawlerId)` | Téléporte le véhicule au dernier noeud franchi (ou à la position de départ), avec la rotation du noeud ou une direction déduite du noeud voisin, répare le véhicule sauf si recovery.repairVehicle == false, et applique la pénalité de récupération. Exige trail.rules.recovery.mode == 'lastGate'. | 1495 |
| `gameplay_crawl_utils.resetCrawlData(crawlerId, force)` | Remet à zéro l'état du crawler (noeud 1, chrono, points, infractions, évènements ; crawlStarted devient false), efface les messages et le suivi des temps. | 1151 |
| `gameplay_crawl_utils.resumeCrawlTimer(crawlerId)` | Fait démarrer le chrono d'un crawler préparé mais pas encore lancé (crawlStarted devient true) et affiche les messages de début et de points. | 1806 |
| `gameplay_crawl_utils.setCrawlState(crawlerId, state)` | Remplace l'état d'un crawler. | 1890 |
| `gameplay_crawl_utils.setDebugDraw(enabled)` | Active ou désactive l'overlay de debug (chemin, zone limite, position de départ). | 1727 |
| `gameplay_crawl_utils.setRecoveryCheckpoint(crawlerId, checkpoint)` | Impose le point de récupération d'un crawler actif et active le délai de 5 s sans pénalité de marche arrière. | 1945 |
| `gameplay_crawl_utils.setupCrawlMarkers(path)` | Crée les marqueurs de portes d'un chemin (tous cachés, le dernier en 'final'), construit le tracé en pointillés depuis la position du joueur et passe en mode aperçu. Sans effet si les marqueurs de ce chemin existent déjà. | 490 |
| `gameplay_crawl_utils.setupCrawlerData(veh)` | Crée les données dynamiques d'un crawler pour un véhicule : id, points, boîte englobante (getSpawnWorldOOBB), décalages des roues (coins de référence), valeurs d'infraction ; enregistre aussi la notification de accZSmooth. | 1279 |
| `gameplay_crawl_utils.startCrawl(crawlerId, trail, crawlerData, isFromMission)` | Crée l'état du crawler (noeud 1, chrono 0, points conservés dans crawlerData), prépare les marqueurs de portes du chemin actif, affiche les messages de début et de points, et configure core_lapTimes (un seul tour, un segment par noeud). Nécessite gameplay_crawl_general.activeTrail avec un chemin non vide. | 1074 |
| `gameplay_crawl_utils.stopCrawl(force)` | Arrête le suivi des temps (core_lapTimes.onRaceStop), efface les points de sortie de zone et appelle clear. Sans force, ne fait rien si un crawl actif vient d'une mission. | 1029 |
| `gameplay_crawl_utils.toggleDebugDraw()` | Bascule l'overlay de debug. | 1732 |
| `gameplay_crawl_utils.trackVehReset(vehId)` | Appelée quand le joueur réinitialise son véhicule : avec la règle de récupération au dernier noeud, annule l'aperçu de récupération puis demande recoverToLastGate ; sinon, mémorise la position pour détecter à l'image suivante un téléport réel (> 1 m) et appliquer onVehicleReset. | 2010 |
| `gameplay_crawl_utils.unloadPrefabs()` | Supprime les prefabs créés, recharge les collisions, vide les objets dynamiques et les marqueurs de zone. | 267 |
| `gameplay_crawl_utils.updateCrawl(dtSim)` | Mise à jour par image de tous les crawlers actifs : animations de la zone limite, chrono, position, noeuds atteints, zone, infractions, évènements, flux de temps vers core_lapTimes, messages de points, DNF et retrait des crawlers terminés. *(interne)* | 1567 |

### Détail des paramètres

#### `gameplay_crawl_utils.applyPenalty(crawlerId, penaltyType, points)`

Ajoute des points au crawler (négatifs = bonus ; total borné à 0), émet onCrawlPenaltyScoreChanged et consigne l'évènement. Sans effet si le crawler est inactif ou si les pénalités sont désactivées.

- `crawlerId` (*integer*) : Id du véhicule.
- `penaltyType` (*string*) : Clé de infractionPoints (ex. 'boundaryViolation', 'dnf').
- `points` (*number|nil*) : Points à ajouter ; sinon la valeur de infractionPoints[penaltyType].

#### `gameplay_crawl_utils.calculatePathStats(pathId, pathReversed)`

Calcule distance totale et dénivelé d'un chemin (par pas de 5 m) et met le résultat en cache.

- `pathId` (*string*) : Id (fichier) du chemin.
- `pathReversed` (*boolean|nil*) : Sans effet réel (voir notes).
- **renvoie** : table|nil {totalDistance (m), totalElevationChange (m), elevationGain, elevationLoss} ; nil si le chemin a moins de 2 positions.

#### `gameplay_crawl_utils.clear(force)`

Efface les marqueurs, décharge les prefabs, supprime tous les états de crawlers, remet gameplay_crawl_general.activeTrail à nil, émet onCrawlCleared et efface les messages. Sans force, ne fait rien si un crawl de mission est actif.

- `force` (*boolean|nil*) : Vrai pour tout effacer même en mission.

#### `gameplay_crawl_utils.clearCrawler(crawlerId)`

Retire un crawler (ses marqueurs par joueur et son état).

- `crawlerId` (*integer|nil*) : Id du véhicule.

#### `gameplay_crawl_utils.drawMarkers(dtReal, dtSim, dtRaw)`

Met à jour et affiche les marqueurs de portes (masqués en mode photo). Appelée par onPreRender.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `gameplay_crawl_utils.getActiveCrawlerId()`

Retourne l'id du premier crawler actif trouvé.

- **renvoie** : integer|nil Id du véhicule.

#### `gameplay_crawl_utils.getAllCrawlStates()`

Retourne la table interne de tous les états (indexés par id de véhicule), sans copie.

- **renvoie** : table<integer, table> États.

#### `gameplay_crawl_utils.getCrawlState(crawlerId)`

Retourne l'état complet d'un crawler : active, trail, crawlerData, currentPathnodeIndex, completedPathnodes, skippedPathnodes, pathnodeTimings, eventLog, currentTime, isCompleted, completionStartTime, events, crawlStarted, lastRecoveryCheckpoint, lastRecoveryCheckpointIndex, lastReachedPathnodeIndex, isDisqualified, recoveryCount, isFromMission, raceData.

- `crawlerId` (*integer*) : Id du véhicule.
- **renvoie** : table|nil État, ou nil.

#### `gameplay_crawl_utils.getCrawlerDirection(crawlerId)`

Retourne l'orientation du véhicule réduite à son lacet (rotation autour de Z).

- `crawlerId` (*integer*) : Id du véhicule.
- **renvoie** : quat Quaternion de lacet ; identité si inconnu.

#### `gameplay_crawl_utils.getCrawlerPosition(crawlerId)`

Retourne la dernière position connue d'un crawler (référence vers un vec3 mis à jour en continu).

- `crawlerId` (*integer*) : Id du véhicule.
- **renvoie** : vec3|nil Position.

#### `gameplay_crawl_utils.getDottedPath()`

Retourne les points du tracé en pointillés d'aperçu.

- **renvoie** : table[] Liste de {pos, distanceFromStart}.

#### `gameplay_crawl_utils.getDynamicObjectsFromPrefab(prefabId, dynamicName)`

Liste les ids des enfants d'un prefab dont un champ dynamique a pour valeur dynamicName.

- `prefabId` (*integer*) : Id du prefab.
- `dynamicName` (*string*) : Valeur recherchée.
- **renvoie** : integer[] Ids des objets trouvés ; vide si absent.

#### `gameplay_crawl_utils.getLastRecoveryCheckpoint(crawlerId)`

Retourne le dernier point de récupération franchi par un crawler actif.

- `crawlerId` (*integer*) : Id du véhicule.
- **renvoie** : table|nil {position, rotation, index, time}.

#### `gameplay_crawl_utils.getLastRecoveryCheckpointIndex(crawlerId)`

Retourne l'indice du dernier point de récupération d'un crawler actif.

- `crawlerId` (*integer*) : Id du véhicule.
- **renvoie** : integer Indice ; 0 si aucun ou crawler inactif.

#### `gameplay_crawl_utils.hasPenalties(crawlerId)`

Indique si le parcours du crawler applique des pénalités (vrai sauf si trail.rules.penalties == false).

- `crawlerId` (*integer|nil*) : Id du véhicule.
- **renvoie** : boolean true si les pénalités sont actives.

#### `gameplay_crawl_utils.isDebugDrawEnabled()`

Indique si l'overlay de debug est actif.

- **renvoie** : boolean État.

#### `gameplay_crawl_utils.isPreviewMode()`

Indique si les marqueurs sont en mode aperçu (avant le démarrage du crawl).

- **renvoie** : boolean État.

#### `gameplay_crawl_utils.loadPrefabs(prefabFileList)`

Fait apparaître les prefabs du parcours (canSave = false, ajoutés à MissionGroup), empêche l'entrée automatique dans les véhicules, repère les objets portant le champ dynamique 'crawlDynamic' (portes qui coûtent gateTouch si touchées), recharge les collisions puis crée les drapeaux de la zone limite (espacement 5 m).

- `prefabFileList` (*string[]|nil*) : Chemins de fichiers prefab.

#### `gameplay_crawl_utils.onBoundaryViolation(crawlerId)`

Applique la pénalité boundaryViolation et affiche le message, sauf pendant le délai de 3 s. Appelée par gameplay_crawl_boundary.checkBoundary.

- `crawlerId` (*integer*) : Id du véhicule.

#### `gameplay_crawl_utils.onDrawOnMinimap(td)`

Hook de dessin de la minimap : dessine les marqueurs de portes (ceux du joueur 0 en écran partagé).

- `td` (*table*) : Objet de dessin de la minimap.

#### `gameplay_crawl_utils.onPreRender(dtReal, dtSim, dtRaw)`

Hook appelé avant le rendu : affiche les marqueurs, l'aperçu en pointillés (en mode aperçu), le guidage en pause et l'overlay de debug.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `gameplay_crawl_utils.onSpawnCCallback(objId)`

Hook appelé quand un objet est créé : pendant le chargement des prefabs, désactive l'entrée automatique dans le véhicule créé.

- `objId` (*integer*) : Id de l'objet créé.

#### `gameplay_crawl_utils.onSplitScreenChanged(enabled, _playerCount, _layoutId, layoutMode)`

Hook appelé au changement d'écran partagé : reconstruit les marqueurs (par joueur en mode 'split', sinon partagés).

- `enabled` (*boolean*) : Écran partagé activé.
- `_playerCount` (*integer*) : Nombre de joueurs (non utilisé).
- `_layoutId` (*any*) : Identifiant de disposition (non utilisé).
- `layoutMode` (*string|nil*) : Mode de disposition ('split' pour des vues séparées).

#### `gameplay_crawl_utils.onVehicleFlippedUpright(crawlerId)`

Applique la pénalité vehicleFlippedUpright et affiche le message.

- `crawlerId` (*integer*) : Id du véhicule.

#### `gameplay_crawl_utils.onVehicleReset(crawlerId, isGateRecovery)`

Compte une récupération du véhicule. Avec isGateRecovery : pénalité vehicleReset et délai de 5 s sans pénalité de marche arrière ; sinon, en mission : pénalité vehicleFlippedUpright ; hors mission : pénalité dnf (seuil du parcours), donc disqualification.

- `crawlerId` (*integer*) : Id du véhicule.
- `isGateRecovery` (*boolean|nil*) : Vrai si la récupération vient de recoverToLastGate.

#### `gameplay_crawl_utils.recoverToLastGate(crawlerId)`

Téléporte le véhicule au dernier noeud franchi (ou à la position de départ), avec la rotation du noeud ou une direction déduite du noeud voisin, répare le véhicule sauf si recovery.repairVehicle == false, et applique la pénalité de récupération. Exige trail.rules.recovery.mode == 'lastGate'.

- `crawlerId` (*integer*) : Id du véhicule.
- **renvoie** : boolean true si la téléportation a eu lieu.

#### `gameplay_crawl_utils.resetCrawlData(crawlerId, force)`

Remet à zéro l'état du crawler (noeud 1, chrono, points, infractions, évènements ; crawlStarted devient false), efface les messages et le suivi des temps.

- `crawlerId` (*integer*) : Id du véhicule.
- `force` (*boolean|nil*) : Nécessaire pour réinitialiser un crawl de mission.
- **renvoie** : boolean false si le crawler est inconnu, inactif, ou protégé (mission sans force).

#### `gameplay_crawl_utils.resumeCrawlTimer(crawlerId)`

Fait démarrer le chrono d'un crawler préparé mais pas encore lancé (crawlStarted devient true) et affiche les messages de début et de points.

- `crawlerId` (*integer*) : Id du véhicule.
- **renvoie** : boolean true si le chrono tourne (déjà démarré ou démarré maintenant).

#### `gameplay_crawl_utils.setCrawlState(crawlerId, state)`

Remplace l'état d'un crawler.

- `crawlerId` (*integer*) : Id du véhicule.
- `state` (*table*) : Nouvel état.
- **renvoie** : boolean false si un paramètre manque.

#### `gameplay_crawl_utils.setDebugDraw(enabled)`

Active ou désactive l'overlay de debug (chemin, zone limite, position de départ).

- `enabled` (*boolean*) : true pour activer.
- **renvoie** : boolean Nouvel état.

#### `gameplay_crawl_utils.setRecoveryCheckpoint(crawlerId, checkpoint)`

Impose le point de récupération d'un crawler actif et active le délai de 5 s sans pénalité de marche arrière.

- `crawlerId` (*integer*) : Id du véhicule.
- `checkpoint` (*table*) : {position, rotation, index, time}.
- **renvoie** : boolean false si paramètres manquants ou crawler inactif.

#### `gameplay_crawl_utils.setupCrawlMarkers(path)`

Crée les marqueurs de portes d'un chemin (tous cachés, le dernier en 'final'), construit le tracé en pointillés depuis la position du joueur et passe en mode aperçu. Sans effet si les marqueurs de ce chemin existent déjà.

- `path` (*table*) : Chemin avec nodes (pos, rotation, radius).

#### `gameplay_crawl_utils.setupCrawlerData(veh)`

Crée les données dynamiques d'un crawler pour un véhicule : id, points, boîte englobante (getSpawnWorldOOBB), décalages des roues (coins de référence), valeurs d'infraction ; enregistre aussi la notification de accZSmooth.

- `veh` (*userdata*) : Objet véhicule.
- **renvoie** : table|nil Données du crawler, nil si veh est nil.

#### `gameplay_crawl_utils.startCrawl(crawlerId, trail, crawlerData, isFromMission)`

Crée l'état du crawler (noeud 1, chrono 0, points conservés dans crawlerData), prépare les marqueurs de portes du chemin actif, affiche les messages de début et de points, et configure core_lapTimes (un seul tour, un segment par noeud). Nécessite gameplay_crawl_general.activeTrail avec un chemin non vide.

- `crawlerId` (*integer*) : Id du véhicule.
- `trail` (*table*) : Parcours (rules, etc.).
- `crawlerData` (*table*) : Données du crawler créées par setupCrawlerData.
- `isFromMission` (*boolean|nil*) : Vrai si lancé par une mission : le crawler n'est alors pas retiré automatiquement à la fin.
- **renvoie** : boolean false si paramètres invalides ou chemin vide.

#### `gameplay_crawl_utils.stopCrawl(force)`

Arrête le suivi des temps (core_lapTimes.onRaceStop), efface les points de sortie de zone et appelle clear. Sans force, ne fait rien si un crawl actif vient d'une mission.

- `force` (*boolean|nil*) : Vrai pour arrêter même un crawl de mission.

#### `gameplay_crawl_utils.toggleDebugDraw()`

Bascule l'overlay de debug.

- **renvoie** : boolean Nouvel état.

#### `gameplay_crawl_utils.trackVehReset(vehId)`

Appelée quand le joueur réinitialise son véhicule : avec la règle de récupération au dernier noeud, annule l'aperçu de récupération puis demande recoverToLastGate ; sinon, mémorise la position pour détecter à l'image suivante un téléport réel (> 1 m) et appliquer onVehicleReset.

- `vehId` (*integer|string|nil*) : Id du véhicule ; si nil, le crawler du joueur ayant utilisé un périphérique en dernier, ou tous les crawlers actifs.

#### `gameplay_crawl_utils.updateCrawl(dtSim)`

Mise à jour par image de tous les crawlers actifs : animations de la zone limite, chrono, position, noeuds atteints, zone, infractions, évènements, flux de temps vers core_lapTimes, messages de points, DNF et retrait des crawlers terminés.

- `dtSim` (*number*) : Delta temps simulation (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `drivingBackwardsSettings` | table<string, number> | Réglages de détection de marche arrière : velocityDotThreshold = -0.5, distanceThreshold = 2. |
| `infractionCooldowns` | table<string, number> | Délais de répétition en secondes : drivingBackwards = 5, boundaryViolation = 3. |
| `infractionPoints` | table<string, number> | Points par type d'infraction (voir notes). Valeurs négatives = bonus. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCrawlCleared` — écouté par 2 module(s)
- `onCrawlDisqualified` — écouté par 2 module(s)
- `onCrawlPathnodeReached` — écouté par 2 module(s)
- `onCrawlPenaltyScoreChanged` — écouté par 1 module(s)
- `onCrawlResultsShown` — écouté par 5 module(s)
- `showDisqualifiedMessage`

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `be:` `getObjectOOBBCenterXYZ`, `getPlayerVehicle`, `getPlayerVehicleID`, `reloadCollision`
- `debugDrawer:` `drawSphere`
- `obj:` `delete`, `setDynDataFieldbyName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/utils.lua`.*
