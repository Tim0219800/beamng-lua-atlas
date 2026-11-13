# `gameplay_drift_scoreboard`

*Fichier : `lua/ge/extensions/gameplay/drift/scoreboard.lua` · VM : Game Engine (GE) · 230 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_scoreboard` : `extensions.load("gameplay_drift_scoreboard")`, puis la globale `gameplay_drift_scoreboard`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_scoreboard.getDriftDebugInfo()` |  | 119 |
| `gameplay_drift_scoreboard.getDriftEventStats()` |  | 198 |
| `gameplay_drift_scoreboard.getPerformanceStats()` | getting the performance stats is a function  as opposed to as a table because we don't want to calculate avrgs every frame i guess | 148 |
| `gameplay_drift_scoreboard.getTiersStats()` |  | 194 |
| `gameplay_drift_scoreboard.onDriftActiveDataFinished(data)` | when single drift done *(hook)* | 87 |
| `gameplay_drift_scoreboard.onDriftCompletedScored(data)` | *(hook)* | 68 |
| `gameplay_drift_scoreboard.onDriftCrash()` | *(hook)* | 206 |
| `gameplay_drift_scoreboard.onDriftQuickMessageReached(data)` | *(hook)* | 53 |
| `gameplay_drift_scoreboard.onDriftSpinout()` | *(hook)* | 210 |
| `gameplay_drift_scoreboard.onUpdate()` | *(hook)* | 44 |
| `gameplay_drift_scoreboard.reset()` |  | 104 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/scoreboard.lua`.*
