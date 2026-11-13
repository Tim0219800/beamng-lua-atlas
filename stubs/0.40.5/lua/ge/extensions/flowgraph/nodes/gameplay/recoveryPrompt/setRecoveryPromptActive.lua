---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptActive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptActive_C
local flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptActive_C = {}

--- Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptActive.lua:42
---@param builder table constructeur de nœud de l'éditeur (builder:Middle())
---@param style table style de dessin du nœud
function flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptActive_C:drawMiddle(builder, style) end

--- Si active est vrai : appelle core_recoveryPrompt.setActive(true), désactive tous les boutons puis active ceux dont le pin n'est pas nil. Sinon appelle core_recoveryPrompt.setActive(false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptActive.lua:25
---@param args table arguments transmis par le moteur (non utilisés)
function flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptActive_C:workOnce(args) end

