---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur simple de pacenotes : à partir d'une liste de points de la ligne de conduite (driveline), il détecte les virages gauche/droite en calculant, pour chaque point, le cercle passant par trois points (le point et ceux situés `lookAheadContext` indices avant/après, en 2D). Les zones quasi droites sont filtrées, puis les segments consécutifs de même direction sont fusionnés. Sert à l'outil de génération de l'éditeur de rallye.
--- Accès : extension `gameplay_rally_notebook_pacenoteGenerator` : `extensions.load("gameplay_rally_notebook_pacenoteGenerator")`, puis la globale `gameplay_rally_notebook_pacenoteGenerator`
---@class gameplay_rally_notebook_pacenoteGenerator
---@field defaultParams table Paramètres par défaut : lookAheadContext = 7 (nombre de points avant/après pour le cercle), straightThreshold = 5.0 (angle en degrés sous lequel un tronçon est considéré droit), mergeDistanceThreshold = 0.2 (m, distance à la droite pour fusionner des tronçons droits), maxSimplifyIterations = 10.
gameplay_rally_notebook_pacenoteGenerator = {}

--- Détecte les virages le long d'une ligne de conduite. Renvoie `sections` (tous les tronçons, droits inclus, pour le dessin de débogage) et `corners` (seulement ceux ayant une direction, candidats à une pacenote). Chaque section contient pos, posEnd, direction, angle, length et nodes.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua:218
---@param pointList table Liste de points : tables avec un champ .pos, ou directement des vec3.
---@param params table|nil Surcharge de defaultParams (lookAheadContext, straightThreshold, mergeDistanceThreshold, maxSimplifyIterations).
---@return table  { sections = table[], corners = table[] }.
function gameplay_rally_notebook_pacenoteGenerator.detectCorners(pointList, params) end

