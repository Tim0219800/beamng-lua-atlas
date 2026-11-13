---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/vec3.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_types_vec3_C
local flowgraph_nodes_types_vec3_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/vec3.lua:48
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_types_vec3_C:_onDeserialized(nodeData) end

--- Vide (rien à sauvegarder).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/vec3.lua:45
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_types_vec3_C:_onSerialize(res) end

--- Affiche le texte du vecteur (x,y,z) au centre du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/vec3.lua:37
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle() ouvre la zone centrale).
---@param style any Style d'affichage du nœud fourni par l'éditeur.
function flowgraph_nodes_types_vec3_C:drawMiddle(builder, style) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/vec3.lua:42
function flowgraph_nodes_types_vec3_C:drawProperties() end

--- Calcule la sortie : direction (0,1,0) tournée par 'rot' si présent, sinon {x,y,z}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/vec3.lua:26
function flowgraph_nodes_types_vec3_C:work() end

