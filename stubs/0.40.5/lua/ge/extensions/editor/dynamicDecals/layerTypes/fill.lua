---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de calque « Fill » de l'outil Dynamic Decals : remplit tout le véhicule avec une couleur unie, utile comme base d'un design. Fournit la fenêtre « Add Fill Layer » (palette de couleur + couleur, OK appelle api.addFillLayer puis ajoute la couleur à l'historique), le bouton de barre d'outils (ordre 10), la GUI d'inspecteur du type fill et la page de documentation.
--- Accès : extension `editor_dynamicDecals_layerTypes_fill` : `extensions.load("editor_dynamicDecals_layerTypes_fill")`, puis la globale `editor_dynamicDecals_layerTypes_fill`
---@class editor_dynamicDecals_layerTypes_fill
editor_dynamicDecals_layerTypes_fill = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua:125
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_layerTypes_fill.editorPreferenceValueChanged(path, value) end

--- Ouvre la fenêtre « Add Fill Layer ».
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua:129
function editor_dynamicDecals_layerTypes_fill.openAddLayerWindow() end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua:119
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_layerTypes_fill.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère les modules liés, enregistre la fenêtre d'ajout (360x140), le dessin de cette fenêtre, la GUI d'inspecteur du type fill, l'élément de barre d'outils « fill » et la page de documentation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua:143
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_layerTypes_fill.setup(tool_in) end

