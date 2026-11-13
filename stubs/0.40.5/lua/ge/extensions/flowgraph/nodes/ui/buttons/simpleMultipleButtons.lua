---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_buttons_simpleMultipleButtons_C
local flowgraph_nodes_ui_buttons_simpleMultipleButtons_C = {}

--- Initialise hiddenAfterDone/hiddenAfterReset à false pour chaque bouton.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:34
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:_executionStarted() end

--- Restaure l'état du nœud depuis les données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:168
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:_onDeserialized(res) end

--- Écrit l'état du nœud dans la table de sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:164
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:_onSerialize(res) end

--- Dessine le panneau de propriétés personnalisé de l'éditeur ; renvoie une chaîne décrivant la modification (pour l'historique d'annulation) ou nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:43
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:drawCustomProperties() end

--- Zone centrale vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:30
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle() ouvre la zone centrale).
---@param style any Style d'affichage du nœud fourni par l'éditeur.
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:drawMiddle(builder, style) end

--- count = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:26
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:init() end

--- Désactive chaque bouton une fois et remet hiddenAfterDone à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:123
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:onNodeReset() end

--- Ajuste le nombre de groupes de pins (4 entrées, 4 sorties par bouton).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:60
---@param old integer Ancien nombre d'éléments.
---@param new integer Nouveau nombre d'éléments.
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:updatePins(old, new) end

--- Pour chaque bouton, met à jour clicked/complete/incomplete et le désactive si hideWhenDone et complété.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:146
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:work() end

--- Crée tous les boutons et écrit leurs id (voir notes : bug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua:135
function flowgraph_nodes_ui_buttons_simpleMultipleButtons_C:workOnce() end

