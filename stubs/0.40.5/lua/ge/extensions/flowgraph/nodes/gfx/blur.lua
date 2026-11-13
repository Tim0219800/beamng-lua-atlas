---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gfx/blur.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gfx_blur_C
local flowgraph_nodes_gfx_blur_C = {}

--- Initialise lastWorking, blurAmount et blurColor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gfx/blur.lua:24
---@param mgr table gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_gfx_blur_C:init(mgr, ...) end

--- Hook appelé avant le rendu (dt, dtSim) ; ajoute un rectangle de flou plein écran à ScreenBlurFX si le nœud a été actif dans les 10 dernières frames.
---Source : lua/ge/extensions/flowgraph/nodes/gfx/blur.lua:45
---@param dt any temps réel écoulé depuis la dernière frame (s)
---@param dtSim any temps de simulation écoulé (s)
function flowgraph_nodes_gfx_blur_C:onPreRender(dt, dtSim) end

--- Configure le pin blurAmount comme curseur float entre 0 et 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gfx/blur.lua:30
function flowgraph_nodes_gfx_blur_C:postInit() end

--- Mémorise la quantité de flou, la couleur correspondante et le numéro de frame courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gfx/blur.lua:39
function flowgraph_nodes_gfx_blur_C:work() end

