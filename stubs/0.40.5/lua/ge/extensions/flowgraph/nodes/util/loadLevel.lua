---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_loadLevel_C
local flowgraph_nodes_util_loadLevel_C = {}

--- Remet l'état à 1, flow à false et efface mgr.__delayedLoadingScreenFunctions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:34
function flowgraph_nodes_util_loadLevel_C:_executionStarted() end

--- Affiche l'état courant dans le corps du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:126
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_util_loadLevel_C:drawMiddle(builder, style) end

--- Initialise l'état à 1, le pin flow à false et les données par défaut (preventPlayerSpawning=true, forceLevelLoad=true, delayBufferFrames=0, noLoadInEdit=true, customLoadingScreen=false...).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:23
function flowgraph_nodes_util_loadLevel_C:init() end

--- Hook appelé au fondu de sortie de l'écran de chargement ; passe à l'état 3 avec le délai de frames, sauf si déjà à l'état 4.
---Source : lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:51
---@param missionFile string Fichier de mission chargé (utilisé pour le log).
function flowgraph_nodes_util_loadLevel_C:onLoadingScreenFadeout(missionFile) end

--- Remplit les modèles du pin levelPath avec la liste triée de getAllLevelIdentifiers().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:40
function flowgraph_nodes_util_loadLevel_C:postInit() end

--- Fait avancer la machine à états. Si le niveau demandé est déjà chargé (et forceLevelLoad faux ou éditeur actif avec noLoadInEdit), passe directement à 4. Sinon lance core_levels.startLevel (en désactivant l'apparition automatique du joueur selon la donnée), puis finalise en état 3.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:59
function flowgraph_nodes_util_loadLevel_C:work() end

