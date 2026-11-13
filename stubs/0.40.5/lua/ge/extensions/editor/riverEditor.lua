---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/riverEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode d'édition « River » de l'éditeur de monde. Ce fichier est une fine enveloppe : il charge la logique générique de meshEditor.lua (via dofile), la configure avec type = "River" (preferencesName "riverEditor", niceName "River") et réexpose ses callbacks d'éditeur. Il enregistre le mode riverEditMode (icône create_river, action map "RiverEditor", classe éditée River) avec les raccourcis Alt + clic gauche (créer une rivière / ajouter un nœud), copier et coller les propriétés de la rivière.
--- Accès : extension `editor_riverEditor` : `extensions.load("editor_riverEditor")`, puis la globale `editor_riverEditor`
---@class editor_riverEditor
---@field deleteNodeAM function Alias de meshEditor.deleteNodeAM : suppression d'un nœud, destinée à l'action map.
---@field onEditorAxisGizmoAligmentChanged function Alias de meshEditor.onEditorAxisGizmoAligmentChanged_ : changement d'alignement du gizmo d'axes (l'orthographe « Aligment » est celle du code).
---@field onEditorGui function Alias de meshEditor.onEditorGui_ : dessine l'interface ImGui du mode.
---@field onEditorInspectorFieldChanged function Alias de meshEditor.onEditorInspectorFieldChanged_ : réagit à la modification d'un champ dans l'inspecteur.
---@field onEditorInspectorHeaderGui function Alias de meshEditor.onEditorInspectorHeaderGui_ : en-tête personnalisé de l'inspecteur.
---@field onEditorObjectSelectionChanged function Alias de meshEditor.onEditorObjectSelectionChanged_ : la sélection d'objets a changé.
---@field onEditorPreferenceValueChanged function Alias de meshEditor.onEditorPreferenceValueChanged_ : réagit au changement d'une préférence.
---@field onEditorRegisterPreferences function Alias de meshEditor.onEditorRegisterPreferences_ : déclare les préférences de l'éditeur de rivière.
---@field selectAllNodes function Alias de meshEditor.selectAllNodes : sélectionne tous les nœuds de la rivière.
editor_riverEditor = {}

--- Hook appelé quand l'éditeur est initialisé. Crée editor.editModes.riverEditMode (onActivate, onUpdate, onToolbar, copier/coller, suppression, tout sélectionner, icône, auxShortcuts) et ajoute les raccourcis auxiliaires « Create river / Add node » (LMB + Alt), « Copy river properties » et « Paste river properties ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/riverEditor.lua:17
function editor_riverEditor.onEditorInitialized() end

--- Hook appelé au chargement de l'extension ; écrit seulement « initialized » dans le log (niveau D).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/riverEditor.lua:40
function editor_riverEditor.onExtensionLoaded() end

