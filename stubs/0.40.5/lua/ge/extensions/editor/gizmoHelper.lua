---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/gizmoHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit utilitaire pour savoir si le gizmo d'axes de l'éditeur est dessiné. Un outil appelle gizmoDrawCalled() chaque frame où il dessine le gizmo ; à la frame suivante, si plus personne ne l'a dessiné, le module désélectionne l'élément du gizmo côté moteur (setAxisGizmoSelectedElement(-1)).
--- Accès : extension `editor_gizmoHelper` : `extensions.load("editor_gizmoHelper")`, puis la globale `editor_gizmoHelper`
---@class editor_gizmoHelper
editor_gizmoHelper = {}

--- À appeler depuis un outil à chaque frame où il dessine le gizmo d'axes ; marque le gizmo comme dessiné pour la frame courante.
---Source : lua/ge/extensions/editor/gizmoHelper.lua:17
function editor_gizmoHelper.gizmoDrawCalled() end

--- Indique si le gizmo a été dessiné à la frame précédente.
---Source : lua/ge/extensions/editor/gizmoHelper.lua:21
---@return boolean  true si gizmoDrawCalled a été appelé à la frame précédente
function editor_gizmoHelper.isGizmoVisible() end

--- Hook appelé chaque frame par l'éditeur : si le gizmo était dessiné à la frame précédente mais pas à celle-ci, désélectionne l'élément du gizmo (-1) ; puis fait glisser l'indicateur de frame et le remet à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/gizmoHelper.lua:9
function editor_gizmoHelper.onEditorGui() end

