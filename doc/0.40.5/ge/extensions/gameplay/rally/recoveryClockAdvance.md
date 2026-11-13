# `gameplay_rally_recoveryClockAdvance`

*Fichier : `lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_recoveryClockAdvance` : `extensions.load("gameplay_rally_recoveryClockAdvance")`, puis la globale `gameplay_rally_recoveryClockAdvance`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_recoveryClockAdvance.getSeconds(recoveryType, isSpecialStage)` |  | 24 |
| `gameplay_rally_recoveryClockAdvance.getSpecialStageSeconds(recoveryType)` |  | 20 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `nonSpecialStageSeconds` | table |  |
| `specialStageSeconds` | table | Flat per-reset clock penalties. A recovery costs a fixed number of seconds<br> regardless of stage length (realistic, and length-fair since a driver's reset<br> COUNT already scales with distance). Flips are free on special stages. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua`.*
