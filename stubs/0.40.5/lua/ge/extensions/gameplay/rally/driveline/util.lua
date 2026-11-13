---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/util.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Constantes d'édition de la driveline de rallye (spline éditable construite à partir de l'enregistrement de reconnaissance). Utilisées par drivelineV3 : largeur par défaut des nœuds, tolérance de simplification RDP, nombre minimal de subdivisions et espacement minimal de la spline.
--- Accès : extension `gameplay_rally_driveline_util` : `extensions.load("gameplay_rally_driveline_util")`, puis la globale `gameplay_rally_driveline_util`
---@class gameplay_rally_driveline_util
---@field defaultSimplificationTolerance number Tolérance de l'algorithme RDP lors de la simplification des points enregistrés : 1.0 (m).
---@field defaultSplineWidth number Largeur par défaut d'un nœud de spline : 10.0 m.
---@field minSplineDivisions number Nombre minimal de subdivisions de la spline : 10.
---@field minSplineSpacing number Espacement minimal entre points subdivisés : 2.0 m.
gameplay_rally_driveline_util = {}

