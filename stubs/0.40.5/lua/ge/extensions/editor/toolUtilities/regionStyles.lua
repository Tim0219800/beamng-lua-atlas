---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/regionStyles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Style de peinture de marquage routier pour une région. Pour l'instant une seule région est définie : USA (circulation à droite). Donne les matériaux et largeurs des lignes centrales, de voie, de rive, d'arrêt et de cédez-le-passage, ainsi que de la zone de séparation hachurée.
--- Accès : extension `editor_toolUtilities_regionStyles` : `extensions.load("editor_toolUtilities_regionStyles")`, puis la globale `editor_toolUtilities_regionStyles`
---@class editor_toolUtilities_regionStyles
editor_toolUtilities_regionStyles = {}

--- Renvoie la table de style de marquage de la région courante (toujours USA) : centerLineMaterial, centerLineWidthM, centerLineTexLen, laneLineMaterial, edgeLineMaterial, leftEdgeLineMaterial, stopLineMaterial, giveWayMaterial, stopLineWidthM, giveWayWidthM, goreSepMaterial, goreSepTexLen.
---Source : lua/ge/extensions/editor/toolUtilities/regionStyles.lua:25
---@return table  Table de style (matériaux en string, largeurs et longueurs de texture en mètres).
function editor_toolUtilities_regionStyles.getRegion() end

