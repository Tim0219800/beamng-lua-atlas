---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_ui_updatedUI_endScreenWhole_C
local flowgraph_nodes_ui_updatedUI_endScreenWhole_C = {}

--- Appelé après le déclenchement du nœud ; corps vide (code commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:167
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:_afterTrigger() end

--- Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:51
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:_executionStarted() end

--- Appelé à l'arrêt du projet ; ferme le dialogue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:159
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:_executionStopped() end

--- Recharge les boutons personnalisés puis recrée les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:154
---@param nodeData any
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:_onDeserialized(nodeData) end

--- Sauvegarde la liste des boutons personnalisés (options).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:150
---@param res any
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:_onSerialize(res) end

--- Appelé quand un bouton est cliqué : met à true le pin de sortie du même nom que l'action, puis ferme le dialogue (navigation vers « play »).
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:173
---@param action string Nom du pin de sortie (contStart, contHere, ou nom d'un bouton personnalisé).
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:buttonPushed(action) end

--- Si construit, navigue vers « play ».
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:195
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:closeDialogue() end

--- Dessine dans l'éditeur flowgraph la liste des boutons personnalisés (champ texte par bouton, boutons « add » et « rem »). Renvoie la raison de la modification (chaîne) ou nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:60
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:drawCustomProperties() end

--- Renvoie la commande Lua (chaîne) qui retrouve ce nœud via core_flowgraphManager.getManagerGraphNode et appelle buttonPushed(action) ; utilisable depuis l'UI.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:183
---@param action string Nom du bouton/pin.
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:getCmd(action) end

--- Initialise open, options, data.includeRetryButton=true, data.autoBuild=true et l'auto-skip.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:36
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:init() end

--- Hook appelé à la fin de la mission côté client ; ferme le dialogue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:163
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:onClientEndMission() end

--- Appelé quand le nœud est réinitialisé (pin reset ou reset du graphe).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:359
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:onNodeReset() end

--- Hook de reset du gameplay ; si l'écran est ouvert et Retry inclus, ferme le dialogue et active le pin retry.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:187
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:onResetGameplay() end

--- Construit les boutons (voir EndScreen Begin) et, si autoBuild, remplit l'écran (en-tête, textPanel Results, objectifs, notes) puis appelle finishUIBuilding.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:204
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:openDialogue() end

--- Appelé juste après init, une fois les pins créés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:46
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:postInit() end

--- Recrée les pins du nœud pour chaque nom de bouton de self.options : pin d'entrée string (libellé), pin d'entrée bool « <nom>_active » (caché, true par défaut) et pin de sortie flow. Reconnecte les liens existants quand le nom n'a pas changé.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:95
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:updateButtons() end

--- Gère reset, construit l'écran à la première frame de flow, active build une frame, et applique l'auto-skip (startingOptions.autoSkipStartScreen, 2 s) en arrêtant la mission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua:368
function flowgraph_nodes_ui_updatedUI_endScreenWhole_C:work() end

