---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_hsvColor_C
local flowgraph_nodes_util_hsvColor_C = {}

--- Convertit HSV en table {r, g, b} via la fonction globale HSVtoRGB ; la teinte est ramenée dans [0,1[ et s, v sont bornés à [0,1].
---Source : lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua:27
---@param h number Teinte.
---@param s number Saturation.
---@param v number Valeur (luminosité).
function flowgraph_nodes_util_hsvColor_C:HSVtoRGB(h, s, v) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua:23
function flowgraph_nodes_util_hsvColor_C:init() end

--- Calcule la couleur et écrit {r, g, b, alpha} dans color.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua:32
function flowgraph_nodes_util_hsvColor_C:work() end

