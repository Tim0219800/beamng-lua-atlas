---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_sevensegmentDisplay_C
local flowgraph_nodes_scene_sevensegmentDisplay_C = {}

--- Oublie le dernier nombre affiché.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:135
function flowgraph_nodes_scene_sevensegmentDisplay_C:_executionStarted() end

--- Supprime les objets à l'arrêt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:131
function flowgraph_nodes_scene_sevensegmentDisplay_C:_executionStopped() end

--- Supprime tous les objets créés et remet spawned à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:139
function flowgraph_nodes_scene_sevensegmentDisplay_C:clearObjects() end

--- Crée les chiffres (shape '8'), le point décimal et, en mode minutes, les deux points.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:42
---@param objectName any non utilisé
function flowgraph_nodes_scene_sevensegmentDisplay_C:createObjects(objectName) end

--- Appelé à la destruction du noeud : nettoie les objets créés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:169
function flowgraph_nodes_scene_sevensegmentDisplay_C:destroy() end

--- Initialise les réglages par défaut (mode 'minutes', count 5, decimals 3, spacing 5...).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:27
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_scene_sevensegmentDisplay_C:init(mgr, ...) end

--- Crée un TSStatic de point (shape 'period') décalé par rapport à la position de base.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:81
---@param offset any vec3 de décalage local
---@param name any suffixe de nom (decimal, m_1, m_2)
function flowgraph_nodes_scene_sevensegmentDisplay_C:makeDot(offset, name) end

--- Hook de fin de mission : nettoie les objets créés par le noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:165
function flowgraph_nodes_scene_sevensegmentDisplay_C:onClientEndMission() end

--- Change la shape de chaque chiffre selon le nombre courant ; efface les zéros de tête si showLeadingZeroes est faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:101
function flowgraph_nodes_scene_sevensegmentDisplay_C:updateNumbers() end

--- Sur clear, supprime l'afficheur ; sinon le crée si besoin et met à jour les chiffres si le nombre a changé.
---Source : lua/ge/extensions/flowgraph/nodes/scene/sevensegmentDisplay.lua:152
function flowgraph_nodes_scene_sevensegmentDisplay_C:work() end

