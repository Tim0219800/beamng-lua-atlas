---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C
local flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C = {}

--- Vide self.flags après le déclenchement du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:43
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:_afterTrigger() end

--- Crée la table self.flags vide au démarrage de l'exécution.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:51
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:_executionStarted() end

--- Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:47
---@param builder table constructeur de nœud de l'éditeur (builder:Middle())
---@param style table style de dessin du nœud
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:drawMiddle(builder, style) end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:26
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:init() end

--- Hook appelé quand un bouton du recovery prompt est pressé ; mémorise l'identifiant dans self.flags pour le prochain work.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:55
---@param id any identifiant du bouton pressé (flipMission, recoverMission, submitMission, restartMission ou personnalisé)
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:onRecoveryPromptButtonPressed(id) end

--- Remet toutes les sorties à false, recopie l'entrée flow sur la sortie flow, puis active les sorties dont l'identifiant de bouton figure dans self.flags, et vide les flags.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:30
---@param args table arguments transmis par le moteur (non utilisés)
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:work(args) end

