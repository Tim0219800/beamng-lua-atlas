---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/selection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la sélection des calques (layers) de l'outil Dynamic Decals. selectLayer copie le calque dans `editor.selection["dynamicDecalLayer"][uid]` (ce que l'inspecteur lit) et configure le gizmo : transform de départ et callbacks translate/rotate/scale selon le type (decal, brushStroke, path, group). deselectLayer vide la sélection et désactive le gizmo.
--- Accès : extension `editor_dynamicDecals_selection` : `extensions.load("editor_dynamicDecals_selection")`, puis la globale `editor_dynamicDecals_selection`
---@class editor_dynamicDecals_selection
editor_dynamicDecals_selection = {}

--- Retire le calque `uid` de la sélection, ou toute la sélection si uid est nil. Désactive le gizmo (mode none, callbacks et data réinitialisés).
---Source : lua/ge/extensions/editor/dynamicDecals/selection.lua:119
---@param uid string|integer|nil Calque à désélectionner.
function editor_dynamicDecals_selection.deselectLayer(uid) end

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/selection.lua:142
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_selection.editorPreferenceValueChanged(path, value) end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/selection.lua:136
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_selection.registerEditorPreferences(prefsRegistry) end

--- Sélectionne le calque `uid` (remplace la sélection, sauf si addToSelection) et prépare le gizmo (type « drag », objectType, transform, callbacks).
---Source : lua/ge/extensions/editor/dynamicDecals/selection.lua:28
---@param uid string|integer Identifiant du calque ; un avertissement est loggé s'il est nil.
---@param addToSelection boolean|nil Si vrai, ajoute à la sélection existante.
function editor_dynamicDecals_selection.selectLayer(uid, addToSelection) end

--- Appelé par l'outil : récupère l'outil, l'API et le module gizmo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/selection.lua:146
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_selection.setup(tool_in) end

