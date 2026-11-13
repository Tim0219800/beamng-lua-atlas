---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/and.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_and_C
local flowgraph_nodes_logic_and_C = {}

--- Relit count (2 par defaut) et recree les pins correspondants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/and.lua:84
---@param res any
function flowgraph_nodes_logic_and_C:_onDeserialized(res) end

--- Sauvegarde count dans les donnees serialisees.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/and.lua:80
---@param res any
function flowgraph_nodes_logic_and_C:_onSerialize(res) end

--- Panneau de proprietes de l'editeur : champ entier 'Count' qui change le nombre de pins d'entree (minimum 1). Renvoie la raison du changement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/and.lua:33
function flowgraph_nodes_logic_and_C:drawCustomProperties() end

--- Initialise le compteur d'entrees a 2.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/and.lua:30
function flowgraph_nodes_logic_and_C:init() end

--- Ajoute ou supprime les pins d'entree flow_i pour passer de old a new ; supprime aussi les liens qui pointaient vers les pins retirees.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/and.lua:50
---@param old integer ancien nombre d'entrees
---@param new integer nouveau nombre d'entrees
function flowgraph_nodes_logic_and_C:updatePins(old, new) end

--- Met la sortie flow a true seulement si toutes les entrees flow_1..flow_count sont vraies, sinon false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/and.lua:71
function flowgraph_nodes_logic_and_C:work() end

