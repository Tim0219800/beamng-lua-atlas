# `gameplay_rally_loop_rallyLoopTime`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua` · VM : Game Engine (GE) · 188 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_rallyLoopTime` : `extensions.load("gameplay_rally_loop_rallyLoopTime")`, puis la globale `gameplay_rally_loop_rallyLoopTime`

Gère l'heure de la journée d'une boucle de rallye. Construit le réglage joueur « Loop Time » (Défaut, Maintenant, puis chaque heure HH:MM listée dans loopTimes), traduit le choix en paramètres d'environnement pour missionManager, et pilote le ciel via core_environment (play, time, date). Ne touche que les champs liés à l'heure ; la météo de la mission est conservée.

## Remarques

- Valeurs spéciales : defaultValue = '__rallyLoopTimeDefault' (heure statique, midi, horloge arrêtée), nowValue = '__rallyLoopTimeNow' (désactive complètement le module d'environnement, tout reste comme en freeroam).
- tod.time brut est décalé d'un demi-jour par rapport à l'horloge murale : midi vaut 0. parseTime calcule (fraction du jour - 0.5) % 1.
- Les heures CSV utilisent timeScale = 7/36 (jour d'environ 9257 s avec une base de 1800 s) ; l'option Défaut utilise timeScale = 0.
- Pour arrêter/avancer l'horloge, n'envoyer que les champs à changer à setTimeOfDay : une table complète issue de getTimeOfDay (startTime, date) n'arrête pas l'horloge (commentaire du code).
- applyToEnvironment remplit cloudCover, cloudWindSpeed, fogDensity avec la météo actuelle quand ils sont nil, et windSpeed/windDirAngle avec 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_rallyLoopTime.advancePlayingTime(seconds)` | Avance l'heure de la journée de seconds secondes de jeu : time = (time + seconds / dayLength) % 1. Sans effet si l'horloge n'est pas en play ou si dayLength est invalide. | 158 |
| `gameplay_rally_loop_rallyLoopTime.applyCurrentDate()` | Applique la date réelle du jour (year, month, day) au ciel (positions du soleil, de la lune, des étoiles) sans changer l'heure. | 145 |
| `gameplay_rally_loop_rallyLoopTime.applyToEnvironment(environment, selectedValue)` | Applique le choix à la table d'environnement de la mission (module setup d'environnement). Maintenant : enabled=false. Défaut : time=0, timeScale=0, _rallyForceStatic=true. Heure CSV : time analysé, timeScale=7/36. Complète la météo manquante. | 81 |
| `gameplay_rally_loop_rallyLoopTime.buildMissionSetting(missionTypeData)` | Construit le réglage de type 'select' « Loop Time » : options Défaut, Maintenant, puis une option par heure de missionTypeData.loopTimes (la valeur est la chaîne d'horloge pour éviter les dérives de flottant). | 55 |
| `gameplay_rally_loop_rallyLoopTime.parseTimes(str)` | Analyse une liste d'heures "HH:MM" séparées par des virgules ; les entrées invalides (format, heure > 23, minute > 59) sont ignorées. | 39 |
| `gameplay_rally_loop_rallyLoopTime.setPlaying(play, time)` | Force l'état play de l'horloge du jour via core_environment.setTimeOfDay, avec éventuellement une heure à rétablir. | 130 |

### Détail des paramètres

#### `gameplay_rally_loop_rallyLoopTime.advancePlayingTime(seconds)`

Avance l'heure de la journée de seconds secondes de jeu : time = (time + seconds / dayLength) % 1. Sans effet si l'horloge n'est pas en play ou si dayLength est invalide.

- `seconds` (*number*) : Secondes à ajouter (doit être > 0).
- **renvoie** : boolean true si l'heure a été modifiée.

#### `gameplay_rally_loop_rallyLoopTime.applyCurrentDate()`

Applique la date réelle du jour (year, month, day) au ciel (positions du soleil, de la lune, des étoiles) sans changer l'heure.

- **renvoie** : boolean false si core_environment est indisponible, sinon true.

#### `gameplay_rally_loop_rallyLoopTime.applyToEnvironment(environment, selectedValue)`

Applique le choix à la table d'environnement de la mission (module setup d'environnement). Maintenant : enabled=false. Défaut : time=0, timeScale=0, _rallyForceStatic=true. Heure CSV : time analysé, timeScale=7/36. Complète la météo manquante.

- `environment` (*table*) : Table d'environnement modifiée sur place (ignorée si ce n'est pas une table).
- `selectedValue` (*string|nil*) : Valeur choisie : nowValue, defaultValue, nil (= défaut) ou chaîne 'HH:MM'.

#### `gameplay_rally_loop_rallyLoopTime.buildMissionSetting(missionTypeData)`

Construit le réglage de type 'select' « Loop Time » : options Défaut, Maintenant, puis une option par heure de missionTypeData.loopTimes (la valeur est la chaîne d'horloge pour éviter les dérives de flottant).

- `missionTypeData` (*table|nil*) : Données du type de mission, lit loopTimes.
- **renvoie** : table Table de réglage {key, label, type, values, value, defaultValue, currentOption}.

#### `gameplay_rally_loop_rallyLoopTime.parseTimes(str)`

Analyse une liste d'heures "HH:MM" séparées par des virgules ; les entrées invalides (format, heure > 23, minute > 59) sont ignorées.

- `str` (*string*) : Liste, par exemple "08:00, 17:30".
- **renvoie** : table Liste de {clock = 'HH:MM', time = valeur brute tod.time dans [0,1)} ; vide si str n'est pas une chaîne.

#### `gameplay_rally_loop_rallyLoopTime.setPlaying(play, time)`

Force l'état play de l'horloge du jour via core_environment.setTimeOfDay, avec éventuellement une heure à rétablir.

- `play` (*boolean*) : true pour faire avancer le temps, false pour le figer.
- `time` (*number|nil*) : Valeur brute tod.time à appliquer en même temps.
- **renvoie** : boolean false si core_environment est indisponible, sinon true.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultValue` | string | Valeur de l'option Défaut : '__rallyLoopTimeDefault'. |
| `key` | string | Clé du réglage : 'rallyLoopTime'. |
| `nowValue` | string | Valeur de l'option Maintenant : '__rallyLoopTimeNow'. |

## Appels vers le moteur (C++)

- `core_environment.` `getCloudCover`, `getFogDensity`, `getTimeOfDay`, `getWindSpeed`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua`.*
