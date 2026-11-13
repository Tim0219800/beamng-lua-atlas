---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/deckSweep.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_deckSweep` : `extensions.load("editor_toolUtilities_deckSweep")`, puis la globale `editor_toolUtilities_deckSweep`
---@class editor_toolUtilities_deckSweep
editor_toolUtilities_deckSweep = {}

--- Sweep the deck along the dense line `dp` (vec3s or {x,y,z} tables).
---  sec  = { extL, extR, fwL, fwR (numbers or per-station arrays), crown, flatEnd (m the crown eases out to flat over at each end;
---           nil/0 = none), slabT, topMat, bodyMat, chamfer = { len, drop, lipT } | nil }
---  opts = { tol (plan chordal tolerance, m), tolZ (vertical chordal tolerance, m; nil = tol bounds both), maxSeg (longest kept gap, m) }
---  Returns the parts plus the kept dense station indices, or nil for a degenerate line.
---Source : lua/ge/extensions/editor/toolUtilities/deckSweep.lua:126
---@param dp any
---@param sec any
---@param opts any
function editor_toolUtilities_deckSweep.build(dp, sec, opts) end

