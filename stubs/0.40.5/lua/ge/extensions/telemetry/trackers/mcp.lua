---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/mcp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie des appels d'outils MCP (serveur Model Context Protocol du jeu) : pour chaque appel d'outil, enregistre le nom de l'outil et si l'appel a échoué (évènement « mcpToolCalled »). Les arguments et résultats ne sont pas rapportés.
--- Accès : extension `telemetry_trackers_mcp` : `extensions.load("telemetry_trackers_mcp")`, puis la globale `telemetry_trackers_mcp`
---@class telemetry_trackers_mcp
---@field dependencies string[] telemetry_core.
telemetry_trackers_mcp = {}

--- Hook appelé au chargement : déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/mcp.lua:18
function telemetry_trackers_mcp.onExtensionLoaded() end

--- Hook appelé quand un outil MCP est appelé : émet mcpToolCalled.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/mcp.lua:10
---@param toolName string Nom de l'outil MCP.
---@param isError boolean true si l'appel a échoué.
function telemetry_trackers_mcp.onMcpToolCalled(toolName, isError) end

