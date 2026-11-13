---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/vehicleRopeDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de débogage ImGui « Rope Visual Sandbox » pour les cordes visuelles (rope visuals) du véhicule joueur. Il liste les cordes de `be:getPlayerVehicle(0).ropeIds` (via `getRopeVisual`), dessine leurs nœuds et directions avec `debugDrawer`, permet de survoler et de faire glisser les nœuds à la souris, d'éditer les positions des ancrages A et B, et affiche des statistiques de performance (temps de simulation et de rendu par corde, pics). Se charge à la main depuis la console.
--- Accès : extension `util_vehicleRopeDebug` : `extensions.load("util_vehicleRopeDebug")`, puis la globale `util_vehicleRopeDebug`
---@class util_vehicleRopeDebug
util_vehicleRopeDebug = {}

--- Mise à jour par image : met à jour les statistiques de performance, gère le survol et le glissement des nœuds de corde à la souris (si debugNodes est actif), dessine les nœuds des cordes du véhicule joueur, puis construit la fenêtre ImGui « Rope Visual Sandbox ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/vehicleRopeDebug.lua:572
---@param dt number pas de temps de l'image, en secondes (hook onUpdate)
function util_vehicleRopeDebug.onUpdate(dt) end

