---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/populationEngine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit moteur de géométrie utilisé par l'outil Mesh Spline : il calcule la géométrie dérivée d'une spline (points subdivisés, largeurs, tangentes, normales) à partir de ses nœuds de contrôle (Catmull-Rom, libre, projetée sur le terrain ou par raycast), puis échantillonne des positions le long de cette courbe pour placer des meshes. S'appuie sur editor/toolUtilities/geom et util. Appelé par splineMgr et populate, pas par un moddeur directement.
--- Accès : extension `editor_meshSpline_populationEngine` : `extensions.load("editor_meshSpline_populationEngine")`, puis la globale `editor_meshSpline_populationEngine`
---@class editor_meshSpline_populationEngine
editor_meshSpline_populationEngine = {}

--- Vide les tables dérivées de la spline : divPoints, divWidths, tangents, binormals, normals et discMap.
---Source : lua/ge/extensions/editor/meshSpline/populationEngine.lua:10
---@param spline table Spline de l'outil Mesh Spline.
function editor_meshSpline_populationEngine.clearDerivedGeometry(spline) end

--- Calcule le repère local (position, tangente, vecteur haut) de l'intervalle entre les échantillons index et index+1 (geom.ribbonIntervalFrame).
---Source : lua/ge/extensions/editor/meshSpline/populationEngine.lua:75
---@param positions table Positions échantillonnées.
---@param tangents table Tangentes échantillonnées.
---@param normals table Normales échantillonnées.
---@param index integer Indice de départ de l'intervalle (base 1).
---@param outPosition vec3 Reçoit la position (déduit du code).
---@param outTangent vec3 Reçoit la tangente (déduit du code).
---@param outUp vec3 Reçoit le vecteur haut (déduit du code).
---@param previousAcross vec3|nil Vecteur transversal de l'intervalle précédent, pour la continuité (déduit du code).
---@return boolean  false si positions[index] ou positions[index+1] n'existe pas, sinon true.
function editor_meshSpline_populationEngine.intervalFrame(positions, tangents, normals, index, outPosition, outTangent, outUp, previousAcross) end

--- Échantillonne la spline à intervalle régulier. Avec useEvenFit, spacing est une cible : un élément est verrouillé aux deux extrémités et l'intérieur est espacé le plus uniformément possible (geom.sampleSplineEvenFit, tient compte de isLoop). Sinon marche à période fixe (geom.sampleSpline).
---Source : lua/ge/extensions/editor/meshSpline/populationEngine.lua:46
---@param spline table Spline avec divPoints, tangents, normals, isLoop.
---@param spacing number Période en mètres entre deux positions.
---@param outPositions table Table remplie avec les positions.
---@param outTangents table Table remplie avec les tangentes.
---@param outNormals table Table remplie avec les normales.
---@param useEvenFit boolean|nil Active l'échantillonnage extrémités verrouillées.
---@return table  outPositions.
---@return table  outTangents.
---@return table  outNormals.
function editor_meshSpline_populationEngine.sample(spline, spacing, outPositions, outTangents, outNormals, useEvenFit) end

--- Recalcule la géométrie dérivée de la spline. Avec moins de 2 nœuds, vide la géométrie et renvoie false. Si isConformToTerrain : abaisse les nœuds sur le terrain (terrainOnly) ou par raycast vertical, puis utilise catmullRomConformToTerrain / catmullRomRaycast ; sinon catmullRomFree.
---Source : lua/ge/extensions/editor/meshSpline/populationEngine.lua:19
---@param spline table Spline avec nodes, widths, nmls, isConformToTerrain, terrainOnly, rayPostFloat.
---@param minimumDivisions integer Nombre minimal de subdivisions par segment (transmis à geom).
---@return boolean  true si la spline a au moins 2 points subdivisés après calcul.
function editor_meshSpline_populationEngine.updateGeometry(spline, minimumDivisions) end

