---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_input_blacklistAction_C
local flowgraph_nodes_input_blacklistAction_C = {}

--- Restaure les réglages propres au nœud à partir des données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:264
---@param data table données sauvegardées du nœud
function flowgraph_nodes_input_blacklistAction_C:_onDeserialized(data) end

--- Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:260
---@param res table table de sérialisation à remplir
function flowgraph_nodes_input_blacklistAction_C:_onSerialize(res) end

--- Dessine l'éditeur de liste d'actions (préréglages, ajout par recherche ou catégorie, liste courante).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:113
function flowgraph_nodes_input_blacklistAction_C:drawCustomProperties() end

--- Affiche le nombre d'actions et renomme le nœud en Block/Allow Input Actions si block est codé en dur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:271
---@param builder table constructeur de nœud de l'éditeur (builder:Middle())
---@param style table style de dessin du nœud
function flowgraph_nodes_input_blacklistAction_C:drawMiddle(builder, style) end

--- Dessine le champ de recherche d'actions et met à jour les résultats.
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:60
function flowgraph_nodes_input_blacklistAction_C:drawSearchInput() end

--- Dessine `label` en surlignant les occurrences de `highlightText`.
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:87
---@param label any texte à afficher
---@param highlightText any texte à surligner
function flowgraph_nodes_input_blacklistAction_C:highlightText(label, highlightText) end

--- Initialise la liste avec le préréglage Scénario et le moteur de recherche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:31
function flowgraph_nodes_input_blacklistAction_C:init() end

--- Enregistre la liste dans le module action du flowgraph (registerList) si pas déjà fait, puis appelle blockActions(id) ou allowActions(id).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/input/blacklistAction.lua:282
function flowgraph_nodes_input_blacklistAction_C:workOnce() end

