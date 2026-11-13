---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « Camera » de l'outil Dynamic Decals de l'éditeur. Affiche un bouton par preset de caméra (default, front, back, left, right, top) qui bascule sur la caméra orbit du véhicule joueur avec une rotation par défaut donnée. Les presets sont stockés dans la préférence editor `dynamicDecalsTool.camera.presets` (nom -> {x,y,z}) et sont éditables dans la fenêtre des préférences.
--- Accès : extension `editor_dynamicDecals_camera` : `extensions.load("editor_dynamicDecals_camera")`, puis la globale `editor_dynamicDecals_camera`
---@class editor_dynamicDecals_camera
editor_dynamicDecals_camera = {}

--- Hook appelé quand une préférence de l'outil change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/camera.lua:119
---@param path string Chemin de la préférence modifiée.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_camera.editorPreferenceValueChanged(path, value) end

--- Enregistre la sous-catégorie de préférences `dynamicDecalsTool.camera` avec la table `presets` (valeurs par défaut : default {145,-5,0}, front {180,0,0}, back {0,0,0}, left {-90,0,0}, right {90,0,0}, top {90,-90,0}) et son éditeur graphique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/camera.lua:103
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_camera.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil dynamicDecalsTool : mémorise l'outil, l'API editor_api_dynamicDecals et le module docs, enregistre la section « Camera » (ordre 125) avec un bouton d'aide, et enregistre la page de documentation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/camera.lua:123
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_camera.setup(tool_in) end

