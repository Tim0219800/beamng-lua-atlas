---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/skeleton.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suite d'utilitaires pour squelettiser et vectoriser des masques binaires. La fonction principale getPathsFromPng convertit un PNG en masque, le squelettise (algorithme Guo-Hall), détecte extrémités et jonctions, extrait les chemins, estime les largeurs, puis simplifie par RDP (tolérance 6.0). Sert aux outils de splines pour transformer une image de routes en polylignes.
--- Accès : extension `editor_toolUtilities_skeleton` : `extensions.load("editor_toolUtilities_skeleton")`, puis la globale `editor_toolUtilities_skeleton`
---@class editor_toolUtilities_skeleton
editor_toolUtilities_skeleton = {}

--- Estime la largeur le long de chaque chemin à partir du masque issu du PNG d'origine (utilise les tangentes locales).
---Source : lua/ge/extensions/editor/toolUtilities/skeleton.lua:451
---@param paths table Chemins extraits.
---@param mask table Masque d'origine, non squelettisé.
---@return table  Largeurs, une liste par chemin (déduit du code).
function editor_toolUtilities_skeleton.estimateWidths(paths, mask) end

--- Extrait tous les chemins d'un masque déjà squelettisé.
---Source : lua/ge/extensions/editor/toolUtilities/skeleton.lua:331
---@param mask table Masque squelettisé.
---@return table  Liste de chemins (déduit du code).
function editor_toolUtilities_skeleton.extractPaths(mask) end

--- Convertit un PNG en masque squelettisé et le vectorise en polylignes. Renvoie nil (avec une erreur loggée) si le fichier ne se charge pas ou si la conversion échoue.
---Source : lua/ge/extensions/editor/toolUtilities/skeleton.lua:652
---@param filepath string Chemin d'un PNG d'un format supporté.
---@return table<integer, {points: vec3[], widths: number[]}>|nil  Un élément par chemin : points (2D en vec3) et widths correspondantes.
function editor_toolUtilities_skeleton.getPathsFromPng(filepath) end

--- Squelettise un masque avec l'algorithme Guo-Hall, en alternant deux passes jusqu'à stabilité. Le masque est modifié en place puis renvoyé.
---Source : lua/ge/extensions/editor/toolUtilities/skeleton.lua:155
---@param mask table Masque 2D (lignes de 0 ou 1).
---@return table  Le même masque, squelettisé.
function editor_toolUtilities_skeleton.skeletonise(mask) end

