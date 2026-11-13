---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/timeslip.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génère le ticket de chronométrage (timeslip) d'une course de drag : infos de piste, météo (température, gravité), et pour chaque racer son nom, ses timers formatés, son dial, son écart au dial, sa disqualification et son résultat (gagnant, tie, breakOut, écart en secondes). Les données sont envoyées à l'UI par gameplay_drag_core.sendTimeslipDataToUi. Fournit aussi la version « panneau » (grille de libellés et lignes) et la capture d'écran du ticket.
--- Accès : extension `gameplay_drag_timeslip` : `extensions.load("gameplay_drag_timeslip")`, puis la globale `gameplay_drag_timeslip`
---@class gameplay_drag_timeslip
---@field dependencies string[] gameplay_drag_saveSystem.
gameplay_drag_timeslip = {}

--- Construit la table du ticket : stripInfo (stripName, levelName, dateTime, timestamp, tree), env (tempK/tempC/tempF, customGrav, gravity), dragType, laneCount, timerConfig, timeslipRows, importantTimerId et racerInfos (par racer : vehId, displayName, stock, licenseText, lane, finalTime, reactionTime, winTime, rewards, dialDiff, dialDiffStr, disqualification, marque/pays/transmission, timerEntries, timers, displayValues, winnerResult, persona...).
---Source : lua/ge/extensions/gameplay/drag/timeslip.lua:63
---@return table|nil  Données du ticket, nil (log E) s'il n'y a pas de données de drag.
function gameplay_drag_timeslip.createTimeslipData() end

--- Version panneau : reprend stripInfo, env, racerInfos, timerConfig, timeslipRows, importantTimerId et ajoute grid {labels, rows} (une ligne par racer avec ses valeurs de timers en police fixe).
---Source : lua/ge/extensions/gameplay/drag/timeslip.lua:304
---@return table  Données du panneau, {} s'il n'y a pas de ticket.
function gameplay_drag_timeslip.createTimeslipPanelData() end

--- Prend une capture d'écran jpg dans screenshots/timeslips/<date-heure> et affiche un message ui.drag.timeslip.saved.
---Source : lua/ge/extensions/gameplay/drag/timeslip.lua:336
function gameplay_drag_timeslip.screenshotTimeslip() end

