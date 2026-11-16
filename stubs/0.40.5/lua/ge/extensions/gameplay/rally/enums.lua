---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/enums.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared enumerations of the rally system (co-driver notes): pacenote audio mode, trigger type, release type for slow corners, with their readable names. These are constant tables used by the note editor and by the rally engine; the file contains no functions.
--- Access: extension `gameplay_rally_enums`: `extensions.load("gameplay_rally_enums")`, then the global `gameplay_rally_enums`
---@class gameplay_rally_enums
---@field pacenoteAudioMode table<string, integer> Audio modes: auto=1, freeform=2, structuredOnline=3, structuredOffline=4, custom=5.
---@field pacenoteAudioModeDisplayNames table<integer, string> Names shown to the user (editor, debug); structuredOffline is displayed as 'structured'.
---@field pacenoteAudioModeHidden table<string, boolean> Modes hidden in the choice lists (freeform, structuredOnline) but still functional for existing notebooks.
---@field pacenoteAudioModeNames table<integer, string> Technical name of each audio mode, keyed by value.
---@field slowCornerReleaseType table<string, integer> Release moment of a slow corner note: csStaticMinus40=10, csStatic=20, csHalf=30, ceMinus5=40, ceStatic=50.
---@field slowCornerReleaseTypeName table<integer, string> Matching labels (e.g. '40m before corner start', 'at corner end').
---@field triggerType table<string, integer> Trigger types of a note: dynamic=1, csImmediate=15.
---@field triggerTypeName table<integer, string> Labels of the trigger types ('dynamic (default)', 'immediate (only use for first pacenote)').
gameplay_rally_enums = {}

