---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/color.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_types_color_C
local flowgraph_nodes_types_color_C = {}

--- Restaure clr (complété à 8 valeurs) et mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/color.lua:84
---@param nodeData any données sauvegardées
function flowgraph_nodes_types_color_C:_onDeserialized(nodeData) end

--- Sauvegarde l'état du noeud dans la table donnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/color.lua:79
---@param res any table de sauvegarde
function flowgraph_nodes_types_color_C:_onSerialize(res) end

--- Crée les pins d'entrée number r, g, b, a.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/color.lua:110
function flowgraph_nodes_types_color_C:createColorPins() end

--- Choix du mode, création/suppression des pins r/g/b/a et sélecteur de couleur (editor.uiColorEdit8).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/color.lua:26
function flowgraph_nodes_types_color_C:drawCustomProperties() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/color.lua:106
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_types_color_C:drawMiddle(builder, style) end

--- clr = {1,1,1,1}, mode = 'custom', modes = {'custom','from Pin'}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/color.lua:20
function flowgraph_nodes_types_color_C:init() end

--- Écrit la couleur (depuis les pins en mode 'from Pin', sinon clr).
---Source : lua/ge/extensions/flowgraph/nodes/types/color.lua:98
function flowgraph_nodes_types_color_C:work() end

