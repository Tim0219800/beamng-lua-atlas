# `gameplay_rally_aiCompetitors`

*Fichier : `lua/ge/extensions/gameplay/rally/aiCompetitors.lua` · VM : Game Engine (GE) · 560 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_aiCompetitors` : `extensions.load("gameplay_rally_aiCompetitors")`, puis la globale `gameplay_rally_aiCompetitors`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_aiCompetitors.applyOfficialPlayerTotalSeconds(leaderboard, totalSecs)` | Overwrite the player row total with the official rally event-log total (all SS times + all penalties).<br>Multi-stage: `finalTime` / `finalDnf`. Single-stage: `time` / `dnf` (deltas are not recomputed). | 521 |
| `gameplay_rally_aiCompetitors.computeLeaderboard(playerTimeOrTimes, silverTimeOrTimes, playerName, playerFinalSortSecs)` | Single stage: (playerTime, silverTime) as numbers. Loop stage layout: (playerTimes, silverTimes) as equal-length arrays (length >= 1).<br>Optional `playerFinalSortSecs`: official total seconds (stages + penalties) for ranking the player row; AI rows rank by sum of simulated stage times (or DNF tier). | 548 |
| `gameplay_rally_aiCompetitors.computeMixtureWeights(paramTable, skill, risk)` |  | 212 |
| `gameplay_rally_aiCompetitors.getReferenceTime(missionTypeData)` |  | 14 |
| `gameplay_rally_aiCompetitors.mixtureDensityTimes(paramTable, referenceSec, skill, consistency, risk, timeLo, timeHi, sampleCount, precomputedWeights)` | Gaussian mixture over finish-time outcomes (editor preview). Uses the same weights and mean/std rules as sampling. | 177 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `referenceStarKey` | string | Medal threshold used to anchor simulated competitor pace. Change this one key<br> to 'silverTime' to switch both standalone-stage and rally-loop simulation. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/aiCompetitors.lua`.*
