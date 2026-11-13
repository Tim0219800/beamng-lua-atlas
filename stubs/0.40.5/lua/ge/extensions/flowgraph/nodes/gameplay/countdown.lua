---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_countdown_C
local flowgraph_nodes_gameplay_countdown_C = {}

--- Appelle stopTimer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:50
function flowgraph_nodes_gameplay_countdown_C:_executionStopped() end

--- Décrémente le timer de mgr.dtSim, affiche chaque seconde et signale la fin.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:93
function flowgraph_nodes_gameplay_countdown_C:countdown() end

--- Barre de progression et état (Running, Done, Stopped) dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:126
---@param builder any
---@param style any
function flowgraph_nodes_gameplay_countdown_C:drawMiddle(builder, style) end

--- Initialise les options data (useImgui, useMessages, playSounds, bigFinishMsg) et l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:28
---@param mgr table Gestionnaire du flowgraph
---@param ... any
function flowgraph_nodes_gameplay_countdown_C:init(mgr, ...) end

--- Remet durée, timer et message par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:44
function flowgraph_nodes_gameplay_countdown_C:onExecutionStarted() end

--- Arrête le compte à rebours et remet les sorties à faux.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:54
function flowgraph_nodes_gameplay_countdown_C:reset() end

--- Affiche un message flash (ScenarioFlashMessage), et un Message si data.useMessages.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:79
---@param msg string Texte
---@param big boolean Grande taille
---@param duration number|nil Durée en s (1.4 grand, 0.95 petit par défaut)
---@param luaCall string|nil Code Lua exécuté par l'UI (son)
function flowgraph_nodes_gameplay_countdown_C:show(msg, big, duration, luaCall) end

--- Lit la durée, arme le timer, vide le message flash précédent et démarre.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:69
function flowgraph_nodes_gameplay_countdown_C:startTimer() end

--- Arrête le timer et efface done et flags.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:61
function flowgraph_nodes_gameplay_countdown_C:stopTimer() end

--- Gère reset, démarre le timer si flow est actif, appelle countdown et remplit les sorties.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:140
---@param args table Arguments du flowgraph
function flowgraph_nodes_gameplay_countdown_C:work(args) end

