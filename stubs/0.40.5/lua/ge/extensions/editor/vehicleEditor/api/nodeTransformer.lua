---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/api/nodeTransformer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide du Vehicle Editor pour déplacer les nœuds sélectionnés (vEditor.selectedNodes) avec le gizmo d'axes de l'éditeur. Le gizmo est centré sur la moyenne des positions des nœuds ; pendant le glissement, chaque nœud reçoit sa position d'origine plus le delta (en coordonnées locales, signe inversé).
--- Accès : extension `editor_vehicleEditor_api_nodeTransformer` : `extensions.load("editor_vehicleEditor_api_nodeTransformer")`, puis la globale `editor_vehicleEditor_api_nodeTransformer`
---@class editor_vehicleEditor_api_nodeTransformer
editor_vehicleEditor_api_nodeTransformer = {}

--- Place et dessine le gizmo au centre des nœuds sélectionnés, gère début/fin/glissement et applique le décalage aux nœuds (node.pos).
---Source : lua/ge/extensions/editor/vehicleEditor/api/nodeTransformer.lua:48
---@return boolean  true si un glissement du gizmo est en cours pendant cet appel.
function editor_vehicleEditor_api_nodeTransformer.transformNodes() end

