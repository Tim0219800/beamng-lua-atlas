---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionLabels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit utilitaire de l'outil Easy Select : calcule le texte affiché pour nommer un objet de la scène. Priorité : nom de l'objet, nom interne, nom du fichier d'asset (champ shapeName ou getModelFile), sinon « Classe #id ». Un préfixe indique le type : [p] Prefab/PrefabInstance, [s] TSStatic, [v] BeamNGVehicle.
--- Accès : extension `editor_ezObjectSelect_selectionLabels` : `extensions.load("editor_ezObjectSelect_selectionLabels")`, puis la globale `editor_ezObjectSelect_selectionLabels`
---@class editor_ezObjectSelect_selectionLabels
editor_ezObjectSelect_selectionLabels = {}

--- Renvoie le libellé d'un objet. Si objectId est fourni, l'objet est retrouvé via scenetree.findObjectById ; s'il n'existe plus, renvoie « deleted #id » (ou « missing » si aucun id).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionLabels.lua:29
---@param obj userdata|nil Objet de la scène (ignoré si objectId est donné)
---@param objectId integer|nil Id de l'objet à retrouver dans scenetree
---@return string  Libellé, éventuellement préfixé par [p], [s] ou [v]
function editor_ezObjectSelect_selectionLabels.objectName(obj, objectId) end

