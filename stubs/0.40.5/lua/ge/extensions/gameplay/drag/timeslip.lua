---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/timeslip.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generates the timing slip (timeslip) of a drag race: track info, weather (temperature, gravity), and for each racer its name, formatted timers, dial, gap to the dial, disqualification and result (winner, tie, breakOut, gap in seconds). The data is sent to the UI by gameplay_drag_core.sendTimeslipDataToUi. Also provides the "panel" version (grid of labels and rows) and the slip screenshot.
--- Access: extension `gameplay_drag_timeslip`: `extensions.load("gameplay_drag_timeslip")`, then the global `gameplay_drag_timeslip`
---@class gameplay_drag_timeslip
---@field dependencies string[] gameplay_drag_saveSystem.
gameplay_drag_timeslip = {}

--- Builds the slip table: stripInfo (stripName, levelName, dateTime, timestamp, tree), env (tempK/tempC/tempF, customGrav, gravity), dragType, laneCount, timerConfig, timeslipRows, importantTimerId and racerInfos (per racer: vehId, displayName, stock, licenseText, lane, finalTime, reactionTime, winTime, rewards, dialDiff, dialDiffStr, disqualification, make/country/transmission, timerEntries, timers, displayValues, winnerResult, persona...).
---Source: lua/ge/extensions/gameplay/drag/timeslip.lua:63
---@return table|nil  Slip data, nil (E log) if there is no drag data.
function gameplay_drag_timeslip.createTimeslipData() end

--- Panel version: takes stripInfo, env, racerInfos, timerConfig, timeslipRows, importantTimerId and adds grid {labels, rows} (one row per racer with its timer values in a monospaced font).
---Source: lua/ge/extensions/gameplay/drag/timeslip.lua:304
---@return table  Panel data, {} if there is no slip.
function gameplay_drag_timeslip.createTimeslipPanelData() end

--- Takes a jpg screenshot in screenshots/timeslips/<date-time> and shows a ui.drag.timeslip.saved message.
---Source: lua/ge/extensions/gameplay/drag/timeslip.lua:336
function gameplay_drag_timeslip.screenshotTimeslip() end

