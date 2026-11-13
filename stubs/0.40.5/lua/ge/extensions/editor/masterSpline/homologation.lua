---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/homologation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire de l'outil Master Spline pour « homologuer » une spline par rapport à un preset de standard routier (roadDesignStandards) : il mesure les écarts géométriques (pente, rayon de virage, dévers, gradient de largeur) et les corrige par itérations. Le mode actif est spline.splineAnalysisMode : 0 pente, 1 rayon, 2 dévers, 3 largeur. Le preset vient de spline.homologationPreset.
--- Accès : extension `editor_masterSpline_homologation` : `extensions.load("editor_masterSpline_homologation")`, puis la globale `editor_masterSpline_homologation`
---@class editor_masterSpline_homologation
editor_masterSpline_homologation = {}

--- Analyse la spline avec la métrique courante (spline.splineAnalysisMode) et remplit le tableau d'erreurs normalisées correspondant, à partir de divPoints/divWidths et du preset d'homologation.
---Source : lua/ge/extensions/editor/masterSpline/homologation.lua:218
---@param spline table Spline avec nodes, divPoints, divWidths, nmls, homologationPreset et splineAnalysisMode.
function editor_masterSpline_homologation.analyseSpline(spline) end

--- Renvoie le nombre d'itérations d'optimisation à exécuter par image (5).
---Source : lua/ge/extensions/editor/masterSpline/homologation.lua:46
---@return integer  Itérations par image.
function editor_masterSpline_homologation.getOptimisationIterationsPerFrame() end

--- Recalcule la géométrie (catmullRomFree), analyse la spline, la marque isDirty, puis lance numIter itérations de l'optimiseur correspondant au mode (pente, rayon, dévers ou largeur). Modifie les nœuds, normales ou largeurs en place.
---Source : lua/ge/extensions/editor/masterSpline/homologation.lua:406
---@param spline table Spline à optimiser.
---@param numIter integer Nombre d'itérations à effectuer dans cet appel (typiquement getOptimisationIterationsPerFrame()).
function editor_masterSpline_homologation.optimiseSpline(spline, numIter) end

