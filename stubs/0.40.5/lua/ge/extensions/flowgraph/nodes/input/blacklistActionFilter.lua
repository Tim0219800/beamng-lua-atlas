---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_input_blacklistActionFilter_C
local flowgraph_nodes_input_blacklistActionFilter_C = {}

--- Restaure les réglages propres au nœud à partir des données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:58
---@param data table données sauvegardées du nœud
function flowgraph_nodes_input_blacklistActionFilter_C:_onDeserialized(data) end

--- Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:54
---@param res table table de sérialisation à remplir
function flowgraph_nodes_input_blacklistActionFilter_C:_onSerialize(res) end

--- Dessine une case à cocher par modèle d'actions, avec le nombre d'actions en infobulle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:32
function flowgraph_nodes_input_blacklistActionFilter_C:drawCustomProperties() end

--- Renomme le nœud en Block/Allow Input Actions by Filters si block est codé en dur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:65
---@param builder table constructeur de nœud de l'éditeur (builder:Middle())
---@param style table style de dessin du nœud
function flowgraph_nodes_input_blacklistActionFilter_C:drawMiddle(builder, style) end

--- Active les modèles par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:25
function flowgraph_nodes_input_blacklistActionFilter_C:init() end

--- Crée la liste via core_input_actionFilter.createActionTemplate(modèles actifs), l'enregistre puis bloque ou autorise les actions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistActionFilter.lua:74
function flowgraph_nodes_input_blacklistActionFilter_C:workOnce() end

