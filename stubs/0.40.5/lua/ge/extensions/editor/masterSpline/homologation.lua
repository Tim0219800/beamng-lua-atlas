---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/homologation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_masterSpline_homologation` : `extensions.load("editor_masterSpline_homologation")`, puis la globale `editor_masterSpline_homologation`
---@class editor_masterSpline_homologation
editor_masterSpline_homologation = {}

--- analyses the spline based on the current metric.
---Source : lua/ge/extensions/editor/masterSpline/homologation.lua:218
---@param spline any
function editor_masterSpline_homologation.analyseSpline(spline) end

--- Returns the optimization iterations per frame.
---Source : lua/ge/extensions/editor/masterSpline/homologation.lua:46
function editor_masterSpline_homologation.getOptimisationIterationsPerFrame() end

--- Dispatcher with iteration loop.
---Source : lua/ge/extensions/editor/masterSpline/homologation.lua:406
---@param spline any
---@param numIter any
function editor_masterSpline_homologation.optimiseSpline(spline, numIter) end

