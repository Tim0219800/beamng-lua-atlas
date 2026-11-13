---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit_C
local flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit_C = {}

--- Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua:42
---@param builder table constructeur de nœud de l'éditeur (builder:Middle())
---@param style table style de dessin du nœud
function flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit_C:drawMiddle(builder, style) end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua:25
function flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit_C:init() end

--- Construit la table des limites à partir des pins number non nil, appelle core_recoveryPrompt.setButtonLimits(limits) puis resetButtonLimitCounters(counts) pour remettre les compteurs à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua:29
---@param args table arguments transmis par le moteur (non utilisés)
function flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit_C:workOnce(args) end

