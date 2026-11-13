---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boîte à outils d'édition de la spline de driveline (ligne de conduite de rallye) pour l'éditeur de rallye. Toutes les fonctions prennent un « host » (la fenêtre qui possède host.drivelineV3, host.selectedNodeIdx, host.dragState, host.path) et une table optionnelle opts de callbacks (onBeforeMutation, onSplineMutated, onCommit, onHistoryRestore, inputBlocked/isInputBlocked, generateFinal). handleSplineInteraction gère la souris : survoler/déplacer un nœud (clic glissé), insérer un nœud sur la courbe, ajouter un nœud au début ou à la fin (le plus proche), supprimer le nœud sélectionné avec la touche Suppr (si plus de 2 nœuds). Chaque modification est enregistrée dans editor.history avec une copie profonde avant/après de la spline (nodes, widths, nmls).
--- Accès : extension `editor_rallyEditor_drivelineEditSurface` : `extensions.load("editor_rallyEditor_drivelineEditSurface")`, puis la globale `editor_rallyEditor_drivelineEditSurface`
---@class editor_rallyEditor_drivelineEditSurface
editor_rallyEditor_drivelineEditSurface = {}

--- Enregistre dans editor.history une action avec l'ancienne spline et une copie de l'actuelle ; l'annulation et le rétablissement appellent onHistoryRestore(host, actionName, 'undo'|'redo') s'il est fourni. Appelle ensuite opts.onCommit.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:82
---@param host table Objet portant drivelineV3.
---@param actionName string Nom de l'action d'historique.
---@param oldSpline table Copie de la spline avant modification.
---@param opts table|nil Callbacks optionnels.
function editor_rallyEditor_drivelineEditSurface.commitSplineEdit(host, actionName, oldSpline, opts) end

--- Génère le driveline final à partir de la spline (drivelineV3:createDrivelineFromSpline).
---Source : lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:135
---@param host table Objet portant drivelineV3.
---@return boolean  Résultat de la génération ; false si host.drivelineV3 est absent.
function editor_rallyEditor_drivelineEditSurface.createFinalDriveline(host) end

--- À appeler à chaque frame : gère la souris sur la spline (survol, glisser d'un nœud, insertion, ajout, suppression avec Suppr). Ne fait rien si ImGui capture la souris, si l'entrée est bloquée ou si la souris n'est pas sur la carte.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:162
---@param host table Objet portant drivelineV3 (spline.nodes/widths/nmls, updateSplineGeometry…), selectedNodeIdx, dragState, deletePressed.
---@param opts table|nil Callbacks : onBeforeMutation, onSplineMutated, onCommit, onHistoryRestore, inputBlocked, isInputBlocked, generateFinal.
function editor_rallyEditor_drivelineEditSurface.handleSplineInteraction(host, opts) end

--- Rétablit une édition : restaure data.new.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:77
---@param host table Objet portant drivelineV3.
---@param data table|nil Données d'action {old, new}.
function editor_rallyEditor_drivelineEditSurface.redoSplineEdit(host, data) end

--- Si la spline est sale et a au moins 2 nœuds, recalcule sa géométrie, régénère le driveline final (sauf si opts.generateFinal == false) et appelle onSplineMutated.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:100
---@param host table Objet portant drivelineV3.
---@param opts table|nil Callbacks optionnels.
---@return boolean  true si la géométrie a été mise à jour.
function editor_rallyEditor_drivelineEditSurface.refreshSplineGeometry(host, opts) end

--- Remplace le contenu de la spline du host (nodes, widths, nmls) par une copie sauvegardée, la marque sale puis recalcule la géométrie et le driveline final.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:48
---@param host table Objet portant drivelineV3.
---@param saved table Spline sauvegardée {nodes, widths, nmls} (par drivelineV3:deepCopySpline).
function editor_rallyEditor_drivelineEditSurface.restoreSpline(host, saved) end

--- Enregistre la spline dans un fichier du dossier de mission du carnet de notes (drivelineV3:saveSplineToFile) après vérification des prérequis.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:140
---@param host table Objet portant drivelineV3 et path (avec getMissionDir()).
---@return boolean  true si la sauvegarde a réussi.
function editor_rallyEditor_drivelineEditSurface.saveFinalDriveline(host) end

--- Simplifie la spline (algorithme Ramer-Douglas-Peucker sur nœuds, largeurs et normales) avec une tolérance, met à jour la géométrie et enregistre l'action « Simplify Spline ». Sans effet avec 2 nœuds ou moins.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:115
---@param host table Objet portant drivelineV3.
---@param tolerance number Tolérance de simplification (mètres, déduit du code).
---@param opts table|nil Callbacks optionnels.
---@return boolean  true si la spline a été simplifiée.
function editor_rallyEditor_drivelineEditSurface.simplifySpline(host, tolerance, opts) end

--- Annule une édition : restaure data.old.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineEditSurface.lua:72
---@param host table Objet portant drivelineV3.
---@param data table|nil Données d'action {old, new}.
function editor_rallyEditor_drivelineEditSurface.undoSplineEdit(host, data) end

