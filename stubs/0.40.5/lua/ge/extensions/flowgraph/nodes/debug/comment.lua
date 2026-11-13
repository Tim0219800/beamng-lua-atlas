---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/comment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud (éditeur uniquement).
---@class flowgraph_nodes_debug_comment_C
local flowgraph_nodes_debug_comment_C = {}

--- Restaure les champs depuis les données chargées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/comment.lua:167
---@param nodeData table données sauvegardées
function flowgraph_nodes_debug_comment_C:_onDeserialized(nodeData) end

--- Ajoute au résultat les champs propres au commentaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/comment.lua:155
---@param res table table de sérialisation du nœud
function flowgraph_nodes_debug_comment_C:_onSerialize(res) end

--- Dessine le cadre, le titre, le groupe redimensionnable et l'indication de groupe dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/comment.lua:208
function flowgraph_nodes_debug_comment_C:draw() end

--- Dessine le panneau de propriétés (titre, alpha, couleurs, simple, mode de déplacement, texte) et renvoie la raison de modification pour l'historique d'annulation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/comment.lua:70
---@return string|nil  description du changement
function flowgraph_nodes_debug_comment_C:drawCustomProperties() end

--- Appelée à la fermeture du panneau de propriétés ; sans effet (code commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/comment.lua:65
function flowgraph_nodes_debug_comment_C:hideProperties() end

--- Initialise taille 200x200, titre « Comment », couleurs (fond gris 0.5, bordure 0.8, texte blanc), alpha 0.75, moveMode 'withoutNodes', simple faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/comment.lua:23
function flowgraph_nodes_debug_comment_C:init() end

--- Recalcule les ImVec4 de fond, bordure et texte depuis les tableaux de floats.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/comment.lua:149
function flowgraph_nodes_debug_comment_C:refreshColors() end

--- Appelée à l'ouverture du panneau de propriétés ; sans effet (code commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/comment.lua:60
function flowgraph_nodes_debug_comment_C:showProperties() end

--- Repositionne le nœud dans l'éditeur à l'ouverture du gestionnaire (si la position est dans des bornes valides) et force la taille.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/comment.lua:198
function flowgraph_nodes_debug_comment_C:updateEditorPosition() end

