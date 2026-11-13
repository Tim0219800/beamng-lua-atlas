---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire central des « groupes » (routes) du Hero Road Editor. Un groupe est une table Lua décrivant une route : nœuds/largeurs/normales, profil en travers, matériaux, calques de marquage, éléments posés (passages piétons, réparations, nids-de-poule, élargissements, carrefours, barrières), peinture de groundmodel et état Edit/Live. Le module crée, copie, découpe, joint, sérialise et supprime les groupes, applique des préréglages de profil, tient les fonctions d'annulation/rétablissement et pilote la reconstruction : updateDirtyGroups rééchantillonne la ligne centrale puis appelle mesh, sidewalkMgr, barrierMgr et layerMgr dans le bon ordre.
--- Accès : extension `editor_heroRoadEditor_groupMgr` : `extensions.load("editor_heroRoadEditor_groupMgr")`, puis la globale `editor_heroRoadEditor_groupMgr`
---@class editor_heroRoadEditor_groupMgr
---@field defaultCrossingDepthM number Profondeur par défaut (m) d'un nouveau passage piéton : 3.5.
---@field defaultPotholeRadiusM number Rayon par défaut (m) d'un nouveau nid-de-poule : 2.0.
---@field defaultRepairLengthM number Longueur par défaut (m) d'un nouvel amas de réparations : 8.0.
editor_heroRoadEditor_groupMgr = {}

--- Ajoute un segment de barrière posable (glissière, jersey ou plastique) sur un côté, sur une fenêtre de longueur, à l'abscisse t01 ; le mobilier est posé par barrierMgr après la reconstruction.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1218
---@param group table Groupe Hero Road.
---@param t01 number|nil Abscisse normalisée (défaut 0.5).
---@return table|nil  La barrière créée (side, lengthM, offsetM, zOffsetM, type).
function editor_heroRoadEditor_groupMgr.addBarrier(group, t01) end

--- Ajoute un passage piéton à l'abscisse t01 ({ id, name, t, depthM 3.5, lateral 'carriageway' }) et marque sale.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1097
---@param group table Groupe Hero Road.
---@param t01 number|nil Abscisse normalisée (défaut 0.5).
---@return table|nil  Le passage créé.
function editor_heroRoadEditor_groupMgr.addCrossing(group, t01) end

--- Ajoute un groupe existant au tableau, avec un nom unique ; crée son dossier SimGroup s'il manque et règle son canSave (true si group.isEnabled == false).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:112
---@param group table Groupe à ajouter.
function editor_heroRoadEditor_groupMgr.addGroupToGroupArray(group) end

--- Ajoute un carrefour (évasement en entonnoir d'un côté, cette route étant le tronc) à l'abscisse t01, avec options giveWay, exitCenterline et breakEdge.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1246
---@param group table Groupe Hero Road.
---@param t01 number|nil Abscisse normalisée (défaut 0.5).
---@return table|nil  Le carrefour créé (flareM, lengthM, bevelM, side...).
function editor_heroRoadEditor_groupMgr.addJunction(group, t01) end

--- Crée un nouveau groupe avec tous les paramètres par défaut (voir notes), son dossier de scène transitoire et ses calques automatiques, l'ajoute à la liste et met à jour la carte des ids. Ne renvoie rien : le groupe se retrouve avec getGroups()[#getGroups()].
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:557
---@param name string|nil Nom de base ; défaut 'Hero Road N'. Rendu unique par util.generateUniqueName.
function editor_heroRoadEditor_groupMgr.addNewGroup(name) end

--- Ajoute un nid-de-poule procédural (creusé dans le maillage) à l'abscisse t01 ; l'étendue de recalage vaut environ le diamètre.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1154
---@param group table Groupe Hero Road.
---@param t01 number|nil Abscisse normalisée (défaut 0.5).
---@return table|nil  Le nid-de-poule créé (lateralM, lengthM, widthM, depthM, noise, cutMarkings, seed).
function editor_heroRoadEditor_groupMgr.addPothole(group, t01) end

--- Ajoute un amas de réparations (dispersion de décalques d'asphalte, graine aléatoire) à l'abscisse t01 et marque sale.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1122
---@param group table Groupe Hero Road.
---@param t01 number|nil Abscisse normalisée (défaut 0.5).
---@return table|nil  L'amas créé.
function editor_heroRoadEditor_groupMgr.addRepair(group, t01) end

--- Ajoute un élargissement plat d'un côté (layby, voie de dépassement) à l'abscisse t01, avec tapers d'entrée et de sortie lissés.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1183
---@param group table Groupe Hero Road.
---@param t01 number|nil Abscisse normalisée (défaut 0.5).
---@return table|nil  L'élargissement créé (side, widthM, bayLenM, taperInM, taperOutM, edgeBulge, laneDivider).
function editor_heroRoadEditor_groupMgr.addWidening(group, t01) end

--- Applique un préréglage de profil au groupe (copie tous ses champs, resynchronise la largeur, marque sale). Ne fait rien si la clé est inconnue.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:219
---@param group table Groupe Hero Road.
---@param key string 'highway', 'city', 'country', 'ledge', 'rally', 'race', 'speedway' ou 'valley'.
function editor_heroRoadEditor_groupMgr.applyProfilePreset(group, key) end

--- Valeurs par défaut d'une nouvelle barrière.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1212
---@return table  { lengthM = 30.0, offsetM = 0.5, zOffsetM = 0.0, side = 'right', type = 'guardrail' }.
function editor_heroRoadEditor_groupMgr.barrierDefaults() end

--- Étendue le long de la route (m) d'un segment de barrière, c'est-à-dire sa longueur ; sert à le tenir à l'écart des extrémités.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1215
---@param b table Barrière.
---@return number  lengthM ou 30.0 par défaut.
function editor_heroRoadEditor_groupMgr.barrierExtent(b) end

--- Borne une abscisse normalisée pour que la bande (plus 0.5 m de dégagement) reste à l'écart des deux extrémités ; sur une route trop courte, renvoie 0.5.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1023
---@param group table Groupe Hero Road.
---@param t01 number Abscisse normalisée.
---@param depthM number|nil Étendue le long de la route (défaut 3.5 m).
---@return number  t01 borné.
function editor_heroRoadEditor_groupMgr.clampCrossingT(group, t01, depthM) end

--- Masque pendant un glissement : supprime maillage, trottoirs, mobilier et décalques du groupe (les définitions de calques sont gardées) et recharge la collision si un maillage existait.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:264
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_groupMgr.clearGroupVisuals(group) end

--- « Drape to Terrain » ponctuel : met la hauteur z de chaque nœud à celle du terrain (core_terrain.getTerrainHeight) et marque sale.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:228
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_groupMgr.conformGroupToTerrain(group) end

--- Convertit des chemins tracés depuis une image (bitmap du terrain) en groupes Hero Road : points de grille convertis en coordonnées monde, normales prises sur le terrain.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1370
---@param paths table[] Chemins { points = {{x, y}, ...}, widths = {...} } en coordonnées de grille du terrain.
function editor_heroRoadEditor_groupMgr.convertPathsToRoadGroups(paths) end

--- Copie le profil de calques d'un groupe : calques non automatiques (sérialisés) et les drapeaux/paramètres de marquage, de bords et de coupe (voies, bombé, accotement, etc.).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:784
---@param sourceGroup table Groupe source.
---@return table  Profil copié, à passer à pasteGroupProfile.
function editor_heroRoadEditor_groupMgr.copyGroupProfile(sourceGroup) end

--- Repère monde d'un passage piéton à l'abscisse normalisée t01 : centre et extrémités des bords de chaussée (p0 gauche, p1 droite). Pilote le fantôme de placement, les poignées et la bande zébrée. nil si la géométrie n'est pas prête.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1067
---@param group table Groupe Hero Road.
---@param t01 number Abscisse normalisée 0..1.
---@return vec3|nil  Centre.
---@return vec3|nil  Bord gauche.
---@return vec3|nil  Bord droit.
function editor_heroRoadEditor_groupMgr.crossingFrame(group, t01) end

--- Copie profonde de l'état de tous les groupes.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1287
---@return table[]  Liste de copies.
function editor_heroRoadEditor_groupMgr.deepCopyAllGroups() end

--- Copie profonde d'un groupe via string.buffer (encode/decode), avec les tableaux dérivés (divPoints, divWidths, tangents, binormals, normals, discMap) vidés. Sert aux instantanés d'annulation.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1275
---@param group table Groupe à copier.
---@return table  Copie indépendante.
function editor_heroRoadEditor_groupMgr.deepCopyGroup(group) end

--- Désérialise un groupe depuis un blob string.buffer ou une table JSON de session : complète les champs manquants par des valeurs par défaut (anciennes sauvegardes), réhydrate les calques, convertit nœuds/normales en vec3 et marque sale.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1417
---@param data string|table Blob encodé ou table brute.
---@param isCreateObject boolean|nil Indicateur transmis par l'appelant (déduit du code).
---@return table  Le groupe reconstitué.
function editor_heroRoadEditor_groupMgr.deserializeGroup(data, isCreateObject) end

--- Désérialisation au chargement d'une session : si la route est cuite mais que ses fichiers .dae ont disparu, elle est rechargée en mode éditable (isEnabled = true, bakedManifest effacé).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1607
---@param gt table Table de groupe lue du fichier de session.
---@return table  Le groupe reconstitué.
function editor_heroRoadEditor_groupMgr.deserializeSessionGroup(gt) end

--- Aligne le tableau clairsemé group.corners (surcharges par virage, false = auto) sur le nombre de nœuds : complète avec false et tronque l'excédent.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:187
---@param group table Groupe Hero Road.
---@return table  Le tableau group.corners.
function editor_heroRoadEditor_groupMgr.ensureCornerArray(group) end

--- Liste des routes activées (Edit) sous forme { name, id, type = 'Hero Road' }.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1796
---@return table[]  Entrées { name, id, type }.
function editor_heroRoadEditor_groupMgr.getCurrentRoadSplineList() end

--- Clé du mode d'édition de l'outil : 'heroRoadEditor'.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:109
---@return string  Clé.
function editor_heroRoadEditor_groupMgr.getEditModeKey() end

--- Tableau courant de tous les groupes (références vivantes, pas une copie).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:100
---@return table[]  Liste des groupes.
function editor_heroRoadEditor_groupMgr.getGroups() end

--- Table id de groupe vers indice dans getGroups().
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:103
---@return table<string, integer>  Carte id vers indice.
function editor_heroRoadEditor_groupMgr.getIdToIdxMap() end

--- Préfixe de nom de l'outil : 'Hero Road'.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:106
---@return string  Préfixe.
function editor_heroRoadEditor_groupMgr.getToolPrefixStr() end

--- Indique si le profil est à sens unique (un côté a zéro voie).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:197
---@param group table Groupe Hero Road.
---@return boolean  true si lanesLeft ou lanesRight vaut 0.
function editor_heroRoadEditor_groupMgr.isOneWayProfile(group) end

--- Joint deux routes ouvertes en une : modifie le groupe 1 avec la géométrie jointe (geom.joinSplineGeometry), supprime le groupe 2 et efface la baseline de terraform. Ne fait rien si les indices sont invalides.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1340
---@param groupIdx1 integer Indice du groupe conservé.
---@param nodeIdx1 integer Nœud d'extrémité du groupe 1.
---@param groupIdx2 integer Indice du groupe supprimé.
---@param nodeIdx2 integer Nœud d'extrémité du groupe 2.
function editor_heroRoadEditor_groupMgr.joinRoadSplines(groupIdx1, nodeIdx1, groupIdx2, nodeIdx2) end

--- Valeurs par défaut d'un nouveau carrefour (aussi valeurs de remise à zéro des curseurs).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:93
---@return table  { flareM = 4.0, lengthM = 8.0, bevelM = 2.5 }.
function editor_heroRoadEditor_groupMgr.junctionDefaults() end

--- Étendue totale (m) d'un carrefour : biseau proche + gorge + biseau lointain (2*bevelM + lengthM). Sert au recalage et au maillage via la correspondance avec l'élargissement.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:97
---@param j table Carrefour.
---@return number  Mètres.
function editor_heroRoadEditor_groupMgr.junctionExtent(j) end

--- Colle un profil sur un groupe : supprime ses calques, reprend ceux du profil et les paramètres (les valeurs absentes gardent celles de la cible ou des défauts), marque sale et recrée les calques automatiques.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:898
---@param targetGroup table Groupe cible.
---@param profile table Profil renvoyé par copyGroupProfile.
function editor_heroRoadEditor_groupMgr.pasteGroupProfile(targetGroup, profile) end

--- Reconstruction légère pour la peinture de groundmodel : refait le maillage (mesh.updateMesh) et recharge la collision. Ne fait rien si la route est désactivée, de type terrain, sans aperçu ou a moins de 2 nœuds.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:532
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_groupMgr.rebuildSurfaceOnly(group) end

--- Recalcule la carte id vers indice (appelé par l'aide de session après un chargement).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1615
function editor_heroRoadEditor_groupMgr.recomputeIdMap() end

--- Supprime tous les calques automatiques (cachés) puis recrée ceux dont le drapeau est actif (traces de pneus, réparations, asphalte endommagé, fissures, patchs, ligne centrale, lignes de rive/voie, fondus de bord), et marque le groupe sale.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:239
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_groupMgr.recreateAutoGeneratedLayers(group) end

--- Supprime tous les groupes (isIncludeDisabled = true) ou seulement les groupes activés (Edit) sinon.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:167
---@param isIncludeDisabled boolean true pour inclure les routes désactivées/cuites.
function editor_heroRoadEditor_groupMgr.removeAllGroups(isIncludeDisabled) end

--- Supprime la barrière d'indice idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1238
---@param group table Groupe Hero Road.
---@param idx integer Indice.
function editor_heroRoadEditor_groupMgr.removeBarrier(group, idx) end

--- Supprime le passage piéton d'indice idx et marque le groupe sale.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1113
---@param group table Groupe Hero Road.
---@param idx integer Indice.
function editor_heroRoadEditor_groupMgr.removeCrossing(group, idx) end

--- Supprime le groupe d'indice idx : restaure la peinture terrain, annule le terraform, supprime calques, maillage, trottoirs, mobilier et dossier de scène, puis recalcule la carte des ids.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:135
---@param idx integer Indice dans getGroups().
function editor_heroRoadEditor_groupMgr.removeGroup(idx) end

--- Supprime le carrefour d'indice idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1268
---@param group table Groupe Hero Road.
---@param idx integer Indice.
function editor_heroRoadEditor_groupMgr.removeJunction(group, idx) end

--- Supprime un groupe d'après son id (appelé depuis la suppression d'un calque de spline maître).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:159
---@param splineId string Id (uuid) du groupe.
function editor_heroRoadEditor_groupMgr.removeLinkedRoadSpline(splineId) end

--- Supprime le nid-de-poule d'indice idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1175
---@param group table Groupe Hero Road.
---@param idx integer Indice.
function editor_heroRoadEditor_groupMgr.removePothole(group, idx) end

--- Supprime l'amas de réparations d'indice idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1145
---@param group table Groupe Hero Road.
---@param idx integer Indice.
function editor_heroRoadEditor_groupMgr.removeRepair(group, idx) end

--- Supprime l'élargissement d'indice idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1205
---@param group table Groupe Hero Road.
---@param idx integer Indice.
function editor_heroRoadEditor_groupMgr.removeWidening(group, idx) end

--- Sérialise un groupe en blob string.buffer après avoir vidé ses tableaux dérivés (modifie le groupe réel).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1404
---@param group table Groupe à sérialiser.
---@return string  Blob encodé.
function editor_heroRoadEditor_groupMgr.serializeGroup(group) end

--- Un groupe sous forme de table simple et portable pour le fichier de session : copie par le codec, sans clés d'exécution, calques réduits à leurs données d'auteur.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1583
---@param group table Groupe à exporter.
---@return table  Table exportable (JSON).
function editor_heroRoadEditor_groupMgr.serializeGroupToTable(group) end

--- Fixe la même largeur à tous les nœuds du groupe et le marque sale. Écrasée par syncProfileWidth à la reconstruction suivante (le profil de voies fait autorité).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:539
---@param group table Groupe Hero Road.
---@param width number Largeur en mètres.
function editor_heroRoadEditor_groupMgr.setFixedWidth(group, width) end

--- Fixe le nombre de voies par côté (et optionnellement leur largeur), recalcule la largeur de chaussée et marque le groupe sale.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:547
---@param group table Groupe Hero Road.
---@param lanesLeft integer Voies à gauche.
---@param lanesRight integer Voies à droite.
---@param laneWidthM number|nil Largeur de voie en mètres (min 1.5).
function editor_heroRoadEditor_groupMgr.setLaneProfile(group, lanesLeft, lanesRight, laneWidthM) end

--- Rétablit une modification d'un seul groupe : applique l'état data.new.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1774
---@param data table Données d'historique { old, new }.
function editor_heroRoadEditor_groupMgr.singleGroupEditRedo(data) end

--- Annule une modification d'un seul groupe : restaure l'état data.old (calques, paramètres, éléments posés) dans le groupe de même id.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1772
---@param data table Données d'historique { old, new }.
function editor_heroRoadEditor_groupMgr.singleGroupEditUndo(data) end

--- Coupe une route au nœud sélectionné. Boucle : devient une route ouverte réordonnée. Sinon : crée deux nouveaux groupes '(1)' et '(2)' (nouveaux ids, surcharges de virages conservées, baseline de terraform effacée) et supprime l'ancien.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1296
---@param group table Groupe à couper.
---@param groupIdx integer Indice du groupe dans getGroups().
---@param selectedNodeIdx integer Indice du nœud de coupure.
function editor_heroRoadEditor_groupMgr.splitGroup(group, groupIdx, selectedNodeIdx) end

--- Dérive la largeur de chaussée du profil de voies : normalise lanesLeft/lanesRight (entiers >= 0, au moins 1 voie au total), borne laneWidthM à 1.5 m minimum, fixe leftExtM/rightExtM et la largeur de chaque nœud.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:204
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_groupMgr.syncProfileWidth(group) end

--- Abscisse normalisée d'un point monde projeté (en plan) sur la ligne centrale, recalée loin des extrémités. Utilisé lors du glissement d'une poignée. nil si la route n'a pas de ruban.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1059
---@param group table Groupe Hero Road.
---@param p vec3 Point monde.
---@param depthM number|nil Étendue le long de la route servant au recalage.
---@return number|nil  t01 ou nil.
function editor_heroRoadEditor_groupMgr.tForPointOnGroup(group, p, depthM) end

--- Rétablit une modification multi-groupes (état groupsData.new).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1793
---@param groupsData table Données d'historique { old, new }.
function editor_heroRoadEditor_groupMgr.transGroupEditRedo(groupsData) end

--- Annule une modification touchant plusieurs groupes : supprime tous les groupes et restaure les copies de groupsData.old, toutes marquées sales.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1791
---@param groupsData table Données d'historique { old, new } (listes de groupes).
function editor_heroRoadEditor_groupMgr.transGroupEditUndo(groupsData) end

--- Reconstruit chaque groupe marqué isDirty (et les calques sales des autres), puis marque la session éditée. Gère routes désactivées/cuites, groupes à moins de 2 nœuds (tout nettoyer), routes mesh, routes terrain, glissement et aperçu désactivé. Appelé à chaque frame par l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:402
---@param dragging boolean true pendant le glissement d'un nœud/gizmo : seuls les bords de ruban sont reconstruits.
function editor_heroRoadEditor_groupMgr.updateDirtyGroups(dragging) end

--- Valeurs par défaut d'un nouvel élargissement (aussi valeurs de remise à zéro des curseurs).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:87
---@return table  { widthM = 3.0, bayLenM = 30.0, taperInM = 40.0, taperOutM = 25.0 }.
function editor_heroRoadEditor_groupMgr.wideningDefaults() end

--- Étendue totale (m) le long de la route d'un élargissement : taper d'entrée + baie + taper de sortie.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:90
---@param w table Élargissement.
---@return number  Mètres.
function editor_heroRoadEditor_groupMgr.wideningExtent(w) end

