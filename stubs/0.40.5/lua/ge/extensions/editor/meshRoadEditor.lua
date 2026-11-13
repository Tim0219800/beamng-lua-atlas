---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshRoadEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension du world editor qui fournit le mode « Edit MeshRoad » (routes en mesh). Elle charge editor/meshEditor.lua avec dofile(), lui fixe type = "MeshRoad", preferencesName = "meshRoadEditor" et niceName = "Mesh Road", puis enregistre le mode d'édition meshRoadEditMode (action map MeshRoadEditor, icône create_road_mesh). Alt+clic gauche crée une route ou ajoute un nœud ; copier/coller transfère les propriétés.
--- Accès : extension `editor_meshRoadEditor` : `extensions.load("editor_meshRoadEditor")`, puis la globale `editor_meshRoadEditor`
---@class editor_meshRoadEditor
---@field deleteNodeAM nil Relais de meshEditor.deleteNodeAM, inexistant : vaut nil.
---@field onEditorAxisGizmoAligmentChanged function Relais de meshEditor.onEditorAxisGizmoAligmentChanged_.
---@field onEditorGui nil Prévu pour relayer meshEditor.onEditorGui_, mais cette fonction n'existe pas : vaut nil.
---@field onEditorInspectorFieldChanged function Relais de meshEditor.onEditorInspectorFieldChanged_ (régénère la route si segmentLength ou subdivideLength change).
---@field onEditorInspectorHeaderGui function Relais de meshEditor.onEditorInspectorHeaderGui_ (panneau des nœuds dans l'inspecteur).
---@field onEditorObjectSelectionChanged function Relais de meshEditor.onEditorObjectSelectionChanged_.
---@field onEditorPreferenceValueChanged function Relais de meshEditor.onEditorPreferenceValueChanged_.
---@field onEditorRegisterPreferences function Relais de meshEditor.onEditorRegisterPreferences_ (préférences meshRoadEditor.general.*).
---@field selectAllNodes nil Relais de meshEditor.selectAllNodes, inexistant : vaut nil.
editor_meshRoadEditor = {}

--- Hook appelé à l'initialisation du world editor : crée editor.editModes.meshRoadEditMode (nom « Edit MeshRoad », onActivate, onUpdate, onToolbar, onDeselect, copier/coller, suppression, tout sélectionner) et ses raccourcis auxiliaires (Alt+LMB, copier, coller).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshRoadEditor.lua:17
function editor_meshRoadEditor.onEditorInitialized() end

--- Hook appelé au chargement de l'extension : écrit « initialized » dans le log (niveau D).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshRoadEditor.lua:41
function editor_meshRoadEditor.onExtensionLoaded() end

