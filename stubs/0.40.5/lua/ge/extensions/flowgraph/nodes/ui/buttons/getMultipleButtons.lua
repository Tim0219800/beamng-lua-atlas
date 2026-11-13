---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_buttons_getMultipleButtons_C
local flowgraph_nodes_ui_buttons_getMultipleButtons_C = {}

--- Restaure l'état du nœud depuis les données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:94
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:_onDeserialized(res) end

--- Écrit l'état du nœud dans la table de sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:90
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:_onSerialize(res) end

--- Dessine le panneau de propriétés personnalisé de l'éditeur ; renvoie une chaîne décrivant la modification (pour l'historique d'annulation) ou nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:29
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:drawCustomProperties() end

--- Dessine la zone centrale du nœud dans l'éditeur flowgraph.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:25
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle() ouvre la zone centrale).
---@param style any Style d'affichage du nœud fourni par l'éditeur.
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:drawMiddle(builder, style) end

--- count = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:21
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:init() end

--- Ajuste le nombre de triplets (entrée buttonId_i, sorties clicked_i et buttonId_i) en supprimant liens et pins en trop ou en créant les nouveaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:46
---@param old integer Ancien nombre d'éléments.
---@param new integer Nouveau nombre d'éléments.
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:updatePins(old, new) end

--- Pour chaque i, lit le bouton buttonId_i et recopie button.clicked sur « clicked_i ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua:78
function flowgraph_nodes_ui_buttons_getMultipleButtons_C:work() end

