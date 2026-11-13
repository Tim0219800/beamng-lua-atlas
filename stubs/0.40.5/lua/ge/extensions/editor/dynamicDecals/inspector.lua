---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/inspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Inspecteur de l'outil Dynamic Decals : affiche et permet de modifier toutes les propriétés des calques (layers) sélectionnés (`editor.selection["dynamicDecalLayer"]`) ou de la brosse sélectionnée (`editor.selection["dynamicDecalBrush"]`). Les champs communs (uid, nom, type, enabled) sont dessinés ici ; le reste est délégué à une fonction GUI enregistrée par type de calque via registerLayerGui (par les modules layerTypes/*).
--- Accès : extension `editor_dynamicDecals_inspector` : `extensions.load("editor_dynamicDecals_inspector")`, puis la globale `editor_dynamicDecals_inspector`
---@class editor_dynamicDecals_inspector
editor_dynamicDecals_inspector = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:104
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_inspector.editorPreferenceValueChanged(path, value) end

--- Si une brosse est sélectionnée, appelle brushes.inspectorGui(brush).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:91
---@param inspectorInfo table Informations de l'inspecteur (non utilisées).
function editor_dynamicDecals_inspector.inspectorGuiBrush(inspectorInfo) end

--- Dessine l'inspecteur des calques sélectionnés (un seul directement, plusieurs dans des TreeNode). Ne fait rien si la sélection est nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:64
---@param inspectorInfo table Informations de l'inspecteur de l'éditeur (non utilisées ici).
function editor_dynamicDecals_inspector.inspectorGuiLayer(inspectorInfo) end

--- Enregistre la préférence float `dynamicDecalsTool.inspector.texturePreviewSize` (défaut 128, de 32 à 512).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:98
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_inspector.registerEditorPreferences(prefsRegistry) end

--- Enregistre la fonction qui dessine les propriétés spécifiques d'un type de calque ; elle est appelée avec (layer, guiId).
---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:133
---@param layerTypeId integer Identifiant du type de calque (valeur de api.layerTypes).
---@param guiFn function function(layer, guiId) qui dessine l'interface.
function editor_dynamicDecals_inspector.registerLayerGui(layerTypeId, guiFn) end

--- Appelé par l'outil : récupère API, brushes, docs, widgets et helper, installe une GUI par défaut pour chaque type de calque d'api.layerTypes et enregistre la page de doc « Inspector ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/inspector.lua:118
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_inspector.setup(tool_in) end

