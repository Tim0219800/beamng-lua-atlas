---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide de débogage visuel pour les courses de scénario : calcule le chemin entre les waypoints de lapConfig (map.getPath) et le dessine avec debugDrawer (sphères rouges aux waypoints, prismes verts le long de la route, rouges quand le segment est direct). N'est actif que si l'éditeur est activé et que le réglage BeamNGRaceDrawDebug est vrai.
--- Accès : extension `scenario_raceDebug` : `extensions.load("scenario_raceDebug")`, puis la globale `scenario_raceDebug`
---@class scenario_raceDebug
scenario_raceDebug = {}

--- Hook de dessin debug appelé à chaque image : dessine les waypoints (sphère de rayon n.radius et libellé 'wp i/N') et le chemin calculé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceDebug.lua:46
---@param focusPos vec3 Position de focus de la caméra (non utilisée).
function scenario_raceDebug.onDrawDebug(focusPos) end

--- Hook appelé à chaque changement d'état du scénario. Si le scénario est 'running' et possède lapConfig, remplit currentScenario.debugPath (noeuds de la route) et currentScenario.debugNodes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceDebug.lua:7
---@param scenario table Scénario (non utilisé, le scénario courant est relu).
function scenario_raceDebug.onScenarioChange(scenario) end

