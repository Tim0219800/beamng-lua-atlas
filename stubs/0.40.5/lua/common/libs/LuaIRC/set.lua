---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaIRC/set.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ensemble de connexions IRC.
---@class libs_LuaIRC_set_set
local libs_LuaIRC_set_set = {}

--- Ajoute une connexion (sa socket est ajoutée à la liste surveillée).
---Source : lua/common/libs/LuaIRC/set.lua:20
---@param connection table Connexion IRC avec champ socket
function libs_LuaIRC_set_set:add(connection) end

--- Comme select, mais en cas de timeout renvoie toutes les connexions (pour qu'elles puissent faire leur travail périodique).
---Source : lua/common/libs/LuaIRC/set.lua:53
---@return table  Connexions à traiter
function libs_LuaIRC_set_set:poll() end

--- Retire une connexion de l'ensemble.
---Source : lua/common/libs/LuaIRC/set.lua:28
---@param connection table Connexion à retirer
function libs_LuaIRC_set_set:remove(connection) end

--- Appelle socket.select sur les sockets avec self.timeout et renvoie la liste des connexions prêtes à lire.
---Source : lua/common/libs/LuaIRC/set.lua:40
---@return table|nil  Connexions prêtes en lecture
---@return string|nil  Erreur (ex. "timeout")
function libs_LuaIRC_set_set:select() end

--- Transforme la table t en ensemble (champs connections et sockets créés vides, métatable set).
---Source : lua/common/libs/LuaIRC/set.lua:14
---@param t table Table de configuration, ex. {timeout = 1}
---@return table  L'ensemble
function new(t) end

