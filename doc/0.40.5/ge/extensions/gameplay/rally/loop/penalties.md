# `gameplay_rally_loop_penalties`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/penalties.lua` · VM : Game Engine (GE) · 114 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_penalties` : `extensions.load("gameplay_rally_loop_penalties")`, puis la globale `gameplay_rally_loop_penalties`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_penalties.calculateEarlyPenalty(minutesEarly)` | Calculate penalty for early arrival<br> Penalty per minute or fraction thereof (see timeControlPenaltySecondsPerMinute)<br> minutesEarly: number of full minutes early<br> Returns: penalty value | 14 |
| `gameplay_rally_loop_penalties.calculateFalseStartPenalty(falseStartCount)` |  | 26 |
| `gameplay_rally_loop_penalties.calculateLatePenalty(minutesLate)` | Calculate penalty for late arrival<br> Penalty per minute or fraction thereof (see timeControlPenaltySecondsPerMinute)<br> minutesLate: number of full minutes late<br> Returns: penalty value | 22 |
| `gameplay_rally_loop_penalties.getTimingStatus(actualTime, scheduledTime)` | Determine if arrival at checkpoint is early, on-time, or late<br> actualTime: actual arrival epoch time in seconds<br> scheduledTime: scheduled epoch time in seconds (can be nil)<br> Returns: table with fields:<br>   - status: "early"\|"on-time"\|"late"<br>   - totalPenalty: sum of all penalty amounts (denormalized for performance)<br>   - hasPenalty: boolean<br>   - penalties: array of individual penalty objects with structured data for i18n | 38 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `falseStartPenaltySeconds` | number |  |
| `timeControlPenaltySecondsPerMinute` | number |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/penalties.lua`.*
