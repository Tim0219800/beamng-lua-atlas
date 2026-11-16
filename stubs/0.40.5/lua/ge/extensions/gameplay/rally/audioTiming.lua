---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/audioTiming.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bounds and clamp functions for the rally co-driver audio spacing settings, in milliseconds: gap between corners, between phrases, between link words and between notes. Each function rounds the value to an integer and clamps it to the allowed range. Used by the editor/settings and by gameplay_rally_audioManager.
--- Access: extension `gameplay_rally_audioTiming`: `extensions.load("gameplay_rally_audioTiming")`, then the global `gameplay_rally_audioTiming`
---@class gameplay_rally_audioTiming
---@field cornerGapMs table Bounds {min=-200, max=200} of the gap between corners (ms). Table shared with phraseGapMs and linkWordGapMs.
---@field linkWordGapMs table Bounds {min=-200, max=200} of the gap with link words (ms).
---@field pacenoteGapMs table Bounds {min=-100, max=400} of the gap between two notes (ms).
---@field phraseGapMs table Bounds {min=-200, max=200} of the gap between phrases (ms).
gameplay_rally_audioTiming = {}

--- Rounds and clamps a corner gap to cornerGapMs.
---Source: lua/ge/extensions/gameplay/rally/audioTiming.lua:27
---@param value number|string Value in ms; converted with tonumber, 0 if invalid.
---@return integer  Clamped value in ms.
function gameplay_rally_audioTiming.clampCornerGapMs(value) end

--- Rounds and clamps a link word gap to linkWordGapMs.
---Source: lua/ge/extensions/gameplay/rally/audioTiming.lua:35
---@param value number|string Value in ms.
---@return integer  Clamped value in ms.
function gameplay_rally_audioTiming.clampLinkWordGapMs(value) end

--- Rounds and clamps a note gap to pacenoteGapMs.
---Source: lua/ge/extensions/gameplay/rally/audioTiming.lua:39
---@param value number|string Value in ms.
---@return integer  Clamped value in ms.
function gameplay_rally_audioTiming.clampPacenoteGapMs(value) end

--- Rounds and clamps a phrase gap to phraseGapMs.
---Source: lua/ge/extensions/gameplay/rally/audioTiming.lua:31
---@param value number|string Value in ms.
---@return integer  Clamped value in ms.
function gameplay_rally_audioTiming.clampPhraseGapMs(value) end

