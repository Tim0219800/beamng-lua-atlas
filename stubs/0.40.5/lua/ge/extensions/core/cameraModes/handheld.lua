---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/handheld.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filtre à ressort sur la direction de visée.
---@class core_cameraModes_handheld
local core_cameraModes_handheld = {}

--- Initialise les paramètres du ressort et force une réinitialisation de la direction au prochain update.
---Source : lua/ge/extensions/core/cameraModes/handheld.lua:8
---@param spring number|nil raideur (20 par défaut)
---@param damping number|nil amortissement (5 par défaut)
---@param rotspring number|nil raideur de l'inclinaison de l'horizon (3 par défaut)
function core_cameraModes_handheld:init(spring, damping, rotspring) end

--- Calcule data.res.rot depuis la direction lissée de data.res.pos vers data.res.targetPos.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/handheld.lua:18
---@param data table camData
---@return boolean  toujours true
function core_cameraModes_handheld:update(data) end

