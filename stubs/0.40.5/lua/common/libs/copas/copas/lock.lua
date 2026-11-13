---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/lock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module de la bibliothèque tierce Copas : verrou (mutex) entre coroutines Copas. Une coroutine qui demande un verrou déjà pris cède la main jusqu'à ce qu'il soit libéré ou que le délai expire. Par défaut le verrou est ré-entrant et le délai de 10 s. Le module renvoie la table lock.
--- Accès : `require("libs/copas/copas/lock")`
---@class libs_copas_copas_lock
---@field __index table Métatable des objets verrou (lock lui-même).
local libs_copas_copas_lock = {}

--- Acquiert le verrou ; cède la main tant qu'une autre coroutine le possède. Avec timeout = 0, retourne immédiatement sans céder.
---Source : lua/common/libs/copas/copas/lock.lua:99
---@param self table Le verrou (appel lock:get)
---@param timeout number|nil Délai en secondes, prioritaire sur celui de new
---@return number|nil  Temps d'attente en cas de succès, sinon nil
---@return string|nil  Erreur : timeout, destroyed ou lock is not re-entrant
---@return number|nil  Temps d'attente en cas d'échec
function libs_copas_copas_lock.get(self, timeout) end

--- Crée un verrou.
---Source : lua/common/libs/copas/copas/lock.lua:19
---@param seconds number|nil Délai par défaut d'acquisition en secondes (défaut 10)
---@param not_reentrant boolean|nil Si vrai, une coroutine ne peut pas reprendre un verrou qu'elle possède déjà
---@return table  Le verrou
function libs_copas_copas_lock.new(seconds, not_reentrant) end

--- Libère le verrou détenu par la coroutine courante.
---Source : lua/common/libs/copas/copas/lock.lua:153
---@param self table Le verrou (appel lock:release)
---@return boolean|nil  true si libéré
---@return string|nil  Message d'erreur
function libs_copas_copas_lock.release(self) end

return libs_copas_copas_lock
