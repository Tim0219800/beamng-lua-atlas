# `core_lapTimes`

*Fichier : `lua/ge/extensions/core/lapTimes.lua` · VM : Game Engine (GE) · 679 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_lapTimes` : `extensions.load("core_lapTimes")`, puis la globale `core_lapTimes`

Extension GE `core_lapTimes` : prépare pour l'UI (appli de temps au tour) les chronos d'une course du système de course « race » : temps courant, tour et segment courants, historique des tours et segments, meilleurs temps, écarts au précédent/meilleur. Elle est alimentée par les fonctions update*FromRace(race, playerId) appelées par le moteur de course, mémorise les résultats dans quatre tables (rapide, lente, statique, placements) et les envoie à l'UI dans onUpdate sous forme de streams guihooks `lapTimes_fast`, `lapTimes_slow`, `lapTimes_static`, `lapTimes_placement`.

## Remarques

- Statut : 'stopped', 'started', 'paused', 'complete' (déduit de race.suspended, race.started, state.complete dans updateSlowFromRace).
- Format des temps : formatTime(s) donne 'MM:SS.mmm' (minutes sur 2 chiffres min., millisecondes tronquées) ; avec addSign true, un '+' ou '-' est ajouté (écarts). getDiffFlavor renvoie 'worse' (>0, plus lent), 'better' (<0), 'same' (=0) ; dans les streams les valeurs sans écart ont le flavor 'default'.
- Données lues dans race : race.time, race.suspended, race.started, race.lapCount, race.path.pathnodes.sorted (segments), race.path.config.closed, race.states[playerId] avec startTime, endTime, complete, currentLap (0-based), currentTimes[] (segments du tour en cours), historicTimes[] (tours finis : lap, beginTime, endTime, duration, segmentTimes[]). Les temps sont en secondes.
- Stream rapide : currentTime (depuis state.startTime), currentLapTime, currentSegmentTime et leurs versions *Formatted. Stream lent : status, currentLap/currentSegment (1-based), bestLapTimeFormatted, bestLapIndex, bestSegmentTimesFormatted, lapTimes, segmentTimes, combinedTimes. Stream statique : totalLaps, totalSegments, closedCircuit. Stream de placement : placements, order (laissés vides).
- Un tour/segment n'est marqué 'best' que si plusieurs tours/instances existent à comparer.
- Incohérences : les champs currentLapDiffToBest*, currentLapDiffToPrevious*, currentSegmentDiffTo* du stream rapide sont toujours mis à nil (jamais calculés) ; updatePlacementFromRace ne construit rien (TODO dans le code) ; la configuration de la fermeture du circuit n'est pas lue au même endroit selon le chemin : onRaceStart(meta) lit meta.pathConfig.isClosed, newRaceStart et updateStaticFromRace lisent race.path.config.closed ; la liste de fonctions automatique signale onRaceStart(), mais c'est une fonction locale vide non exportée définie en fin de fichier (de même que onRaceWaypointReached et onRaceResult) : le vrai M.onRaceStart est celui qui prend meta ; le paramètre playerId de updateStaticFromRace et updatePlacementFromRace n'est pas utilisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_lapTimes.formatTime(timeInSeconds, addSign)` | Formate un temps en secondes au format MM:SS.mmm ; avec addSign, préfixe '+' (>= 0) ou '-' pour les écarts. | 92 |
| `core_lapTimes.getDiffFlavor(val)` | Qualifie un écart de temps pour l'affichage. | 109 |
| `core_lapTimes.initialize()` | Réinitialise tout l'état (statut 'stopped', tours, segments, meilleurs temps, tables de streams) et demande un envoi complet des quatre streams à l'UI. | 53 |
| `core_lapTimes.newRaceStart(race)` | Hook du nouveau système de course : configure totalLaps, totalSegments (nombre de pathnodes triés) et closedCircuit à partir de l'objet race. | 641 |
| `core_lapTimes.newRaceStop()` | Hook du nouveau système de course : appelle onRaceStop. | 654 |
| `core_lapTimes.onRaceStart()` | Démarre le suivi d'une course : appelle initialize puis lit le nombre de tours et de segments dans meta, passe le statut à 'started' et demande l'envoi des quatre streams. Sans effet si meta est nil. *(hook)* | 665 |
| `core_lapTimes.onRaceStop()` | Passe le statut à 'stopped' et demande l'envoi des quatre streams. *(hook)* | 147 |
| `core_lapTimes.onUpdate(dtReal, dtSim, dtRaw)` | Hook par image : envoie à l'UI (guihooks.queueStream) les streams marqués comme à envoyer puis efface les drapeaux. *(interne)* *(hook)* | 595 |
| `core_lapTimes.setConfiguration(config)` | Met à jour totalLaps, totalSegments et closedCircuit pour les champs présents dans config. | 120 |
| `core_lapTimes.updateFastFromRace(race, playerId)` | Calcule les valeurs rapides pour un joueur : temps depuis le départ, durée du tour et du segment courants (avec le temps de fin figé quand la course est terminée) et prépare le stream rapide. | 156 |
| `core_lapTimes.updatePlacementFromRace(race, playerId)` | Vide et prépare le stream de placements (vide : fonctionnalité non implémentée, TODO dans le code). | 572 |
| `core_lapTimes.updateSlowFromRace(race, playerId)` | Recalcule l'historique pour un joueur : statut, tour/segment courants, meilleur tour, meilleurs segments par index, diffs, listes lapTimes/segmentTimes/combinedTimes et prépare le stream lent. | 242 |
| `core_lapTimes.updateStaticFromRace(race, playerId)` | Met à jour les valeurs statiques (nombre de tours, nombre de segments, circuit fermé) à partir de la course et prépare le stream statique. | 546 |

### Détail des paramètres

#### `core_lapTimes.formatTime(timeInSeconds, addSign)`

Formate un temps en secondes au format MM:SS.mmm ; avec addSign, préfixe '+' (>= 0) ou '-' pour les écarts.

- `timeInSeconds` (*number|nil*) : Temps en secondes (négatif accepté avec addSign).
- `addSign` (*boolean|nil*) : true = ajoute le signe.
- **renvoie** : string|nil Texte formaté ; nil si timeInSeconds est nil.

#### `core_lapTimes.getDiffFlavor(val)`

Qualifie un écart de temps pour l'affichage.

- `val` (*number*) : Écart en secondes (positif = plus lent).
- **renvoie** : string 'worse', 'better' ou 'same'.

#### `core_lapTimes.newRaceStart(race)`

Hook du nouveau système de course : configure totalLaps, totalSegments (nombre de pathnodes triés) et closedCircuit à partir de l'objet race.

- `race` (*table*) : Objet course (lapCount, path.pathnodes.sorted, path.config.closed).

#### `core_lapTimes.onRaceStart()`

Démarre le suivi d'une course : appelle initialize puis lit le nombre de tours et de segments dans meta, passe le statut à 'started' et demande l'envoi des quatre streams. Sans effet si meta est nil.


#### `core_lapTimes.onUpdate(dtReal, dtSim, dtRaw)`

Hook par image : envoie à l'UI (guihooks.queueStream) les streams marqués comme à envoyer puis efface les drapeaux.

- `dtReal` (*number*) : Non utilisé.
- `dtSim` (*number*) : Non utilisé.
- `dtRaw` (*number*) : Non utilisé.

#### `core_lapTimes.setConfiguration(config)`

Met à jour totalLaps, totalSegments et closedCircuit pour les champs présents dans config.

- `config` (*table*) : {totalLaps?, totalSegments?, closedCircuit?}.

#### `core_lapTimes.updateFastFromRace(race, playerId)`

Calcule les valeurs rapides pour un joueur : temps depuis le départ, durée du tour et du segment courants (avec le temps de fin figé quand la course est terminée) et prépare le stream rapide.

- `race` (*table*) : Objet course.
- `playerId` (*integer*) : Clé de race.states.

#### `core_lapTimes.updatePlacementFromRace(race, playerId)`

Vide et prépare le stream de placements (vide : fonctionnalité non implémentée, TODO dans le code).

- `race` (*table*) : Objet course.
- `playerId` (*integer*) : Non utilisé.

#### `core_lapTimes.updateSlowFromRace(race, playerId)`

Recalcule l'historique pour un joueur : statut, tour/segment courants, meilleur tour, meilleurs segments par index, diffs, listes lapTimes/segmentTimes/combinedTimes et prépare le stream lent.

- `race` (*table*) : Objet course.
- `playerId` (*integer*) : Clé de race.states.

#### `core_lapTimes.updateStaticFromRace(race, playerId)`

Met à jour les valeurs statiques (nombre de tours, nombre de segments, circuit fermé) à partir de la course et prépare le stream statique.

- `race` (*table*) : Objet course.
- `playerId` (*integer*) : Non utilisé.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/lapTimes.lua`.*
