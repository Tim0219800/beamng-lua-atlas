---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/debugSection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « Debug » (ordre 1010) de l'outil Dynamic Decals : une série de boutons de test pour développeurs. Ils appellent l'API editor_api_dynamicDecals (reprojection des calques, bake de brosse, dump du layerStack, noms des matériaux, profondeur/normale de surface, mise à jour des matériaux du véhicule), les autres modules de l'outil (textures, gizmo, notification, docs, widgets, settings) et un générateur de matériaux dynamiques pour tous les véhicules.
--- Accès : extension `editor_dynamicDecals_debugSection` : `extensions.load("editor_dynamicDecals_debugSection")`, puis la globale `editor_dynamicDecals_debugSection`
---@class editor_dynamicDecals_debugSection
editor_dynamicDecals_debugSection = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/debugSection.lua:172
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_debugSection.editorPreferenceValueChanged(path, value) end

--- Ne déclare aucune préférence (le corps est entièrement commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/debugSection.lua:166
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_debugSection.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère l'API et les modules textures, gizmo, notification, docs, widgets, settings, puis enregistre la section « Debug » (ordre 1010).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/debugSection.lua:176
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_debugSection.setup(tool_in) end

