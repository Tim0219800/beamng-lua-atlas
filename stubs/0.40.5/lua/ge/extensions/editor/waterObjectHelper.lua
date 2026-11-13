---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/waterObjectHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite extension de l'éditeur de monde : quand on modifie dans l'inspecteur un champ de texture d'un objet d'eau, elle recharge les textures de l'objet. Elle ne réagit qu'aux champs rippleTex, foamTex, depthGradientTex et cubemap, et uniquement pour les objets de classe WaterObject.
--- Accès : extension `editor_waterObjectHelper` : `extensions.load("editor_waterObjectHelper")`, puis la globale `editor_waterObjectHelper`
---@class editor_waterObjectHelper
editor_waterObjectHelper = {}

--- Hook de l'éditeur appelé quand un champ de l'inspecteur change. Pour chaque id sélectionné, si le champ est rippleTex, foamTex, depthGradientTex ou cubemap et que l'objet est un WaterObject, appelle object:reloadTextures().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/waterObjectHelper.lua:7
---@param selectedIds table<integer, integer> ids des objets sélectionnés
---@param fieldName string nom du champ modifié
---@param fieldValue any nouvelle valeur (non utilisée)
---@param arrayIndex integer|nil indice dans le tableau pour un champ tableau (non utilisé)
function editor_waterObjectHelper.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

