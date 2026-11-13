---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/geometry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de géométrie de l'éditeur Road Architect (GE). Il transforme les nœuds de référence d'une route en points discrétisés le long d'une spline, puis calcule pour chaque point et chaque voie les quatre coins de la section transversale, les vecteurs normal et latéral, le dévers, etc. Le résultat est stocké dans road.renderData et sert à l'affichage et à la création des DecalRoads/meshes. Un moddeur ne l'utilise que pour recalculer ou lire ces données depuis un outil d'édition.
--- Accès : extension `editor_roadArchitect_geometry` : `extensions.load("editor_roadArchitect_geometry")`, puis la globale `editor_roadArchitect_geometry`
---@class editor_roadArchitect_geometry
editor_roadArchitect_geometry = {}

--- Calcule les données de rendu de la route donnée et les stocke dans road.renderData. Choisit l'ajustement selon la route : style génie civil (road.isCivilEngRoads[0]), arc de cercle (road.isArc, trois nœuds) ou spline Catmull-Rom centripète par défaut. Applique avant cela la projection sur le terrain, l'auto-banking et l'élargissement aux épingles si ces options sont actives.
---Source : lua/ge/extensions/editor/roadArchitect/geometry.lua:533
---@param road table Route de Road Architect (nodes, profile, laneKeys, leftKeys, rightKeys, renderData, tunnels, options imgui…). Modifiée en place.
function editor_roadArchitect_geometry.computeRoadRenderData(road) end

