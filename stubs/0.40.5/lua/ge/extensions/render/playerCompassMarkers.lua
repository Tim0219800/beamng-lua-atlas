---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/playerCompassMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Indicateurs de direction des autres joueurs pour l'écran partagé (multi-sièges en freeroam). Pour chaque vue, dessine en haut de la vue une pastille colorée par autre joueur, positionnée horizontalement selon la direction où il se trouve (comme une boussole), dans une texture ImGui transparente. Piloté par render_splitScreen (appel de update chaque frame). Dépend de ui_imgui, core_gamestate, core_camera. Global : render_playerCompassMarkers.
--- Accès : extension `render_playerCompassMarkers` : `extensions.load("render_playerCompassMarkers")`, puis la globale `render_playerCompassMarkers`
---@class render_playerCompassMarkers
---@field dependencies table
render_playerCompassMarkers = {}

--- Libère les textures de direction enregistrées et réinitialise les états ; sans effet si déjà inactif.
---Source : lua/ge/extensions/render/playerCompassMarkers.lua:54
function render_playerCompassMarkers.destroy() end

--- Hook de l'écran de chargement : quand state vaut 2, lève la suppression des marqueurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/playerCompassMarkers.lua:260
---@param state integer État de l'écran de chargement (2 = terminé, déduit du code).
function render_playerCompassMarkers.onLoadingScreenInactive(state) end

--- Met à jour et dessine les marqueurs de direction pour toutes les vues d'écran partagé (collecte, texture, fenêtre ImGui sans fond ni entrées par vue).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/playerCompassMarkers.lua:179
---@param enabled boolean Activer la fonction.
---@param views table[] Vues : {name, player, markerRect = {x, y, w, h}}.
---@param players table[] Joueurs : {player, color = '#RRGGBB'}.
---@param vehicleForPlayer function function(player) -> objet véhicule ou nil.
function render_playerCompassMarkers.update(enabled, views, players, vehicleForPlayer) end

