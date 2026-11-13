---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/burn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Verrouillage (« burn » = lock) d'une Master Spline de l'éditeur. Une Master Spline possède une pile de splines enfants liées (mesh, assembly, road, tree, decal) ; la verrouiller verrouille aussi tous ses enfants : ils restent dans leurs outils, non modifiables, et leur contenu généré est sauvegardé avec le niveau. Le déverrouillage rend tout éditable.
--- Accès : extension `editor_masterSpline_burn` : `extensions.load("editor_masterSpline_burn")`, puis la globale `editor_masterSpline_burn`
---@class editor_masterSpline_burn
editor_masterSpline_burn = {}

--- Action du bouton Burn : verrouille la Master Spline d'indice idx (équivaut à setLocked(idx, true)).
---Source : lua/ge/extensions/editor/masterSpline/burn.lua:56
---@param idx integer Indice de la Master Spline dans la liste (à partir de 1).
function editor_masterSpline_burn.run(idx) end

--- Verrouille ou déverrouille la Master Spline d'indice idx, avec tous ses enfants liés, en une seule transaction annulable. Ne fait rien si l'indice est invalide.
---Source : lua/ge/extensions/editor/masterSpline/burn.lua:47
---@param idx integer Indice de la Master Spline dans la liste (à partir de 1).
---@param isLocked boolean true pour verrouiller, false pour déverrouiller.
function editor_masterSpline_burn.setLocked(idx, isLocked) end

