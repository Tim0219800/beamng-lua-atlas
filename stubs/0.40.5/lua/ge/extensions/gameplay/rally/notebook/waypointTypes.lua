---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/waypointTypes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Constantes des types de waypoints d'une pacenote de rallye : début de virage ("cornerStart") et fin de virage ("cornerEnd"). Fournit aussi une fonction qui abrège ces types en "Cs" / "Ce" pour l'affichage dans l'éditeur.
--- Accès : extension `gameplay_rally_notebook_waypointTypes` : `extensions.load("gameplay_rally_notebook_waypointTypes")`, puis la globale `gameplay_rally_notebook_waypointTypes`
---@class gameplay_rally_notebook_waypointTypes
---@field wpTypeCornerEnd string Valeur "cornerEnd" : waypoint de fin de virage.
---@field wpTypeCornerStart string Valeur "cornerStart" : waypoint de début de virage.
gameplay_rally_notebook_waypointTypes = {}

--- Renvoie l'abréviation d'un type de waypoint : "Cs" pour cornerStart, "Ce" pour cornerEnd, nil sinon.
---Source : lua/ge/extensions/gameplay/rally/notebook/waypointTypes.lua:15
---@param wpType string Type de waypoint (wpTypeCornerStart ou wpTypeCornerEnd).
---@return string|nil  Abréviation, ou nil si le type est inconnu.
function gameplay_rally_notebook_waypointTypes.shortenWaypointType(wpType) end

