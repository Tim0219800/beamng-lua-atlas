---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/roads.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Conteneur central du Road Architect : il stocke la liste des routes de la session (chaque route = nœuds, profil latéral, options d'affichage, pont, tunnels) et fournit toutes les opérations d'édition (ajout/suppression de nœuds, déplacement, hauteur, rotation latérale, découpe, retournement, copie, sérialisation). Il gère aussi le passage entre l'état « edit » et l'état « finalised » (création des maillages procéduraux, statiques, tunnels et décalcomanies). Un moddeur s'en sert pour créer ou manipuler des routes par script depuis l'éditeur ; les modules du Road Architect (geometry, profiles, decals, roadMesh…) lisent ses tables.
--- Accès : extension `editor_roadArchitect_roads` : `extensions.load("editor_roadArchitect_roads")`, puis la globale `editor_roadArchitect_roads`
---@class editor_roadArchitect_roads
---@field isAuditionProfileDirty boolean Copie initiale (false) du flag d'audition de profil ; voir notes, la valeur réelle n'est pas exposée.
---@field map table<string, integer> Table de hachage nom de route -> indice dans roads. Reconstruite par recomputeMap().
---@field multi table<integer, {r: integer, n: integer}> Multi-sélection de nœuds : chaque entrée donne l'indice de route (r) et de nœud (n).
---@field roads table<integer, table> Liste des routes de la session (même table que celle utilisée en interne : la modifier agit directement).
editor_roadArchitect_roads = {}

--- Ajoute un nœud entre le nœud sélectionné et son voisin (point milieu, valeurs moyennées). Aux extrémités de la route, copie le nœud et le place 3 m plus loin dans l'axe de la route.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:404
---@param rIdx integer Indice de la route.
---@param nIdx integer Indice du nœud sélectionné.
---@param lie string 'above' (avec le nœud précédent) ou 'below' (avec le nœud suivant).
function editor_roadArchitect_roads.addIntermediateNode(rIdx, nIdx, lie) end

--- Ajoute un nœud à la fin de la route, avec les largeurs/hauteurs par voie issues du profil. Marque la route dirty.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:191
---@param rIdx integer Indice de la route dans roads.
---@param pos vec3 Position monde du nœud.
function editor_roadArchitect_roads.addNodeToRoad(rIdx, pos) end

--- Insère un nœud à l'indice donné de la route. Marque la route dirty.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:210
---@param rIdx integer Indice de la route.
---@param pos vec3 Position monde.
---@param idx integer Indice d'insertion dans route.nodes (table.insert).
function editor_roadArchitect_roads.addNodeToRoadAtIdx(rIdx, pos, idx) end

--- Modifie la hauteur d'un nœud (bornée à ±1000 m) et propage la variation aux autres nœuds (rigide ou champ de force). Marque dirty.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:555
---@param hNew number Nouvelle hauteur du nœud central, en mètres.
---@param hOld number Ancienne hauteur (sert à calculer la variation dz).
---@param nIdx integer Indice du nœud central.
---@param rIdx integer Indice de la route.
function editor_roadArchitect_roads.adjustHeight(hNew, hOld, nIdx, rIdx) end

--- Modifie la rotation latérale (devers) d'un nœud et propage aux autres (bornée à ±50 degrés). Sans effet si le profil est en auto-banking.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:602
---@param rotNew number Nouvelle rotation du nœud central, en degrés.
---@param rotOld number Ancienne rotation.
---@param nIdx integer Indice du nœud central.
---@param rIdx integer Indice de la route.
function editor_roadArchitect_roads.adjustLateralRotation(rotNew, rotOld, nIdx, rIdx) end

--- Supprime toutes les routes qui ne sont pas des routes de jonction (isJctRoad).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:452
function editor_roadArchitect_roads.clearAllRoads() end

--- Vide la table des ponts du module roadMesh (sans supprimer les objets de scène).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:910
function editor_roadArchitect_roads.clearBridges() end

--- Boîte englobante 2D des nœuds d'une route. Renvoie nil pour un pont ou un overlay. (Le commentaire annonce que la largeur du profil est incluse, mais le code ne prend en compte que les nœuds.)
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:314
---@param rIdx integer Indice de la route.
---@return table|nil  {xMin, xMax, yMin, yMax} ou nil.
function editor_roadArchitect_roads.computeAABB2D(rIdx) end

--- Recalcule le renderData de toutes les routes à 2 nœuds ou plus (via geometry).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1115
function editor_roadArchitect_roads.computeAllRoadRenderData() end

--- Calcule la boîte englobante 2D alignée sur les axes des nœuds d'une route (utilisée uniquement par l'arbre d'accélération).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:137
---@param r table Route.
---@return number  xMin
---@return number  xMax
---@return number  yMin
---@return number  yMax
function editor_roadArchitect_roads.computeRoadAABB_2D(r) end

--- Recalcule le renderData d'une seule route.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1126
---@param i integer Indice de la route.
function editor_roadArchitect_roads.computeRoadRenderDataSingle(i) end

--- Pour chaque DecalRoad sélectionné dans l'éditeur, crée une route Road Architect (nœuds re-paramétrés, profil selon lanesLeft/lanesRight) et l'ajoute à roads. Voir notes : les DecalRoad ne sont pas supprimés.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1213
function editor_roadArchitect_roads.convertDecalRoads2RoadArchitect() end

--- Copie profonde d'un nœud (nouveaux pointeurs ImGui et nouveau vec3).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:285
---@param n table Nœud.
---@return table  Copie du nœud.
function editor_roadArchitect_roads.copyNode(n) end

--- Copie profonde d'une route (nœuds, profil, options, paramètres de pont/tunnel). Le nom est conservé identique, renderData est vidé, tunnels est vide et isDirty = true.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:663
---@param r table Route.
---@return table  Copie de la route.
function editor_roadArchitect_roads.copyRoad(r) end

--- Remplit roads.multi avec tous les nœuds de toutes les routes situés dans le polygone (en 2D).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1075
---@param gPolygon table<integer, vec3> Sommets du polygone de sélection.
function editor_roadArchitect_roads.createMultiSelect(gPolygon) end

--- Construit une nouvelle table route à partir d'un profil latéral (met à jour les drapeaux de voies du profil, calcule les clés de voies). La route n'a aucun nœud et n'est pas ajoutée à la liste.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:61
---@param profile table Profil latéral (voir editor/roadArchitect/profiles).
---@return table  La route créée (valeurs par défaut : visible, 15 divisions radiales de tunnel, pont de demi-largeur 5.5, profondeur 4, arche -6, etc.).
function editor_roadArchitect_roads.createRoadFromProfile(profile) end

--- Comme createRoadFromProfile, mais le profil est créé à partir du nom d'un modèle de profil (avec un identifiant généré par Engine.generateUUID()).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:129
---@param profileTemplateName string Nom du modèle de profil.
---@return table  La route créée.
function editor_roadArchitect_roads.createRoadFromTemplate(profileTemplateName) end

--- Reconstruit une route (avec pointeurs ImGui, isDirty = true) à partir d'une table sérialisée par serialiseRoad.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1505
---@param rSer table Route sérialisée.
---@return table  Route utilisable dans roads.
function editor_roadArchitect_roads.deserialiseRoad(rSer) end

--- Passe à l'état « finalised » : recalcule tous les renderData, crée un dossier de scène par route (« Road Architect - Road <i> »), génère les maillages de ponts puis de routes, les maillages statiques et les tunnels, recharge la collision (be:reloadCollision), pose les décalcomanies puis recharge le navgraph (map.reset()).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1270
function editor_roadArchitect_roads.finalise() end

--- Inverse le sens de la route (ordre des nœuds) et recalcule immédiatement son renderData. Utile pour corriger des imports.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:873
---@param rIdx integer Indice de la route.
function editor_roadArchitect_roads.flipRoad(rIdx) end

--- Renvoie le nom/identifiant de la carte (niveau) actuellement mémorisée par le module.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:55
---@return any  Valeur stockée par setCurrentMap (nil au départ).
function editor_roadArchitect_roads.getCurrentMap() end

--- Centre de la boîte englobante 3D des nœuds de la multi-sélection.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1100
---@return vec3  Centre (valeurs absurdes si la sélection est vide).
function editor_roadArchitect_roads.getMultiSelectionCentroid() end

--- Renvoie les routes (sans doublon) appartenant à un groupe placé ; si group est nil, renvoie toutes les routes de la session.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:330
---@param group table|nil Groupe avec group.list = liste d'entrées {r = nom de route, n = indice de nœud}.
---@return table  Liste de routes.
function editor_roadArchitect_roads.getRoadsFromGroup(group) end

--- Renvoie le quadtree 2D utilisé pour le culling de l'affichage en édition (nil s'il n'existe pas encore).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:182
---@return table|nil  Le quadtree.
function editor_roadArchitect_roads.getTree() end

--- Place la caméra libre à la verticale du centre de la route, à une hauteur qui cadre toute la route (selon le champ de vision). Ne fait rien si la route est trop petite (moins de 0.1 m d'étendue).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:478
---@param rIdx integer Indice de la route.
function editor_roadArchitect_roads.goToRoad(rIdx) end

--- Teste si la position de la souris est proche (tolérance 3.5 m en 2D) d'un segment de la route, entre deux nœuds, pour proposer l'insertion d'un nœud.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:230
---@param rIdx integer Indice de la route.
---@param mousePos vec3 Position de la souris sur la carte.
---@return boolean  true si la souris est sur un segment.
---@return vec3|nil  Position interpolée sur le segment.
---@return integer|nil  Indice du nœud qui suit le point trouvé.
function editor_roadArchitect_roads.isMouseAtIntermediatePos(rIdx, mousePos) end

--- Crée ou met à jour la route temporaire 'temp' (segment droit de 20 m à 1000 m d'altitude) qui montre le profil en cours d'édition, place la caméra libre dessus et la fait tourner autour. Appelée à chaque frame pendant l'audition.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:959
---@param pIdx integer Indice du profil dans profileMgr.profiles.
function editor_roadArchitect_roads.manageTempRoadSection(pIdx) end

--- Translate une route : soit rigide (tous les nœuds non verrouillés), soit en champ de force (le nœud central suit la souris, les autres bougent proportionnellement à la distance, jusqu'au premier nœud verrouillé). Marque la route dirty.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:515
---@param road table Route (table, pas un indice).
---@param nodeIdx integer Nœud saisi.
---@param mouseNow vec3 Position actuelle de la souris.
---@param mouseLast vec3 Position précédente.
function editor_roadArchitect_roads.moveRoad(road, nodeIdx, mouseNow, mouseLast) end

--- Ajoute un décalage vertical à tous les nœuds de toutes les routes et les marque dirty.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1257
---@param offset number Décalage en mètres (positif = vers le haut).
function editor_roadArchitect_roads.offsetByValue(offset) end

--- Active isConformRoadToTerrain sur toutes les routes (elles se posent sur le terrain) et les marque dirty.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1249
function editor_roadArchitect_roads.offsetRoads2Terrain() end

--- Reconstruit la table nom -> indice (roads.map). À appeler après toute insertion/suppression manuelle dans roads.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:353
function editor_roadArchitect_roads.recomputeMap() end

--- Supprime toutes les décalcomanies, maillages de routes, statiques, ponts et tunnels, puis vide roads et la map.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:913
function editor_roadArchitect_roads.removeAll() end

--- Retire un indice de groupe placé de la liste groupIdx de la route.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1129
---@param r table Route.
---@param groupIdx integer Indice de groupe à retirer.
function editor_roadArchitect_roads.removeGroupFromRoad(r, groupIdx) end

--- Supprime de roads toutes les routes masquées (isHidden) et leurs maillages, puis recalcule la map.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:462
function editor_roadArchitect_roads.removeHiddenRoads() end

--- Supprime un nœud d'une route (table.remove). Ne marque pas la route dirty.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:385
---@param rIdx integer Indice de la route.
---@param nIdx integer Indice du nœud.
function editor_roadArchitect_roads.removeNode(rIdx, nIdx) end

--- Supprime une route par son nom : retire décalcomanies, maillages de route et statiques, entrée du quadtree, dossier de pont éventuel, puis l'entrée de roads et reconstruit la map.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:362
---@param roadName string Nom (identifiant) de la route, pas son displayName.
function editor_roadArchitect_roads.removeRoad(roadName) end

--- Oublie le quadtree (il sera recréé au prochain setDirty).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:185
function editor_roadArchitect_roads.removeTree() end

--- Convertit une route en table simple (valeurs plain, sans pointeurs ImGui) pour la sauvegarde JSON.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1446
---@param r table Route.
---@return table  Route sérialisée.
function editor_roadArchitect_roads.serialiseRoad(r) end

--- Appelle setDirty sur toutes les routes.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:175
function editor_roadArchitect_roads.setAllDirty() end

--- Demande la reconstruction de la route temporaire d'audition de profil au prochain appel de manageTempRoadSection.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:188
function editor_roadArchitect_roads.setAuditionProfileDirty() end

--- Affiche ou masque tous les ponts.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1426
---@param isShow boolean true pour afficher.
function editor_roadArchitect_roads.setBridgesVisibilityMaster(isShow) end

--- Mémorise la carte (niveau) actuellement chargée.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:58
---@param cMap any Valeur à mémoriser (déduit du code).
function editor_roadArchitect_roads.setCurrentMap(cMap) end

--- Marque la route comme à recalculer (isDirty), met à jour la condition du profil et réinsère la route dans le quadtree d'édition (créé à la demande avec l'étendue du terrain, ou 5000 m par défaut).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:149
---@param r table|nil Route ; ne fait rien si nil.
function editor_roadArchitect_roads.setDirty(r) end

--- Modifie la largeur de toutes les voies de type 'road_lane' d'un nœud : nouvelle largeur = largeur de départ + offset, bornée à [0.5, 10].
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:260
---@param rIdx integer Indice de la route.
---@param nIdx integer Indice du nœud.
---@param offset number Variation de largeur de voie, en mètres.
function editor_roadArchitect_roads.setLocalWidth(rIdx, nIdx, offset) end

--- Affiche ou masque tous les overlays.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1436
---@param isShow boolean true pour afficher.
function editor_roadArchitect_roads.setOverlaysVisibilityMaster(isShow) end

--- Affiche ou masque toutes les routes ordinaires (ni ponts ni overlays) en remplaçant leur isVis.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1416
---@param isShow boolean true pour afficher.
function editor_roadArchitect_roads.setRoadsVisibilityMaster(isShow) end

--- Coupe une route au nœud donné en deux nouvelles routes ([A] et [B], chacune avec une copie du nœud de coupure repoussé de 1 m), supprime l'ancienne route et les ajoute à roads. Utile pour créer des jonctions.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:737
---@param rIdx integer Indice de la route.
---@param nIdx integer Indice du nœud de coupure ; doit avoir un voisin de chaque côté (le code lit nodes[nIdx-1] et nodes[nIdx+1]).
function editor_roadArchitect_roads.splitRoad(rIdx, nIdx) end

--- Quitte l'état « finalised » : supprime décalcomanies, maillages, statiques et tunnels générés par finalise et revient à l'édition.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1334
function editor_roadArchitect_roads.unfinalise() end

--- Applique la largeur et la profondeur de pont de la route aux deux premiers nœuds (voies -1 et 1). Voir notes : bug probable de pointeur.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1054
---@param road table Route de type pont.
function editor_roadArchitect_roads.updateBridgeParameters(road) end

--- Retire de roads.multi les entrées dont la route ou le nœud n'existe plus.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1202
function editor_roadArchitect_roads.updateMultiAfterRemove() end

--- Recalcule le renderData de chaque route dirty ayant au moins 2 nœuds ; pour les ponts, met à jour aussi le maillage de pont dans le dossier de scène « Road Architect - Bridge <nom> ». À appeler à chaque frame d'édition.
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:889
function editor_roadArchitect_roads.updateRoads() end

--- Reconstruit les groupIdx de toutes les routes à partir de la liste des groupes placés restants (renumérotation après suppression d'un groupe).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:1188
---@param placedGroups table Liste des groupes placés, chacun avec list = {{r = nom, n = indice}, ...}.
function editor_roadArchitect_roads.updateRoadsAfterRemovingGroup(placedGroups) end

--- Réinitialise les largeurs et hauteurs par voie de tous les nœuds de la route selon son profil actuel (après changement de profil).
---Source : lua/ge/extensions/editor/roadArchitect/roads.lua:304
---@param road table Route.
function editor_roadArchitect_roads.updateWAndHToNewProfile(road) end

