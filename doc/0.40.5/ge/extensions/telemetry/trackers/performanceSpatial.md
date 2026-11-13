# `telemetry_trackers_performanceSpatial`

*Fichier : `lua/ge/extensions/telemetry/trackers/performanceSpatial.lua` · VM : Game Engine (GE) · 329 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_performanceSpatial` : `extensions.load("telemetry_trackers_performanceSpatial")`, puis la globale `telemetry_trackers_performanceSpatial`

Suiveur de télémétrie des performances « spatiales » : relie le framerate à l'endroit où se trouve le joueur. Il interroge le FPS instantané toutes les 0,13 s (dans un niveau suivi, monde prêt, fenêtre au premier plan, simulation non en pause) et émet, selon la config serveur (module performanceSpatial) : « performanceDip » (chute de FPS détectée par performanceSpatialDetector, avec l'instantané du pire moment), « performanceSpatial » (échantillons périodiques de position/performance et exposition finale), « shaderGeneration » (nouveaux shaders générés), « vehicleRecovery » (récupérations de véhicule) et « gameplayActivityExit » (sortie d'une activité, via performanceSpatialGameplayExit). Chaque fonctionnalité est activable séparément.

## Remarques

- Si aucune fonctionnalité n'est activée, onExtensionLoaded renvoie false (le suiveur ne reste pas chargé). Si seuls le suivi de récupération ou de sortie d'activité sont actifs, le hook onUpdate est retiré.
- Quand la fenêtre perd le focus, que la simulation est en pause, que le monde n'est pas prêt (worldReadyState ~= 2) ou que le niveau n'est pas suivi, le contexte est clos (le dernier dip est émis, ainsi qu'une exposition finale) et réinitialisé.
- Dédoublonnage de sortie d'activité : une même clé type:id n'est pas ré-émise dans les 5 s ; pour worldExit/gameExit, une mission déjà terminée (tentative agrégée) n'est pas rapportée comme abandonnée.
- Les hooks de sortie (onAnyMissionChanged, onMissionAttemptAggregated, onRecoveryPromptButtonPressed, onGameplayActivityAborted, onClientPreEndMission, onPreExit) sont ajoutés ou retirés dynamiquement selon l'option gameplayExitTrackingEnabled ; leurs entrées du tableau de fonctions de l'extension n'existent donc pas toujours.
- Lors d'un rechargement Lua, onSerialize sauvegarde completedMissionId et l'état du détecteur (eventCount, cooldownUntilMs) pour les restaurer via onExtensionLoaded(data).
- trackVehReset n'est pas un hook du moteur : il est appelé par d'autres modules (par exemple lors d'un reset de véhicule) ; il ne fait rien si le suivi de récupération est désactivé ou si le niveau n'est pas suivi.

**Dépendances (chargées avant) :** `telemetry_core`, `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_performanceSpatial.onClientEndMission()` | Hook appelé à la fin du niveau : clôt le contexte courant (dernier dip et exposition finale). *(interne)* *(hook)* | 316 |
| `telemetry_trackers_performanceSpatial.onExit()` | Hook appelé à la fermeture du jeu : clôt le contexte courant. *(interne)* *(hook)* | 316 |
| `telemetry_trackers_performanceSpatial.onExtensionLoaded(data)` | Hook appelé au chargement : lit la config du module performanceSpatial, active les fonctionnalités demandées, prépare le détecteur et le GPU actif, restaure l'état d'un rechargement Lua. *(interne)* *(hook)* | 246 |
| `telemetry_trackers_performanceSpatial.onExtensionUnloaded()` | Hook appelé au déchargement : clôt le contexte courant. *(interne)* *(hook)* | 316 |
| `telemetry_trackers_performanceSpatial.onSerialize(reason)` | Hook appelé avant déchargement : pour un rechargement Lua, clôt le contexte et renvoie l'état à restaurer. *(interne)* *(hook)* | 305 |
| `telemetry_trackers_performanceSpatial.onUpdate(dtReal, dtSim)` | Hook appelé à chaque image : à chaque intervalle de 0,13 s, lit le FPS instantané, détecte les chutes, compte les shaders générés et émet les échantillons spatiaux. *(interne)* *(hook)* | 178 |
| `telemetry_trackers_performanceSpatial.trackVehReset()` | Enregistre un évènement « vehicleRecovery » (niveau et position du véhicule du joueur 0) si le suivi des récupérations est activé et que le niveau est suivi. | 101 |

### Détail des paramètres

#### `telemetry_trackers_performanceSpatial.onExtensionLoaded(data)`

Hook appelé au chargement : lit la config du module performanceSpatial, active les fonctionnalités demandées, prépare le détecteur et le GPU actif, restaure l'état d'un rechargement Lua.

- `data` (*table|nil*) : Données de onSerialize d'un rechargement précédent (completedMissionId, eventCount, cooldownUntilMs).
- **renvoie** : boolean|nil false si aucune fonctionnalité n'est activée (l'extension se décharge).

#### `telemetry_trackers_performanceSpatial.onSerialize(reason)`

Hook appelé avant déchargement : pour un rechargement Lua, clôt le contexte et renvoie l'état à restaurer.

- `reason` (*string*) : Raison ; seul « reload » est traité.
- **renvoie** : table|nil {completedMissionId, eventCount, cooldownUntilMs}

#### `telemetry_trackers_performanceSpatial.onUpdate(dtReal, dtSim)`

Hook appelé à chaque image : à chaque intervalle de 0,13 s, lit le FPS instantané, détecte les chutes, compte les shaders générés et émet les échantillons spatiaux.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s) ; <= 0 ferme le contexte.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core et core_camera. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAnyMissionChanged` — écouté par 19 module(s)
- `onClientPreEndMission`
- `onGameplayActivityAborted`
- `onMissionAttemptAggregated` — écouté par 2 module(s)
- `onPreExit` — écouté par 1 module(s)
- `onRecoveryPromptButtonPressed` — écouté par 2 module(s)
- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/performanceSpatial.lua`.*
