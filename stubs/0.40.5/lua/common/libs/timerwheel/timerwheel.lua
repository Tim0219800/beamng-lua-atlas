---@meta
-- tim19Atlas stub generated from lua/common/libs/timerwheel/timerwheel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce timerwheel (roue de minuteries, issue de l'écosystème Kong/lua-resty) : minuteries de type timeout avec insertion, annulation et exécution en O(1), au prix d'une précision limitée (taille d'un créneau). Le module ne fournit pas de boucle : l'appelant doit appeler `wheel:step()` régulièrement (au moins toutes les `precision` secondes), par exemple depuis onUpdate.
--- Accès : `require("libs/timerwheel/timerwheel")`
---@class libs_timerwheel_timerwheel
local libs_timerwheel_timerwheel = {}

--- Crée une roue de minuteries et renvoie l'objet `wheel` (méthodes step, count, set, cancel, peek). Valide les options par assertions.
---Source : lua/common/libs/timerwheel/timerwheel.lua:59
---@param opts table|nil Options : precision (secondes par créneau, défaut 0.050), ringsize (créneaux par anneau, entier > 0, défaut 72000 = 1 h), now (fonction renvoyant l'heure en secondes), err_handler (gestionnaire d'erreur du xpcall).
---@return table  Objet roue.
function libs_timerwheel_timerwheel.new(opts) end

--- Objet renvoyé par new(opts). Les méthodes s'appellent avec les deux-points.
---@class libs_timerwheel_timerwheel_wheel
local libs_timerwheel_timerwheel_wheel = {}

--- Annule une minuterie.
---Source : lua/common/libs/timerwheel/timerwheel.lua:dyn
---@param id integer Identifiant renvoyé par set.
---@return boolean  true si annulée, false si introuvable.
function libs_timerwheel_timerwheel_wheel:cancel(id) end

--- Nombre de minuteries en attente.
---Source : lua/common/libs/timerwheel/timerwheel.lua:dyn
---@return integer  Nombre de minuteries.
function libs_timerwheel_timerwheel_wheel:count() end

--- Cherche la prochaine minuterie à échoir (parcours O(n)).
---Source : lua/common/libs/timerwheel/timerwheel.lua:dyn
---@param max_ahead number|nil Horizon maximal de recherche en secondes.
---@return number|nil  Secondes avant la prochaine échéance (peut être négatif), ou nil s'il n'y en a pas.
function libs_timerwheel_timerwheel_wheel:peek(max_ahead) end

--- Programme une minuterie qui appellera cb(arg) dans `expire_in` secondes. Lève une erreur si `cb` est nil.
---Source : lua/common/libs/timerwheel/timerwheel.lua:dyn
---@param expire_in number Délai en secondes.
---@param cb function Callback, exécuté dans un xpcall.
---@param arg any Argument transmis au callback.
---@return integer  Identifiant (négatif) de la minuterie, pour cancel.
function libs_timerwheel_timerwheel_wheel:set(expire_in, cb, arg) end

--- Vérifie et exécute les minuteries échues. À appeler régulièrement par votre boucle (au moins toutes les `precision` secondes).
---Source : lua/common/libs/timerwheel/timerwheel.lua:dyn
---@return boolean  Toujours true.
function libs_timerwheel_timerwheel_wheel:step() end

return libs_timerwheel_timerwheel
