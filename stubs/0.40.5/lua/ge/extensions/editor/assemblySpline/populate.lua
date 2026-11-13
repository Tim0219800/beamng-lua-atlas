---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Place dans le niveau les meshes TSStatic d'une assembly spline : à partir de la géométrie de la spline (divPoints, tangentes, normales), de la molécule et de la carte de distribution (distribution.computeMeshMap), il positionne les rigides le long de la courbe (espacement, décalage vertical, affaissement, rotation préalable, jitter, graine aléatoire) et étire/oriente les ponts entre deux rigides. Les meshes sont rangés dans des pools par spline et par chemin de mesh pour être réutilisés, et sont enfants du SimGroup de la spline. Gère aussi l'état verrouillé (splineLock) : une spline verrouillée dont les meshes existent n'est pas replacée.
--- Accès : extension `editor_assemblySpline_populate` : `extensions.load("editor_assemblySpline_populate")`, puis la globale `editor_assemblySpline_populate`
---@class editor_assemblySpline_populate
editor_assemblySpline_populate = {}

--- Reprend les meshes lâchés par release (ceux encore présents dans la scène) tels quels et mémorise l'état de verrouillage.
---Source : lua/ge/extensions/editor/assemblySpline/populate.lua:516
---@param spline table Assembly spline.
---@param ids table<string, integer[]> Résultat de release.
function editor_assemblySpline_populate.adopt(spline, ids) end

--- Appelle fn(mesh, true) pour chaque mesh que l'outil détient pour la spline (le « each » de splineLock).
---Source : lua/ge/extensions/editor/assemblySpline/populate.lua:54
---@param spline table Assembly spline.
---@param fn function Callback fn(mesh, true).
function editor_assemblySpline_populate.eachObject(spline, fn) end

--- Met la spline à jour dans la scène. Si la spline est verrouillée (isEnabled faux) et que ses meshes existent, applique seulement l'état de verrouillage sans les déplacer ; sinon (re)place tous les meshes.
---Source : lua/ge/extensions/editor/assemblySpline/populate.lua:490
---@param spline table Assembly spline.
---@param splineIdx integer Index de la spline.
---@param molecule table Molécule (spline.moleculeDescription).
function editor_assemblySpline_populate.populateAssemblySpline(spline, splineIdx, molecule) end

--- Rechargement Lua : l'outil lâche les meshes d'une spline verrouillée sans les supprimer (ils font partie du niveau) et renvoie leurs ids par chemin de mesh.
---Source : lua/ge/extensions/editor/assemblySpline/populate.lua:500
---@param spline table Assembly spline.
---@return table<string, integer[]>  Ids des meshes par meshPath.
function editor_assemblySpline_populate.release(spline) end

--- Supprime tous les meshes de la spline (objets de la scène et pools) et oublie son état de verrouillage appliqué.
---Source : lua/ge/extensions/editor/assemblySpline/populate.lua:460
---@param spline table Assembly spline.
function editor_assemblySpline_populate.tryRemove(spline) end

