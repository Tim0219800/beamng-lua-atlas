---@meta
-- tim19Atlas stub generated from lua/common/luaCore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fonction qui ne fait rien (valeur par défaut pour des callbacks).
---Source : lua/common/luaCore.lua:41
function nop() end

--- Fait require(module) dans un pcall : renvoie le module, ou nil si le chargement échoue (module absent ou erreur dans le module).
---Source : lua/common/luaCore.lua:8
---@param module string nom du module
---@return any|nil  module ou nil
function require_optional(module) end

--- Force le rechargement d'un fichier : vide package.loaded[module] puis fait require. Journalise un avertissement si le module est falsy après chargement.
---Source : lua/common/luaCore.lua:21
---@param module string nom du module
---@return any  module rechargé
function rerequire(module) end

--- Décharge un module : supprime package.loaded[m] et la globale du même nom.
---Source : lua/common/luaCore.lua:15
---@param m string nom du module
function unrequire(m) end

---@type any
ffi = nil
