---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/semaphore.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module de la bibliothèque tierce Copas : sémaphore à compteur pour coroutines Copas. take demande des ressources (et attend si elles manquent), give en rend. Le module renvoie la table semaphore.
--- Accès : `require("libs/copas/copas/semaphore")`
---@class libs_copas_copas_semaphore
---@field __index table Métatable des objets sémaphore.
local libs_copas_copas_semaphore = {}

--- Nombre de ressources actuellement disponibles.
---Source : lua/common/libs/copas/copas/semaphore.lua:154
---@param self table Le sémaphore
---@return integer  Compteur
function libs_copas_copas_semaphore.get_count(self) end

--- Manque total de ressources demandées par les coroutines en attente.
---Source : lua/common/libs/copas/copas/semaphore.lua:159
---@param self table Le sémaphore
---@return integer  Déficit total
function libs_copas_copas_semaphore.get_wait(self) end

--- Rend des ressources au sémaphore (et réveille les coroutines en attente).
---Source : lua/common/libs/copas/copas/semaphore.lua:44
---@param self table Le sémaphore
---@param given integer|nil Nombre de ressources (défaut 1)
---@return boolean|nil  true en cas de succès
---@return string|nil  "too many" si le maximum est dépassé (le compteur est plafonné)
function libs_copas_copas_semaphore.give(self, given) end

--- Crée un sémaphore.
---Source : lua/common/libs/copas/copas/semaphore.lua:17
---@param max integer Nombre maximal de ressources (doit être supérieur à 0)
---@param start integer|nil Ressources disponibles au départ (défaut 0)
---@param seconds number|nil Timeout par défaut en secondes (défaut 10)
---@return table  Le sémaphore
function libs_copas_copas_semaphore.new(max, start, seconds) end

--- Demande des ressources ; attend (en cédant la main) tant qu'il n'y en a pas assez. Avec timeout = 0, réussit ou échoue tout de suite avec « timeout ».
---Source : lua/common/libs/copas/copas/semaphore.lua:111
---@param self table Le sémaphore
---@param requested integer|nil Nombre demandé (défaut 1)
---@param timeout number|nil Délai en secondes (défaut : celui du sémaphore)
---@return boolean|nil  true en cas de succès
---@return string|nil  Erreur, ex. "timeout"
function libs_copas_copas_semaphore.take(self, requested, timeout) end

return libs_copas_copas_semaphore
