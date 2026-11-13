---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_UpdateDisplayDragRace_C
local flowgraph_nodes_mission_UpdateDisplayDragRace_C = {}

--- Vide les listes d'afficheurs et met la sortie flow a false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:96
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:_executionStarted() end

--- Meme initialisation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:104
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:init() end

--- Recherche dans la scene les 20 objets display_time_i_l/r et display_speed_i_l/r (i de 1 a 5) et les stocke.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:80
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:insertDigits() end

--- Definit les valeurs proposees pour le pin 'side' : left=l, right=r.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:22
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:postInit() end

--- Construit la liste des chiffres (temps avec 3 decimales, vitesse avec 2) et applique le bon modele sur chacun des 5 afficheurs du cote voulu ; un 'empty' est ajoute pour le zero de tete.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:29
---@param side string 'l' ou 'r'
---@param finishTime number temps en secondes
---@param finishSpeed number vitesse en mph
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:updateDisplay(side, finishTime, finishSpeed) end

--- Sur reset : retrouve les afficheurs et remet l'affichage a 0. Sinon, si time, velocity et side sont fournis, met a jour l'affichage ; flow=true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/UpdateDisplayDragRace.lua:112
function flowgraph_nodes_mission_UpdateDisplayDragRace_C:work() end

