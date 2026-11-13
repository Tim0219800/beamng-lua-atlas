---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/kerbSpec.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section unique de bordure (kerb) et de trottoir (footway) à laquelle tous les outils de l'éditeur construisent, et pierre dont elles sont taillées. Les dimensions vivent ici pour qu'une voiture ressente le même ressaut sur une rue, un parking, un pont ou une place. Donne aussi les lignes de texture d'une variante de bordure.
--- Accès : extension `editor_toolUtilities_kerbSpec` : `extensions.load("editor_toolUtilities_kerbSpec")`, puis la globale `editor_toolUtilities_kerbSpec`
---@class editor_toolUtilities_kerbSpec
---@field spec table Dimensions et matériaux : slabW, slabThick, kerbW, kerbH, buryM, slabMaterial, kerbMaterial.
editor_toolUtilities_kerbSpec = {}

--- Renvoie les trois lignes V de la texture occupées par une variante de bordure : le dos de la marche, l'arête et le pied de la face. La variante est tronquée à l'entier et bornée à 0..4 ; une valeur non numérique donne 0.
---Source : lua/ge/extensions/editor/toolUtilities/kerbSpec.lua:35
---@param variant integer|nil Indice de variante, 0 à 4.
---@return number  Rangée du dos de la marche (variante * 0.2).
---@return number  Rangée de l'arête (+0.1).
---@return number  Rangée du pied de la face (+0.2 moins un petit écart de 0.00332).
function editor_toolUtilities_kerbSpec.kerbRows(variant) end

