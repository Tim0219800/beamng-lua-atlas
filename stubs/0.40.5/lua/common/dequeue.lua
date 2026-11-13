---@meta
-- tim19Atlas stub generated from lua/common/dequeue.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- File à double extrémité (deque) : on peut ajouter et retirer des éléments au début comme à la fin. Bibliothèque de Pierre Chapuis (licence MIT en en-tête). Utile pour des historiques ou tampons glissants. L'objet est une table indexée par des entiers entre head+1 et tail.
--- Accès : `require("dequeue")`
---@class dequeue
local dequeue = {}

--- Crée une deque vide, ou transforme la table fournie en deque.
---Source : lua/common/dequeue.lua:157
---@param data table|nil Table existante à réutiliser (peut contenir head/tail).
---@return table  Objet deque.
function dequeue.new(data) end

--- Objet renvoyé par new. Champs : head, tail, _serialize.
---@class dequeue_deque
local dequeue_deque = {}

--- Copie le contenu dans un tableau ordonné de 1 à length().
---Source : lua/common/dequeue.lua:dyn
---@return table  Tableau des éléments.
function dequeue_deque:contents() end

--- Indique si la file est vide.
---Source : lua/common/dequeue.lua:dyn
---@return boolean  true si vide.
function dequeue_deque:is_empty() end

--- Itérateur du début vers la fin.
---Source : lua/common/dequeue.lua:dyn
---@return function  Itérateur (for x in q:iter_left()).
function dequeue_deque:iter_left() end

--- Itérateur de la fin vers le début.
---Source : lua/common/dequeue.lua:dyn
---@return function  Itérateur (for x in q:iter_right()).
function dequeue_deque:iter_right() end

--- Nombre d'éléments.
---Source : lua/common/dequeue.lua:dyn
---@return integer  tail - head.
function dequeue_deque:length() end

--- Renvoie le premier élément sans le retirer.
---Source : lua/common/dequeue.lua:dyn
---@return any  Premier élément ou nil.
function dequeue_deque:peek_left() end

--- Renvoie le dernier élément sans le retirer.
---Source : lua/common/dequeue.lua:dyn
---@return any  Dernier élément ou nil.
function dequeue_deque:peek_right() end

--- Retire et renvoie le premier élément.
---Source : lua/common/dequeue.lua:dyn
---@return any  Élément ou nil si vide.
function dequeue_deque:pop_left() end

--- Retire et renvoie le dernier élément.
---Source : lua/common/dequeue.lua:dyn
---@return any  Élément ou nil si vide.
function dequeue_deque:pop_right() end

--- Ajoute x au début.
---Source : lua/common/dequeue.lua:dyn
---@param x any Élément (non nil).
function dequeue_deque:push_left(x) end

--- Ajoute x à la fin.
---Source : lua/common/dequeue.lua:dyn
---@param x any Élément (non nil).
function dequeue_deque:push_right(x) end

--- Supprime la première occurrence de x en cherchant depuis le début.
---Source : lua/common/dequeue.lua:dyn
---@param x any Valeur à retirer.
---@return boolean  true si un élément a été retiré.
function dequeue_deque:remove_left(x) end

--- Supprime la première occurrence de x en cherchant depuis la fin.
---Source : lua/common/dequeue.lua:dyn
---@param x any Valeur à retirer.
---@return boolean  true si un élément a été retiré.
function dequeue_deque:remove_right(x) end

--- Remet head et tail à 0 (les anciens éléments ne sont pas effacés de la table).
---Source : lua/common/dequeue.lua:dyn
function dequeue_deque:reset() end

--- Fait passer n éléments du début vers la fin.
---Source : lua/common/dequeue.lua:dyn
---@param n integer|nil Nombre de rotations (défaut 1).
function dequeue_deque:rotate_left(n) end

--- Fait passer n éléments de la fin vers le début.
---Source : lua/common/dequeue.lua:dyn
---@param n integer|nil Nombre de rotations (défaut 1).
function dequeue_deque:rotate_right(n) end

return dequeue
