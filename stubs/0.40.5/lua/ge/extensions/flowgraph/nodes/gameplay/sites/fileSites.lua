---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_sites_fileSites_C
local flowgraph_nodes_gameplay_sites_fileSites_C = {}

--- Appelé à l'arrêt de l'exécution du projet flowgraph ; libère l'état interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:55
function flowgraph_nodes_gameplay_sites_fileSites_C:_executionStopped() end

--- Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:33
function flowgraph_nodes_gameplay_sites_fileSites_C:drawCustomProperties() end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:22
---@param mgr table gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_gameplay_sites_fileSites_C:init(mgr, ...) end

--- Oublie les sites chargés pour forcer un nouveau chargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:51
function flowgraph_nodes_gameplay_sites_fileSites_C:onNodeReset() end

--- Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:27
function flowgraph_nodes_gameplay_sites_fileSites_C:postInit() end

--- Au premier appel, résout le chemin (avec ou sans extension .sites.json), charge et finalise les sites, puis publie la table sur sitesData. Les appels suivants ne font rien tant que self.sites est défini.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:59
---@param args table arguments transmis par le moteur (non utilisés)
function flowgraph_nodes_gameplay_sites_fileSites_C:work(args) end

