---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_ui_updatedUI_startScreenDial_C
local flowgraph_nodes_ui_updatedUI_startScreenDial_C = {}

--- Prépare le panneau {type='dragDial', header='Dial Setup', ...}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua:22
function flowgraph_nodes_ui_updatedUI_startScreenDial_C:init() end

--- Appelé quand le joueur modifie un dial dans le panneau ; met à jour la valeur de l'entrée de même label et republie dials.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua:58
---@param dial table Table {label, value} envoyée par le panneau.
function flowgraph_nodes_ui_updatedUI_startScreenDial_C:onDialSetByDialPanel(dial) end

--- Lit gameplay_drag_dragBridge.getData() ; pour chaque coureur crée une entrée de dial (valeur timers.dial.value ou 12 par défaut, désactivée si le coureur n'est pas jouable), ajoute le panneau à l'UI et publie la liste sur le pin dials. Sans données, logue un avertissement et ne fait rien d'autre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua:34
function flowgraph_nodes_ui_updatedUI_startScreenDial_C:work() end

