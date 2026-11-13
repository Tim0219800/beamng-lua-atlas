---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/demolitionDerby.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de scénario de type démolition : elle déclare vainqueur le dernier véhicule encore en mouvement. Chaque seconde, elle compare la position de chaque véhicule du scénario à sa dernière position connue ; un véhicule qui bouge de 1 m ou moins pendant plus de 15 secondes est considéré à l'arrêt.
--- Accès : extension `scenario_demolitionDerby` : `extensions.load("scenario_demolitionDerby")`, puis la globale `scenario_demolitionDerby`
---@class scenario_demolitionDerby
scenario_demolitionDerby = {}

--- Hook appelé avant le rendu de chaque image. Toutes les secondes, détecte les véhicules immobiles et termine le scénario s'il ne reste qu'un véhicule en mouvement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/demolitionDerby.lua:40
---@param dt number Durée de l'image en secondes.
function scenario_demolitionDerby.onPreRender(dt) end

--- Hook appelé par scenario_scenarios à chaque changement d'état du scénario. Quand le scénario passe en 'running', réinitialise le suivi et enregistre chaque véhicule de scenario.vehicles trouvé dans le scenetree. Sans scénario, remet tout à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/demolitionDerby.lua:21
---@param sc any Argument transmis par le hook, non utilisé (le scénario est relu via scenario_scenarios.getScenario()).
function scenario_demolitionDerby.onScenarioChange(sc) end

