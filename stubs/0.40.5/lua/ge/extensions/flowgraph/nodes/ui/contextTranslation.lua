---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/contextTranslation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_contextTranslation_C
local flowgraph_nodes_ui_contextTranslation_C = {}

--- Affiche l'état de chargement des variables (icône rouge/verte/blanche) et le bouton « Load Variables » qui recrée les pins de contexte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/contextTranslation.lua:51
function flowgraph_nodes_ui_contextTranslation_C:drawCustomProperties() end

--- Active savePins et allowCustomInPins ; crée la table de sortie réutilisée {context = {}}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/contextTranslation.lua:33
function flowgraph_nodes_ui_contextTranslation_C:init() end

--- Remplit txt et context (valeur de chaque pin personnalisé) dans la table de sortie réutilisée et l'écrit sur « value ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/contextTranslation.lua:39
function flowgraph_nodes_ui_contextTranslation_C:work() end

