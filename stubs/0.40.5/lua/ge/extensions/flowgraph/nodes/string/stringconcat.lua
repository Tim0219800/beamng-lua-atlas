---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_string_stringconcat_C
local flowgraph_nodes_string_stringconcat_C = {}

--- Vide le cache d'entrées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:30
function flowgraph_nodes_string_stringconcat_C:_executionStarted() end

--- Garde exactement un pin vide en fin de liste (en crée un ou supprime les surplus).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:85
function flowgraph_nodes_string_stringconcat_C:cleanupPins() end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:119
---@param builder any
---@param style any
function flowgraph_nodes_string_stringconcat_C:drawMiddle(builder, style) end

--- Sortie à '', cache d'entrées vide, savePins = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:23
function flowgraph_nodes_string_stringconcat_C:init() end

--- Hook : à la création d'un lien, nettoie les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:72
---@param link any lien créé
function flowgraph_nodes_string_stringconcat_C:onLink(link) end

--- Hook : à la suppression d'un lien, nettoie les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:77
---@param link any lien supprimé
function flowgraph_nodes_string_stringconcat_C:onUnlink(link) end

--- Reconstruit le cache de chaînes depuis les pins d'entrée et indique s'il a changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:36
function flowgraph_nodes_string_stringconcat_C:updateCache() end

--- Recalcule la sortie par table.concat(cache) si le cache a changé.
---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:65
function flowgraph_nodes_string_stringconcat_C:work() end

