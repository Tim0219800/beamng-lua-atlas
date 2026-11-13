---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/mesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génération du maillage de conduite procédural d'un groupe du Hero Road Editor. Balaye les coupes de profile.lua le long de la ligne centrale 3D (divPoints) : chaussée, accotements, chanfreins périphériques, nids-de-poule creusés, et groupes de surface (groundmodels) répartis par matériau. Produit des ProceduralMesh avec collision pour l'édition (nommés 'HeroRoad_<id>_<n>', découpés en chunks) et, pour le bake, les chunks avec niveaux de détail et maillage de collision. Il remplit aussi les champs dérivés que d'autres modules lisent (meshEdgeL/R, meshEdgeDirL/R, meshEdgeUp, meshGrid, meshVArc, meshStationCount, triCount).
--- Accès : extension `editor_heroRoadEditor_mesh` : `extensions.load("editor_heroRoadEditor_mesh")`, puis la globale `editor_heroRoadEditor_mesh`
---@class editor_heroRoadEditor_mesh
editor_heroRoadEditor_mesh = {}

--- Construit toute la charge utile du bake : pour chaque chunk d'environ chunkLenM, son jeu de LOD visibles et un maillage de collision de chaussée seule. Les coupures sont calculées une fois à partir de la longueur d'arc pleine résolution et partagées par tous les niveaux. Les LOD de nombre de triangles quasi égal sont abandonnés.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:883
---@param group table Groupe Hero Road.
---@param chunkLenM number|nil Longueur de chunk en mètres (min 20, défaut 120).
---@return table|nil  Liste de chunks { lods = { {size, parts}, ... }, col = { part, ... } }, ou nil s'il n'y a rien à construire.
---@return number|nil  nullSize : taille en px du niveau 'nulldetail' lointain, ou nil si le dernier niveau est un LOD visible.
function editor_heroRoadEditor_mesh.buildChunkLODs(group, chunkLenM) end

--- Assemble la géométrie de conduite en une liste de parts de matériau (meshPart) ; c'est la fonction interne assemble exportée sous ce nom. Écrase les champs dérivés du groupe (bords, grille, vArc, triCount...). Avec jLo/jHi, ne construit que les stations de ce chunk.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:371
---@param group table Groupe Hero Road (divPoints, tangents, matériaux, paramètres de profil).
---@param opts table|nil Options : tol (tolérance de décimation en m, nil = pleine résolution), maxSeg (longueur max de segment en m), emitChamfer (false pour omettre les chanfreins), potholes (true pour creuser les nids-de-poule).
---@param jLo integer|nil Première station du chunk.
---@param jHi integer|nil Dernière station du chunk.
---@param isFirst boolean|nil Chunk de début de route (déduit du code).
---@param isLast boolean|nil Chunk de fin de route (déduit du code).
---@param cutArcs number[]|nil Positions d'arc (m) des coupures de chunk.
---@return table|nil  Liste de parts (matériau, sommets, faces), ou nil si la géométrie est insuffisante.
function editor_heroRoadEditor_mesh.buildExportParts(group, opts, jLo, jHi, isFirst, isLast, cutArcs) end

--- Reconstruction LÉGÈRE des seuls bords supérieurs extérieurs (group.meshEdgeL/R) pendant un glissement, quand grille, collision et décalques sont démontés. Réutilise profile.build et worldStation sur les deux points extrêmes de la coupe, avec la même extension de fin : le ruban suit exactement le bord que le maillage complet aura. Met aussi à jour group.divBankR (axe droit incliné, pour la carte de chaleur). Efface les bords si la géométrie est insuffisante.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:1033
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_mesh.buildRibbonEdges(group) end

--- Construit des repères de bord PLATS (relevés à l'horizontale) pour une route en mode terrain : group.meshEdgeL/R décalés de leftExtM/rightExtM (défaut 4.0 m) le long du binormal, meshEdgeDirL/R, meshEdgeUp = (0,0,1), et met meshGrid à nil (pas de grille de chaussée en mode terrain).
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:1068
---@param group table Groupe Hero Road (divPoints, binormals).
function editor_heroRoadEditor_mesh.buildTerrainEdges(group) end

--- Nombre de chunks DAE qu'un bake produira pour une longueur d'arc totale et une longueur de chunk données (reflète le baker). L'interface doit passer la même longueur d'arc que le bake (group.meshVArc[fin]).
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:810
---@param total number Longueur d'arc totale en mètres.
---@param chunkLenM number|nil Longueur de chunk en mètres (min 20, défaut 120).
---@return integer  Nombre de chunks (au moins 1).
function editor_heroRoadEditor_mesh.chunkCount(total, chunkLenM) end

--- Calcule, pour le panneau Export, le nombre de triangles de la route entière pour chaque LOD visible. Le résultat est mis en cache par groupe (signature des paramètres de LOD, de résolution, de géométrie et des nids-de-poule) et les champs dérivés du groupe écrasés par l'assemblage sont restaurés ensuite. Écrit aussi group.lodMaxEdgeM.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:924
---@param group table Groupe Hero Road.
---@return table  { lods = { {size, tris, kept}, ... }, nullSize = number|nil } ; kept indique si le niveau est conservé au bake.
function editor_heroRoadEditor_mesh.lodPreview(group) end

--- Supprime les ProceduralMesh du groupe : celui hérité sans suffixe ('HeroRoad_<id>') et chaque chunk 'HeroRoad_<id>_<n>' jusqu'au premier trou.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:68
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_mesh.removeMesh(group) end

--- Reconstruit le maillage LOD0 (niveau proche) vivant du groupe : supprime l'ancien, assemble la géométrie, la découpe en chunks, crée un ProceduralMesh avec collision par chunk dans le dossier de scène du groupe et remplit group.meshIds / group.meshId. Appelé par le pipeline de reconstruction à chaque modification ; ne fait rien sans dossier de scène (sceneTreeFolderId).
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:1098
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_mesh.updateMesh(group) end

