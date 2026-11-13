---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/rdp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Implémentation optimisée de l'algorithme de Ramer-Douglas-Peucker (RDP) pour simplifier des polylignes ayant trop de points. Utilise la distance au segment (et non à la droite infinie), une pile explicite à la place de la récursion et des tables réutilisées. Les variantes simplifyNodes* compactent les tableaux en place, y compris les tableaux parallèles (largeurs, normales, vitesses, limites de vitesse).
--- Accès : extension `editor_toolUtilities_rdp` : `extensions.load("editor_toolUtilities_rdp")`, puis la globale `editor_toolUtilities_rdp`
---@class editor_toolUtilities_rdp
editor_toolUtilities_rdp = {}

--- Calcule les indices à conserver par RDP entre startIdx et endIdx. La table de sortie est vidée puis remplie ; l'ordre n'est pas strictement croissant selon la pile mais le premier indice est startIdx.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:24
---@param nodes table Liste de vec3.
---@param startIdx integer Indice de départ (1 pour tout le tracé).
---@param endIdx integer Indice de fin.
---@param tol number Distance maximale tolérée au segment.
---@param retListP table|nil Table de sortie réutilisable ; créée si nil.
---@return table  Liste des indices conservés.
function editor_toolUtilities_rdp.rdpIndices(nodes, startIdx, endIdx, tol, retListP) end

--- Simplifie nodes en place et supprime les points en trop.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:69
---@param nodes table Liste de vec3, modifiée.
---@param tol number|nil Tolérance (défaut 6.0).
---@return integer  Nombre de points restants.
function editor_toolUtilities_rdp.simplifyNodes(nodes, tol) end

--- Comme simplifyNodes, en gardant velocities aligné avec nodes.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:140
---@param nodes table Points.
---@param velocities table Vitesses associées.
---@param tol number|nil Tolérance (défaut 6.0).
---@return integer  Nombre de points restants.
function editor_toolUtilities_rdp.simplifyNodesVels(nodes, velocities, tol) end

--- Comme simplifyNodes, en gardant le tableau widths aligné avec nodes.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:92
---@param nodes table Points, modifiés en place.
---@param widths table Largeurs associées, modifiées en place.
---@param tol number|nil Tolérance (défaut 6.0).
---@return integer  Nombre de points restants.
function editor_toolUtilities_rdp.simplifyNodesWidths(nodes, widths, tol) end

--- Comme simplifyNodes, en gardant widths et normals alignés avec nodes.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:116
---@param nodes table Points.
---@param widths table Largeurs.
---@param normals table Normales.
---@param tol number|nil Tolérance (défaut 6.0).
---@return integer  Nombre de points restants.
function editor_toolUtilities_rdp.simplifyNodesWidthsNormals(nodes, widths, normals, tol) end

--- Comme simplifyNodes, en gardant widths, velocities et velLimits alignés avec nodes.
---Source : lua/ge/extensions/editor/toolUtilities/rdp.lua:164
---@param nodes table Points.
---@param widths table Largeurs.
---@param velocities table Vitesses.
---@param velLimits table Limites de vitesse.
---@param tol number|nil Tolérance (défaut 6.0).
---@return integer  Nombre de points restants.
function editor_toolUtilities_rdp.simplifyNodesWidthsVelVelLimits(nodes, widths, velocities, velLimits, tol) end

