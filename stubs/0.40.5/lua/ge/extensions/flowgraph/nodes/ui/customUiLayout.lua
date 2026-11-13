---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_customUiLayout_C
local flowgraph_nodes_ui_customUiLayout_C = {}

--- Écrit {apps = storedLayout, layoutName = ...} sur « layout ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:25
function flowgraph_nodes_ui_customUiLayout_C:_executionStarted() end

--- Restaure storedLayout.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:90
---@param data table Données sauvegardées / reçues.
function flowgraph_nodes_ui_customUiLayout_C:_onDeserialized(data) end

--- Sauvegarde storedLayout.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:86
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_customUiLayout_C:_onSerialize(res) end

--- Boutons Capture, Clear, Load Stored Layout, Load Freeroam layout et liste de copie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:30
function flowgraph_nodes_ui_customUiLayout_C:drawCustomProperties() end

--- Renvoie la chaîne de la fonction Lua de rappel (setLayout) de ce nœud.
---Source : lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:82
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_customUiLayout_C:getCmd(action) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:21
function flowgraph_nodes_ui_customUiLayout_C:init() end

--- Reçoit le layout capturé par l'UI et mémorise data.apps dans storedLayout.
---Source : lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:77
---@param data table Données sauvegardées / reçues.
function flowgraph_nodes_ui_customUiLayout_C:setLayout(data) end

--- Renvoie « <idManager>_<idNœud> », utilisé pour nommer l'état de jeu temporaire.
---Source : lua/ge/extensions/flowgraph/nodes/ui/customUiLayout.lua:29
function flowgraph_nodes_ui_customUiLayout_C:uniqueId() end

