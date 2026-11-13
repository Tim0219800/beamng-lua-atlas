---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recceSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet de réglages renvoyé par le constructeur.
---@class gameplay_rally_recceSettings
local gameplay_rally_recceSettings = {}

--- Remet last_mission_ids, last_load_states et corner_call_style_name aux valeurs par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:23
function gameplay_rally_recceSettings:_reset() end

--- Liste des noms de styles d'annonce de virage disponibles.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:90
---@return string[]  Noms des styles
function gameplay_rally_recceSettings:cornerCallStyleNames() end

--- Nom du premier style de pacenoteStyles des angles de virage, ou la valeur par défaut (nil) si aucune donnée.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:79
---@return string|nil  Nom du style
function gameplay_rally_recceSettings:defaultCornerCallStyleName() end

--- Renvoie la table du style correspondant au nom actuel dans pacenoteStyles.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:128
---@return table|nil  Style, ou nil si introuvable
function gameplay_rally_recceSettings:getCornerCallStyle() end

--- Nom du style d'annonce des virages actuel.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:125
---@return string|nil  Nom du style
function gameplay_rally_recceSettings:getCornerCallStyleName() end

--- Dernier état de chargement pour un niveau.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:117
---@param level string Nom du niveau
---@return any  État mémorisé ou nil
function gameplay_rally_recceSettings:getLastLoadState(level) end

--- Dernier id de mission pour un niveau.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:109
---@param level string Nom du niveau
---@return string|nil  Id de mission
function gameplay_rally_recceSettings:getLastMissionId(level) end

--- Définit le chemin du fichier (recce.json) et remet les valeurs par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:17
function gameplay_rally_recceSettings:init() end

--- Remet à zéro, charge les angles de virage puis lit recce.json et le désérialise.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:38
---@return boolean  false si le chemin est nil, le fichier absent ou illisible
function gameplay_rally_recceSettings:load() end

--- Charge les données d'angles de virage via rallyUtil.loadCornerAnglesFile ; corner_angles_data reste nil en cas d'échec.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:29
function gameplay_rally_recceSettings:loadCornerAngles() end

--- Applique les données lues du fichier ; les champs absents prennent leur valeur par défaut (style : premier style disponible).
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:98
---@param data table|nil Contenu du JSON
function gameplay_rally_recceSettings:onDeserialized(data) end

--- Renvoie la table à sauvegarder (last_mission_ids, last_load_states, corner_call_style_name).
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:69
---@return table  Données sérialisables
function gameplay_rally_recceSettings:onSerialize() end

--- Écrit les réglages sérialisés dans recce.json (jsonWriteFile, joli format).
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:64
function gameplay_rally_recceSettings:save() end

--- Définit le style d'annonce des virages et sauvegarde.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:121
---@param style_name string Nom du style
function gameplay_rally_recceSettings:setCornerCallStyleName(style_name) end

--- Mémorise le dernier état de chargement pour un niveau et sauvegarde.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:113
---@param level string Nom du niveau
---@param state any État à mémoriser (déduit du code : valeur libre)
function gameplay_rally_recceSettings:setLastLoadState(level, state) end

--- Mémorise l'id de la dernière mission pour un niveau et sauvegarde.
---Source : lua/ge/extensions/gameplay/rally/recceSettings.lua:105
---@param level string Nom du niveau
---@param id string Id de mission
function gameplay_rally_recceSettings:setLastMissionId(level, id) end

