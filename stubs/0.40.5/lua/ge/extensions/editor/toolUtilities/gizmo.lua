---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/gizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion partagée du gizmo d'axes pour les outils d'édition de splines de l'éditeur. Place le gizmo sur le noeud sélectionné (ou sur une position d'ancrage d'affichage), déplace le noeud en translation (ou tous les noeuds en mode rigide), fait tourner les normales autour de la tangente locale, et enregistre le glissement dans l'historique d'annulation.
--- Accès : extension `editor_toolUtilities_gizmo` : `extensions.load("editor_toolUtilities_gizmo")`, puis la globale `editor_toolUtilities_gizmo`
---@class editor_toolUtilities_gizmo
editor_toolUtilities_gizmo = {}

--- À appeler chaque frame : positionne, met à jour et dessine le gizmo sur le noeud sélectionné d'une spline, et configure les verrous d'axes. Pendant un glissement, le noeud suit le curseur ; relâcher valide l'action 'Gizmo Drag' dans l'historique.
---Source : lua/ge/extensions/editor/toolUtilities/gizmo.lua:112
---@param isRotEnabledIn boolean Active la rotation (axe tangent).
---@param selectedSplineIdx integer Indice de la spline sélectionnée.
---@param selectedNodeIdx integer Indice du noeud sélectionné.
---@param splinesIn table[] Liste des splines (chacune avec nodes, nmls, isDirty).
---@param isConformToTerrainIn boolean Spline conforme au terrain (Z non libre au gizmo).
---@param isRigidIn boolean Translation/rotation rigide appliquée à tous les noeuds.
---@param deepCopyFunctIn function Copie profonde de l'état d'une spline, pour l'historique.
---@param undoFunctIn function Callback d'annulation.
---@param redoFunctIn function Callback de rétablissement.
---@param commitHistoryOverrideIn function|nil Remplace editor.history:commitAction pour regrouper le glissement dans une action plus large.
---@param anchorPosIn vec3|nil Position d'affichage du gizmo à la place du noeud ; nil = sur le noeud.
function editor_toolUtilities_gizmo.handleGizmo(isRotEnabledIn, selectedSplineIdx, selectedNodeIdx, splinesIn, isConformToTerrainIn, isRigidIn, deepCopyFunctIn, undoFunctIn, redoFunctIn, commitHistoryOverrideIn, anchorPosIn) end

--- Vrai tant qu'un glissement du gizmo (translation ou rotation) est en cours ; permet de différer les reconstructions lourdes.
---Source : lua/ge/extensions/editor/toolUtilities/gizmo.lua:170
---@return boolean  État du glissement.
function editor_toolUtilities_gizmo.isDragging() end

