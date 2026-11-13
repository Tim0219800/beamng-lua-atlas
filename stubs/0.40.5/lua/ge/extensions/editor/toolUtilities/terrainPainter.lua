---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/terrainPainter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Peint le matériau de terrain sous une spline (route) et permet d'annuler. Calcule l'emprise de la route (bord réel du tablier pour les routes mesh, sinon ligne centrale et largeurs par station), pousse ce contour de group.paintMargin, remplit le polygone par lignes de balayage et mémorise les matériaux d'origine dans le groupe pour pouvoir les restaurer. Passe par editor_terrainEditor (bloc de terrain et terrain editor).
--- Accès : extension `editor_toolUtilities_terrainPainter` : `extensions.load("editor_toolUtilities_terrainPainter")`, puis la globale `editor_toolUtilities_terrainPainter`
---@class editor_toolUtilities_terrainPainter
editor_toolUtilities_terrainPainter = {}

--- Peint la spline donnée : calcule d'abord son emprise puis la peint, avec le matériau group.paintMaterialIdx. Stocke coordonnées, anciennes valeurs et boîte dans le groupe.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:143
---@param group table Groupe de spline (nodes, divPoints, binormals, divWidths, meshEdgeL/R, paintMargin, paintMaterialIdx, paintedData*).
---@param runs table|nil Paires d'indices de divPoints { i0, i1 } : seulement ces tronçons, dans un seul enregistrement. Par défaut toute la route.
function editor_toolUtilities_terrainPainter.paint(group, runs) end

--- Peint un polygone fermé en XY monde avec le matériau de terrain donné, en enregistrant dans `store` ce qui s'y trouvait pour pouvoir le remettre. Met à jour la grille du terrain (updateGridMaterials, updateGrid).
---Source : lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:83
---@param store table Table qui reçoit paintedDataX, paintedDataY, paintedDataVals et les bornes paintedDataBox*.
---@param poly table Liste de points (x, y) du polygone, 3 au moins.
---@param materialIdx integer|nil Indice du matériau de terrain (1 par défaut).
---@param skip function|nil skip(x, y) interrogé pour chaque point ; si vrai le sol est laissé tel quel.
function editor_toolUtilities_terrainPainter.paintPolygon(store, poly, materialIdx, skip) end

--- Remet sous la peinture l'état d'avant : restaure les indices de matériau, met à jour la grille, vide les données peintes du groupe.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:179
---@param group table Groupe peint.
function editor_toolUtilities_terrainPainter.revert(group) end

--- Annule la peinture du terrain pour tous les groupes.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:207
---@param groups table Liste de groupes.
function editor_toolUtilities_terrainPainter.revertAll(groups) end

