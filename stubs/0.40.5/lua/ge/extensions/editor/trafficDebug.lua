---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/trafficDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre d'éditeur « Traffic Debug » (menu Window > Debug) pour inspecter et régler le système de trafic de gameplay_traffic. Deux onglets : General (nombre de véhicules de trafic et de stationnement, réglages globaux via gameplay_traffic.setTrafficVars : activeAmount, spawnValue, spawnDirBias, baseAggression, speedLimit, aiAware, enableRandomEvents ; case debugMode ; bouton de dispersion) et Vehicles (données par véhicule : général, route, réapparition, poursuite, minuteries, rôle, journal d'actions, téléportation forcée). Active gameplay_traffic.debugMode à l'ouverture et le coupe à la désactivation de l'éditeur.
--- Accès : extension `editor_trafficDebug` : `extensions.load("editor_trafficDebug")`, puis la globale `editor_trafficDebug`
---@class editor_trafficDebug
editor_trafficDebug = {}

--- Hook appelé à la fermeture de l'éditeur : coupe gameplay_traffic.debugMode et oublie les données de trafic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficDebug.lua:461
function editor_trafficDebug.onEditorDeactivated() end

--- Hook appelé à chaque frame d'interface de l'éditeur : dessine la fenêtre, active gameplay_traffic.debugMode au premier affichage, lit gameplay_traffic.getTrafficData() et dessine l'onglet courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficDebug.lua:471
function editor_trafficDebug.onEditorGui() end

--- Hook de l'éditeur : enregistre la fenêtre 'Traffic Debug' (400x600) et son entrée de menu Window > Debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficDebug.lua:466
function editor_trafficDebug.onEditorInitialized() end

--- Hook de trafic : ajoute une ligne au journal du véhicule `id`, avec l'horodatage reçu, l'action et ses données, affichée dans l'onglet Vehicles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/trafficDebug.lua:500
---@param id integer Id du véhicule de trafic.
---@param action string Nom de l'action de trafic.
---@param data any Données associées, affichées entre parenthèses si présentes.
function editor_trafficDebug.onTrafficAction(id, action, data) end

