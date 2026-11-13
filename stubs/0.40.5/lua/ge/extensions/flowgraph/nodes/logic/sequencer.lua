---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_sequencer_C
local flowgraph_nodes_logic_sequencer_C = {}

--- index = 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:45
function flowgraph_nodes_logic_sequencer_C:_executionStarted() end

--- Relit les reglages, recree les pins et le mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:140
---@param res any
function flowgraph_nodes_logic_sequencer_C:_onDeserialized(res) end

--- Sauvegarde mode, count, incMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:134
---@param res any
function flowgraph_nodes_logic_sequencer_C:_onSerialize(res) end

--- Panneau : mode d'increment, mode de sequence (sauf select), nombre de sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:70
function flowgraph_nodes_logic_sequencer_C:drawCustomProperties() end

--- Affiche le mode et l'index courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:179
---@param builder any
---@param style any
function flowgraph_nodes_logic_sequencer_C:drawMiddle(builder, style) end

--- count=1, mode='loop', incMode='auto', index=1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:38
function flowgraph_nodes_logic_sequencer_C:init() end

--- Ajoute/supprime les pins d'entree selon le mode d'increment (index pour select ; next, reset, count pour manual).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:50
---@param m string 'auto', 'manual' ou 'select'
function flowgraph_nodes_logic_sequencer_C:updateMode(m) end

--- Cree ou supprime les sorties flow value_i.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:117
---@param old integer ancien nombre
---@param new integer nouveau nombre
function flowgraph_nodes_logic_sequencer_C:updatePins(old, new) end

--- Met a jour l'index selon le mode d'increment, calcule la sortie active, met value_i a (i == actif), ecrit currentIndex, maxIndex, totalIndex ; flow vaut le flux d'entree.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:148
function flowgraph_nodes_logic_sequencer_C:work() end

