---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/roadDesignStandards.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road design standards shared by several editor tools. Defines six ordered presets, from the most rigorous to the most rustic, each with four constraints: maximum longitudinal slope (ratio), minimum curvature radius (m), maximum banking (degrees) and maximum width gradient.
--- Access: extension `editor_toolUtilities_roadDesignStandards`: `extensions.load("editor_toolUtilities_roadDesignStandards")`, then the global `editor_toolUtilities_roadDesignStandards`
---@class editor_toolUtilities_roadDesignStandards
editor_toolUtilities_roadDesignStandards = {}

--- Returns the ordered array of preset names.
---Source: lua/ge/extensions/editor/toolUtilities/roadDesignStandards.lua:93
---@return string[]  Names of the six presets.
function editor_toolUtilities_roadDesignStandards.getPresetStrings() end

--- Returns the table preset name -> parameters {maxSlope, minRadius, maxBanking, maxWidthGradient}.
---Source: lua/ge/extensions/editor/toolUtilities/roadDesignStandards.lua:97
---@return table<string, table>  Parameters of each preset.
function editor_toolUtilities_roadDesignStandards.getPresetsMap() end

