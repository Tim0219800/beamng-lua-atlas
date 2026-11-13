---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de calque « Decal » de l'outil Dynamic Decals, le plus important : un decal unique avec couleur, textures (color, alpha, metallic, normal, roughness), échelle, rotation, skew, UV, masque alpha, miroir, dégradé et propriétés SDF (Signed Distance Fields : contours, adoucissement). Fournit la section « Decal Properties » (réglages du decal courant, ordre 60), la GUI d'inspecteur du type decal, la fenêtre d'introduction SDF, la fenêtre de choix d'un caractère de police et les pages de documentation (Decal Layers, Properties, SDF).
--- Accès : extension `editor_dynamicDecals_layerTypes_decal` : `extensions.load("editor_dynamicDecals_layerTypes_decal")`, puis la globale `editor_dynamicDecals_layerTypes_decal`
---@class editor_dynamicDecals_layerTypes_decal
editor_dynamicDecals_layerTypes_decal = {}

--- Si la texture couleur courante est compatible SDF, affiche la fenêtre d'introduction SDF (sauf si elle a été fermée ou si la préférence doNotShowSdfIntroAgain est vraie).
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:77
function editor_dynamicDecals_layerTypes_decal.checkColorDecalTexturesSdfCompatible() end

--- Appelé à chaque frame par le mode d'édition (via tool.registerEditorOnUpdateFn) : décompte le minuteur de mise en évidence des propriétés SDF.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1154
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function editor_dynamicDecals_layerTypes_decal.editModeUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1146
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_layerTypes_decal.editorPreferenceValueChanged(path, value) end

--- Ferme la fenêtre d'introduction SDF.
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1247
function editor_dynamicDecals_layerTypes_decal.hideSdfIntroWindow() end

--- Indique si la texture donnée est compatible SDF, d'après son fichier de métadonnées.
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:67
---@param texturePath string|nil Chemin de la texture ; par défaut la texture couleur courante du decal (api.getDecalTexturePath("color")).
---@return boolean  true si la métadonnée isSdfCompatible est vraie.
function editor_dynamicDecals_layerTypes_decal.isTexturesSdfCompatible(texturePath) end

--- Enregistre `dynamicDecalsTool.decalProperties` : scaleStep (float 0.025, de 0.001 à 0.25), rotationStep (float 15 degrés, de 1 à 360), texturePreviewSize (float 128, de 32 à 512), doNotShowSdfIntroAgain (bool false) ; et `dynamicDecalsTool.inspector.applyMirroredPropertyToChildren` (bool true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1134
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_layerTypes_decal.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère les modules liés, enregistre les fenêtres (SDF 400x400, caractère de police 550x550), la section « Decal Properties », les callbacks d'update et de GUI, la GUI d'inspecteur du type decal, les pages de documentation et la liste des blend modes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1211
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_layerTypes_decal.setup(tool_in) end

--- Ouvre la fenêtre « Dynamic Decals - SDF Introduction ».
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua:1246
function editor_dynamicDecals_layerTypes_decal.showSdfIntroWindow() end

