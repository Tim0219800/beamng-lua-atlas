# `flowgraph_modules_timerModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/timerModule.lua` · VM : Game Engine (GE) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/timerModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 0) qui gère des minuteurs. Il tient trois horloges globales cumulées (real, sim, raw) mises à jour par onUpdate avec dtReal, dtSim et dtRaw ; chaque minuteur référence l'une d'elles (mode 'dtSim', 'dtReal' ou 'dtRaw'), a un temps de départ, une durée (défaut 5 s) et peut être mis en pause. Les valeurs sont stockées dans un variableStorage et finalisées à la fin du tick.

## Remarques

- Unités : secondes. Mode par défaut : 'dtSim' (temps de simulation, affecté par le ralenti et la pause).
- Les pauses sont différées : setPause pose un drapeau (pauseFlag) appliqué dans afterTrigger.
- Bug probable : clear() fait C.idCounter = 0 sur la classe et non sur self ; l'instance garde son compteur d'ids si self.idCounter a déjà été créé.
- setMode utilise variables:set alors que les autres fonctions utilisent variables:change ; le comportement exact dépend de variableStorage (non vérifié ici).
- setPause provoque une erreur si l'id est inconnu.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_timerModule.addTimer(data)` | Crée un minuteur et renvoie son id. (assignée dynamiquement) | dyn |
| `flowgraph_modules_timerModule.afterTrigger()` | Appelé après le tick du graphe : applique les pauses ou reprises en attente puis finalise les variables. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_timerModule.clear()` | Vide variables et minuteurs, remet les horloges globales à 0. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_timerModule.executionStopped()` | Appelé à l'arrêt du projet : appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_timerModule.getElapsedTime(id)` | Renvoie le temps écoulé : valeur figée si en pause, sinon horloge du mode moins le départ. (assignée dynamiquement) | dyn |
| `flowgraph_modules_timerModule.getFreeId()` | Incrémente et renvoie un id de minuteur. (assignée dynamiquement) | dyn |
| `flowgraph_modules_timerModule.getGlobalTime(mode)` | Renvoie l'horloge globale du mode demandé. (assignée dynamiquement) | dyn |
| `flowgraph_modules_timerModule.getTimer(id)` | Renvoie l'objet minuteur complet (start, mode, duration, isPaused…). (assignée dynamiquement) | dyn |
| `flowgraph_modules_timerModule.init()` | Crée le variableStorage et appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_timerModule.isComplete(id)` | Vrai si le temps écoulé a atteint la durée. (assignée dynamiquement) | dyn |
| `flowgraph_modules_timerModule.onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque mise à jour du manager : ajoute dtReal, dtSim et dtRaw aux horloges globales. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_timerModule.set(id, field, val)` | Change un champ du minuteur (start, mode, duration) via le variableStorage. (assignée dynamiquement) | dyn |
| `flowgraph_modules_timerModule.setElapsedTime(id, time)` | Fixe le temps écoulé d'un minuteur (en pause : mémorise la valeur ; sinon recalcule le départ). (assignée dynamiquement) | dyn |
| `flowgraph_modules_timerModule.setMode(id, mode)` | Change le mode d'horloge du minuteur en conservant le temps écoulé (si non en pause). (assignée dynamiquement) | dyn |
| `flowgraph_modules_timerModule.setPause(id, val)` | Met en pause ou reprend un minuteur ; l'effet est appliqué dans afterTrigger. Ne fait rien si l'état demandé est déjà l'état actuel ; avertit si un drapeau est déjà posé. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_timerModule.addTimer(data)`

Crée un minuteur et renvoie son id. (assignée dynamiquement)

- `data` (*table*) : mode (défaut 'dtSim'), time (temps déjà écoulé, défaut 0), duration (défaut 5)
- **renvoie** : integer id du minuteur

#### `flowgraph_modules_timerModule.getElapsedTime(id)`

Renvoie le temps écoulé : valeur figée si en pause, sinon horloge du mode moins le départ. (assignée dynamiquement)

- `id` (*integer*) : id du minuteur
- **renvoie** : number temps écoulé (s)

#### `flowgraph_modules_timerModule.getFreeId()`

Incrémente et renvoie un id de minuteur. (assignée dynamiquement)

- **renvoie** : integer id

#### `flowgraph_modules_timerModule.getGlobalTime(mode)`

Renvoie l'horloge globale du mode demandé. (assignée dynamiquement)

- `mode` (*string*) : 'dtSim', 'dtReal' ou 'dtRaw'
- **renvoie** : number temps cumulé (s), 0 si mode inconnu

#### `flowgraph_modules_timerModule.getTimer(id)`

Renvoie l'objet minuteur complet (start, mode, duration, isPaused…). (assignée dynamiquement)

- `id` (*integer*) : id du minuteur
- **renvoie** : table|nil minuteur

#### `flowgraph_modules_timerModule.isComplete(id)`

Vrai si le temps écoulé a atteint la durée. (assignée dynamiquement)

- `id` (*integer*) : id du minuteur
- **renvoie** : boolean terminé

#### `flowgraph_modules_timerModule.onUpdate(dtReal, dtSim, dtRaw)`

Appelé à chaque mise à jour du manager : ajoute dtReal, dtSim et dtRaw aux horloges globales. (assignée dynamiquement)

- `dtReal` (*number*) : delta temps réel (s)
- `dtSim` (*number*) : delta temps de simulation (s)
- `dtRaw` (*number*) : delta temps brut (s)

#### `flowgraph_modules_timerModule.set(id, field, val)`

Change un champ du minuteur (start, mode, duration) via le variableStorage. (assignée dynamiquement)

- `id` (*integer*) : id du minuteur
- `field` (*string*) : start, mode ou duration
- `val` (*any*) : nouvelle valeur

#### `flowgraph_modules_timerModule.setElapsedTime(id, time)`

Fixe le temps écoulé d'un minuteur (en pause : mémorise la valeur ; sinon recalcule le départ). (assignée dynamiquement)

- `id` (*integer*) : id du minuteur
- `time` (*number*) : temps écoulé (s)

#### `flowgraph_modules_timerModule.setMode(id, mode)`

Change le mode d'horloge du minuteur en conservant le temps écoulé (si non en pause). (assignée dynamiquement)

- `id` (*integer*) : id du minuteur
- `mode` (*string*) : 'dtSim', 'dtReal' ou 'dtRaw'

#### `flowgraph_modules_timerModule.setPause(id, val)`

Met en pause ou reprend un minuteur ; l'effet est appliqué dans afterTrigger. Ne fait rien si l'état demandé est déjà l'état actuel ; avertit si un drapeau est déjà posé. (assignée dynamiquement)

- `id` (*integer*) : id du minuteur
- `val` (*boolean*) : true = pause, false = reprise

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:addTimer(data)` | adds a new timer. | 38 |
| `C:afterTrigger()` | called at the end, finalizing all the merge strats. | 112 |
| `C:clear()` |  | 18 |
| `C:executionStopped()` |  | 134 |
| `C:getElapsedTime(id)` | gets the elapsed time on a timer. | 92 |
| `C:getFreeId()` |  | 8 |
| `C:getGlobalTime(mode)` | gets the global time depending on the mode. | 30 |
| `C:getTimer(id)` | gets the full timer object. | 58 |
| `C:init()` |  | 13 |
| `C:isComplete(id)` | checks if the timer is complete. | 101 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` |  | 105 |
| `C:set(id, field, val)` | sets some field for the timer, using the variables. | 61 |
| `C:setElapsedTime(id, time)` | sets the elapsed time on a timer. | 74 |
| `C:setMode(id, mode)` | sets the desired mode of the timer | 83 |
| `C:setPause(id, val)` | pauses or unpauses a timer. | 64 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/timerModule.lua`.*
