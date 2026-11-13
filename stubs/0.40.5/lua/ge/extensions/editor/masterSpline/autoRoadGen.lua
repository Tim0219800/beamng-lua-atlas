---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/autoRoadGen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_masterSpline_autoRoadGen` : `extensions.load("editor_masterSpline_autoRoadGen")`, puis la globale `editor_masterSpline_autoRoadGen`
---@class editor_masterSpline_autoRoadGen
editor_masterSpline_autoRoadGen = {}

--- Clears the current preview.
---Source : lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:67
function editor_masterSpline_autoRoadGen.clearPreview() end

--- Creates an auto-generated spline from the preview.
---Source : lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:346
---@param spline any
---@param bankingStrength any
---@param autoBankFalloff any
function editor_masterSpline_autoRoadGen.createAutoRoad(spline, bankingStrength, autoBankFalloff) end

--- Generates an auto-generated road preview for a multi-waypoint spline.
---Source : lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:290
---@param spline any
---@param autoParams any
---@param presetParams any
function editor_masterSpline_autoRoadGen.generateAutoPreview(spline, autoParams, presetParams) end

--- Handles the preview. Called once per frame.
---Source : lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:375
---@param spline any
function editor_masterSpline_autoRoadGen.handlePreview(spline) end

--- Returns true if a preview currently exists, otherwise false.
---Source : lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:64
function editor_masterSpline_autoRoadGen.isPreview() end

