---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/junctions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des jonctions de l'éditeur Road Architect : passage piéton, carrefour en croix, T, Y, rond-point, transitions rural/urbain et autoroute/urbain, fusions, séparateurs, fondu de bande d'arrêt d'urgence et bretelle d'autoroute. Une jonction est un enregistrement (nom, type, paramètres ImGui im.FloatPtr/IntPtr/BoolPtr, liste de noms de routes) dont les routes sont générées dans roadMgr (editor/roadArchitect/roads) à partir de profils. Le module permet aussi de déplacer/tourner/copier/sauvegarder/charger une jonction, de la finaliser (elle devient des routes ordinaires) et d'importer un réseau routier issu de l'outil L-System. Réservé à l'éditeur (GE).
--- Accès : extension `editor_roadArchitect_junctions` : `extensions.load("editor_roadArchitect_junctions")`, puis la globale `editor_roadArchitect_junctions`
---@class editor_roadArchitect_junctions
---@field junctions table<integer, table> Liste des jonctions de la session d'édition (même table que celle utilisée en interne : les modifications sont visibles des deux côtés). Chaque élément contient au minimum name, type, roads (noms de routes) et les paramètres de condition (condition, conditionSeed, numPatches, numPotholes).
editor_roadArchitect_junctions = {}

--- Ajoute un carrefour à 4 branches, type 'crossroads'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8381
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addCrossroads(isNew) end

--- Ajoute une fusion d'autoroute (par exemple 2 voies vers 1, 3 vers 2...), type 'highway_merge'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9056
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addHighwayMergeJunction(isNew) end

--- Ajoute un séparateur d'autoroute : scinde une autoroute à double sens en deux sections à sens unique pour les relier séparément, type 'highway_separator'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9246
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addHighwaySeparatorJunction(isNew) end

--- Ajoute une bretelle d'autoroute (slip), type 'highway_slip'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9429
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addHighwaySlipJunction(isNew) end

--- Ajoute une transition autoroute / urbain (réduit le terre-plein central jusqu'à une simple ligne centrale), type 'highway_urban_transition'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9155
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addHighwayUrbanTransJunction(isNew) end

--- Ajoute une jonction de passage piéton à 2 sens (passage + feux de signalisation seulement), type 'crossing'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8280
---@param isNew boolean true : crée un nouvel enregistrement par défaut ; false : réutilise la dernière jonction de la liste.
function editor_roadArchitect_junctions.addPedXJunction(isNew) end

--- Ajoute un rond-point à 4 branches, type 'roundabout'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8684
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addRoundaboutJunction(isNew) end

--- Ajoute une transition urbain (avec trottoirs) / rural (sans trottoirs), type 'rural_urban_transition'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8785
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addRuralUrbanTransJunction(isNew) end

--- Ajoute un fondu de bande d'arrêt d'urgence : la bande d'arrêt d'une autoroute à sens unique s'efface pour devenir une route rurale à sens unique, type 'shoulder_fade'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9330
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addShoulderFadeJunction(isNew) end

--- Ajoute une jonction en T à 3 branches, type 't-junction'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8482
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addTJunction(isNew) end

--- Ajoute une fusion urbaine (par exemple 2 voies vers 1, 3 vers 2...), type 'urban_merge'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8869
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addUrbanMergeJunction(isNew) end

--- Ajoute un séparateur urbain, type 'urban_separator'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8970
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addUrbanSeparatorJunction(isNew) end

--- Ajoute une jonction en Y à 3 branches inclinées, type 'y-junction'.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8583
---@param isNew boolean true : nouvel enregistrement par défaut ; false : réutilise la dernière jonction.
function editor_roadArchitect_junctions.addYJunction(isNew) end

--- Pour chaque route listée, supprime les nœuds situés à l'intérieur de la sphère (cercle en 2D) et projette le premier ou dernier nœud sur le cercle, selon que la route touche la jonction par son début ('start') ou sa fin.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:10076
---@param jNodes table<integer, {rName: string, lie: string}> Extrémités de routes concernées : rName = nom de la route, lie = 'start' ou 'end'.
---@param jCen vec3 Centre de la sphère.
---@param jRad number Rayon, en mètres.
function editor_roadArchitect_junctions.chopRoadsToSphere(jNodes, jCen, jRad) end

--- Tente de supprimer toutes les jonctions en appelant removeJunction(i) dans une boucle croissante. Voir notes : la boucle modifie la liste pendant le parcours.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9537
function editor_roadArchitect_junctions.clearAllJunctions() end

--- Calcule l'angle de rotation autour de l'axe Z de la jonction à partir de la direction de ses routes, par rapport à l'axe X (util.getRotationBetweenVecs). Dépend du type de jonction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:97
---@param jIdx integer Indice dans junctions.
---@return any  Rotation renvoyée par util.getRotationBetweenVecs (nil pour un type non géré).
function editor_roadArchitect_junctions.computeInitRot(jIdx) end

--- Copie en profondeur une jonction (nouveaux pointeurs ImGui, liste des routes dupliquée avec deepcopy).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9672
---@param jct table Enregistrement de jonction à copier.
---@return table  Nouvel enregistrement indépendant.
function editor_roadArchitect_junctions.copyJunction(jct) end

--- Crée automatiquement des routes overlay entre les routes qui arrivent à une même jonction (par paire, selon les cas start/end), à partir des données de rendu des routes. Aucun commentaire dans le code ; description déduite du code.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:10146
---@param jNodes table<integer, {rName: string, lie: string}> Extrémités de routes de la jonction (rName, lie = 'start' ou 'end').
---@param laneWidth number Largeur de voie, en mètres (déduit du code).
---@param jctCen vec3 Centre de la jonction (sa hauteur z est utilisée).
function editor_roadArchitect_junctions.createAutoJctOverlays(jNodes, laneWidth, jctCen) end

--- Opération inverse de serialiseJct : reconstruit un enregistrement de jonction avec ses pointeurs ImGui à partir d'une table lue depuis le JSON ; certaines valeurs absentes reçoivent un défaut (par exemple arrowMat).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9788
---@param jSer table Table sérialisée.
---@return table  Enregistrement de jonction utilisable dans junctions.
function editor_roadArchitect_junctions.deserialiseJct(jSer) end

--- Finalise la jonction : renomme ses routes (nom de la jonction + ' R' + n, ou 'Overlay n' pour les overlays), les marque comme routes normales (isJctRoad = false), puis retire la jonction de la liste. Les routes restent dans l'éditeur.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9651
---@param jIdx integer Indice dans junctions.
function editor_roadArchitect_junctions.finaliseJunction(jIdx) end

--- Calcule le centre de la jonction d'indice jIdx. Le calcul dépend du type : milieu entre un nœud de deux routes (crossing, crossroads, t, y, roundabout, merges, slip), entre début et fin de la 3e route (transitions), dernier nœud de la 1re route (séparateurs), ou milieu entre extrémités de deux routes (shoulder_fade, selon isY1Outwards). Renvoie nil pour un type non géré.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:65
---@param jIdx integer Indice dans junctions.
---@return vec3|nil  Position du centre de la jonction.
function editor_roadArchitect_junctions.getJunctionCentroid(jIdx) end

--- Place la caméra libre au-dessus de la jonction, regardant vers le bas, à une hauteur qui fait entrer toute la jonction dans le champ de vision (calcul avec le FOV de core_camera). Ne fait rien si la boîte englobante est inférieure à 0,1 m.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9588
---@param jIdx integer Indice dans junctions.
function editor_roadArchitect_junctions.goToJunction(jIdx) end

--- Importe un réseau routier issu de l'outil L-System : crée une route Road Architect par route unique (profil 1 voie par sens, largeur de l'import), puis pour chaque intersection coupe les routes à la sphère du rayon donné et crée les overlays de jonction. Si doTerraform est vrai, terraforme ensuite le terrain sous tout le réseau.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:10329
---@param roadNetwork table Routes uniques indexées ; chaque élément a id, type, width, splineNodes (avec pos) et nodes (avec id).
---@param intersections table Intersections indexées par id de nœud ; chaque élément a connectedRoads, radius et pos.
---@param DOI number Paramètre transmis à terra.terraformMultiRoads (domaine d'influence, déduit du code).
---@param margin number Marge transmise à terra.terraformMultiRoads.
---@param doTerraform boolean true pour terraformer le terrain après l'import.
function editor_roadArchitect_junctions.importRoadsFromLSystem(roadNetwork, intersections, DOI, margin, doTerraform) end

--- Ouvre la boîte de dialogue d'ouverture (editor_fileDialog), lit le JSON, désérialise la jonction, l'ajoute à la liste puis régénère ses routes avec la fonction addXxx(false) correspondant à son type.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9861
function editor_roadArchitect_junctions.loadJunction() end

--- Supprime les routes de la jonction (roadMgr.removeRoad) puis l'entrée de la liste junctions.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9528
---@param jIdx integer Indice dans junctions.
function editor_roadArchitect_junctions.removeJunction(jIdx) end

--- Fait tourner la jonction autour de l'axe Z passant par cen, de l'angle theta ; la hauteur z des nœuds est conservée.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9557
---@param jIdx integer Indice dans junctions.
---@param cen vec3 Centre de rotation.
---@param theta number Angle en radians.
function editor_roadArchitect_junctions.rotateJunction(jIdx, cen, theta) end

--- Fait tourner tous les nœuds de la jonction autour de cen selon le quaternion q (util.rotateVecByQuaternion).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9575
---@param jIdx integer Indice dans junctions.
---@param cen vec3 Centre de rotation.
---@param q quat Rotation à appliquer.
function editor_roadArchitect_junctions.rotateJunctionQuat(jIdx, cen, q) end

--- Ouvre la boîte de dialogue d'enregistrement (editor_fileDialog) puis écrit un JSON contenant la jonction sérialisée (nom = nom du fichier), sa position (centroïde) et sa rotation initiale.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9846
---@param jIdx integer Indice dans junctions.
function editor_roadArchitect_junctions.saveJunction(jIdx) end

--- Convertit une jonction en table simple, sans pointeurs ImGui (valeurs lues avec [0], nom avec ffi.string), prête à être écrite en JSON. Note : la liste roads est partagée, pas copiée.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9730
---@param jct table Enregistrement de jonction.
---@return table  Table sérialisable.
function editor_roadArchitect_junctions.serialiseJct(jct) end

--- Destinée à faire utiliser (ou non) des meshes à toutes les routes de la jonction, mais le corps ne modifie rien (voir notes).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9629
---@param jIdx integer Indice dans junctions.
function editor_roadArchitect_junctions.setAllMeshProperty(jIdx) end

--- Translate tous les nœuds de toutes les routes de la jonction du vecteur donné et marque les routes comme modifiées (roadMgr.setDirty).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9544
---@param jIdx integer Indice dans junctions.
---@param offset vec3 Vecteur de translation, en mètres.
function editor_roadArchitect_junctions.translateJunction(jIdx, offset) end

--- Vide roadMgr.multi puis régénère les routes de la jonction selon son type après modification d'un paramètre, et réapplique la condition de la chaussée.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8244
---@param jIdx integer Indice dans junctions.
function editor_roadArchitect_junctions.updateJunctionAfterChange(jIdx) end

--- Propage l'état d'usure de la jonction (condition, graine, nombre de rustines et de nids-de-poule) à toutes ses routes non overlay, puis appelle profileMgr.updateCondition. Les rustines et nids-de-poule des routes valent 15 % (arrondi au supérieur) des valeurs de la jonction ; la graine est décalée d'un rang par route.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:152
---@param jct table Enregistrement de jonction.
function editor_roadArchitect_junctions.updateJunctionCondition(jct) end

--- Retire de la liste les jonctions dont au moins une route n'existe plus dans roadMgr. À appeler après la suppression d'une route.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9637
function editor_roadArchitect_junctions.updateJunctionsAfterRoadRemove() end

