# `gameplay_drift_freeroam_driftSpots`

*Fichier : `lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua` · VM : Game Engine (GE) · 532 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_freeroam_driftSpots` : `extensions.load("gameplay_drift_freeroam_driftSpots")`, puis la globale `gameplay_drift_freeroam_driftSpots`

Gère les spots de drift du roaming libre (et de la carrière) : zones de départ/arrivée sous forme de lignes (lineOne/lineTwo), à traverser en drift. Il détecte le départ (le joueur drifte dans le rectangle d'une ligne, dans le sens de startDir), passe en contexte inFreeroamChallenge, configure les limites (gameplay_drift_bounds) et le trajet (gameplay_drift_destination), puis détecte la fin propre (ligne d'arrivée franchie à contresens de sa startDir) ou impropre (contresens, hors route, arrêt, remise en place du véhicule). Enregistre le score (10 meilleurs), valide les objectifs et expose les spots comme POI sur la carte.

## Remarques

- Réglages : maxWrongWayDist 5 m, maxDistToIntendedRoad 30 m, phase de conclusion 2.5 s, arrêt (vitesse < 2 m/s) pendant plus de 1 s = abandon (reason stopped).
- Raisons d'échec : wrongWay, outOfBounds, stopped, vehReset (clés de traduction missions.drift.display.endReason.*).
- lineTwo est parcourue en sens inverse : le trajet est chargé avec reverse = (line.name == "lineTwo"). La ligne d'arrivée est la ligne correspondante (lineOne <-> lineTwo) du même spot.
- Ne garde que 10 scores par spot ; les objectifs atteints donnent des récompenses, versées en carrière via career_modules_playerAttributes.
- Les spots ne sont proposés comme POI que si la carrière est active ou si le réglage enableDriftInFreeroam est vrai. Ignoré en multiseat et pendant un gamemode multijoueur.
- Hooks émis : onDriftSpotStarted({lineId}), onDriftSpotFinishLineCrossed(), onDriftSpotCompleted({duration, score, newRecord}), onDriftSpotFailed({reason, concludingPhaseDuration, lineId}), onFreeroamDriftZoneNewHighscore(), onDriftSpotForcedEnd({lineId}).
- Bug : dans onDriftCompletedScored, le champ done du message « New Highscore! » utilise la variable `completed`, qui n'existe pas dans cette portée (nil global).
- Bug mineur : dans onUpdate, un return anticipé (pas de position de véhicule) saute profiler:finish(false) quand le debug général est actif.
- findNearestStartLine est défini mais jamais appelé (code mort).

**Dépendances (chargées avant) :** `gameplay_drift_general`, `gameplay_drift_drift`, `gameplay_drift_scoring`, `gameplay_drift_saveLoad`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_freeroam_driftSpots.detectStart(lineId)` | Teste si le joueur démarre un spot par la ligne indiquée : il doit être dans le rectangle de la ligne, rouler dans le sens de startDir (produit scalaire > 0) et être en train de drifter. Si oui, lance le spot (contexte inFreeroamChallenge, limites, trajet, hook onDriftSpotStarted, tasklist). Sans effet si déjà dans un défi, en multiseat ou en gamemode multijoueur. Logge une erreur si l'id de ligne est inconnu. | 244 |
| `gameplay_drift_freeroam_driftSpots.getDriftDebugInfo()` | Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift. | 379 |
| `gameplay_drift_freeroam_driftSpots.getGC()` | Renvoie la quantité de garbage mesurée par le profileur (0 hors debug). | 387 |
| `gameplay_drift_freeroam_driftSpots.getIsInFreeroamChallenge()` | Indique si un spot de drift est en cours. | 391 |
| `gameplay_drift_freeroam_driftSpots.getIsInTheConcludingPhase()` | Indique si le spot est dans sa phase de conclusion (réussite ou échec), pendant laquelle le drift est gelé. | 383 |
| `gameplay_drift_freeroam_driftSpots.onClientEndMission()` | Hook : fin de niveau ; nettoie la tasklist et l'état du spot en cours. *(interne)* *(hook)* | 482 |
| `gameplay_drift_freeroam_driftSpots.onClientStartMission()` | Hook : démarrage de niveau ; vide le cache de gameplay_drift_saveLoad et reconstruit les lignes. *(interne)* *(hook)* | 491 |
| `gameplay_drift_freeroam_driftSpots.onDeserialized(data)` | Hook : si un spot était en cours avant le rechargement, émet onDriftSpotForcedEnd puis le termine. *(interne)* *(hook)* | 497 |
| `gameplay_drift_freeroam_driftSpots.onDriftCompletedScored()` | Hook : à la fin d'une chaîne de drifts scorée, met à jour la tasklist des objectifs et affiche « New Highscore! » (une fois par spot) si le record est battu. *(interne)* *(hook)* | 446 |
| `gameplay_drift_freeroam_driftSpots.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook : recharge les lignes du niveau puis ajoute un POI par ligne (marqueur de ligne de drift) ; lineOne ajoute aussi un marqueur de grande carte avec nom, aperçu, meilleur score et position de téléportation. *(interne)* *(hook)* | 409 |
| `gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStarted()` | Hook : un gamemode multijoueur démarre ; force la fin d'un spot en cours (onDriftSpotForcedEnd), désactive les spots et vide les POI. *(interne)* *(hook)* | 468 |
| `gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStopped()` | Hook : fin du gamemode multijoueur ; réactive les spots et vide les POI. *(interne)* *(hook)* | 477 |
| `gameplay_drift_freeroam_driftSpots.onSerialize()` | Hook : sauvegarde isInFreeroamChallenge et activeLine avant un rechargement Lua. *(interne)* *(hook)* | 504 |
| `gameplay_drift_freeroam_driftSpots.onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame : met à jour position/vitesse du joueur puis, pendant un spot, vérifie la fin propre et les fins impropres. *(interne)* *(hook)* | 358 |
| `gameplay_drift_freeroam_driftSpots.onVehicleResetted(id)` | Hook : si le véhicule remis en place est celui du drift pendant un spot, termine le spot en échec (reason vehReset). *(interne)* *(hook)* | 395 |

### Détail des paramètres

#### `gameplay_drift_freeroam_driftSpots.detectStart(lineId)`

Teste si le joueur démarre un spot par la ligne indiquée : il doit être dans le rectangle de la ligne, rouler dans le sens de startDir (produit scalaire > 0) et être en train de drifter. Si oui, lance le spot (contexte inFreeroamChallenge, limites, trajet, hook onDriftSpotStarted, tasklist). Sans effet si déjà dans un défi, en multiseat ou en gamemode multijoueur. Logge une erreur si l'id de ligne est inconnu.

- `lineId` (*string*) : Id de ligne de la forme spotId..lineName (clé de la table lines).

#### `gameplay_drift_freeroam_driftSpots.getDriftDebugInfo()`

Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift.

- **renvoie** : table {default = false, canBeChanged = true}

#### `gameplay_drift_freeroam_driftSpots.getGC()`

Renvoie la quantité de garbage mesurée par le profileur (0 hors debug).

- **renvoie** : number Garbage de la section « Drift driftSpots ».

#### `gameplay_drift_freeroam_driftSpots.getIsInFreeroamChallenge()`

Indique si un spot de drift est en cours.

- **renvoie** : boolean true pendant un défi de spot.

#### `gameplay_drift_freeroam_driftSpots.getIsInTheConcludingPhase()`

Indique si le spot est dans sa phase de conclusion (réussite ou échec), pendant laquelle le drift est gelé.

- **renvoie** : boolean true pendant les ~2.5 s de conclusion.

#### `gameplay_drift_freeroam_driftSpots.onDeserialized(data)`

Hook : si un spot était en cours avant le rechargement, émet onDriftSpotForcedEnd puis le termine.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `gameplay_drift_freeroam_driftSpots.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook : recharge les lignes du niveau puis ajoute un POI par ligne (marqueur de ligne de drift) ; lineOne ajoute aussi un marqueur de grande carte avec nom, aperçu, meilleur score et position de téléportation.

- `levelIdentifier` (*string*) : Identifiant du niveau (inutilisé).
- `elements` (*table*) : Liste de POI bruts à compléter.

#### `gameplay_drift_freeroam_driftSpots.onSerialize()`

Hook : sauvegarde isInFreeroamChallenge et activeLine avant un rechargement Lua.

- **renvoie** : table {isInFreeroamChallenge, activeLine}

#### `gameplay_drift_freeroam_driftSpots.onUpdate(dtReal, dtSim, dtRaw)`

Appelé à chaque frame : met à jour position/vitesse du joueur puis, pendant un spot, vérifie la fin propre et les fins impropres.

- `dtReal` (*number*) : Delta temps réel (inutilisé).
- `dtSim` (*number*) : Delta temps simulé, utilisé pour le chrono d'arrêt.
- `dtRaw` (*number*) : Delta temps brut (inutilisé).

#### `gameplay_drift_freeroam_driftSpots.onVehicleResetted(id)`

Hook : si le véhicule remis en place est celui du drift pendant un spot, termine le spot en échec (reason vehReset).

- `id` (*integer*) : Id du véhicule.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring, gameplay_drift_saveLoad. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDriftSpotCompleted` — écouté par 1 module(s)
- `onDriftSpotFailed` — écouté par 2 module(s)
- `onDriftSpotFinishLineCrossed` — écouté par 1 module(s)
- `onDriftSpotForcedEnd`
- `onDriftSpotStarted` — écouté par 1 module(s)
- `onFreeroamDriftZoneNewHighscore` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `SetTasklistTask`

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua`.*
