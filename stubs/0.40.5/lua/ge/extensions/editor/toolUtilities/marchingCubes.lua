---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/marchingCubes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extraction de surface par marching cubes (Lorensen & Cline 1987, tables d'après Paul Bourke) : produit un maillage de triangles à partir d'un champ de densité scalaire échantillonné sur une grille 3D régulière, au croisement iso = 0, avec F > 0 = intérieur (solide). Ne calcule pas de normales : l'appelant les recalcule après soudure/décimation.
--- Accès : extension `editor_toolUtilities_marchingCubes` : `extensions.load("editor_toolUtilities_marchingCubes")`, puis la globale `editor_toolUtilities_marchingCubes`
---@class editor_toolUtilities_marchingCubes
editor_toolUtilities_marchingCubes = {}

--- Extrait la surface iso = 0 de sampleFn(sampleCtx, x, y, z) (positif = intérieur) sur la boîte bounds avec une grille de pas cell. Renvoie un maillage indexé en structure de tableaux { vx, vy, vz (positions), ta, tb, tc (indices 1-based des coins de triangle), nv, nt }, ou nil s'il est vide. Si 'store' est fourni, les valeurs des coins sont copiées depuis cette grille pré-échantillonnée au lieu d'appeler sampleFn, ce qui évite de réévaluer le champ sur les plans de coins partagés entre blocs voisins.
---Source : lua/ge/extensions/editor/toolUtilities/marchingCubes.lua:160
---@param bounds table Boîte { minx, miny, minz, maxx, maxy, maxz }.
---@param cell number Pas de la grille.
---@param sampleFn function sampleFn(sampleCtx, x, y, z) -> number.
---@param sampleCtx any Contexte passé tel quel à sampleFn.
---@param store table|nil Grille de valeurs partagée : sval (valeurs à plat, une colonne en z après l'autre), colBase (décalage par colonne de coins globale), colStride (colonnes par rangée = NX global + 1 ; col = gj*colStride + gi + 1), gi0, gj0, gk0 (origine globale des coins de ce bloc).
---@return table|nil  { vx, vy, vz, ta, tb, tc, nv, nt } ou nil.
function editor_toolUtilities_marchingCubes.polygonize(bounds, cell, sampleFn, sampleCtx, store) end

---@type number
ci = nil
