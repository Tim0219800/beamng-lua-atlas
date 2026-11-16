---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/multiplayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bridge between the drift gameplay and the multiplayer scoreboard (multiplayer_multiplayerScoreboard). When a drift spot starts, creates a scoreboard with the columns potentialScore, driftLevel and score; then pushes the player's score, drift level, status (finishLine / disqualified) and pulses red on a crash. Does nothing if multiplayer_multiplayerScoreboard does not exist.
--- Access: extension `gameplay_drift_multiplayer`: `extensions.load("gameplay_drift_multiplayer")`, then the global `gameplay_drift_multiplayer`
---@class gameplay_drift_multiplayer
---@field dependencies string[] gameplay_drift_general, loaded beforehand.
gameplay_drift_multiplayer = {}

--- Returns the table {default=false, canBeChanged=false} describing this module's debug setting (used by the drift debug window).
---Source: lua/ge/extensions/gameplay/drift/multiplayer.lua:59
---@return table  {default = false, canBeChanged = false}
function gameplay_drift_multiplayer.getDriftDebugInfo() end

--- Hook: crash during a challenge, makes the player's color pulse red in the scoreboard.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/multiplayer.lua:53
function gameplay_drift_multiplayer.onDriftCrash() end

--- Hook: pushes to the scoreboard the current potential score, score and drift level, in the inFreeroamChallenge context.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/multiplayer.lua:18
---@param data table Score change data (unused here: the score is re-read via gameplay_drift_scoring.getScore()).
function gameplay_drift_multiplayer.onDriftScoreChanged(data) end

--- Hook: spot failed, pushes the "disqualified" status to the scoreboard.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/multiplayer.lua:46
function gameplay_drift_multiplayer.onDriftSpotFailed() end

--- Hook: finish line crossed, pushes the "finishLine" status to the scoreboard.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/multiplayer.lua:39
function gameplay_drift_multiplayer.onDriftSpotFinishLineCrossed() end

--- Hook: when entering a drift spot, creates a new multiplayer scoreboard sorted by descending score.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/multiplayer.lua:25
---@param data table Contains lineId, passed to startNewScoreboard.
function gameplay_drift_multiplayer.onDriftSpotStarted(data) end

--- Called every frame: sends the drift level to the scoreboard if it changed since the last frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/multiplayer.lua:72
function gameplay_drift_multiplayer.onUpdate() end

