---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_debug_numberSlider_C
local flowgraph_nodes_debug_numberSlider_C = {}

--- Restaure les valeurs a à e (0 par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:98
---@param data table données chargées
function flowgraph_nodes_debug_numberSlider_C:_onDeserialized(data) end

--- Sauvegarde les valeurs a à e.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:88
---@param res table table de sérialisation
function flowgraph_nodes_debug_numberSlider_C:_onSerialize(res) end

--- Dessine les cinq curseurs dans le panneau de propriétés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:48
---@return nil  aucune raison de modification
function flowgraph_nodes_debug_numberSlider_C:drawCustomProperties() end

--- Éditeur : dessine les curseurs des pins non cachés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:58
---@param builder table constructeur de nœud
---@param style table style
function flowgraph_nodes_debug_numberSlider_C:drawMiddle(builder, style) end

--- Définit les plages par défaut et les valeurs initiales à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:25
function flowgraph_nodes_debug_numberSlider_C:init() end

--- Copie les valeurs des curseurs vers les pins a à e.
---Source : lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua:80
function flowgraph_nodes_debug_numberSlider_C:work() end

