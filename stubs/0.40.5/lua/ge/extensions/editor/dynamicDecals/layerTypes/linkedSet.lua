---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de calque « Linked Set » de l'outil Dynamic Decals : se comporte comme un groupe, mais on peut lui ajouter dans l'inspecteur des propriétés (parmi api.properties) avec une valeur. Le bouton « Apply » propage récursivement ces valeurs à tous les calques enfants qui possèdent la propriété, quel que soit leur type. Le bouton de barre d'outils (ordre 40) appelle api.addLinkedSet.
--- Accès : extension `editor_dynamicDecals_layerTypes_linkedSet` : `extensions.load("editor_dynamicDecals_layerTypes_linkedSet")`, puis la globale `editor_dynamicDecals_layerTypes_linkedSet`
---@class editor_dynamicDecals_layerTypes_linkedSet
editor_dynamicDecals_layerTypes_linkedSet = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua:184
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_layerTypes_linkedSet.editorPreferenceValueChanged(path, value) end

--- Fonction vide (section non utilisée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua:174
---@param guiId string Suffixe d'identifiant ImGui (non utilisé).
function editor_dynamicDecals_layerTypes_linkedSet.onGui(guiId) end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua:178
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_layerTypes_linkedSet.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère les modules liés, enregistre la GUI d'inspecteur du type linkedSet, l'élément de barre d'outils « linkedSet » et la page de documentation « Layer Types / Linked Set Layers ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/linkedSet.lua:202
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_layerTypes_linkedSet.setup(tool_in) end

