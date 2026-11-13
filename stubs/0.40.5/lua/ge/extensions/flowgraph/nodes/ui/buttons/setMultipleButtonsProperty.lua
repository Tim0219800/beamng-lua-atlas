---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C
local flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C = {}

--- Restaure l'état du nœud depuis les données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:107
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:_onDeserialized(res) end

--- Écrit l'état du nœud dans la table de sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:103
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:_onSerialize(res) end

--- Dessine le panneau de propriétés personnalisé de l'éditeur ; renvoie une chaîne décrivant la modification (pour l'historique d'annulation) ou nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:31
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:drawCustomProperties() end

--- Dessine la zone centrale du nœud dans l'éditeur flowgraph.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:27
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle() ouvre la zone centrale).
---@param style any Style d'affichage du nœud fourni par l'éditeur.
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:drawMiddle(builder, style) end

--- count = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:23
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:init() end

--- Ajuste le nombre de groupes de 5 pins d'entrée (buttonId, label, active, order, style).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:48
---@param old integer Ancien nombre d'éléments.
---@param new integer Nouveau nombre d'éléments.
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:updatePins(old, new) end

--- Pour chaque i dont le bouton existe, applique les propriétés non nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua:89
function flowgraph_nodes_ui_buttons_setMultipleButtonsProperty_C:work() end

