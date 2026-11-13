---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire d'état de l'outil Mesh Spline : détient la liste des mesh splines (meshSplines) et la table id vers indice (splineMap). Il crée, copie, découpe, joint, supprime, sérialise et reconstruit les splines, applique les presets, gère les liens avec le Master Spline et fournit les callbacks undo/redo de l'éditeur. Chaque spline possède un dossier SimGroup dans MissionGroup (non sauvegardé tant qu'elle n'est pas « bakée ») et reçoit un UUID via Engine.generateUUID().
--- Accès : extension `editor_meshSpline_splineMgr` : `extensions.load("editor_meshSpline_splineMgr")`, puis la globale `editor_meshSpline_splineMgr`
---@class editor_meshSpline_splineMgr
editor_meshSpline_splineMgr = {}

--- Ajoute une nouvelle mesh spline vide : nom unique, UUID, dossier de scène, flags par défaut (isEnabled, normalMode = 2, isAliasRoundRobin...), puis applique le preset 'concrete_barrier' et met à jour la table id vers indice.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:610
function editor_meshSpline_splineMgr.addNewMeshSpline() end

--- Action ponctuelle : pose les nœuds de contrôle sur la surface en dessous (raycast vertical) puis marque la spline dirty. La construction reste libre en 3D ; à relancer après un terraformage pour re-coller.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1246
---@param spline table Spline à modifier.
function editor_meshSpline_splineMgr.conformNodesToTerrain(spline) end

--- Convertit des chemins tracés depuis une bitmap en mesh splines : une spline par chemin, points convertis en coordonnées monde via le terrain editor, normales prises sur le terrain. Un chemin trop petit n'est pas importé (la spline vide créée reste dans la liste).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1256
---@param paths table[] Chemins avec points ({x,y} en grille) et widths.
function editor_meshSpline_splineMgr.convertPathsToMeshSplines(paths) end

--- Copie le profil d'une spline (tous ses paramètres sans les nœuds, largeurs, normales ni géométrie dérivée) pour le coller sur une autre.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1083
---@param spline table Spline source.
---@return table  Profil copié.
function editor_meshSpline_splineMgr.copyMeshSplineProfile(spline) end

--- Copie profonde d'une spline (buffer.encode/decode), avec les tables de géométrie dérivée vidées.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:707
---@param spline table Spline à copier.
---@return table  Copie indépendante.
function editor_meshSpline_splineMgr.deepCopyMeshSpline(spline) end

--- Copie profonde de la liste complète des splines (pour l'historique undo/redo).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:719
---@return table  Liste de copies.
function editor_meshSpline_splineMgr.deepCopyMeshSplineState() end

--- Désérialise une spline. data est soit le blob encodé de l'éditeur (string), soit une table issue d'un fichier de session JSON ; dans ce dernier cas les tables dérivées sont créées vides et les positions {x,y,z} redeviennent des vec3 avant la première reconstruction.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1180
---@param data string|table Blob ou table de session.
---@param isCreateObject boolean true pour créer le dossier SimGroup de scène de la spline (sauf si une spline verrouillée en garde déjà un après rechargement Lua).
---@return table  La spline désérialisée.
function editor_meshSpline_splineMgr.deserializeMeshSpline(data, isCreateObject) end

--- Trouve une spline vivante par son id.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:672
---@param id string UUID de la spline.
---@return table|nil  La spline, ou nil si absente.
function editor_meshSpline_splineMgr.findMeshSpline(id) end

--- Renvoie la liste simplifiée des splines actives (isEnabled) pour l'interface : nom, id et type.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1289
---@return table[]  Éléments {name, id, type}.
function editor_meshSpline_splineMgr.getCurrentMeshSplineList() end

--- Renvoie les paramètres par défaut des curseurs de l'interface (bornes, valeurs).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:607
---@return table  Paramètres de curseurs.
function editor_meshSpline_splineMgr.getDefaultSliderParams() end

--- Renvoie la clé du mode d'édition de l'outil.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:476
---@return string  Clé du mode d'édition.
function editor_meshSpline_splineMgr.getEditModeKey() end

--- Renvoie la table vivante des mesh splines (non copiée).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:479
---@return table  Liste des splines, base 1.
function editor_meshSpline_splineMgr.getMeshSplines() end

--- Renvoie la table vivante id vers indice des splines.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:482
---@return table<string, integer>  Indice par id.
function editor_meshSpline_splineMgr.getSplineMap() end

--- Renvoie le préfixe de nom de l'outil (« Mesh Spline »).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:473
---@return string  Préfixe de l'outil.
function editor_meshSpline_splineMgr.getToolPrefixStr() end

--- Dit si la spline d'id donné est liée à un Master Spline.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1303
---@param id string UUID de la spline.
---@return boolean  true si liée, false sinon (ou si absente).
function editor_meshSpline_splineMgr.isLinked(id) end

--- Joint deux mesh splines ouvertes en une seule : la géométrie concaténée (geom.joinSplineGeometry) est écrite dans la première, la seconde est supprimée. Ne fait rien si un indice est invalide ou si les nœuds ne permettent pas la jonction.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:885
---@param splineIdx1 integer Indice de la première spline.
---@param nodeIdx1 integer Nœud d'extrémité de la première.
---@param splineIdx2 integer Indice de la seconde spline.
---@param nodeIdx2 integer Nœud d'extrémité de la seconde.
function editor_meshSpline_splineMgr.joinMeshSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Callback de rétablissement pour une opération de sélection d'objet : remet data.new à la place de la spline de même id.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1080
---@param data table Données d'action avec old et new.
function editor_meshSpline_splineMgr.objectSelectRedo(data) end

--- Callback d'annulation pour une opération de sélection d'objet : remet data.old à la place de la spline de même id, retire ses meshes et la marque dirty.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1077
---@param data table Données d'action avec old et new.
function editor_meshSpline_splineMgr.objectSelectUndo(data) end

--- Colle un profil sur la spline : retire d'abord ses meshes, reprend les paramètres du profil (normalMode, espacement, jitter, décalage vertical, etc.) et marque la spline dirty.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1098
---@param spline table Spline cible.
---@param profile table Profil renvoyé par copyMeshSplineProfile.
function editor_meshSpline_splineMgr.pasteMeshSplineProfile(spline, profile) end

--- Rétablit le choix d'un preset (retire les meshes avant d'appliquer le nouvel état).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1029
---@param meshSplineData table Données d'action.
function editor_meshSpline_splineMgr.presetSelectionRedo(meshSplineData) end

--- Annule le choix d'un preset (retire les meshes avant d'appliquer l'ancien état).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1015
---@param meshSplineData table Données d'action.
function editor_meshSpline_splineMgr.presetSelectionUndo(meshSplineData) end

--- Recalcule la table id vers indice (appelée par l'utilitaire de session après un chargement qui ajoute des splines).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1063
function editor_meshSpline_splineMgr.recomputeIdMap() end

--- Supprime toutes les splines. Avec isIncludeDisabled à true, y compris les verrouillées et liées ; sinon seulement les actives non liées.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:688
---@param isIncludeDisabled boolean true pour tout supprimer.
function editor_meshSpline_splineMgr.removeAllMeshSplines(isIncludeDisabled) end

--- Supprime une spline liée par son id (appelée quand une couche du Master Spline est retirée). Ne fait rien si l'id est inconnu.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:678
---@param splineId string UUID de la spline.
function editor_meshSpline_splineMgr.removeLinkedMeshSpline(splineId) end

--- Supprime la spline d'indice donné : ses meshes, son dossier de scène, puis l'entrée de la liste ; met à jour la table id vers indice. Plante si l'indice n'existe pas (la spline est lue sans test avant tryRemove).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:656
---@param idx integer Indice de la spline (base 1).
function editor_meshSpline_splineMgr.removeMeshSpline(idx) end

--- Sérialise une spline pour le tampon d'éditeur : vide d'abord les tables dérivées de la spline vivante (elle est donc modifiée), puis renvoie buffer.encode(spline).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1158
---@param spline table Spline à sérialiser.
---@return string  Données encodées (déduit du code).
function editor_meshSpline_splineMgr.serializeMeshSpline(spline) end

--- Sérialise une spline en table simple et portable pour un fichier de session (toolUtilities/session). Copie profonde via le codec pour ne jamais modifier la spline vivante ; la géométrie dérivée est vidée (reconstruite ensuite) et le handle de scène retiré.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1171
---@param spline table Spline à sérialiser.
---@return table  Table JSON-compatible.
function editor_meshSpline_splineMgr.serializeMeshSplineToTable(spline) end

--- Active ou désactive le lien d'une spline (isLink, linkId), retire ses meshes et la marque dirty. Ne fait rien si l'id est inconnu.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1309
---@param id string UUID de la spline.
---@param groupId string Identifiant du groupe de lien, utilisé comme linkId si isLink est vrai.
---@param isLink boolean true pour lier, false pour délier.
function editor_meshSpline_splineMgr.setLink(id, groupId, isLink) end

--- Place la spline à l'indice donné, crée son dossier de scène (SimGroup dans MissionGroup, cansave = false) s'il n'existe pas et la marque dirty.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:485
---@param spline table Spline à enregistrer.
---@param idx integer Indice de destination (base 1).
function editor_meshSpline_splineMgr.setMeshSpline(spline, idx) end

--- Enregistre toutes les splines de la table à leurs indices (appelle setMeshSpline pour chacune).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:505
---@param splines table Liste de splines.
function editor_meshSpline_splineMgr.setMeshSplines(splines) end

--- Applique un preset (mesh central, capuchons, espacement, décalages, etc., issus de la table des presets) à la spline : supprime d'abord ses meshes de la scène, copie les paramètres du preset, mesure le mesh et marque la spline dirty. Ne fait rien si la spline ou le nom est nil ; un nom inconnu se contente de la vider et de la marquer dirty.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:512
---@param spline table Spline cible.
---@param presetStr string Nom du preset, par exemple 'concrete_barrier'.
function editor_meshSpline_splineMgr.setPreset(spline, presetStr) end

--- Callback de rétablissement pour l'édition d'une seule spline.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1007
---@param meshSplineData table Données d'action contenant le nouvel état.
function editor_meshSpline_splineMgr.singleSplineEditRedo(meshSplineData) end

--- Callback d'annulation pour l'édition d'une seule spline (historique de l'éditeur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:999
---@param meshSplineData table Données d'action contenant l'ancien état.
function editor_meshSpline_splineMgr.singleSplineEditUndo(meshSplineData) end

--- Coupe la spline sélectionnée en deux au nœud sélectionné. Une spline en boucle est simplement ouverte au point de coupe. Sinon la spline d'origine est supprimée et remplacée par deux nouvelles splines nommées <nom>_split_A et <nom>_split_B qui reprennent ses paramètres.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:728
---@param selectedSplineIdx integer Indice de la spline (base 1).
---@param selectedNodeIdx integer Indice du nœud de coupe (base 1).
function editor_meshSpline_splineMgr.splitMeshSpline(selectedSplineIdx, selectedNodeIdx) end

--- Rétablit une édition transverse à plusieurs mesh splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1053
---@param data table Données d'action.
function editor_meshSpline_splineMgr.transSplineEditRedo(data) end

--- Annule une édition transverse à plusieurs mesh splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1043
---@param data table Données d'action.
function editor_meshSpline_splineMgr.transSplineEditUndo(data) end

--- Délie toutes les mesh splines (isLink = false, linkId = nil) et les marque dirty.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1347
function editor_meshSpline_splineMgr.unlinkAll() end

--- Reconstruit les splines marquées dirty : moins de 2 nœuds, retire meshes et géométrie ; sinon recalcule la géométrie (populationEngine.updateGeometry), repeuple les meshes (populate.populateMeshSpline) et met à jour roadLength. Signale ensuite une édition à la session « meshSpline ».
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1218
function editor_meshSpline_splineMgr.updateDirtyMeshSplines() end

--- Met à jour une spline liée avec la géométrie du Master Spline (nodes, widths, nmls, isLoop, isConformToTerrain). S'il y a moins de 2 points, vide la géométrie dérivée et retire les meshes. Marque la spline dirty.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1324
---@param id string UUID de la spline liée.
---@param points table Nœuds.
---@param widths table Largeurs par nœud.
---@param nmls table Normales par nœud.
---@param isLoop boolean Spline en boucle.
---@param isConformToTerrain boolean Épouse la surface en dessous.
function editor_meshSpline_splineMgr.updateLinkedMeshSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

