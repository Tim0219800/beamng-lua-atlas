---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de calque « Brush Stroke » de l'outil Dynamic Decals : un coup de pinceau virtuel qui pose un decal à chaque frame pendant le déplacement et interpole des decals entre les frames. Il partage les propriétés d'un calque decal. Ce module fournit la section « Brush Stroke Properties » (nombre d'étapes d'interpolation, ordre 1070), la GUI d'inspecteur du type brushStroke (uid, nom, enabled, couleur, échelle, rotation, masque alpha, SDF, textures, dataPoints, etc.) et les pages de documentation (Brush Stroke Layers, Properties).
--- Accès : extension `editor_dynamicDecals_layerTypes_brushStroke` : `extensions.load("editor_dynamicDecals_layerTypes_brushStroke")`, puis la globale `editor_dynamicDecals_layerTypes_brushStroke`
---@class editor_dynamicDecals_layerTypes_brushStroke
editor_dynamicDecals_layerTypes_brushStroke = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua:544
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_layerTypes_brushStroke.editorPreferenceValueChanged(path, value) end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua:538
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_layerTypes_brushStroke.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère les modules liés, enregistre la section « Brush Stroke Properties », la GUI d'inspecteur du type brushStroke et les pages de documentation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua:589
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_layerTypes_brushStroke.setup(tool_in) end

