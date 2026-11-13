---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des splines du Drive Path Editor (préfixe « Drive Path Spline », mode d'édition drivePathSplineEditMode). Une spline de chemin décrit un trajet pour une IA : nœuds, largeurs, normales, vitesses (vels) et limites de vitesse (velLimits) en mode libre, ou liste de nœuds du navgraph (graphNodes/graphPath) en mode graphe. Le module tient la liste des splines et la table id vers index, gère création, suppression, coupe, jonction, inversion, undo/redo, sérialisation, liens spline-véhicule (qui replacent le véhicule au départ) et le cache du navgraph de la carte (map.getGraphpath()).
--- Accès : extension `editor_drivePathEditor_splineMgr` : `extensions.load("editor_drivePathEditor_splineMgr")`, puis la globale `editor_drivePathEditor_splineMgr`
---@class editor_drivePathEditor_splineMgr
editor_drivePathEditor_splineMgr = {}

--- Ajoute à la fin une nouvelle spline vide avec un nom unique, un UUID Engine.generateUUID() et les paramètres par défaut.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:202
function editor_drivePathEditor_splineMgr.addNewDrivePathSpline() end

--- Reconstruit la liste des véhicules actifs de la scène (activeVehiclesIterator) avec vid, veh, name et liens remis à zéro.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:84
function editor_drivePathEditor_splineMgr.computeActiveVehicles() end

--- Convertit des tracés issus d'une image en splines (voir notes pour les cas des tracés trop petits).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:967
---@param paths table tableau de {points, widths}
function editor_drivePathEditor_splineMgr.convertPathsToDrivePathSplines(paths) end

--- Copie profonde d'une spline (pour l'historique).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:283
---@param spline table spline
---@return table  copie
function editor_drivePathEditor_splineMgr.deepCopyDrivePathSpline(spline) end

--- Copie profonde de toutes les splines.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:350
---@return table  tableau de copies
function editor_drivePathEditor_splineMgr.deepCopyDrivePathSplineState() end

--- Reconstruit une spline depuis une table sérialisée.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:811
---@param data table table issue de serializeDrivePathSpline
---@return table  spline
function editor_drivePathEditor_splineMgr.deserializeDrivePathSpline(data) end

--- Inverse le sens d'une spline : nœuds, largeurs, normales, vitesses et limites de vitesse sont renversés.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:577
---@param spline table spline
function editor_drivePathEditor_splineMgr.flipSpline(spline) end

--- Renvoie la liste des véhicules actifs ; la recalcule si elle est vide ou si isForce est vrai.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:94
---@param isForce boolean|nil forcer le recalcul
---@return table  tableau de {vid, veh, name, isLink, linkSplineId}
function editor_drivePathEditor_splineMgr.getActiveVehicles(isForce) end

--- Renvoie les valeurs par défaut des paramètres de spline.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:183
---@return table  paramètres par défaut
function editor_drivePathEditor_splineMgr.getDefaultSliderParams() end

--- Renvoie la table des splines (référence).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:65
---@return table  tableau de splines
function editor_drivePathEditor_splineMgr.getDrivePathSplines() end

--- Renvoie la clé du mode d'édition (« drivePathSplineEditMode »).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:62
---@return string  clé
function editor_drivePathEditor_splineMgr.getEditModeKey() end

--- Renvoie les données du navgraph de la carte (cache), les calcule au premier appel si possible.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:141
---@return table|nil  {graph, nodes, widths, lines} ou nil si le graphe n'est pas encore disponible
function editor_drivePathEditor_splineMgr.getNavGraph() end

--- Renvoie la table id de spline vers index.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:68
---@return table<string, integer>  id vers index
function editor_drivePathEditor_splineMgr.getSplineMap() end

--- Renvoie le préfixe de l'outil (« Drive Path Spline »).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:59
---@return string  préfixe
function editor_drivePathEditor_splineMgr.getToolPrefixStr() end

--- Cherche un véhicule dans la liste déjà calculée (sans la recalculer).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:102
---@param vid integer id du véhicule
---@return table|nil  entrée de véhicule
function editor_drivePathEditor_splineMgr.getVehicleById(vid) end

--- Joint deux splines non bouclées : la première reçoit la géométrie concaténée, la seconde est supprimée.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:486
---@param splineIdx1 integer spline conservée
---@param nodeIdx1 integer nœud d'extrémité de la première
---@param splineIdx2 integer spline supprimée
---@param nodeIdx2 integer nœud d'extrémité de la seconde
function editor_drivePathEditor_splineMgr.joinDrivePathSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Lie une spline à un véhicule (isVehicleLink, linkVehId, linkSplineId) et replace le véhicule au départ.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:635
---@param spline table spline
---@param vehicle table entrée de véhicule
function editor_drivePathEditor_splineMgr.linkSpline(spline, vehicle) end

--- Relie toutes les splines à leur véhicule (via linkVehId) en cherchant dans la liste des véhicules calculée.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:673
function editor_drivePathEditor_splineMgr.relinkAllVehiclesToSplines() end

--- Supprime les splines. Avec isIncludeDisabled vrai, toutes ; sinon seulement celles activées.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:264
---@param isIncludeDisabled boolean inclure les splines désactivées
function editor_drivePathEditor_splineMgr.removeAllDrivePathSplines(isIncludeDisabled) end

--- Supprime la spline d'index donné et met à jour la table d'index.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:256
---@param idx integer index (base 1)
function editor_drivePathEditor_splineMgr.removeDrivePathSpline(idx) end

--- Vide toute la géométrie d'une spline (nodes, widths, nmls, vels, velLimits, graphNodes, graphPath) et la marque isDirty.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:186
---@param spline table|nil spline
function editor_drivePathEditor_splineMgr.resetGeometry(spline) end

--- Place le véhicule au nœud de départ (startingNode) de la spline, orienté selon les nœuds voisins, avec 0.3 m de décalage vertical. Mémorise une seule fois sa pose d'origine. En mode graphe, utilise les nœuds du navgraph (nécessite le cache).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:602
---@param spline table spline
---@param vehicle table entrée de véhicule {vid, veh…}
function editor_drivePathEditor_splineMgr.resetVehiclePose(spline, vehicle) end

--- Sérialise une spline en table.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:756
---@param spline table spline
---@return table  données sérialisées
function editor_drivePathEditor_splineMgr.serializeDrivePathSpline(spline) end

--- Place une spline à un index et la marque isDirty.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:71
---@param spline table spline
---@param idx integer index (base 1)
function editor_drivePathEditor_splineMgr.setDrivePathSpline(spline, idx) end

--- Place toutes les splines d'un tableau (chacune marquée isDirty).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:77
---@param splines table tableau de splines
function editor_drivePathEditor_splineMgr.setDrivePathSplines(splines) end

--- Rétablit une édition de spline unique à partir de drivePathSplineData.new.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:724
---@param drivePathSplineData table {old, new}
function editor_drivePathEditor_splineMgr.singleSplineEditRedo(drivePathSplineData) end

--- Annule une édition de spline unique à partir de drivePathSplineData.old, puis relie à nouveau les véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:716
---@param drivePathSplineData table {old, new}
function editor_drivePathEditor_splineMgr.singleSplineEditUndo(drivePathSplineData) end

--- Coupe une spline en deux au nœud donné (écart de 1.0 m entre les deux parties).
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:360
---@param selectedSplineIdx integer index de la spline
---@param selectedNodeIdx integer index du nœud de coupe
function editor_drivePathEditor_splineMgr.splitDrivePathSpline(selectedSplineIdx, selectedNodeIdx) end

--- Rétablit une édition globale avec data.new.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:744
---@param data table {old, new}
function editor_drivePathEditor_splineMgr.transSplineEditRedo(data) end

--- Annule une édition globale (toutes les splines) avec data.old.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:732
---@param data table {old, new}
function editor_drivePathEditor_splineMgr.transSplineEditUndo(data) end

--- Supprime le lien spline-véhicule et rend au véhicule sa pose d'origine mémorisée.
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:646
---@param spline table spline
---@param vehicle table entrée de véhicule
function editor_drivePathEditor_splineMgr.unlinkSpline(spline, vehicle) end

--- Recalcule la géométrie des splines isDirty (raycasts terrain, barres de vitesse, ruban en mode libre ; chemin de graphe en mode navgraph). Appelée chaque frame par onEditorGui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/drivePathEditor/splineMgr.lua:913
function editor_drivePathEditor_splineMgr.updateDirtyDrivePathSplines() end

