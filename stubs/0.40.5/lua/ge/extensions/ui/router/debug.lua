---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre ImGui « Router Debugger » pour inspecter le routeur d'interface : route courante, route en attente, fil d'Ariane, champ de saisie pour naviguer vers une route ou revenir en arrière, et arbre des routes enregistrées regroupées par module (préfixe avant le premier point). Outil de développement ; chargé à la demande (la ligne de chargement dans ui_router est commentée).
--- Accès : extension `ui_router_debug` : `extensions.load("ui_router_debug")`, puis la globale `ui_router_debug`
---@class ui_router_debug
---@field dependencies table<integer, string> Dépendance déclarée : ui_imgui (indiquée par la page auto-générée).
ui_router_debug = {}

--- Ferme la fenêtre de debug.
---Source : lua/ge/extensions/ui/router/debug.lua:282
function ui_router_debug.close() end

--- Hook appelé au chargement : demande l'ouverture automatique de la fenêtre sauf si disableHwWarnings est vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/debug.lua:237
function ui_router_debug.onExtensionLoaded() end

--- Hook appelé à chaque frame : ouvre la fenêtre si demandé, puis dessine « Router Debugger » (taille initiale 450x600) avec route courante, route en attente, fil d'Ariane, actions et modules de routes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/debug.lua:242
function ui_router_debug.onUpdate() end

--- Ouvre la fenêtre de debug.
---Source : lua/ge/extensions/ui/router/debug.lua:274
function ui_router_debug.open() end

--- Inverse l'état d'ouverture de la fenêtre de debug.
---Source : lua/ge/extensions/ui/router/debug.lua:288
function ui_router_debug.toggle() end

