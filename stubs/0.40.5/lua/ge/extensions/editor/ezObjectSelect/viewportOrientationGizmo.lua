---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/viewportOrientationGizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit gizmo d'orientation 2D dessiné dans un coin de la vue de l'éditeur (ImGui, foreground draw list) pour Easy Object Select : trois axes X (rouge), Y (vert), Z (bleu) projetés selon l'orientation de la caméra (core_camera.getQuat), avec bouts positifs pleins étiquetés et bouts négatifs plus sombres. Affiche « W » (monde) ou « L » (local) selon qu'un objet local est donné.
--- Accès : extension `editor_ezObjectSelect_viewportOrientationGizmo` : `extensions.load("editor_ezObjectSelect_viewportOrientationGizmo")`, puis la globale `editor_ezObjectSelect_viewportOrientationGizmo`
---@class editor_ezObjectSelect_viewportOrientationGizmo
editor_ezObjectSelect_viewportOrientationGizmo = {}

--- Dessine le gizmo. Si localObjectId désigne un objet existant, les axes suivent sa matrice de transformation (mode L), sinon les axes monde (mode W). Les extrémités sont triées par profondeur.
---Source : lua/ge/extensions/editor/ezObjectSelect/viewportOrientationGizmo.lua:52
---@param rightOffset number|nil Décalage depuis le bord droit de la vue de scène, en pixels avant uiscale (défaut 64).
---@param topOffset number|nil Décalage depuis le haut, en pixels avant uiscale (défaut 64).
---@param localObjectId integer|nil ID d'un objet dont les axes locaux sont affichés.
function editor_ezObjectSelect_viewportOrientationGizmo.draw(rightOffset, topOffset, localObjectId) end

