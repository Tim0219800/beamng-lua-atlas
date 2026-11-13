# `gameplay_rally_codriverTiming`

*Fichier : `lua/ge/extensions/gameplay/rally/codriverTiming.lua` · VM : Game Engine (GE) · 61 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_codriverTiming` : `extensions.load("gameplay_rally_codriverTiming")`, puis la globale `gameplay_rally_codriverTiming`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_codriverTiming.config()` |  | 28 |
| `gameplay_rally_codriverTiming.delayForSpeed(speedMph, enableSpeedScaling, offsetSeconds)` |  | 42 |
| `gameplay_rally_codriverTiming.maxDelay(enableSpeedScaling, offsetSeconds)` |  | 36 |
| `gameplay_rally_codriverTiming.minDelay(offsetSeconds)` |  | 32 |
| `gameplay_rally_codriverTiming.nudge(tick)` | shift the delay range by `tick` seconds. only the min (rallyCodriverTiming setting)<br> moves; the max follows via the offset, so nothing needs to be re-saved. returns newMin, newMax. | 54 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/codriverTiming.lua`.*
