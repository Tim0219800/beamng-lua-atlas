---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/genericValue.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_types_genericValue_C
local flowgraph_nodes_types_genericValue_C = {}

--- Restaure getter/global et recrée les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:57
---@param nodeData any données sauvegardées
function flowgraph_nodes_types_genericValue_C:_onDeserialized(nodeData) end

--- Sauvegarde l'état du noeud dans la table donnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:52
---@param res any table de sauvegarde
function flowgraph_nodes_types_genericValue_C:_onSerialize(res) end

--- Cases « Use Project as Source » et « Is Getter ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:82
function flowgraph_nodes_types_genericValue_C:drawCustomProperties() end

--- getter = true, global = true et pins getter.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:24
function flowgraph_nodes_types_genericValue_C:init() end

--- Passe en mode « Generic Getter » : pin de sortie val.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:67
function flowgraph_nodes_types_genericValue_C:setupGetPins() end

--- Passe en mode « Generic Setter » : pin d'entrée val.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:74
function flowgraph_nodes_types_genericValue_C:setupSetPins() end

--- Choisit la table de variables, construit le nom, puis lit (target:get) ou écrit (target:change) la variable.
---Source : lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:30
function flowgraph_nodes_types_genericValue_C:work() end

