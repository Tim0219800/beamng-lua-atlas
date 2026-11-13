---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/treeSpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module de l'outil Tree Spline de l'éditeur : plante ou retire les arbres (instances Forest) le long d'une spline. S'appuie sur editor/toolUtilities/foliageScatter (scatterLine, removeItems, ensureForest) et editor/toolUtilities/occupancy (masque d'exclusion). Les instances plantées sont stockées dans spline.items et spline.count.
--- Accès : extension `editor_treeSpline_populate` : `extensions.load("editor_treeSpline_populate")`, puis la globale `editor_treeSpline_populate`
---@class editor_treeSpline_populate
editor_treeSpline_populate = {}

--- Reprend les arbres rendus par release() qui existent encore dans la Forest (retrouvés par clé et position) et met à jour spline.items / spline.count.
---Source : lua/ge/extensions/editor/treeSpline/populate.lua:78
---@param spline table Spline qui récupère ses arbres.
---@param kept table Liste renvoyée par release().
function editor_treeSpline_populate.adopt(spline, kept) end

--- (Re)plante la spline : supprime ses anciennes instances puis répartit une nouvelle rangée régulière le long de la ligne centrale (divPoints, binormals) selon les paramètres de feuillage (species, speciesWeights, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed). Remplit spline.items et spline.count.
---Source : lua/ge/extensions/editor/treeSpline/populate.lua:31
---@param spline table Spline d'arbres avec ses paramètres de feuillage.
function editor_treeSpline_populate.populateTreeSpline(spline) end

--- Utilisé lors d'un rechargement Lua : l'outil lâche les arbres d'une spline verrouillée sans les supprimer (ils appartiennent au niveau) et renvoie leurs clés et positions pour adopt().
---Source : lua/ge/extensions/editor/treeSpline/populate.lua:67
---@param spline table Spline verrouillée.
---@return table  Liste de {clé, x, y, z} pour chaque arbre conservé.
function editor_treeSpline_populate.release(spline) end

--- Retire de la Forest les instances précédemment plantées pour cette spline, puis vide spline.items et remet spline.count à 0. Sans effet si spline ou spline.items est nil.
---Source : lua/ge/extensions/editor/treeSpline/populate.lua:21
---@param spline table Spline d'arbres (champs items, count).
function editor_treeSpline_populate.tryRemove(spline) end

