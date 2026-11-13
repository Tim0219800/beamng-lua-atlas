---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/colorPresets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « Color Presets » de l'outil Dynamic Decals. Liste des couleurs nommées stockées dans la préférence `dynamicDecalsTool.colorPresets.presets` (environ 42 par défaut : « iconic oraNGe », Aquamarine, Burgundy, Jet Black…). Chaque entrée {name, value={r,g,b,a}} peut être éditée, renommée, supprimée, filtrée par nom, et appliquée comme couleur de decal ou de fill layer.
--- Accès : extension `editor_dynamicDecals_colorPresets` : `extensions.load("editor_dynamicDecals_colorPresets")`, puis la globale `editor_dynamicDecals_colorPresets`
---@class editor_dynamicDecals_colorPresets
editor_dynamicDecals_colorPresets = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/colorPresets.lua:152
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_colorPresets.editorPreferenceValueChanged(path, value) end

--- Dessine le filtre de recherche, la liste des presets (widget couleur, nom, boutons supprimer / appliquer comme couleur de decal via api.setDecalColor / appliquer comme couleur de fill layer via api.setFillLayerColor) et le bouton d'ajout. Sert à la fois de contenu de section et d'éditeur de la préférence `presets`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/colorPresets.lua:30
---@param guiId string Suffixe pour des identifiants ImGui uniques.
function editor_dynamicDecals_colorPresets.onGui(guiId) end

--- Enregistre la sous-catégorie `dynamicDecalsTool.colorPresets` avec la table `presets` (liste par défaut de couleurs nommées) et son éditeur graphique (onGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/colorPresets.lua:101
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_colorPresets.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère l'API et docs, enregistre la section « Color Presets » (ordre 121) et sa page de documentation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/colorPresets.lua:169
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_colorPresets.setup(tool_in) end

