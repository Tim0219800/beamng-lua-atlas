---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/layerStack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « Decal Stack / Layers » (ordre 140) de l'outil Dynamic Decals : liste hiérarchique de tous les calques du design, avec icône colorée par type, sélection (via le module selection), activation, duplication, suppression, édition de masque, miroir et réorganisation par glisser-déposer (changement d'ordre et de parent, dans des groupes). L'ordre d'affichage est configurable (haut vers bas ou bas vers haut).
--- Accès : extension `editor_dynamicDecals_layerStack` : `extensions.load("editor_dynamicDecals_layerStack")`, puis la globale `editor_dynamicDecals_layerStack`
---@class editor_dynamicDecals_layerStack
editor_dynamicDecals_layerStack = {}

--- Hook appelé quand une préférence change. Ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerStack.lua:805
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_dynamicDecals_layerStack.editorPreferenceValueChanged(path, value) end

--- Enregistre la sous-catégorie `dynamicDecalsTool.layerStack` : topToBottomLayerStructure et layerTypeIconColor (avec un éditeur graphique de couleurs par type).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerStack.lua:787
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_dynamicDecals_layerStack.registerEditorPreferences(prefsRegistry) end

--- Fonction vide, sans effet (point d'extension prévu pour des éléments d'interface de calque).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerStack.lua:840
function editor_dynamicDecals_layerStack.registerLayerElementGui() end

--- Appelé par l'outil : récupère l'API et les modules (fill, textureFill, gizmo, selection, helper, docs), enregistre la section « Decal Stack / Layers » (ordre 140, ouverte par défaut) et la page de documentation « Layer Stack ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dynamicDecals/layerStack.lua:821
---@param tool_in table Référence à l'outil editor_dynamicDecalsTool.
function editor_dynamicDecals_layerStack.setup(tool_in) end

