---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_debug_drawGraph_C
local flowgraph_nodes_debug_drawGraph_C = {}

--- Recrée les pins selon data.count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:103
---@param data table données chargées
function flowgraph_nodes_debug_drawGraph_C:_onDeserialized(data) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:100
---@param res table table de sérialisation
function flowgraph_nodes_debug_drawGraph_C:_onSerialize(res) end

--- Éditeur : synchronise le nombre de pins avec data.count et dessine les courbes (PlotMultiLines).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:107
---@param builder table constructeur de nœud
---@param style table style
function flowgraph_nodes_debug_drawGraph_C:drawMiddle(builder, style) end

--- Initialise tables de données, 400 points max, count = 1, échelle 0..1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:21
function flowgraph_nodes_debug_drawGraph_C:init() end

--- Hook éditeur : réinitialise les données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:92
function flowgraph_nodes_debug_drawGraph_C:onLink() end

--- Hook éditeur : réinitialise les données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:88
function flowgraph_nodes_debug_drawGraph_C:onLinkDeleted() end

--- Hook éditeur : réinitialise les données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:96
function flowgraph_nodes_debug_drawGraph_C:onUnlink() end

--- Reconstruit étiquettes, couleurs arc-en-ciel et séries d'après les pins numériques connectés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:48
function flowgraph_nodes_debug_drawGraph_C:resetGraphData() end

--- Ajoute ou retire des pins value<i> pour passer de old à new (supprime les liens des pins retirés), puis réinitialise les données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:65
---@param old integer ancien nombre de pins
---@param new number nouveau nombre de pins (arrondi par excès, minimum 0)
function flowgraph_nodes_debug_drawGraph_C:updatePins(old, new) end

--- Ajoute la valeur numérique de chaque pin à sa série, étend l'échelle, supprime les valeurs les plus anciennes au-delà de la taille max.
---Source : lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua:32
function flowgraph_nodes_debug_drawGraph_C:work() end

