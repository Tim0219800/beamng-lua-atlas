---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_race_raceEndScreen_C
local flowgraph_nodes_gameplay_race_raceEndScreen_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:154
function flowgraph_nodes_gameplay_race_raceEndScreen_C:_afterTrigger() end

--- Met toutes les sorties à false et remet open/done à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:47
function flowgraph_nodes_gameplay_race_raceEndScreen_C:_executionStarted() end

--- Ferme le dialogue s'il est ouvert et réinitialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:147
function flowgraph_nodes_gameplay_race_raceEndScreen_C:_executionStopped() end

--- Relit options puis appelle updateButtons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:142
---@param nodeData table Données sérialisées.
function flowgraph_nodes_gameplay_race_raceEndScreen_C:_onDeserialized(nodeData) end

--- Sauvegarde la liste options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:138
---@param res table Table de sérialisation.
function flowgraph_nodes_gameplay_race_raceEndScreen_C:_onSerialize(res) end

--- Appelé par le clic d'un bouton : met à vrai la sortie du bouton, ferme le dialogue et marque done.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:165
---@param action string Nom du bouton cliqué.
function flowgraph_nodes_gameplay_race_raceEndScreen_C:buttonPushed(action) end

--- Navigue vers la route UI 'play' et marque l'écran fermé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:184
function flowgraph_nodes_gameplay_race_raceEndScreen_C:closeDialogue() end

--- Marque done = true (fermeture signalée par l'UI).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:306
function flowgraph_nodes_gameplay_race_raceEndScreen_C:closed() end

--- Panneau éditeur : renommer, supprimer, ajouter (« add ») ou retirer (« rem ») des boutons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:56
---@return string|nil  Raison de la modification.
function flowgraph_nodes_gameplay_race_raceEndScreen_C:drawCustomProperties() end

--- Construit la chaîne de commande Lua exécutée par l'UI pour appeler buttonPushed(action).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:173
---@param action string Nom du bouton.
---@return string  Code Lua à exécuter.
function flowgraph_nodes_gameplay_race_raceEndScreen_C:getCmd(action) end

--- Initialise l'état (open, done, options) et les options data.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:31
function flowgraph_nodes_gameplay_race_raceEndScreen_C:init() end

--- Hook de fin de mission : marque open = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:194
function flowgraph_nodes_gameplay_race_raceEndScreen_C:onClientEndMission() end

--- Hook : si l'écran est ouvert avec le bouton Retry, le ferme et marque done (log d'information).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:177
function flowgraph_nodes_gameplay_race_raceEndScreen_C:onResetGameplay() end

--- Construit les boutons et les stats (titre, temps détaillés, highscores) puis navigue vers scenario.quickrace.end.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:212
function flowgraph_nodes_gameplay_race_raceEndScreen_C:openDialogue() end

--- Crée le bouton par défaut 'cont' avec le libellé « Continue ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:40
function flowgraph_nodes_gameplay_race_raceEndScreen_C:postInit() end

--- Remet done et open à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:160
function flowgraph_nodes_gameplay_race_raceEndScreen_C:reset() end

--- Recrée les pins d'entrée string et de sortie flow pour chaque bouton de self.options en préservant les liens existants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:91
function flowgraph_nodes_gameplay_race_raceEndScreen_C:updateButtons() end

--- Gère reset et ouvre le dialogue au premier flux tant que done est faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:311
function flowgraph_nodes_gameplay_race_raceEndScreen_C:work() end

