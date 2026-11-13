---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/textures.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Navigateur de textures de decals de l'outil Dynamic Decals (interface). Ajoute dans le navigateur les onglets « Textures » (ordre 10) et « Tags » (ordre 20), un inspecteur pour la sélection `editor.selection["dynamicDecalTexture"]` (édition des métadonnées/tags du fichier sidecar), la sélection multiple (Maj = plage, Ctrl = ajout), un menu contextuel pour affecter une texture à une propriété et une notification quand des fichiers de métadonnées manquants ont été créés. La logique de fichiers est dans editor_api_dynamicDecals_textures.
--- Accès : extension `editor_dynamicDecals_textures` : `extensions.load("editor_dynamicDecals_textures")`, puis la globale `editor_dynamicDecals_textures`
---@class editor_dynamicDecals_textures
editor_dynamicDecals_textures = {}

--- Hook appelé quand un fichier texture est ajouté au dossier surveillé : si des fichiers de métadonnées manquants ont été créés, ajoute une notification avec boutons de sélection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/textures.lua:544
---@param filepath string Chemin du fichier ajouté (non utilisé directement).
function editor_dynamicDecals_textures.dynamicDecals_onTextureFileAdded(filepath) end

--- Hook appelé quand un fichier texture est supprimé : le retire de la sélection `dynamicDecalTexture` (qui devient nil si elle est vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/textures.lua:572
---@param filepath string Chemin du fichier supprimé.
function editor_dynamicDecals_textures.dynamicDecals_onTextureFileDeleted(filepath) end

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/textures.lua:257
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_textures.editorPreferenceValueChanged(path, value) end

--- Renvoie le dossier des textures de decals (délègue à editor_api_dynamicDecals_textures).
---Source : lua/ge/extensions/editor/dynamicDecals/textures.lua:585
---@return string  Chemin du dossier de textures.
function editor_dynamicDecals_textures.getTexturesDirectoryPath() end

--- Enregistre la sous-catégorie `dynamicDecalsTool.textureBrowser` (loadImagesPerFrameCount, enableVirtualScrolling, texturePreviewSize).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/textures.lua:249
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_textures.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère les modules liés, enregistre les onglets Textures et Tags, la page de doc « Browser / Textures » et l'inspecteur du type dynamicDecalTexture, crée le dossier des textures, initialise l'API de textures et notifie les fichiers de métadonnées manquants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/textures.lua:492
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_textures.setup(tool_in) end

