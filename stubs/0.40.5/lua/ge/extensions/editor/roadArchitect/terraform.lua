---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/terraform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Modifie le terrain (TerrainBlock) pour l'adapter aux routes du Road Architect : aplanit le terrain sous une route ou un réseau de routes (avec un domaine d'influence et une marge), calcule des masques de routes, et importe/exporte la heightmap en PNG 16 bits. Utilisé par l'interface du Road Architect et par l'import de réseaux routiers. Toutes les fonctions sortent sans rien faire si la scène n'a pas de TerrainBlock (ex. smallgrid).
--- Accès : extension `editor_roadArchitect_terraform` : `extensions.load("editor_roadArchitect_terraform")`, puis la globale `editor_roadArchitect_terraform`
---@class editor_roadArchitect_terraform
editor_roadArchitect_terraform = {}

--- Aplanit le terrain local pour qu'il épouse une route : calcule les quads de la route, un masque et des hauteurs fixées, moyenne avec les voisins puis écrit le terrain. L'emprise est la boîte 2D de la route agrandie du DOI.
---Source : lua/ge/extensions/editor/roadArchitect/terraform.lua:303
---@param rIdx integer Indice de la route dans roads.
---@param DOI number Domaine d'influence (distance de fondu), en mètres, minimum 5.
---@param margin number Marge autour de la route (déduit du code : dilatation du masque).
function editor_roadArchitect_terraform.conformTerrainToRoad(rIdx, DOI, margin) end

--- Calcule deux masques sur la grille du terrain : un masque des routes seules (valeur 65535 là où une route couvre le point, dilaté de 1 case) et un masque routes + marge (dilatation par margin).
---Source : lua/ge/extensions/editor/roadArchitect/terraform.lua:672
---@param DOI number Domaine d'influence, en mètres (minimum 5) ; sert à étendre la boîte de recherche.
---@param margin integer Nombre de cases de dilatation du masque de marge (déduit du code).
---@param group table|nil Groupe placé, ou nil pour toutes les routes.
---@return table<integer, table<integer, number>>|nil  Masque des routes indexé [x][y] (0 ou 65535) ; nil s'il n'y a pas de terrain.
---@return table<integer, table<integer, number>>  Masque routes + marge.
function editor_roadArchitect_terraform.getRoadMasks(DOI, margin, group) end

--- Applique une heightmap PNG au terrain (case par case) puis met à jour la grille du TerrainBlock.
---Source : lua/ge/extensions/editor/roadArchitect/terraform.lua:632
---@param path string Chemin du PNG.
function editor_roadArchitect_terraform.setHeightmapFromPng(path) end

--- Modèle le terrain sur tout le réseau routier, ou sur le groupe indiqué. Recalcule d'abord tous les renderData. N'inclut ni overlays ni ponts.
---Source : lua/ge/extensions/editor/roadArchitect/terraform.lua:451
---@param DOI number Domaine d'influence, en mètres (minimum 5).
---@param margin number Marge autour des routes (déduit du code).
---@param group table|nil Groupe placé, ou nil pour tout le réseau.
function editor_roadArchitect_terraform.terraformMultiRoads(DOI, margin, group) end

--- Enregistre la heightmap du terrain dans un fichier PNG 16 bits (hauteurs négatives ramenées à 0).
---Source : lua/ge/extensions/editor/roadArchitect/terraform.lua:604
---@param path string Chemin du fichier .png à écrire.
---@return table|nil  {} s'il n'y a pas de terrain, sinon nil.
function editor_roadArchitect_terraform.writeHeightmapToPng(path) end

