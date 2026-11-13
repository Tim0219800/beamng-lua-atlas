---@meta
-- tim19Atlas stub generated from lua/ge/client/postFx.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("client/postFx")`
---@class client_postFx
local client_postFx = {}

--- Restores the shipped default values for every effect that exposes them, then re-applies
---  the resulting state to the scene objects.
---Source : lua/ge/client/postFx.lua:133
function client_postFx.applyDefaults() end

---Source : lua/ge/client/postFx.lua:84
function client_postFx.initPostEffects() end

---Source : lua/ge/client/postFx.lua:103
function client_postFx.reloadPostEffects() end

--- Classe locale `postEffectCallbacks` de lua/ge/client/postFx.lua
---@class client_postFx_postEffectCallbacks
local client_postFx_postEffectCallbacks = {}

---Source : lua/ge/client/postFx.lua:125
function client_postFx_postEffectCallbacks.onEnabled() end

return client_postFx
