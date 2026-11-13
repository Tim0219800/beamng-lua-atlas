---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/helper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petites fonctions utilitaires ImGui et de chaînes partagées par les sections de l'outil Dynamic Decals : texte centré, aperçu d'image avec sa taille, info-bulle d'image ou d'icône, mise en forme de noms camelCase. Utile à un moddeur qui écrit une section ou un widget pour cet outil.
--- Accès : extension `editor_dynamicDecals_helper` : `extensions.load("editor_dynamicDecals_helper")`, puis la globale `editor_dynamicDecals_helper`
---@class editor_dynamicDecals_helper
editor_dynamicDecals_helper = {}

--- Met la première lettre de chaque mot en majuscule et le reste en minuscules.
---Source : lua/ge/extensions/editor/dynamicDecals/helper.lua:60
---@param str string Chaîne source.
---@return string  Chaîne formatée (suivie du nombre de substitutions).
function editor_dynamicDecals_helper.capitalizeWords(str) end

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/helper.lua:72
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_helper.editorPreferenceValueChanged(path, value) end

--- Dessine une icône « info » avec une info-bulle contenant le message.
---Source : lua/ge/extensions/editor/dynamicDecals/helper.lua:44
---@param msg string Texte de l'info-bulle.
---@param inline boolean|nil Si vrai, place l'icône sur la même ligne que l'élément précédent.
function editor_dynamicDecals_helper.iconTooltip(msg, inline) end

--- Si l'élément ImGui précédent est survolé, affiche une info-bulle avec l'image et sa taille. Largeur par défaut : préférence `dynamicDecalsTool.imageTooltip.texturePreviewSize`.
---Source : lua/ge/extensions/editor/dynamicDecals/helper.lua:32
---@param path string Chemin de la texture.
---@param overrideTooltipWidth number|nil Largeur de l'aperçu en pixels.
function editor_dynamicDecals_helper.imageTooltip(path, overrideTooltipWidth) end

--- Affiche une image (teintée avec la couleur BeamNG de l'éditeur) à la largeur donnée en respectant le ratio, suivie de sa taille « L x H ».
---Source : lua/ge/extensions/editor/dynamicDecals/helper.lua:24
---@param path string Chemin de la texture.
---@param overrideWidth number|nil Largeur en pixels ; par défaut toute la largeur disponible.
function editor_dynamicDecals_helper.imageWidget(path, overrideWidth) end

--- Enregistre la préférence float `dynamicDecalsTool.imageTooltip.texturePreviewSize` (défaut 128, de 32 à 512).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/helper.lua:66
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_helper.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : mémorise la référence à l'outil (nécessaire pour iconTooltip, qui utilise tool.getIconSize()).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/helper.lua:76
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_helper.setup(tool_in) end

--- Transforme une chaîne camelCase en mots séparés par des espaces avec majuscule initiale (ex. « brushStroke » donne « Brush Stroke »).
---Source : lua/ge/extensions/editor/dynamicDecals/helper.lua:52
---@param str string Chaîne camelCase.
---@return string  Chaîne formatée (suivie du nombre de substitutions du dernier gsub).
function editor_dynamicDecals_helper.splitAndCapitalizeCamelCase(str) end

--- Comme textUnformattedCentered mais avec une couleur ImGui.
---Source : lua/ge/extensions/editor/dynamicDecals/helper.lua:18
---@param color ImVec4 Couleur du texte.
---@param string_label string|nil Texte à afficher.
function editor_dynamicDecals_helper.textColoredCentered(color, string_label) end

--- Affiche un texte brut centré horizontalement dans la zone disponible. Ne fait rien si le texte est nil.
---Source : lua/ge/extensions/editor/dynamicDecals/helper.lua:12
---@param string_label string|nil Texte à afficher.
function editor_dynamicDecals_helper.textUnformattedCentered(string_label) end

