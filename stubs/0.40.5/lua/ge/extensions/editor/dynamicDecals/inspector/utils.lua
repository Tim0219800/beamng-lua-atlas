---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Widgets ImGui réutilisables par les GUI de calques de l'inspecteur Dynamic Decals : sélecteur de texture (champ en lecture seule, bouton dossier, bouton de remise à zéro, aperçu, dépôt par glisser-déposer) et éditeur de dégradé à quatre coins pour un calque decal. Chaque modification appelle api.setLayer(layer, true). Dépend de editor_api_dynamicDecals.
--- Accès : extension `editor_dynamicDecals_inspector_utils` : `extensions.load("editor_dynamicDecals_inspector_utils")`, puis la globale `editor_dynamicDecals_inspector_utils`
---@class editor_dynamicDecals_inspector_utils
---@field dependencies string[] Extensions chargées avant celle-ci : {"editor_api_dynamicDecals"}.
editor_dynamicDecals_inspector_utils = {}

--- Dessine un carré dégradé à quatre coins avec un sélecteur de couleur RGBA à chaque coin ; met à jour les propriétés decalGradientColor* du calque.
---Source : lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:56
---@param k any Non utilisé dans le corps de la fonction.
---@param layer table Calque decal contenant les quatre couleurs de dégradé.
---@param guiId string Suffixe d'identifiant ImGui.
function editor_dynamicDecals_inspector_utils.decalColorGradientWidgetInspect(k, layer, guiId) end

--- Dessine un sélecteur de texture pour layer[property] : chemin en lecture seule, ouverture d'une boîte de fichier (png/jpg/jpeg, dossier par défaut /art/decals/dynDecals/), suppression, aperçu et zone de dépôt. Affecte layer[property] puis appelle api.setLayer(layer, true).
---Source : lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:17
---@param layer table Données du calque.
---@param property string Nom du champ contenant le chemin de texture.
---@param guiId string Suffixe d'identifiant ImGui.
---@param removeTextureOverridePath string|nil Valeur mise dans la propriété par le bouton supprimer ; défaut « / ».
function editor_dynamicDecals_inspector_utils.decalTextureWidgetInspect(layer, property, guiId, removeTextureOverridePath) end

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:136
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_inspector_utils.editorPreferenceValueChanged(path, value) end

--- Fonction vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:126
function editor_dynamicDecals_inspector_utils.onGui() end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:130
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_inspector_utils.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : mémorise l'outil et l'API.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua:140
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_inspector_utils.setup(tool_in) end

