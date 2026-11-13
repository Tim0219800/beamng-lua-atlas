# `gameplay_drag_times`

*Fichier : `lua/ge/extensions/gameplay/drag/times.lua` · VM : Game Engine (GE) · 288 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_times` : `extensions.load("gameplay_drag_times")`, puis la globale `gameplay_drag_times`

Chronométrage du drag. Chaque frame, onUpdate fait avancer le timer principal de chaque racer dont les timers sont démarrés (dtSim en solo, horloge de départ synchronisée en MP), détecte le franchissement de chaque distance configurée (timers de type distanceTimer et velocity, interpolés entre deux frames), calcule le temps de réaction (timer de distance < 0,5 m) et disqualifie un départ anticipé (temps de réaction négatif). Il fournit aussi des lecteurs de valeurs de timers (locaux ou reçus du réseau en MP) utilisés par le classement et le ticket. Débloque le succès DRAG_QUARTER_MILE pour un time_1_4 <= 8,20 s du joueur non disqualifié.

## Remarques

- Unités : temps en secondes, vitesses (timers velocity) en m/s.
- Le temps de réaction est la valeur du timer de distance < 0,5 m ; si reactionTimeInvalid est vrai (faux départ ou sortie de couloir), il vaut -1. Après calcul, le timer principal est décalé de la valeur de réaction (timer = timer - réaction), donc les temps ET/distance sont mesurés à partir du feu vert.
- En MP, les timers franchis sont envoyés à l'hôte via drag.updateTimerValue, et ceux des racers finis ou retirés sont complétés pour que tous aient leurs temps (ex. time_1_4 après les 1000 pi).
- Le code gère aussi des types de timer 'timeToVelocity' (champ velocity) et 'brakingG' (champs deltaTime, startTime...) en phase emergencyStop, mais core.buildRacerTimers ne crée que dial, timer, distanceTimer et velocity : ces branches ne servent que si la config de piste les ajoute autrement.
- Les timers de type dialTimer ne sont jamais remis à zéro par reset().

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_achievement`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_times.dragRaceStarted(vehId)` | Marque les timers d'un racer comme démarrés (racer.timersStarted = true). Appelée via le hook dragRaceStarted quand le feu vert part. | 270 |
| `gameplay_drag_times.getImportantTimerValue(racer, data)` | Valeur du timer important (data.importantTimerId, time_1_4 par défaut) d'un racer. | 89 |
| `gameplay_drag_times.getImportantTimerValueForWin(racer, data)` | Temps effectif de comparaison pour le classement : valeur du timer important plus le temps de réaction si c'est un timer de distance (ou si le timer n'est pas dans la config) ; la valeur brute pour un timer de vitesse. | 112 |
| `gameplay_drag_times.getNetworkTimersForRacer(racer)` | En MP, renvoie la table des timers diffusés par le réseau pour le véhicule du racer (clé = id de timer). Utilise un cache véhicule vers joueur MP reconstruit si la course ou les joueurs changent. | 56 |
| `gameplay_drag_times.getRacerTimerValue(racer, timerId)` | Valeur d'un timer pour un racer : la valeur réseau en MP si elle existe, sinon la valeur locale. | 82 |
| `gameplay_drag_times.getReactionTimerValue(racer)` | Temps de réaction d'un racer : timer réseau dont l'id contient 'reaction' en MP, sinon valeur du timer de type distanceTimer à moins de 0,5 m. | 94 |
| `gameplay_drag_times.onDragClear()` | Hook de clear drag ; ne fait rien. *(interne)* *(hook)* | 284 |
| `gameplay_drag_times.onDragReset()` | Hook de reset drag : appelle reset(). *(interne)* *(hook)* | 283 |
| `gameplay_drag_times.onUpdate(dtReal, dtSim, dtRaw)` | Mise à jour par frame des timers : temps écoulé, passages de distance/vitesse, réaction, succès quart de mile, freinage d'urgence, synchronisation MP (et checkTimerDrift de l'hôte). Sans effet si la course est terminée. *(interne)* *(hook)* | 138 |
| `gameplay_drag_times.reset()` | Remet à zéro tous les timers sauf le dial de chaque racer (valeur 0, isSet = false) et timersStarted = false. | 12 |
| `gameplay_drag_times.resetDragRaceValues()` | Alias de reset(). | 276 |

### Détail des paramètres

#### `gameplay_drag_times.dragRaceStarted(vehId)`

Marque les timers d'un racer comme démarrés (racer.timersStarted = true). Appelée via le hook dragRaceStarted quand le feu vert part.

- `vehId` (*integer*) : ID du véhicule du racer.

#### `gameplay_drag_times.getImportantTimerValue(racer, data)`

Valeur du timer important (data.importantTimerId, time_1_4 par défaut) d'un racer.

- `racer` (*table*) : Racer.
- `data` (*table|nil*) : Données de piste (importantTimerId).
- **renvoie** : number Valeur en s (ou m/s pour un timer de vitesse), 0 si absente.

#### `gameplay_drag_times.getImportantTimerValueForWin(racer, data)`

Temps effectif de comparaison pour le classement : valeur du timer important plus le temps de réaction si c'est un timer de distance (ou si le timer n'est pas dans la config) ; la valeur brute pour un timer de vitesse.

- `racer` (*table*) : Racer.
- `data` (*table|nil*) : Données de piste (importantTimerId, timers).
- **renvoie** : number Temps effectif.

#### `gameplay_drag_times.getNetworkTimersForRacer(racer)`

En MP, renvoie la table des timers diffusés par le réseau pour le véhicule du racer (clé = id de timer). Utilise un cache véhicule vers joueur MP reconstruit si la course ou les joueurs changent.

- `racer` (*table*) : Racer (vehId).
- **renvoie** : table|nil Timers réseau, nil hors MP ou si inconnus.

#### `gameplay_drag_times.getRacerTimerValue(racer, timerId)`

Valeur d'un timer pour un racer : la valeur réseau en MP si elle existe, sinon la valeur locale.

- `racer` (*table*) : Racer.
- `timerId` (*string*) : Identifiant du timer (par ex. 'time_1_4').
- **renvoie** : number Valeur, 0 si absente.

#### `gameplay_drag_times.getReactionTimerValue(racer)`

Temps de réaction d'un racer : timer réseau dont l'id contient 'reaction' en MP, sinon valeur du timer de type distanceTimer à moins de 0,5 m.

- `racer` (*table*) : Racer.
- **renvoie** : number Temps de réaction en s (-1 si invalide, 0 si absent).

#### `gameplay_drag_times.onUpdate(dtReal, dtSim, dtRaw)`

Mise à jour par frame des timers : temps écoulé, passages de distance/vitesse, réaction, succès quart de mile, freinage d'urgence, synchronisation MP (et checkTimerDrift de l'hôte). Sans effet si la course est terminée.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta brut (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_core, gameplay_achievement. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/times.lua`.*
