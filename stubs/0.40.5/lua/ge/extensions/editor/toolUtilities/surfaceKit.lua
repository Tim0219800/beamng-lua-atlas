---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/surfaceKit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Kit partagé pour peindre des groundmodels (physique) sur des routes en mesh (mode groundmodel du Hero Road Editor). Le groundmodel est déduit du nom du matériau d'un triangle : les variantes de grip ont le même aspect que la base et ne diffèrent que par groundType. Les variantes sont le matériau de chaussée de la route plus un suffixe (_wet, _snow ou _snowy, _ice) ; Dry est le matériau de base et sert de gomme. Un état n'est peignable que si son matériau existe dans le niveau. La peinture est stockée en tampons monde { x, y, r, m } (m = indice de palette à partir de 1).
--- Accès : extension `editor_toolUtilities_surfaceKit` : `extensions.load("editor_toolUtilities_surfaceKit")`, puis la globale `editor_toolUtilities_surfaceKit`
---@class editor_toolUtilities_surfaceKit
editor_toolUtilities_surfaceKit = {}

--- Construit un hachage spatial uniforme sur les tampons pour que la recherche par quad soit environ O(1). Renvoie nil s'il n'y a rien de peint.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:84
---@param stamps table|nil Liste de tampons { x, y, r, m }.
---@return table|nil  { cell, map } ou nil.
function editor_toolUtilities_surfaceKit.buildGrid(stamps) end

--- Couleur de surcouche { r, g, b } (0-255) ; celle de Dry si l'indice est inconnu.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:41
---@param i integer Indice.
---@return table  { r, g, b }.
function editor_toolUtilities_surfaceKit.colOf(i) end

--- Nombre d'entrées de la palette.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:37
---@return integer  4
function editor_toolUtilities_surfaceKit.count() end

--- Entrée de palette (id, label, groundmodel, col, suffixes).
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:38
---@param i integer Indice à partir de 1.
---@return table|nil  Entrée.
function editor_toolUtilities_surfaceKit.get(i) end

--- Vrai si la surface `i` est peignable : Dry toujours, les autres seulement si une variante existe.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:62
---@param i integer Indice de palette.
---@param baseMat string Matériau de base.
---@return boolean  Disponible.
function editor_toolUtilities_surfaceKit.isAvailable(i, baseMat) end

--- Vrai si l'indice est celui de la surface de base (Dry) ; nil est traité comme la base.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:39
---@param i integer|nil Indice de palette.
---@return boolean  Est la base.
function editor_toolUtilities_surfaceKit.isBase(i) end

--- Libellé de l'entrée, '?' si inconnue.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:40
---@param i integer Indice.
---@return string  Libellé.
function editor_toolUtilities_surfaceKit.labelOf(i) end

--- Indice de palette de la surface peinte au point monde (px, py) : le tampon d'indice le plus élevé couvrant le point gagne. Renvoie l'indice de base si rien ne le couvre.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:101
---@param grid table|nil Résultat de buildGrid.
---@param stamps table Les mêmes tampons.
---@param px number X monde (m).
---@param py number Y monde (m).
---@return integer  Indice de palette.
function editor_toolUtilities_surfaceKit.materialAt(grid, stamps, px, py) end

--- Vrai si un matériau de ce nom est présent dans le niveau (scenetree.findObject).
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:44
---@param name string|nil Nom du matériau.
---@return boolean  Existe.
function editor_toolUtilities_surfaceKit.materialExists(name) end

--- Matériau réellement appliqué à un quad peint de la surface `i` : la variante si elle existe, sinon la base.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:69
---@param i integer Indice.
---@param baseMat string Matériau de base.
---@return string  Nom du matériau.
function editor_toolUtilities_surfaceKit.materialOf(i, baseMat) end

--- Résout le matériau de chaque surface pour une base donnée, en un passage (appelé une fois par construction de mesh).
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:75
---@param baseMat string Matériau de base.
---@return table<integer, string>  Indice de palette -> nom de matériau.
function editor_toolUtilities_surfaceKit.resolveMaterials(baseMat) end

--- Nom du matériau variante de la surface `i` pour la chaussée `baseMat`, ou nil si aucune variante n'existe (non peignable). Dry renvoie le matériau de base.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:50
---@param i integer Indice de palette.
---@param baseMat string Matériau de base de la chaussée.
---@return string|nil  Nom du matériau.
function editor_toolUtilities_surfaceKit.variantMaterial(i, baseMat) end

