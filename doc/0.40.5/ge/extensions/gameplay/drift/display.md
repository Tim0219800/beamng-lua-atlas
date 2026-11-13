# `gameplay_drift_display`

*Fichier : `lua/ge/extensions/gameplay/drift/display.lua` · VM : Game Engine (GE) · 532 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_display` : `extensions.load("gameplay_drift_display")`, puis la globale `gameplay_drift_display`

Couche d'affichage (UI) du drift. Chaque frame, publie sur le stream UI "drift" l'état de chaque véhicule suivi (score permanent, score potentiel, score en cache, combo, temps de combo restant, creep, angle, vitesse, facteur de performance, phase de présentation du score confirmé). Réagit aux hooks de score, crash, spinout, zones de cascade, spots et paliers par des messages flash (TopCenterAppsFlashMessage) et des évènements guihooks, et affiche/masque les apps UI de drift (scoreboard, tasks, driftScores, flashMessage) selon le contexte de gameplay_drift_general. Chargé par general dans les contextes inChallenge, inFreeroamChallenge, inFreeroamCruising et inSplitscreen.

## Remarques

- Stream "drift" : { context, players = { ["<playerId>"] = {permanentScore, potentialScore, realtimePerformanceFactor, realtimeCachedScoreFloored, realtimeCombo, realtimeRemainingComboTime, realtimeCreep, realtimeAngle, realtimeAirSpeed, scorePhase, scorePhaseProgress, confirmedScore, confirmedScoreId} } }. Les clés de players sont des chaînes pour que le stream soit toujours sérialisé comme un objet.
- Présentation du score confirmé : machine à phases hold (0.9 s) -> dwindle (0.6 s) -> linger (0.5 s) -> idle ; durée totale 2.0 s (getScorePresentationDuration). Les durées sont comptées en temps réel (dtReal).
- Les messages flash sont ignorés en contexte inFreeroam et si le message est vide ; durée par défaut 1.5 s (2 s pour un échec de spot).
- realtimeAngle n'est renseigné que si |angle| < maxAngle, véhicule en survirage, au-dessus de la vitesse min de drift, pas en l'air et pas en mode marche.
- Évènements guihooks émis : ScenarioRealtimeDisplay, ClearTasklist, TopCenterAppsFlashMessage, displayDriftScoreModifier, setDriftPersistentDriftScored, setDriftRealtimeFail (table unique {reason, playerId}), stuntZoneScored ({type, score}).
- Contextes -> apps : inChallenge = enableDriftMissionUI (état de jeu driftMission, app tasks) ; inFreeroamChallenge = scoreboard si multijoueur sinon driftScores, plus tasks ; inFreeroamCruising = driftScores ; inFreeroam = tout masquer.
- Après onExtensionUnloaded, isUnloaded vaut true et onUpdate ne publie plus rien : la variable n'est jamais remise à false (le module est rechargé comme nouvelle instance).

**Dépendances (chargées avant) :** `gameplay_drift_general`, `gameplay_drift_drift`, `gameplay_drift_scoring`, `ui_apps_genericMissionData`, `ui_appContainers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_display.getDriftDebugInfo()` | Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift. | 494 |
| `gameplay_drift_display.getIsScorePresentationActive(vehId)` | Indique si l'animation du score confirmé est en cours pour ce véhicule. | 70 |
| `gameplay_drift_display.getScorePresentationDuration()` | Renvoie la durée totale de la présentation du score confirmé (hold + dwindle + linger). Utilisée par driftSpots pour attendre la fin de l'animation. | 56 |
| `gameplay_drift_display.onDeserialized(data)` | Hook : restaure driftDebugUILayout. *(interne)* *(hook)* | 453 |
| `gameplay_drift_display.onDonutDriftScored(score)` | Hook : message flash et évènement stuntZoneScored (type donut). *(interne)* *(hook)* | 171 |
| `gameplay_drift_display.onDriftCachedScoreReset(vehId)` | Hook : le score en cache a été réinitialisé ; efface le message temps réel. *(interne)* *(hook)* | 407 |
| `gameplay_drift_display.onDriftCompletedScored(data)` | Hook : lance la présentation du score confirmé, affiche « +points » et notifie l'UI (setDriftPersistentDriftScored). *(interne)* *(hook)* | 143 |
| `gameplay_drift_display.onDriftContextChanged(context)` | Hook : montre ou masque les apps UI de drift selon le nouveau contexte. *(interne)* *(hook)* | 463 |
| `gameplay_drift_display.onDriftCrash(vehId)` | Hook : affiche l'échec « crashed » dans l'UI et remet le lisseur à zéro. *(interne)* *(hook)* | 163 |
| `gameplay_drift_display.onDriftDebugChanged(value)` | Hook : à la désactivation du debug, masque l'interface de drift. *(interne)* *(hook)* | 457 |
| `gameplay_drift_display.onDriftPlVehReset(vehId)` | Hook : véhicule du joueur remis en place ; remet à zéro lisseur, présentation du score et message temps réel. *(interne)* *(hook)* | 401 |
| `gameplay_drift_display.onDriftQuickMessageDisplay(data)` | Hook : envoie un quick message à l'UI (displayDriftScoreModifier). *(interne)* *(hook)* | 396 |
| `gameplay_drift_display.onDriftScoreWrappedUp(score, vehId)` | Hook : le score en cours est validé de force (fin de spot) ; lance la présentation et affiche les points bonus. *(interne)* *(hook)* | 436 |
| `gameplay_drift_display.onDriftSpinout(vehId)` | Hook : affiche l'échec « spinout » dans l'UI. *(interne)* *(hook)* | 167 |
| `gameplay_drift_display.onDriftSpotCompleted(data)` | Hook : message flash de fin de spot (nouveau record ou zone terminée) avec le score. *(interne)* *(hook)* | 392 |
| `gameplay_drift_display.onDriftSpotFailed(data)` | Hook : message flash de 2 s avec le texte de la raison d'échec. *(interne)* *(hook)* | 432 |
| `gameplay_drift_display.onExtensionLoaded()` | Hook : applique tout de suite l'UI correspondant au contexte drift déjà actif. *(interne)* *(hook)* | 480 |
| `gameplay_drift_display.onExtensionUnloaded()` | Hook : masque l'UI, vide les données et publie un stream vide. *(interne)* *(hook)* | 411 |
| `gameplay_drift_display.onFreeroamDriftZoneNewHighscore()` | Hook : message flash « nouveau meilleur score ». *(interne)* *(hook)* | 428 |
| `gameplay_drift_display.onHitPoleScored(score)` | Hook : message flash et évènement stuntZoneScored (type hitPole). *(interne)* *(hook)* | 186 |
| `gameplay_drift_display.onNearPoleScored(score)` | Hook : message flash et évènement stuntZoneScored (type nearPole). *(interne)* *(hook)* | 176 |
| `gameplay_drift_display.onNewDriftTierReached(tierData)` | Hook : affiche le nom du nouveau palier en message flash. *(interne)* *(hook)* | 442 |
| `gameplay_drift_display.onSerialize()` | Hook : sauvegarde driftDebugUILayout avant rechargement Lua. *(interne)* *(hook)* | 447 |
| `gameplay_drift_display.onTightDriftScored(score)` | Hook : message flash et évènement stuntZoneScored (type tightDrift). *(interne)* *(hook)* | 181 |
| `gameplay_drift_display.onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame (sauf après déchargement) : fenêtre de debug, publication du stream drift, messages de contresens, de sortie de limites et de distance restante. *(interne)* *(hook)* | 381 |
| `gameplay_drift_display.onVehicleDestroyed(vehId)` | Hook : supprime lisseur et présentation du véhicule détruit. *(interne)* *(hook)* | 423 |
| `gameplay_drift_display.reset()` | Vide les lisseurs de creep, les présentations de score, le pool de données joueur et les données de gameplay_ui genericMissionData. | 487 |

### Détail des paramètres

#### `gameplay_drift_display.getDriftDebugInfo()`

Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift.

- **renvoie** : table {default = false, canBeChanged = true}

#### `gameplay_drift_display.getIsScorePresentationActive(vehId)`

Indique si l'animation du score confirmé est en cours pour ce véhicule.

- `vehId` (*integer*) : Id du véhicule.
- **renvoie** : boolean true si la phase n'est pas idle.

#### `gameplay_drift_display.getScorePresentationDuration()`

Renvoie la durée totale de la présentation du score confirmé (hold + dwindle + linger). Utilisée par driftSpots pour attendre la fin de l'animation.

- **renvoie** : number Durée en secondes (2.0).

#### `gameplay_drift_display.onDeserialized(data)`

Hook : restaure driftDebugUILayout.

- `data` (*table*) : Table de onSerialize.

#### `gameplay_drift_display.onDonutDriftScored(score)`

Hook : message flash et évènement stuntZoneScored (type donut).

- `score` (*number*) : Points gagnés.

#### `gameplay_drift_display.onDriftCachedScoreReset(vehId)`

Hook : le score en cache a été réinitialisé ; efface le message temps réel.

- `vehId` (*integer*) : Véhicule concerné.

#### `gameplay_drift_display.onDriftCompletedScored(data)`

Hook : lance la présentation du score confirmé, affiche « +points » et notifie l'UI (setDriftPersistentDriftScored).

- `data` (*table*) : {vehId, addedScore, combo}.

#### `gameplay_drift_display.onDriftContextChanged(context)`

Hook : montre ou masque les apps UI de drift selon le nouveau contexte.

- `context` (*string*) : Nouveau contexte de gameplay_drift_general.

#### `gameplay_drift_display.onDriftCrash(vehId)`

Hook : affiche l'échec « crashed » dans l'UI et remet le lisseur à zéro.

- `vehId` (*integer*) : Véhicule concerné.

#### `gameplay_drift_display.onDriftDebugChanged(value)`

Hook : à la désactivation du debug, masque l'interface de drift.

- `value` (*boolean*) : Nouvel état du debug.

#### `gameplay_drift_display.onDriftPlVehReset(vehId)`

Hook : véhicule du joueur remis en place ; remet à zéro lisseur, présentation du score et message temps réel.

- `vehId` (*integer*) : Véhicule concerné.

#### `gameplay_drift_display.onDriftQuickMessageDisplay(data)`

Hook : envoie un quick message à l'UI (displayDriftScoreModifier).

- `data` (*table*) : {msg, displayTime, vehId?}.

#### `gameplay_drift_display.onDriftScoreWrappedUp(score, vehId)`

Hook : le score en cours est validé de force (fin de spot) ; lance la présentation et affiche les points bonus.

- `score` (*number*) : Score validé.
- `vehId` (*integer*) : Véhicule concerné.

#### `gameplay_drift_display.onDriftSpinout(vehId)`

Hook : affiche l'échec « spinout » dans l'UI.

- `vehId` (*integer*) : Véhicule concerné.

#### `gameplay_drift_display.onDriftSpotCompleted(data)`

Hook : message flash de fin de spot (nouveau record ou zone terminée) avec le score.

- `data` (*table*) : {newRecord, score, duration}.

#### `gameplay_drift_display.onDriftSpotFailed(data)`

Hook : message flash de 2 s avec le texte de la raison d'échec.

- `data` (*table*) : {reason = {msg = clé de traduction}, ...}.

#### `gameplay_drift_display.onHitPoleScored(score)`

Hook : message flash et évènement stuntZoneScored (type hitPole).

- `score` (*number*) : Points gagnés.

#### `gameplay_drift_display.onNearPoleScored(score)`

Hook : message flash et évènement stuntZoneScored (type nearPole).

- `score` (*number*) : Points gagnés.

#### `gameplay_drift_display.onNewDriftTierReached(tierData)`

Hook : affiche le nom du nouveau palier en message flash.

- `tierData` (*table*) : Données du palier (name utilisé).

#### `gameplay_drift_display.onSerialize()`

Hook : sauvegarde driftDebugUILayout avant rechargement Lua.

- **renvoie** : table {driftDebugUILayout}

#### `gameplay_drift_display.onTightDriftScored(score)`

Hook : message flash et évènement stuntZoneScored (type tightDrift).

- `score` (*number*) : Points gagnés.

#### `gameplay_drift_display.onUpdate(dtReal, dtSim, dtRaw)`

Appelé à chaque frame (sauf après déchargement) : fenêtre de debug, publication du stream drift, messages de contresens, de sortie de limites et de distance restante.

- `dtReal` (*number*) : Delta temps réel en secondes, utilisé pour les animations.
- `dtSim` (*number*) : Delta temps simulé (inutilisé).
- `dtRaw` (*number*) : Delta temps brut (inutilisé).

#### `gameplay_drift_display.onVehicleDestroyed(vehId)`

Hook : supprime lisseur et présentation du véhicule détruit.

- `vehId` (*integer*) : Véhicule détruit.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring, ui_apps_genericMissionData, ui_appContainers. |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `ScenarioRealtimeDisplay`, `TopCenterAppsFlashMessage`, `displayDriftScoreModifier`, `setDriftPersistentDriftScored`, `setDriftRealtimeFail`, `stuntZoneScored`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/display.lua`.*
