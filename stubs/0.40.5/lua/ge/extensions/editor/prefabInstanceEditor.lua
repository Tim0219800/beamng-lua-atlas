---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/prefabInstanceEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ajoute une section « PrefabInstance » en tête de l'inspecteur de l'éditeur quand tous les objets sélectionnés sont des PrefabInstance. Si au moins une instance ne correspond plus à son modèle parent (matchesParentTemplate), il affiche les boutons « Make new template » et « Apply to parent ».
--- Accès : extension `editor_prefabInstanceEditor` : `extensions.load("editor_prefabInstanceEditor")`, puis la globale `editor_prefabInstanceEditor`
---@class editor_prefabInstanceEditor
editor_prefabInstanceEditor = {}

--- Appelé à l'initialisation de l'éditeur ; écrit seulement une ligne de log (niveau I).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/prefabInstanceEditor.lua:15
function editor_prefabInstanceEditor.onEditorInitialized() end

--- Appelé à chaque frame en tête de l'inspecteur. Affiche l'en-tête repliable « PrefabInstance » seulement si toute la sélection est composée de PrefabInstance ; les boutons n'apparaissent que si une instance diffère de son parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/prefabInstanceEditor.lua:19
---@param inspectorInfo table Informations de l'inspecteur ; le champ previousSelectedIds (liste d'IDs d'objets) est utilisé.
function editor_prefabInstanceEditor.onEditorInspectorHeaderGui(inspectorInfo) end

