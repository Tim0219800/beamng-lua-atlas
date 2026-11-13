---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_buttons_simpleButton_C
local flowgraph_nodes_ui_buttons_simpleButton_C = {}

--- Remet hiddenAfterDone et hiddenAfterReset à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua:30
function flowgraph_nodes_ui_buttons_simpleButton_C:_executionStarted() end

--- Désactive le bouton (active=false) une fois et remet hiddenAfterDone à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua:39
function flowgraph_nodes_ui_buttons_simpleButton_C:onNodeReset() end

--- Définit le modèle de valeur du pin style.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua:35
function flowgraph_nodes_ui_buttons_simpleButton_C:postInit() end

--- Réactive le bouton après un reset, met à jour clicked/used/unused et le désactive si hideWhenDone et déjà cliqué.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua:63
function flowgraph_nodes_ui_buttons_simpleButton_C:work() end

--- Crée le bouton et écrit son id (voir notes : bugs).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleButton.lua:50
function flowgraph_nodes_ui_buttons_simpleButton_C:workOnce() end

