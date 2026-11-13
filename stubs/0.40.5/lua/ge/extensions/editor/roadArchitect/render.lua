---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/render.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rendu de debug (utils/debugDraw et debugDrawer) de tout ce que Road Architect affiche dans la vue 3D : surface et contour des routes, ligne de référence, guides, sphères et numéros de nœuds, numéros et flèches de voies, tunnels automatiques, couches (layers) de la route sélectionnée, routes de superposition, proposition de liaison ou de jonction, polygone de création de groupe, nœuds de sélection multiple et zones de terraformage. Un seul point d'entrée public : drawRoadMarkups, appelé à chaque image par l'éditeur. Seules les routes situées dans un carré de 700 m centré sur la caméra (interrogation de l'arbre spatial) sont dessinées ; les détails secondaires sont limités à 150 m de la caméra.
--- Accès : extension `editor_roadArchitect_render` : `extensions.load("editor_roadArchitect_render")`, puis la globale `editor_roadArchitect_render`
---@class editor_roadArchitect_render
editor_roadArchitect_render = {}

--- Dessine toutes les annotations 3D de Road Architect pour l'image courante. Ne fait rien si tree est nil. Parcourt les routes proches de la caméra (tree:queryNotNested) et, selon les cases cochées de chaque route (isDisplayRoadSurface, isDisplayRoadOutline, isDisplayRefLine, isDisplayLaneInfo, isDisplayNodeSpheres, isDisplayNodeNumbers) et son état (isVis, isHidden, treatAsInvisibleInEdit, isOverlay, isJctRoad), affiche les éléments correspondants, puis la liaison/jonction proposée, le polygone de groupe, les nœuds en sélection multiple, les guides et la zone de terraformage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadArchitect/render.lua:1094
---@param roads table[] Tableau des routes Road Architect.
---@param map table<string, integer> Table nom de route -> indice dans roads.
---@param tree table|nil Arbre spatial (quadtree) des routes ; son absence désactive tout le rendu.
---@param selectedRoadIdx integer|nil Indice de la route sélectionnée.
---@param selectedNodeIdx integer|nil Indice du nœud sélectionné (mis en évidence).
---@param selectedLayerIdx integer|nil Indice de la couche sélectionnée de la route sélectionnée.
---@param isGroupMode boolean Mode groupes actif (affiche aussi les routes cachées).
---@param isProfileMode boolean Mode édition de profil actif (affiche aussi les routes cachées).
---@param isCreateGroup boolean L'utilisateur dessine un polygone de groupe : affiche la clôture gPolygon.
---@param gPolygon table Points du polygone de création de groupe.
---@param multi table[] Sélection multiple de nœuds (éléments avec champ r = nom de route) ; leurs nœuds sont mis en évidence.
---@param selectedLink table|nil Liaison bout à bout proposée (voir link.computePossibleLinks), à dessiner.
---@param selectedCandidateJct table|nil Jonction candidate (voir link.computePossibleJct), à dessiner.
---@param isGuidelines boolean Affiche les guides le long des routes.
---@param isShowTerraSingle boolean Affiche la zone de terraformage de la route sélectionnée.
---@param isShowTerraGroup boolean Affiche la zone de terraformage du groupe placé sélectionné.
---@param selectedPlacedGroup table|nil Groupe placé sélectionné pour la visualisation du terraformage de groupe.
---@param terraParams table Paramètres de terraformage (pointeurs ImGui domainOfInfluence et terraMargin).
function editor_roadArchitect_render.drawRoadMarkups(roads, map, tree, selectedRoadIdx, selectedNodeIdx, selectedLayerIdx, isGroupMode, isProfileMode, isCreateGroup, gPolygon, multi, selectedLink, selectedCandidateJct, isGuidelines, isShowTerraSingle, isShowTerraGroup, selectedPlacedGroup, terraParams) end

