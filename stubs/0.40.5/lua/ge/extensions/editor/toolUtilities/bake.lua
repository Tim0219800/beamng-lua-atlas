---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/bake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide partagée « Bake » des outils de splines de l'éditeur. Tant qu'une spline appartient à son outil, ses objets générés (TSStatic, DecalRoad, rivière) sont transitoires (canSave=false). Bake les valide dans le niveau : passe objets et dossier SimGroup en canSave=true et retire la spline de l'outil sans rien supprimer. Tout est piloté par une table `spec` fournie par l'outil (toolId, displayName, getBakeTarget, rebuildNow, burn, detach, finalizeFolder, removeFromTool, captureState, restoreState, findSpline, optionnellement iconColor/iconSize/bakeIcon/canBake/rowIconSize). L'opération est une seule transaction d'historique annulable, sans dialogue.
--- Accès : extension `editor_toolUtilities_bake` : `extensions.load("editor_toolUtilities_bake")`, puis la globale `editor_toolUtilities_bake`
---@class editor_toolUtilities_bake
editor_toolUtilities_bake = {}

--- Propagation Master-Spline : bake la spline d'id donné (typiquement un enfant lié) sans ouvrir sa propre transaction d'historique ; le Master Spline englobe tout dans une action.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:166
---@param spec table Table de configuration (doit avoir findSpline).
---@param id any Id de la spline.
---@return table|nil  { manifest, items, folderId } pour permettre l'annulation, ou nil si l'id est introuvable.
function editor_toolUtilities_bake.burnById(spec, id) end

--- Variante colonne : dessine le bouton Bake comme une cellule de colonne (l'appelant doit augmenter son im.Columns de 1). S'il n'y a pas de spline bakeable sélectionnée, la cellule est un Dummy vide.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:142
---@param spec table Table de configuration de l'outil (voir module).
function editor_toolUtilities_bake.renderButton(spec) end

--- Variante en ligne : dessine le bouton Bake (ou un Dummy) sans gestion de colonnes ; l'appelant fait son propre im.SameLine() avant.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:151
---@param spec table Table de configuration de l'outil.
function editor_toolUtilities_bake.renderButtonInline(spec) end

--- Variante ligne : bouton Bake pour la spline d'une ligne de liste (petite icône), ou Dummy si elle n'est pas bakeable. Un clic bake immédiatement et renvoie true.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:178
---@param spec table Table de configuration de l'outil.
---@param spline table Spline de la ligne.
---@return boolean  true si un bake a eu lieu (l'appelant doit terminer sa fenêtre). Toujours false en mode LOCK.
function editor_toolUtilities_bake.rowButton(spec, spline) end

--- Verrouille/déverrouille `spline` en une transaction d'historique annulable. Utilisé par le bouton flamme et le basculeur de verrou de l'outil.
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:114
---@param spec table Table de configuration (doit avoir setLockedById).
---@param spline table Spline (utilise spline.id).
---@param isLocked boolean true pour verrouiller, false pour déverrouiller.
function editor_toolUtilities_bake.setLocked(spec, spline, isLocked) end

--- Reprend un bake : supprime les objets brûlés et les items de forêt plantés, recharge la collision et remet le dossier en transitoire (cansave=false).
---Source : lua/ge/extensions/editor/toolUtilities/bake.lua:72
---@param data table Enregistrement de doBake/burnById (manifest, items, folderId).
function editor_toolUtilities_bake.unburn(data) end

