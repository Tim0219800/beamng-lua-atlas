---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/controls.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie des commandes : signale la méthode de direction utilisée (évènement ponctuel « controlsUsed ») et, à la fermeture du jeu, le nombre d'utilisations de chaque action liée (« inputActionUse », via ActionMap.getActionUseCounts). Les périphériques connectés relèvent du relevé matériel (tracker hardware), pas de celui-ci.
--- Accès : extension `telemetry_trackers_controls` : `extensions.load("telemetry_trackers_controls")`, puis la globale `telemetry_trackers_controls`
---@class telemetry_trackers_controls
---@field dependencies string[] telemetry_core.
telemetry_trackers_controls = {}

--- Hook appelé au chargement : déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/controls.lua:45
function telemetry_trackers_controls.onExtensionLoaded() end

--- Hook appelé au déchargement : envoie le décompte d'utilisation des actions (sauf rechargement Lua ou si déjà fait).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/controls.lua:50
function telemetry_trackers_controls.onExtensionUnloaded() end

--- Hook appelé avant déchargement/rechargement : retient si la raison est un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/controls.lua:56
---@param reason string Raison de la sérialisation (« reload » en cas de rechargement).
function telemetry_trackers_controls.onSerialize(reason) end

--- Hook appelé quand le filtre de direction du véhicule change : enregistre l'évènement controlsUsed avec la méthode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/controls.lua:22
---@param method string Méthode de direction (déduit du code : nom du filtre/mode de direction).
function telemetry_trackers_controls.onSteeringFilterChanged(method) end

