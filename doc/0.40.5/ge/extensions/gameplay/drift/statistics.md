# `gameplay_drift_statistics`

*Fichier : `lua/ge/extensions/gameplay/drift/statistics.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_statistics` : `extensions.load("gameplay_drift_statistics")`, puis la globale `gameplay_drift_statistics`

Enregistre les statistiques de drift dans gameplay_statistic (clés drift/...) et débloque les succès de drift. Écoute les hooks de fin de drift, de score, de spinout et de crash ; ne contient aucune logique de détection.

## Remarques

- Clés écrites : drift/rightDrifts, drift/leftDrifts, drift/maxDriftDistance.length, drift/maxDriftTime.time, drift/maxChainedDrifts, drift/totalScore, drift/maxDriftScore, drift/spinOuts, drift/crashes.
- Succès : DRIFT_SINGLE si un seul drift rapporte >= 20000 points ; DRIFT_TOTAL si drift/totalScore atteint 1 000 000 (seulement si gameplay_achievement est chargé).
- Les maxima ne sont mis à jour que si la nouvelle valeur dépasse strictement l'ancienne (setNewMaxStat).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_statistics.onDriftCompleted(data)` | Hook : à la fin d'une chaîne de drifts, ajoute les drifts droite/gauche et met à jour les records de distance, durée et nombre de drifts chaînés. Ne fait rien sans data.chainDriftData. *(interne)* *(hook)* | 15 |
| `gameplay_drift_statistics.onDriftCompletedScored(data)` | Hook : ajoute le score gagné au total, met à jour le record de score et déclenche les succès DRIFT_SINGLE et DRIFT_TOTAL. *(interne)* *(hook)* | 26 |
| `gameplay_drift_statistics.onDriftCrash()` | Hook : incrémente drift/crashes. *(interne)* *(hook)* | 42 |
| `gameplay_drift_statistics.onDriftSpinout()` | Hook : incrémente drift/spinOuts. *(interne)* *(hook)* | 38 |

### Détail des paramètres

#### `gameplay_drift_statistics.onDriftCompleted(data)`

Hook : à la fin d'une chaîne de drifts, ajoute les drifts droite/gauche et met à jour les records de distance, durée et nombre de drifts chaînés. Ne fait rien sans data.chainDriftData.

- `data` (*table*) : Contient chainDriftData {rightDrifts, leftDrifts, totalDriftDistance, totalDriftTime, chainedDrifts}.

#### `gameplay_drift_statistics.onDriftCompletedScored(data)`

Hook : ajoute le score gagné au total, met à jour le record de score et déclenche les succès DRIFT_SINGLE et DRIFT_TOTAL.

- `data` (*table*) : Contient addedScore (number, points ajoutés par ce drift).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/statistics.lua`.*
