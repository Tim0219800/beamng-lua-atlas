# `gameplay_rally_loop_scheduleUtils`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_scheduleUtils` : `extensions.load("gameplay_rally_loop_scheduleUtils")`, puis la globale `gameplay_rally_loop_scheduleUtils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_scheduleUtils.calculateNextSlotTime(currentTime, slotSizeMinutes, roundToMinute)` | Calculate the next slot time by adding slot duration and rounding to minute boundary<br> @param currentTime: Current time in seconds<br> @param slotSizeMinutes: Size of time slot in minutes (default: 1)<br> @param roundToMinute: If true, rounds result to next minute boundary (default: true)<br> @return: Next slot time in seconds | 27 |
| `gameplay_rally_loop_scheduleUtils.isLaterTime(newTime, currentTime, tolerance)` | Check if one time is later than another (with optional tolerance)<br> @param newTime: Time to check<br> @param currentTime: Time to compare against<br> @param tolerance: Optional tolerance in seconds (default: 0)<br> @return: true if newTime > currentTime (accounting for tolerance) | 45 |
| `gameplay_rally_loop_scheduleUtils.roundToNextMinute(timeSecs)` | Round time up to the next minute boundary (60 second intervals)<br> @param timeSecs: Time in seconds<br> @return: Time rounded up to next minute | 11 |
| `gameplay_rally_loop_scheduleUtils.slotMinutesToSeconds(slotSizeMinutes)` | Convert slot size from minutes to seconds<br> @param slotSizeMinutes: Slot size in minutes<br> @return: Slot size in seconds | 18 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua`.*
