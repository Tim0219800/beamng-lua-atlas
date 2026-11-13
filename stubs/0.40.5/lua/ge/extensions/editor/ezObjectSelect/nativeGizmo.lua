---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Enveloppe de l'outil Easy Select autour du gizmo d'axes natif de l'éditeur (editor.updateAxisGizmo / drawAxisGizmo). Capture les transformations/échelles de la sélection au début du glisser, applique translation (avec snap grille), rotation et échelle pendant le glisser, puis à la fin enregistre des actions d'historique annulables (SetObjectTransform / SetObjectScale, transaction « EasySelectNativeTransform » ou « EasySelectNativeScale ») et émet le hook onEditorObjectSelectionTransformChanged. Les offsets de prefab sont mis à jour pour les objets contenus dans un prefab.
--- Accès : extension `editor_ezObjectSelect_nativeGizmo` : `extensions.load("editor_ezObjectSelect_nativeGizmo")`, puis la globale `editor_ezObjectSelect_nativeGizmo`
---@class editor_ezObjectSelect_nativeGizmo
editor_ezObjectSelect_nativeGizmo = {}

--- Lit et efface l'indicateur « glisser terminé cette frame ».
---Source : lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua:355
---@return boolean  true si un glisser s'est terminé
---@return table|nil  {mode, anchorDistance} (distance de translation appliquée, 0 hors translation) si des changements ont été validés
function editor_ezObjectSelect_nativeGizmo.consumeFinished() end

--- À appeler chaque frame : vérifie que la sélection correspond au glisser capturé et que les objets supportent le mode courant (position/rotation/scale non vides, editor.canManipulateObject), met à jour le gizmo avec les options de snap puis le dessine.
---Source : lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua:332
---@param options table|nil {gridSnapEnabled, gridRelative, gridSize, rotateSnapEnabled, rotateSnapSize}
---@return boolean  false si rien n'a été dessiné (sélection changée ou mode non supporté), sinon true
function editor_ezObjectSelect_nativeGizmo.draw(options) end

--- Indique si un glisser du gizmo est en cours.
---Source : lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua:351
---@return boolean
function editor_ezObjectSelect_nativeGizmo.isInteracting() end

--- Annule le glisser en cours : restaure transformations et échelles d'origine, efface les indicateurs et annule l'interaction du gizmo.
---Source : lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua:363
function editor_ezObjectSelect_nativeGizmo.reset() end

