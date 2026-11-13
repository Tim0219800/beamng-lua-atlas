---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerTypes/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de calque « Path » de l'outil Dynamic Decals : des decals posés le long d'un chemin (points de contrôle interpolés en linéaire ou en courbe de Bézier), éventuellement orientés selon la courbure, ou remplacés par les caractères d'un texte avec une police (atlas généré par le module fonts). Fournit la section « Path Properties » (orientation, type de chemin, police, texte, étapes d'interpolation ; ordre 80), la GUI d'inspecteur du type path, des boutons de barre d'actions « Finish path layer » et « Remove last path layer data point » (visibles seulement pendant la création d'un chemin) et les pages de doc.
--- Accès : extension `editor_dynamicDecals_layerTypes_path` : `extensions.load("editor_dynamicDecals_layerTypes_path")`, puis la globale `editor_dynamicDecals_layerTypes_path`
---@class editor_dynamicDecals_layerTypes_path
editor_dynamicDecals_layerTypes_path = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/path.lua:718
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_layerTypes_path.editorPreferenceValueChanged(path, value) end

--- Ne déclare aucune préférence (corps commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/path.lua:712
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_layerTypes_path.registerEditorPreferences(prefsRegistry) end

--- Appelé par l'outil : récupère les modules liés (dont fonts), enregistre la section « Path Properties » (avec bouton d'aide), la GUI d'inspecteur du type path, l'élément de barre d'actions « path layer » (ordre 40) et les pages de documentation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerTypes/path.lua:769
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_layerTypes_path.setup(tool_in) end

