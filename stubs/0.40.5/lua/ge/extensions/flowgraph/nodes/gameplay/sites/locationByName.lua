---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_sites_locationByName_C
local flowgraph_nodes_gameplay_sites_locationByName_C = {}

--- Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.lua:45
function flowgraph_nodes_gameplay_sites_locationByName_C:_executionStarted() end

--- Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.lua:27
function flowgraph_nodes_gameplay_sites_locationByName_C:drawCustomProperties() end

--- Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.lua:66
---@param builder table constructeur de nœud de l'éditeur (builder:Middle())
---@param style table style de dessin du nœud
function flowgraph_nodes_gameplay_sites_locationByName_C:drawMiddle(builder, style) end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.lua:23
---@param mgr table gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_gameplay_sites_locationByName_C:init(mgr, ...) end

--- Quand le flux est actif et que le nom change, retrouve la location et active la sortie flow si elle existe (non missing).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.lua:49
---@param args table arguments transmis par le moteur (non utilisés)
function flowgraph_nodes_gameplay_sites_locationByName_C:work(args) end

