# `telemetry_trackers_level`

*Fichier : `lua/ge/extensions/telemetry/trackers/level.lua` · VM : Game Engine (GE) · 135 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_level` : `extensions.load("telemetry_trackers_level")`, puis la globale `telemetry_trackers_level`

Suiveur de télémétrie des niveaux et des scénarios : quels niveaux sont joués et combien de temps (activité « levelLoaded »), plus le cycle de vie des scénarios (activité « scenarioRunning » avec le résultat). Le temps de chargement du niveau (loadMs) est ajouté à la fin de l'activité levelLoaded, car le chargement n'est terminé que bien après son ouverture. Le suivi par image des collisions et dégâts qui existait ici a été retiré (trop d'évènements).

## Remarques

- loadMs va de onClientPreStartMission à l'état 2 de onWorldReadyState. L'attente des matériaux dans l'état 2 abandonne après 5 s : un chargement très lent rapporte le moment de l'abandon. Un niveau sans véhicule joueur atteint l'état 2 immédiatement et semble rapide.
- Entrer dans un niveau où le jeu se trouve déjà saute onClientPreStartMission : le niveau est alors rapporté sans temps de chargement plutôt qu'avec celui du précédent.
- Les scénarios flowgraph n'atteignent jamais scenario_scenarios (onScenarioLoaded ne se déclenche pas pour eux) et n'ont pas de signal de fin : onFlowgraphScenarioStarted est le même callback que onScenarioLoaded et endLevel les clôt avec le résultat « aborted ».
- Résultats de scénario : success, failed (pooledResults[1].failed), restarted, aborted.
- À la fin d'un niveau, le suiveur demande l'écriture du rapport (telemetry_core.triggerReportWrite).

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_level.onClientEndMission(levelPath)` | Hook appelé à la sortie du niveau : termine scénario éventuel et niveau. *(interne)* *(hook)* | 84 |
| `telemetry_trackers_level.onClientPreStartMission(levelPath)` | Hook appelé tout en haut de la chaîne de chargement (avant datablocks, objets et physique), à chaque chargement y compris les redémarrages : mémorise l'heure de début de chargement. *(interne)* *(hook)* | 57 |
| `telemetry_trackers_level.onClientStartMission(levelPath)` | Hook appelé au démarrage du niveau (écran de chargement encore affiché) : démarre l'activité levelLoaded. *(interne)* *(hook)* | 62 |
| `telemetry_trackers_level.onExit()` | Hook appelé à la fermeture du jeu : ferme les activités ouvertes pour ne pas laisser de débuts sans fin dans le fichier de session. *(interne)* *(hook)* | 114 |
| `telemetry_trackers_level.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel ; si un niveau est déjà chargé, démarre l'activité immédiatement. *(interne)* *(hook)* | 103 |
| `telemetry_trackers_level.onExtensionUnloaded()` | Hook appelé au déchargement : un rechargement Lua détruit les suiveurs sans onExit, donc les activités sont fermées ici aussi (même fonction que endLevel). *(interne)* *(hook)* | 39 |
| `telemetry_trackers_level.onFlowgraphScenarioStarted(scenario)` | Hook appelé au démarrage d'un scénario flowgraph ; même fonction que onScenarioLoaded. *(interne)* *(hook)* | 88 |
| `telemetry_trackers_level.onScenarioFinished(scenario)` | Hook appelé à la fin d'un scénario : termine l'activité avec « failed » ou « success » selon pooledResults[1].failed. *(interne)* *(hook)* | 93 |
| `telemetry_trackers_level.onScenarioLoaded(scenario)` | Hook appelé au chargement d'un scénario : démarre l'activité scenarioRunning (nom et fichier source). *(interne)* *(hook)* | 88 |
| `telemetry_trackers_level.onScenarioRestarted(scenario)` | Hook appelé au redémarrage d'un scénario : termine l'activité avec « restarted » puis en démarre une nouvelle. *(interne)* *(hook)* | 98 |
| `telemetry_trackers_level.onWorldReadyState(state)` | Hook appelé aux changements d'état de préparation du monde. L'état 2 est le premier moment où le joueur peut conduire (caméra avec son objet de contrôle, matériaux du véhicule prêts) : calcule loadMs. *(interne)* *(hook)* | 77 |

### Détail des paramètres

#### `telemetry_trackers_level.onClientEndMission(levelPath)`

Hook appelé à la sortie du niveau : termine scénario éventuel et niveau.

- `levelPath` (*string*) : Chemin du niveau.

#### `telemetry_trackers_level.onClientPreStartMission(levelPath)`

Hook appelé tout en haut de la chaîne de chargement (avant datablocks, objets et physique), à chaque chargement y compris les redémarrages : mémorise l'heure de début de chargement.

- `levelPath` (*string*) : Chemin du niveau.

#### `telemetry_trackers_level.onClientStartMission(levelPath)`

Hook appelé au démarrage du niveau (écran de chargement encore affiché) : démarre l'activité levelLoaded.

- `levelPath` (*string*) : Chemin du niveau.

#### `telemetry_trackers_level.onFlowgraphScenarioStarted(scenario)`

Hook appelé au démarrage d'un scénario flowgraph ; même fonction que onScenarioLoaded.

- `scenario` (*table*) : Scénario.

#### `telemetry_trackers_level.onScenarioFinished(scenario)`

Hook appelé à la fin d'un scénario : termine l'activité avec « failed » ou « success » selon pooledResults[1].failed.

- `scenario` (*table*) : Scénario terminé.

#### `telemetry_trackers_level.onScenarioLoaded(scenario)`

Hook appelé au chargement d'un scénario : démarre l'activité scenarioRunning (nom et fichier source).

- `scenario` (*table*) : Scénario (name, sourceFile).

#### `telemetry_trackers_level.onScenarioRestarted(scenario)`

Hook appelé au redémarrage d'un scénario : termine l'activité avec « restarted » puis en démarre une nouvelle.

- `scenario` (*table*) : Scénario.

#### `telemetry_trackers_level.onWorldReadyState(state)`

Hook appelé aux changements d'état de préparation du monde. L'état 2 est le premier moment où le joueur peut conduire (caméra avec son objet de contrôle, matériaux du véhicule prêts) : calcule loadMs.

- `state` (*integer*) : État de préparation (seul 2 est utilisé).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/level.lua`.*
