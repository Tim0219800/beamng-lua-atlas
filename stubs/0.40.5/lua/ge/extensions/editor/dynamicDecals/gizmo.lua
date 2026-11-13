---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/gizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère le gizmo d'axes (déplacement / rotation / échelle) de l'outil Dynamic Decals. Les autres modules (decal, path, group…) choisissent le mode avec setTransformMode, installent leur callback translateFn / rotateFn / scaleFn, et mettent à jour M.transform. À chaque frame d'édition, editModeUpdate affiche le gizmo, la boîte englobante du decal sélectionné et une sphère de debug.
--- Accès : extension `editor_dynamicDecals_gizmo` : `extensions.load("editor_dynamicDecals_gizmo")`, puis la globale `editor_dynamicDecals_gizmo`
---@class editor_dynamicDecals_gizmo
---@field data table Informations sur l'objet en cours de manipulation (uid, type, objectType, dataPointIndex, objectDataCopy), remplies par les modules appelants.
---@field rotateFn function|nil Callback de rotation.
---@field scaleFn function|nil Callback d'échelle.
---@field transform MatrixF Matrice du gizmo (MatrixF(true) au départ).
---@field transformModes table<string, integer> none = 0, translate = 1, rotate = 2, scale = 3.
---@field translateFn function|nil Callback de translation, reçoit la matrice du gizmo.
editor_dynamicDecals_gizmo = {}

--- Appelé à chaque frame par le mode d'édition de l'éditeur : met à jour et dessine le gizmo si un mode est actif, dessine la boîte englobante du decal sélectionné, puis la sphère de debug des points de contrôle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:116
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_dynamicDecals_gizmo.editModeUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:112
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_gizmo.editorPreferenceValueChanged(path, value) end

--- Nombre de mises à jour de drag depuis le début du drag courant.
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:54
---@return integer  Compteur.
function editor_dynamicDecals_gizmo.getDragCount() end

--- Renvoie le mode de transformation actuel.
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:40
---@return integer  Valeur de transformModes.
function editor_dynamicDecals_gizmo.getTransformMode() end

--- Callback passé à editor.updateAxisGizmo : appelé quand le drag du gizmo commence. Remet le compteur à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:59
function editor_dynamicDecals_gizmo.gizmoBeginDrag() end

--- Callback appelé à chaque mise à jour du drag : incrémente le compteur puis, selon le mode, appelle translateFn / rotateFn / scaleFn avec editor.getAxisGizmoTransform().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:72
function editor_dynamicDecals_gizmo.gizmoDragging() end

--- Callback appelé à la fin du drag. Remet le compteur à 0 (aucune action d'annulation n'est ajoutée ici).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:66
function editor_dynamicDecals_gizmo.gizmoEndDrag() end

--- Enregistre `dynamicDecalsTool.gizmo` : displayBoundingBox (bool, vrai), boundingBoxColor (RGBA {1,0,0,0.75}, avec sélecteur de couleur) et displayDebugObjWhileMovingControlPoints (bool, vrai).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:100
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_gizmo.registerEditorPreferences(prefsRegistry) end

--- Remet à nil translateFn, rotateFn et scaleFn.
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:48
function editor_dynamicDecals_gizmo.resetTransformFn() end

--- Définit le mode de transformation ; avec none, le gizmo n'est plus affiché.
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:44
---@param value integer Une valeur de transformModes.
function editor_dynamicDecals_gizmo.setTransformMode(value) end

--- Appelé par l'outil : mémorise l'outil et l'API editor_api_dynamicDecals.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:142
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_gizmo.setup(tool_in) end

