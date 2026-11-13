---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadSpline/groupMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des « groupes » de l'outil Road Spline : un groupe = une route (nœuds, largeurs, normales, couches, options de couches automatiques, peinture de terrain, verrouillage) avec son dossier SimGroup dans MissionGroup. Gère création/suppression, reconstruction des groupes sales (updateDirtyGroups : échantillonnage Catmull-Rom ou géométrie « engineered », points de côtes, puis couches), copie profonde, découpe/jointure, sérialisation (buffer ou table JSON de session), annulation/rétablissement et liaison avec la Master Spline. Un moddeur l'utilise pour créer ou modifier des routes par script.
--- Accès : extension `editor_roadSpline_groupMgr` : `extensions.load("editor_roadSpline_groupMgr")`, puis la globale `editor_roadSpline_groupMgr`
---@class editor_roadSpline_groupMgr
editor_roadSpline_groupMgr = {}

--- Ajoute un groupe déjà construit à la liste, avec un nom unique ; crée son dossier SimGroup (cansave = false) dans MissionGroup s'il n'existe pas encore.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:55
---@param group table Groupe à ajouter.
function editor_roadSpline_groupMgr.addGroupToGroupArray(group) end

--- Crée un nouveau groupe vide (nom unique, UUID, dossier SimGroup transitoire sous MissionGroup, couches automatiques initiales) et l'ajoute à la liste.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:281
---@param name string|nil Nom de base ; par défaut « Road Spline N ».
function editor_roadSpline_groupMgr.addNewGroup(name) end

--- Reprend les DecalRoads listés par release() (seulement ceux encore présents dans la scène) et fixe l'état de verrouillage appliqué.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:129
---@param group table Groupe recréé.
---@param ids table Valeur renvoyée par release().
function editor_roadSpline_groupMgr.adopt(group, ids) end

--- Convertit des tracés issus d'un bitmap en Road Splines : points de grille convertis en coordonnées monde via le terrain, normales prises sur le terrain ; un tracé dont la plus petite dimension est inférieure ou égale à 10 m n'est pas importé.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:567
---@param paths table[] Liste de {points = {{x=,y=},...}, widths = {...}} en coordonnées de grille.
function editor_roadSpline_groupMgr.convertPathsToRoadGroups(paths) end

--- Copie le « profil » d'un groupe : ses couches non cachées (serializeLayer, sans ids de scène) et ses options/réglages de couches automatiques (largeurs et décalages de lignes et fondus).
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:381
---@param sourceGroup table Groupe source.
---@return table  Profil prêt pour pasteGroupProfile ou JSON.
function editor_roadSpline_groupMgr.copyGroupProfile(sourceGroup) end

--- Copie profonde de tous les groupes (pour l'historique d'annulation).
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:483
---@return table[]  Liste de copies.
function editor_roadSpline_groupMgr.deepCopyAllGroups() end

--- Copie profonde d'un groupe via string.buffer ; vide la géométrie dérivée (divPoints, divWidths, tangents, binormals, normals, discMap, divCurv) qui sera recalculée.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:470
---@param group table Groupe.
---@return table  Copie indépendante.
function editor_roadSpline_groupMgr.deepCopyGroup(group) end

--- Désérialise un groupe, soit depuis un blob (string), soit depuis une table JSON : garantit toutes les tables, ré-hydrate les couches et les vec3, remplit les valeurs par défaut des décors de bord et crée le dossier de scène si demandé (sauf si un dossier gardé existe encore). Marque le groupe sale.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:632
---@param data string|table Blob string.buffer ou table de session.
---@param isCreateObject boolean true pour créer le dossier SimGroup dans MissionGroup.
---@return table  Le groupe prêt à être ajouté.
function editor_roadSpline_groupMgr.deserializeGroup(data, isCreateObject) end

--- Cherche un groupe par id.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:143
---@param id string UUID du groupe.
---@return table|nil  Le groupe ou nil.
function editor_roadSpline_groupMgr.findGroup(id) end

--- Liste les Road Splines actifs (isEnabled), pour les menus de liaison d'autres outils.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:785
---@return table[]  Éléments { name, id, type = « Road Spline » }.
function editor_roadSpline_groupMgr.getCurrentRoadSplineList() end

--- Renvoie la clé du mode d'édition de l'outil (« roadSplineEditor »).
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:52
---@return string  « roadSplineEditor »
function editor_roadSpline_groupMgr.getEditModeKey() end

--- Renvoie le tableau vivant des groupes (routes) de l'outil.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:43
---@return table[]  Liste des groupes, modifiable en place.
function editor_roadSpline_groupMgr.getGroups() end

--- Renvoie la table id de groupe -> indice dans getGroups().
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:46
---@return table<string, integer>  Table vivante.
function editor_roadSpline_groupMgr.getIdToIdxMap() end

--- Renvoie le préfixe de nom de l'outil (« Road Spline »).
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:49
---@return string  « Road Spline »
function editor_roadSpline_groupMgr.getToolPrefixStr() end

--- Indique si la route est liée à une Master Spline.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:798
---@param id string UUID du groupe.
---@return boolean  true si liée (false si inconnue).
function editor_roadSpline_groupMgr.isLinked(id) end

--- Joint deux routes non bouclées en une seule : group1 est modifié, group2 est supprimé. Ne fait rien si un groupe est introuvable ou si les indices de nœuds sont invalides.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:538
---@param groupIdx1 integer Indice du premier groupe.
---@param nodeIdx1 integer Nœud d'extrémité du premier groupe.
---@param groupIdx2 integer Indice du second groupe.
---@param nodeIdx2 integer Nœud d'extrémité du second groupe.
function editor_roadSpline_groupMgr.joinRoadSplines(groupIdx1, nodeIdx1, groupIdx2, nodeIdx2) end

--- Applique un profil au groupe cible : supprime ses couches, recrée celles du profil, recopie les options (valeurs par défaut si absentes), puis régénère les couches automatiques et marque le groupe sale.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:426
---@param targetGroup table Groupe cible.
---@param profile table Profil de copyGroupProfile.
function editor_roadSpline_groupMgr.pasteGroupProfile(targetGroup, profile) end

--- Recalcule la table id -> indice (appelé par l'assistant de session après un chargement qui ajoute des routes).
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:782
function editor_roadSpline_groupMgr.recomputeIdMap() end

--- Supprime les couches cachées (automatiques) puis recrée celles dont l'option du groupe est active (marques de pneus, réparations, fissures, rustines, asphalte abîmé, ligne centrale, lignes de rive/de voie, fondus de bord 1 à 3), et marque le groupe sale.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:177
---@param group table Groupe.
function editor_roadSpline_groupMgr.recreateAutoGeneratedLayers(group) end

--- Avant un rechargement Lua : renvoie, par id de couche, les ids de DecalRoad du groupe verrouillé, pour que adopt() les reprenne ensuite (routes, dossier et peinture restent dans la scène).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:120
---@param group table Groupe.
---@return table  { [layerId] = {id = decalRoadId, ids = {...}} }
function editor_roadSpline_groupMgr.release(group) end

--- Supprime les groupes. Avec isIncludeDisabled, supprime tout et vide la liste ; sinon seulement les groupes activés et non liés (les verrouillés et liés restent).
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:157
---@param isIncludeDisabled boolean|nil true pour tout supprimer, y compris verrouillés et liés.
function editor_roadSpline_groupMgr.removeAllGroups(isIncludeDisabled) end

--- Supprime le groupe à l'indice donné : annule la peinture de terrain, supprime ses couches (DecalRoads) et son dossier de scène, puis recalcule la table id -> indice.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:75
---@param idx integer Indice dans la liste des groupes.
function editor_roadSpline_groupMgr.removeGroup(idx) end

--- Supprime une spline liée par son id (appelé quand la couche correspondante de la Master Spline est retirée).
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:149
---@param splineId string UUID du groupe.
function editor_roadSpline_groupMgr.removeLinkedRoadSpline(splineId) end

--- Sérialise un groupe en blob string.buffer : annule la peinture de terrain si activé et vide les tables dérivées avant encodage.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:600
---@param group table Groupe.
---@return string  Données encodées.
function editor_roadSpline_groupMgr.serializeGroup(group) end

--- Sérialise un groupe en table portable pour un fichier de session JSON : sans géométrie dérivée ni poignées de scène, couches réduites aux champs auteur (serializeLayer). Le groupe vivant n'est pas modifié.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:615
---@param group table Groupe.
---@return table  Table JSON-compatible.
function editor_roadSpline_groupMgr.serializeGroupToTable(group) end

--- Met la même largeur à chaque nœud du groupe et le marque sale.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:273
---@param group table Groupe.
---@param width number Largeur en mètres.
function editor_roadSpline_groupMgr.setFixedWidth(group, width) end

--- Active ou désactive la liaison d'une route avec une autre spline (champ linkId) et la marque sale.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:804
---@param id string UUID de la route.
---@param groupId string UUID de la spline maître (ignoré si isLink est false).
---@param isLink boolean true pour lier.
function editor_roadSpline_groupMgr.setLink(id, groupId, isLink) end

--- Rétablissement d'une édition d'un seul groupe : restaure data.new.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:760
---@param data table { old = groupe, new = groupe }
function editor_roadSpline_groupMgr.singleGroupEditRedo(data) end

--- Annulation d'une édition d'un seul groupe : restaure data.old (couches recopiées, tous les champs de la route, peinture, nom du dossier si renommé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:759
---@param data table { old = groupe, new = groupe }
function editor_roadSpline_groupMgr.singleGroupEditUndo(data) end

--- Coupe un groupe au nœud donné. Une boucle devient une route ouverte réordonnée ; une route ouverte est remplacée par deux nouveaux groupes « nom (1) » et « nom (2) » (nouveaux UUID). Les réglages par virage (corners) suivent.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:492
---@param group table Groupe à couper.
---@param groupIdx integer Indice du groupe.
---@param selectedNodeIdx integer Indice du nœud de coupe.
function editor_roadSpline_groupMgr.splitGroup(group, groupIdx, selectedNodeIdx) end

--- Rétablissement d'une édition multi-groupes : réinsère les copies de groupsData.new.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:779
---@param groupsData table { old = groupes[], new = groupes[] }
function editor_roadSpline_groupMgr.transGroupEditRedo(groupsData) end

--- Annulation d'une édition touchant plusieurs groupes : supprime tous les groupes et réinsère les copies de groupsData.old.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:778
---@param groupsData table { old = groupes[], new = groupes[] }
function editor_roadSpline_groupMgr.transGroupEditUndo(groupsData) end

--- Détache toutes les routes liées (isLink = false, linkId = nil) et marque tous les groupes sales.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:828
function editor_roadSpline_groupMgr.unlinkAll() end

--- Reconstruit les groupes marqués sales (isDirty) : ignore les groupes de moins de 2 nœuds (couches supprimées), plaque les nœuds au terrain (raycast vertical), échantillonne la spline (Catmull-Rom, ou clothoïde en mode engineered), calcule les points de côtes et la longueur, repeint le terrain si actif, régénère les couches automatiques et met à jour les DecalRoads. Met aussi à jour les couches seules marquées sales. Pendant un glissement de poignée, seul l'échantillonnage est fait et le groupe reste sale.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:204
---@param dragging boolean|nil true pendant un glissement en direct (reconstruction lourde différée).
function editor_roadSpline_groupMgr.updateDirtyGroups(dragging) end

--- Remplace la géométrie (nœuds, largeurs, normales, boucle) d'une route liée et la marque sale.
---Source : lua/ge/extensions/editor/roadSpline/groupMgr.lua:818
---@param id string UUID de la route liée.
---@param points vec3[] Nouveaux nœuds.
---@param widths number[] Largeurs en m.
---@param nmls vec3[] Normales.
---@param isLoop boolean État de boucle du maître.
---@param isConformToTerrain boolean Reçu mais non utilisé dans le code.
function editor_roadSpline_groupMgr.updateLinkedRoadSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

