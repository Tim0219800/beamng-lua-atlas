---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/jumpTables.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module utilitaire de l'outil Master Spline : regroupe des tables de dispatch indexées par le type de lien d'une couche (préfixe d'outil de meshSpline, assemblySpline, decalSpline, roadSpline, treeSpline). Chaque table associe à ce type la fonction de l'outil compatible correspondant (créer, restaurer, délier, supprimer, verrouiller, sérialiser…). Utile pour comprendre comment une Master Spline pilote ses splines enfants.
--- Accès : extension `editor_masterSpline_jumpTables` : `extensions.load("editor_masterSpline_jumpTables")`, puis la globale `editor_masterSpline_jumpTables`
---@class editor_masterSpline_jumpTables
---@field createJumpTable table<string, function> Crée une nouvelle spline dans l'outil cible (addNewMeshSpline, addNewAssemblySpline, addNewDecalSpline, addNewGroup, addNewTreeSpline).
---@field eachObjectJumpTable table<string, function(id: any, fn: function)> Itère sur les objets d'une spline liée (eachObjectById), pour splineLock ; mesh et assembly seulement.
---@field getLastCreatedSplineJumpTable table<string, function> Renvoie la dernière spline de la liste de l'outil (ou nil si vide) ; optimisé pour undo/redo.
---@field removeJumpTable table<string, function> Supprime une spline liée (removeLinkedXxx de chaque outil).
---@field restoreJumpTable table<string, function(data: table)> Restaure une spline à partir de données : copie profonde, ajout à la liste de l'outil, recalcul de la table id vers indice ; renvoie la spline.
---@field serializeJumpTable table<string, function(linkedSplineId: any)> Renvoie une copie profonde de la spline liée (deepCopyXxx), ou nil si introuvable.
---@field setLinkJumpTable table<string, function> setLink de chaque outil : définit l'état de lien d'une couche.
---@field setLinkedSplineDirtyJumpTable table<string, function(id: any)> Met isDirty = true sur la spline liée, si elle existe.
---@field setLockedJumpTable table<string, function(id: any, isLocked: boolean)> Verrouille/déverrouille une spline enfant via le setLockedById de l'outil ; suit le verrou de sa Master Spline.
---@field setNameJumpTable table<string, function(id: any, splineName: string)> Renomme la spline liée (champ name) ; pour mesh, assembly et road, renomme aussi le dossier de l'arbre de scène (sceneTreeFolderId) et rafraîchit la fenêtre de l'arbre.
---@field toolNavigation table<string, table> Pour chaque type : uiModule (nom de l'extension, ex. 'editor_meshSpline'), getModeKey, getSplines et getIdToIdxMap, pour naviguer vers l'outil compatible.
---@field unlinkJumpTable table<string, function(linkedSplineId: any)> Délie la spline : isLink = false, linkId = nil, isDirty = true.
editor_masterSpline_jumpTables = {}

