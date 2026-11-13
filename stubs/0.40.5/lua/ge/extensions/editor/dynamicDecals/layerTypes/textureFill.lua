---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de calque « Texture Fill » de l'outil Dynamic Decals : remplit le véhicule avec un motif basé sur une texture d'entrée, avec couleur (ou palette du véhicule), échelle et décalage (offset). Fournit la fenêtre « Add Texture Fill Layer » (OK appelle api.addTextureFillLayer), le bouton de barre d'outils (ordre 20), la GUI d'inspecteur du type textureFill (fillTexturePath, colorPaletteMapId, color, scale, offset) et la page de doc.
--- Accès : extension `editor_dynamicDecals_layerTypes_textureFill` : `extensions.load("editor_dynamicDecals_layerTypes_textureFill")`, puis la globale `editor_dynamicDecals_layerTypes_textureFill`
---@class editor_dynamicDecals_layerTypes_textureFill
editor_dynamicDecals_layerTypes_textureFill = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua:161
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_layerTypes_textureFill.editorPreferenceValueChanged(path, value) end

--- Ouvre la fenêtre « Add Texture Fill Layer ».
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua:165
function editor_dynamicDecals_layerTypes_textureFill.openAddLayerWindow() end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua:155
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_layerTypes_textureFill.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère les modules liés, enregistre le dessin de la fenêtre d'ajout, la GUI d'inspecteur du type textureFill, l'élément de barre d'outils « textureFill », la page de documentation et la fenêtre (450x310).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua:181
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_layerTypes_textureFill.setup(tool_in) end

