---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/kerbSpec.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_kerbSpec` : `extensions.load("editor_toolUtilities_kerbSpec")`, puis la globale `editor_toolUtilities_kerbSpec`
---@class editor_toolUtilities_kerbSpec
---@field spec table
editor_toolUtilities_kerbSpec = {}

--- The three rows one kerb variant occupies: the back of its tread, the arris, and the foot of its face. The arris row matters
---  -- the normal map carries a bullnose baked across the middle of every band, so putting the real 90 degree edge anywhere
---  else throws the roll off the corner it belongs on.
---Source : lua/ge/extensions/editor/toolUtilities/kerbSpec.lua:35
---@param variant any
function editor_toolUtilities_kerbSpec.kerbRows(variant) end

