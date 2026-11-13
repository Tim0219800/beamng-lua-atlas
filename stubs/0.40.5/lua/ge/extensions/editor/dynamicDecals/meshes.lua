---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/meshes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module (expérimental, désactivé) de l'outil Dynamic Decals pour changer le fichier de forme (.dae) sur lequel les decals sont projetés. Le code de la section existe mais l'enregistrement de la section « Meshes (Experimental) » est commenté dans setup : aucune interface n'est visible.
--- Accès : extension `editor_dynamicDecals_meshes` : `extensions.load("editor_dynamicDecals_meshes")`, puis la globale `editor_dynamicDecals_meshes`
---@class editor_dynamicDecals_meshes
editor_dynamicDecals_meshes = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/meshes.lua:46
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_meshes.editorPreferenceValueChanged(path, value) end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/meshes.lua:40
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_meshes.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : mémorise l'outil, l'API et le module settings. N'enregistre aucune section (ligne commentée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/meshes.lua:50
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_meshes.setup(tool_in) end

