---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de calque « Group » de l'outil Dynamic Decals : un calque conteneur qui regroupe d'autres calques ; le désactiver masque tous ses enfants. Ce module ajoute le bouton « Add group » dans la barre d'outils (api.addGroup), enregistre une GUI d'inspecteur vide pour ce type et la page de documentation « Layer Types / Group Layers ».
--- Accès : extension `editor_dynamicDecals_layerTypes_group` : `extensions.load("editor_dynamicDecals_layerTypes_group")`, puis la globale `editor_dynamicDecals_layerTypes_group`
---@class editor_dynamicDecals_layerTypes_group
editor_dynamicDecals_layerTypes_group = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua:37
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_layerTypes_group.editorPreferenceValueChanged(path, value) end

--- Fonction vide (section non utilisée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua:27
---@param guiId string Suffixe d'identifiant ImGui (non utilisé).
function editor_dynamicDecals_layerTypes_group.onGui(guiId) end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua:31
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_layerTypes_group.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : enregistre la GUI d'inspecteur du type group, l'élément de barre d'outils « group » (ordre 30) et la page de documentation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua:52
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_layerTypes_group.setup(tool_in) end

