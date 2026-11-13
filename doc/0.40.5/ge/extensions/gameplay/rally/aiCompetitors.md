# `gameplay_rally_aiCompetitors`

*Fichier : `lua/ge/extensions/gameplay/rally/aiCompetitors.lua` · VM : Game Engine (GE) · 560 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_aiCompetitors` : `extensions.load("gameplay_rally_aiCompetitors")`, puis la globale `gameplay_rally_aiCompetitors`

Simule des concurrents IA pour le classement (leaderboard) d'une spéciale ou d'une boucle de rallye. Les paramètres des concurrents (skill, consistency, risk, name) et les coefficients du modèle sont lus dans gameplay/rally/aiCompetitorsConfig.json au chargement du module. Pour chaque concurrent, un résultat (safe, push, minor_incident, major_incident, dnf) est tiré au hasard, puis un temps est échantillonné selon une loi normale ancrée sur un temps de référence (par défaut la médaille 'silverTime'). Le module formate aussi les temps et construit les lignes du tableau affiché à l'UI.

## Exemple

```lua
local lb = gameplay_rally_aiCompetitors.computeLeaderboard(playerTime, silverTime, 'Moi')
-- lb.rows[i] = {position, name, time, delta, deltaVsLeader, deltaVsAhead, dnf}
gameplay_rally_aiCompetitors.applyOfficialPlayerTotalSeconds(lb, 312.4)
```

## Remarques

- Les temps sont en secondes ; les textes sont formatés 'h:mm:ss.d' / 'm:ss.d' / 's.d' (un seul chiffre de dixième, arrondi à 0,1 s).
- Les résultats sont aléatoires (math.random) : chaque appel à computeLeaderboard donne un classement différent pour les IA.
- Chaque incident (minor : 1 à 2, major : 2 à 5) ajoute 5 s au temps d'un concurrent ; un DNF donne un temps nil.
- En multi-spéciales, un DNF sur une spéciale force le DNF sur toutes les suivantes ; le tri place d'abord ceux qui ont le moins de colonnes DNF.
- Si aiCompetitorsConfig.json est introuvable, PARAMS vaut nil : la liste de concurrents est vide mais les fonctions de densité/poids (qui utilisent PARAMS) provoqueraient une erreur si paramTable n'est pas fourni.
- Le sous-objet 'general' du JSON de config est aplati dans la table des paramètres ; la liste des concurrents est lue dans 'competitors' (ou 'drivers').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_aiCompetitors.applyOfficialPlayerTotalSeconds(leaderboard, totalSecs)` | Écrase le temps total de la ligne du joueur avec le total officiel du journal d'évènements du rallye (temps de toutes les spéciales + pénalités). En multi-spéciales met à jour finalTime/finalDnf, en spéciale seule time/dnf ; les écarts (deltas) ne sont pas recalculés. | 521 |
| `gameplay_rally_aiCompetitors.computeLeaderboard(playerTimeOrTimes, silverTimeOrTimes, playerName, playerFinalSortSecs)` | Construit le classement joueur + concurrents IA. Avec deux nombres : une spéciale seule. Avec deux tableaux de même longueur (>= 1) : plusieurs spéciales (boucle). Renvoie {rows = {}} si les entrées sont invalides. | 548 |
| `gameplay_rally_aiCompetitors.computeMixtureWeights(paramTable, skill, risk)` | Calcule les poids normalisés des 5 résultats possibles (safe, push, minor_incident, major_incident, dnf) pour un niveau de compétence et de risque donnés. Utilise une consistance fixe de 0,5 (sans effet sur les poids). | 212 |
| `gameplay_rally_aiCompetitors.getReferenceTime(missionTypeData)` | Renvoie le temps de référence (médaille désignée par referenceStarKey) d'une mission, ou nil s'il est absent ou non strictement positif. | 14 |
| `gameplay_rally_aiCompetitors.mixtureDensityTimes(paramTable, referenceSec, skill, consistency, risk, timeLo, timeHi, sampleCount, precomputedWeights)` | Calcule la densité du mélange de gaussiennes des temps d'arrivée (aperçu pour l'éditeur). Utilise les mêmes poids et moyennes/écarts-types que l'échantillonnage ; le DNF n'a pas de densité. | 177 |

### Détail des paramètres

#### `gameplay_rally_aiCompetitors.applyOfficialPlayerTotalSeconds(leaderboard, totalSecs)`

Écrase le temps total de la ligne du joueur avec le total officiel du journal d'évènements du rallye (temps de toutes les spéciales + pénalités). En multi-spéciales met à jour finalTime/finalDnf, en spéciale seule time/dnf ; les écarts (deltas) ne sont pas recalculés.

- `leaderboard` (*table*) : Résultat de computeLeaderboard (doit avoir rows et playerRowIndex).
- `totalSecs` (*number*) : Total officiel en secondes (> 0).

#### `gameplay_rally_aiCompetitors.computeLeaderboard(playerTimeOrTimes, silverTimeOrTimes, playerName, playerFinalSortSecs)`

Construit le classement joueur + concurrents IA. Avec deux nombres : une spéciale seule. Avec deux tableaux de même longueur (>= 1) : plusieurs spéciales (boucle). Renvoie {rows = {}} si les entrées sont invalides.

- `playerTimeOrTimes` (*number|number[]*) : Temps du joueur (ou liste de temps par spéciale).
- `silverTimeOrTimes` (*number|number[]*) : Temps de référence (silver) de la spéciale, ou liste par spéciale ; doivent être > 0.
- `playerName` (*string|nil*) : Nom affiché ; nil = 'Player' avec clé de traduction missions.aiCompetitorsLeaderboard.player.
- `playerFinalSortSecs` (*number|nil*) : Total officiel (spéciales + pénalités) utilisé pour classer le joueur.
- **renvoie** : table {rows, playerRowIndex} ; en multi : aussi multiStage=true et stageCount, lignes avec stageCells/finalTime/finalDnf ; en simple : lignes avec time/delta/deltaVsLeader/deltaVsAhead/dnf.

#### `gameplay_rally_aiCompetitors.computeMixtureWeights(paramTable, skill, risk)`

Calcule les poids normalisés des 5 résultats possibles (safe, push, minor_incident, major_incident, dnf) pour un niveau de compétence et de risque donnés. Utilise une consistance fixe de 0,5 (sans effet sur les poids).

- `paramTable` (*table|nil*) : Coefficients du modèle (safe_weight_base, push_weight_floor, etc.) ; nil = ceux du fichier de config.
- `skill` (*number*) : Compétence du concurrent (0 à 1 attendu, déduit du code).
- `risk` (*number*) : Propension au risque (0 à 1 attendu, déduit du code).
- **renvoie** : number[] 5 poids dont la somme vaut 1, dans l'ordre safe, push, minor_incident, major_incident, dnf.

#### `gameplay_rally_aiCompetitors.getReferenceTime(missionTypeData)`

Renvoie le temps de référence (médaille désignée par referenceStarKey) d'une mission, ou nil s'il est absent ou non strictement positif.

- `missionTypeData` (*table|nil*) : Données de type de mission contenant par exemple silverTime.
- **renvoie** : number|nil Temps de référence en secondes.

#### `gameplay_rally_aiCompetitors.mixtureDensityTimes(paramTable, referenceSec, skill, consistency, risk, timeLo, timeHi, sampleCount, precomputedWeights)`

Calcule la densité du mélange de gaussiennes des temps d'arrivée (aperçu pour l'éditeur). Utilise les mêmes poids et moyennes/écarts-types que l'échantillonnage ; le DNF n'a pas de densité.

- `paramTable` (*table|nil*) : Coefficients du modèle ; nil = config du fichier.
- `referenceSec` (*number*) : Temps de référence en secondes.
- `skill` (*number*) : Compétence.
- `consistency` (*number*) : Régularité (1 = très régulier : écart-type réduit).
- `risk` (*number*) : Propension au risque.
- `timeLo` (*number*) : Borne basse de l'axe des temps.
- `timeHi` (*number*) : Borne haute de l'axe des temps.
- `sampleCount` (*integer|nil*) : Nombre de points (minimum 2, 500 par défaut).
- `precomputedWeights` (*number[]|nil*) : Poids déjà calculés, pour éviter de les recalculer.
- **renvoie** : table {times, mixture, weights, components (5 tableaux de densités par résultat), sampleCount}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `referenceStarKey` | string | Clé du temps de médaille utilisée comme référence de rythme des concurrents simulés. Vaut 'silverTime' par défaut ; getReferenceTime la lit dans missionTypeData. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/aiCompetitors.lua`.*
