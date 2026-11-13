---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/debugTextures.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section de debug « Debug Textures » de l'outil Dynamic Decals. Affiche, dans des en-têtes repliables, les textures internes de l'API editor_api_dynamicDecals : dynamiques, baked, highlight, decal (entrée des brosses) et masques. La largeur maximale des aperçus vient de la préférence `dynamicDecalsTool.debugTextures.maxImageWidgetWidth` (défaut 512).
--- Accès : extension `editor_dynamicDecals_debugTextures` : `extensions.load("editor_dynamicDecals_debugTextures")`, puis la globale `editor_dynamicDecals_debugTextures`
---@class editor_dynamicDecals_debugTextures
editor_dynamicDecals_debugTextures = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/debugTextures.lua:48
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_debugTextures.editorPreferenceValueChanged(path, value) end

--- Enregistre la préférence float `dynamicDecalsTool.debugTextures.maxImageWidgetWidth` (défaut 512).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/debugTextures.lua:42
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_debugTextures.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère l'API et enregistre la section « Debug Textures » (ordre 1130).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/debugTextures.lua:52
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_debugTextures.setup(tool_in) end

