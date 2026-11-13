---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_careerVehicleSelect_C
local flowgraph_nodes_career_careerVehicleSelect_C = {}

--- Au démarrage du graphe : met toutes les sorties à faux et _active à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:53
function flowgraph_nodes_career_careerVehicleSelect_C:_executionStarted() end

--- Ferme la fenêtre si elle est ouverte puis reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:72
function flowgraph_nodes_career_careerVehicleSelect_C:_executionStopped() end

--- Appelée par l'UI : met à vrai uniquement le pin de sortie portant le nom de l'action (test1, pick2…).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:85
---@param action string nom du pin (testN ou pickN)
function flowgraph_nodes_career_careerVehicleSelect_C:buttonPushed(action) end

--- Marque la fenêtre comme fermée et inactive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:95
function flowgraph_nodes_career_careerVehicleSelect_C:closeDialogue() end

--- Marque le choix comme terminé (done) et inactif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:126
function flowgraph_nodes_career_careerVehicleSelect_C:closed() end

--- Construit la commande Lua que le bouton de l'UI exécutera pour rappeler buttonPushed sur ce nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:91
---@param action string nom du pin à activer
---@return string  code Lua à exécuter côté GE
function flowgraph_nodes_career_careerVehicleSelect_C:getCmd(action) end

--- Met open et done à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:48
function flowgraph_nodes_career_careerVehicleSelect_C:init() end

--- Hook : remet open et _active à faux à la fin de mission côté client.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:139
function flowgraph_nodes_career_careerVehicleSelect_C:onClientEndMission() end

--- Construit les données des 3 véhicules (image, marque, nom, description, codes des boutons, testDisabled) et navigue vers 'menu.careerVehicleSelect'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:100
function flowgraph_nodes_career_careerVehicleSelect_C:openDialogue() end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:62
function flowgraph_nodes_career_careerVehicleSelect_C:postInit() end

--- Remet done, open et _active à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:79
function flowgraph_nodes_career_careerVehicleSelect_C:reset() end

--- Ferme la fenêtre, met le pin flow de sortie à vrai et done à vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:132
function flowgraph_nodes_career_careerVehicleSelect_C:started() end

--- Si reset est actif : ferme, réinitialise et met les sorties à faux. Sinon, ouvre la fenêtre une fois quand flow est actif et que ce n'est pas déjà fait.
---Source : lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:144
function flowgraph_nodes_career_careerVehicleSelect_C:work() end

