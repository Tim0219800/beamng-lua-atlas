---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire de données de l'outil Master Spline de l'éditeur. Il stocke la liste des Master Splines (nodes, widths, nmls, layers, mode de géométrie « engineered » à clothoïdes ou « spline » Catmull-Rom, homologation), reconstruit la géométrie des splines « dirty », pilote les couches liées (via layerMgr) et fournit copies profondes, sérialisation, séparation/jonction, callbacks undo/redo et sauvegarde/chargement de session groupée (masters + enfants mesh/assembly/decal/road/tree).
--- Accès : extension `editor_masterSpline_splineMgr` : `extensions.load("editor_masterSpline_splineMgr")`, puis la globale `editor_masterSpline_splineMgr`
---@class editor_masterSpline_splineMgr
editor_masterSpline_splineMgr = {}

--- Crée une Master Spline vide (mode engineered, nom unique, UUID) et l'ajoute à la liste, puis recalcule la table id vers indice.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:84
---@param name string|nil Nom de base ; par défaut « Master Spline N ».
---@return table  La nouvelle Master Spline.
function editor_masterSpline_splineMgr.addNewMasterSpline(name) end

--- Ajoute une Master Spline à la liste sans recalculer la table id vers indice.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:152
---@param spline table Master Spline à ajouter.
function editor_masterSpline_splineMgr.addToMasterSplineArray(spline) end

--- Copie profonde de toutes les splines enfants liées par les couches de toutes les Master Splines, regroupées par outil.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:261
---@return table  Table avec les listes meshSpline, assemblySpline, decalSpline, roadSpline, treeSpline.
function editor_masterSpline_splineMgr.captureLinkedSplinesState() end

--- Capture l'état complet pour undo/redo multi-splines : Master Splines et splines liées.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:345
---@return table  Table { masterSplines, linkedSplines }.
function editor_masterSpline_splineMgr.captureTransTierState() end

--- Convertit des tracés issus d'une bitmap en Master Splines : points grille convertis en monde via le terrain editor, normales du terrain ; importe seulement si la plus petite dimension de l'AABB dépasse 10 m. Écrit un log.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1259
---@param paths table Liste de tracés { points (x, y grille), widths }.
function editor_masterSpline_splineMgr.convertPathsToMasterSplines(paths) end

--- Copie profonde de toute la liste des Master Splines.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:255
---@return table  Copie.
function editor_masterSpline_splineMgr.deepCopyAllMasterSplines() end

--- Copie profonde d'une Master Spline (string.buffer).
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:252
---@param spline table Spline à copier.
---@return table  Copie.
function editor_masterSpline_splineMgr.deepCopyMasterSpline(spline) end

--- Reconstruit une Master Spline (vec3, couches, géométrie secondaire vide à régénérer) depuis des données sérialisées.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:614
---@param data table Table produite par serializeMasterSpline.
---@return table  Master Spline.
function editor_masterSpline_splineMgr.deserializeMasterSpline(data) end

--- Renvoie la clé de mode d'édition « masterSpline ».
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:66
---@return string  Clé.
function editor_masterSpline_splineMgr.getEditModeKey() end

--- Renvoie la table id vers indice des Master Splines.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:72
---@return table<string, integer>  Table id vers indice.
function editor_masterSpline_splineMgr.getIdToIdxMap() end

--- Renvoie le tableau (vivant, non copié) des Master Splines.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:69
---@return table  Tableau de Master Splines.
function editor_masterSpline_splineMgr.getMasterSplines() end

--- Renvoie le préfixe d'outil « Master Spline ».
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:63
---@return string  Préfixe.
function editor_masterSpline_splineMgr.getToolPrefixStr() end

--- Joint deux Master Splines ouvertes : la première reçoit la géométrie concaténée et la seconde est supprimée. Ne fait rien si les indices sont invalides.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:539
---@param splineIdx1 integer Indice de la première spline (conservée).
---@param nodeIdx1 integer Nœud de jonction de la première.
---@param splineIdx2 integer Indice de la seconde spline (supprimée).
---@param nodeIdx2 integer Nœud de jonction de la seconde.
function editor_masterSpline_splineMgr.joinMasterSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Redo des modifications légères : applique data.new.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:765
---@param data table Action { old, new }.
function editor_masterSpline_splineMgr.lightSplineRedo(data) end

--- Undo des modifications légères d'une Master Spline : applique data.old.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:762
---@param data table Action { old, new }.
function editor_masterSpline_splineMgr.lightSplineUndo(data) end

--- Charge un état de session : nouveaux UUID pour masters, enfants et couches, insertion des enfants dans leurs outils, relinkage et marquage dirty. Retourne 0 si state n'est pas une table.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1030
---@param state table État produit par serializeSessionState.
---@param replace boolean Si vrai, supprime d'abord tout le graphe de masters courant (et leurs enfants).
---@return integer  Nombre de Master Splines chargées.
function editor_masterSpline_splineMgr.loadSessionState(state, replace) end

--- Si la spline sélectionnée a isOptimising vrai et plus de 2 divPoints, lance homologation.optimiseSpline avec le nombre d'itérations par image.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:243
---@param selectedSplineIdx integer Indice de la spline sélectionnée.
function editor_masterSpline_splineMgr.manageLiveOptimise(selectedSplineIdx) end

--- Recalcule la table id vers indice (appelé par l'assistant de session après un chargement).
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:258
function editor_masterSpline_splineMgr.recomputeIdMap() end

--- Redo de la création : recrée une Master Spline avec l'id data.masterSplineId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1241
---@param data table Action { masterSplineId }.
function editor_masterSpline_splineMgr.redoAddNewMasterSpline(data) end

--- Redo de l'ajout d'une couche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1117
---@param data table Données de l'action.
function editor_masterSpline_splineMgr.redoLayerAdd(data) end

--- Redo de la suppression d'une couche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1206
---@param data table Données de l'action.
function editor_masterSpline_splineMgr.redoLayerRemove(data) end

--- Supprime toutes les Master Splines de la session, avec leurs couches et enfants liés.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:165
function editor_masterSpline_splineMgr.removeAllMasterSplines() end

--- Supprime la Master Spline d'indice idx, toutes ses couches et leurs splines liées, puis recalcule la table id vers indice.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:155
---@param idx integer Indice (à partir de 1).
function editor_masterSpline_splineMgr.removeMasterSpline(idx) end

--- Sérialise une Master Spline en table sûre pour JSON (nœuds et normales en {x,y,z}, couches, paramètres).
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:570
---@param spline table Spline.
---@return table  Données sérialisées.
function editor_masterSpline_splineMgr.serializeMasterSpline(spline) end

--- État pour l'assistant de session partagé : toutes les Master Splines plus chaque enfant lié (dédupliqué par id), en tables JSON.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1005
---@return table  { masterSplines = {...}, children = { [linkType] = {...} } }.
function editor_masterSpline_splineMgr.serializeSessionState() end

--- Redo d'une édition d'une seule Master Spline (data.new) ; recrée par défaut les splines enfants supprimées pendant l'action, nomme et relie les nouvelles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:940
---@param data table Action { old, new }.
function editor_masterSpline_splineMgr.singleMasterSplineEditRedo(data) end

--- Undo d'une édition d'une seule Master Spline (applique data.old).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:831
---@param data table Action { old, new }.
function editor_masterSpline_splineMgr.singleMasterSplineEditUndo(data) end

--- Coupe la Master Spline au nœud choisi. Une boucle devient une spline ouverte re-démarrée au point de coupure ; sinon deux copies « nom (1) » et « nom (2) » sont créées avec leurs overrides de virage, et les couches sont gérées pour chaque moitié.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:353
---@param spline table Master Spline à couper.
---@param splineIdx integer Indice de la spline dans la liste.
---@param selectedNodeIdx integer Indice du nœud de coupure.
function editor_masterSpline_splineMgr.splitMasterSpline(spline, splineIdx, selectedNodeIdx) end

--- Redo d'une édition multi-splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:966
---@param splinesData table Action { old, new }.
function editor_masterSpline_splineMgr.transMasterSplineEditRedo(splinesData) end

--- Undo d'une édition multi-splines (état complet, masters et enfants).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:935
---@param splinesData table Action { old, new } issue de captureTransTierState.
function editor_masterSpline_splineMgr.transMasterSplineEditUndo(splinesData) end

--- Undo de la création d'une Master Spline : la supprime par data.masterSplineId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1232
---@param data table Action { masterSplineId }.
function editor_masterSpline_splineMgr.undoAddNewMasterSpline(data) end

--- Undo de l'ajout d'une couche : retire la couche de la Master Spline (data.masterSplineId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1095
---@param data table Données de l'action.
function editor_masterSpline_splineMgr.undoLayerAdd(data) end

--- Undo de la suppression d'une couche : la restaure.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1162
---@param data table Données de l'action.
function editor_masterSpline_splineMgr.undoLayerRemove(data) end

--- Délie toutes les splines liées de la Master Spline (isLink = false, linkId = nil), sans passer par undo/redo.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1248
---@param masterSpline table Master Spline.
function editor_masterSpline_splineMgr.unlinkAllSplines(masterSpline) end

--- Reconstruit la géométrie des splines isDirty (terrain, engineered ou Catmull-Rom, élargissement des virages, rib points, homologation si activée), met à jour les couches liées et roadLength. Les splines non dirty ne mettent à jour que leurs couches dirty. Signale la modification à la session si quelque chose a été reconstruit.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:173
---@param isSplineAnalysisEnabled boolean Si vrai, lance homologation.analyseSpline sur les splines de plus de 2 points discrétisés.
function editor_masterSpline_splineMgr.updateDirtyMasterSplines(isSplineAnalysisEnabled) end

--- Renomme la spline liée pour qu'elle suive le nom de la couche (via setNameJumpTable).
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1229
---@param splineId string Id de la spline liée.
---@param linkType string Type de lien (préfixe d'outil de la spline liée).
---@param newName string Nouveau nom.
function editor_masterSpline_splineMgr.updateLinkedSplineName(splineId, linkType, newName) end

