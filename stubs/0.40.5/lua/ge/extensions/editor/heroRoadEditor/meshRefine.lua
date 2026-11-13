---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Décimation de maillage pour le Hero Road Editor, par l'algorithme de Ramer-Douglas-Peucker (RDP). decimateStations réduit le nombre de stations (tranches transversales) le long de la route ; decimateCols réduit le nombre de colonnes (points latéraux d'une coupe). Utilisé par mesh.lua pour construire les niveaux de détail (LOD) et le maillage de collision.
--- Accès : extension `editor_heroRoadEditor_meshRefine` : `extensions.load("editor_heroRoadEditor_meshRefine")`, puis la globale `editor_heroRoadEditor_meshRefine`
---@class editor_heroRoadEditor_meshRefine
editor_heroRoadEditor_meshRefine = {}

--- Décimation latérale des colonnes. Force la conservation de la colonne 1, de la dernière et de toute frontière entre bandes de matériaux différents, puis applique RDP aux colonnes intérieures avec l'écart (o, dz) MAXIMAL sur toutes les stations : une colonne reste si le profil plie à n'importe quelle station (par exemple un bombé qui apparaît progressivement garde ses colonnes de sommet).
---Source : lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua:129
---@param ptsA table ptsA[s] = coupe de la station s, un tableau de {o, dz} par colonne (décalage latéral, écart vertical).
---@param bandMat table Un matériau par bande (entre les colonnes c et c+1).
---@param tolM number Tolérance en mètres.
---@param m integer Nombre de stations.
---@return integer[]  Indices triés des colonnes conservées.
function editor_heroRoadEditor_meshRefine.decimateCols(ptsA, bandMat, tolM, m) end

--- RDP multi-canal sur les stations 1..m : une station est conservée si la ligne centrale, le bord gauche (colonne 1) ou le bord droit (colonne numCols) dévie de plus que la tolérance par rapport à la corde. Garde toujours les stations 1 et m et celles de mustKeep. Avec tolZM, tolM ne borne que l'écart en plan et tolZM l'écart vertical (une corde en plan décale seulement un bord, une corde verticale crée une bosse). Un plafond maxSegM réinsère des stations d'origine pour couper les segments trop longs en sous-segments à peu près égaux (au mieux jusqu'à l'espacement d'origine).
---Source : lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua:49
---@param centres table Points de la ligne centrale par station (x, y, z).
---@param W table Grille de points monde W[station][colonne]; seules les colonnes 1 et numCols sont lues.
---@param numCols integer Nombre de colonnes de la grille.
---@param tolM number Tolérance en mètres (plan seul si tolZM est fourni, sinon écart 3D).
---@param m integer Nombre de stations.
---@param maxSegM number|nil Longueur d'arc maximale entre deux stations conservées, en mètres ; nil ou 0 pour désactiver.
---@param mustKeep table<integer, boolean>|nil Ensemble des indices de stations à conserver obligatoirement.
---@param tolZM number|nil Tolérance verticale en mètres ; active le mode à deux tolérances.
---@return integer[]  Indices triés des stations conservées.
function editor_heroRoadEditor_meshRefine.decimateStations(centres, W, numCols, tolM, m, maxSegM, mustKeep, tolZM) end

