---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/fonts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des polices de l'outil Dynamic Decals. Génère, via FontRasterizer.createFontBitmap, des atlas de glyphes (bitmaps de 256 px de haut, option SDF avec padding, valeur onedge et échelle de distance) dans /art/dynamicDecals/fonts/ à partir d'un fichier de police (dossier source par défaut /ui/common/). Les atlas générés (`<nom>.font.json` avec header et glyphs) sont listés, prévisualisés dans la section « Fonts », dans une fenêtre d'aperçu et dans un onglet « Fonts » du navigateur ; un glyphe choisi peut servir de texture de decal (api.setDecalLayerFontPath / setDecalLayerFontCharacter). Les calques à texte (path layers) s'en servent.
--- Accès : extension `editor_dynamicDecals_fonts` : `extensions.load("editor_dynamicDecals_fonts")`, puis la globale `editor_dynamicDecals_fonts`
---@class editor_dynamicDecals_fonts
---@field supportedFontFileFormats table Filtres de la boîte de fichier pour choisir une police : tous les fichiers, fichiers police (.ttf, .TTF) et fichiers TTF.
editor_dynamicDecals_fonts = {}

--- S'assure qu'un atlas existe pour la police donnée, le génère sinon (nom de l'atlas = nom du fichier sans extension).
---Source : lua/ge/extensions/editor/dynamicDecals/fonts.lua:502
---@param fontPath string Chemin du fichier .ttf.
---@return boolean  false si la création a échoué, true sinon.
function editor_dynamicDecals_fonts.checkOrGenerateFontBitmaps(fontPath) end

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/fonts.lua:470
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_fonts.editorPreferenceValueChanged(path, value) end

--- Renvoie le dossier source des polices (/ui/common/).
---Source : lua/ge/extensions/editor/dynamicDecals/fonts.lua:517
---@return string  Chemin du dossier.
function editor_dynamicDecals_fonts.getFontDirectory() end

--- Renvoie la liste (triée sans casse) des noms d'atlas de police déjà générés.
---Source : lua/ge/extensions/editor/dynamicDecals/fonts.lua:521
---@return string[]  Noms de polices.
function editor_dynamicDecals_fonts.getGeneratedFontAtlases() end

--- Enregistre `dynamicDecalsTool.fonts` : glyphPreviewSize et glyphPreviewSizeInPreviewWindow (float, défaut 128, de 32 à 1024) et markMissingGlyphs (bool, vrai).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/fonts.lua:462
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_fonts.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : liste les atlas existants, enregistre la section « Fonts » (ordre 1030), l'onglet « Fonts » du navigateur (ordre 40), la fenêtre d'aperçu, les callbacks d'update et d'interface, puis indique à l'API le dossier des atlas (api.setFontTextureAtlasPath).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/fonts.lua:483
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_fonts.setup(tool_in) end

