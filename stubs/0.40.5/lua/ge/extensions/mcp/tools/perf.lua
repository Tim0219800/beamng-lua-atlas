---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/perf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP de performance : métriques de la dernière frame, raison du limiteur de FPS, usage de la VRAM, et captures du profileur Optick (builds BNG_PROFILER=OPTICK seulement).
--- Accès : extension `mcp_tools_perf` : `extensions.load("mcp_tools_perf")`, puis la globale `mcp_tools_perf`
---@class mcp_tools_perf
---@field schemas table<string, table> Schémas des outils de performance.
mcp_tools_perf = {}

--- Sources et plafonds actuels du limiteur de FPS (vsync, limites avant/arrière-plan, focus), via Engine.getCurrentFpsLimitReason.
---Source : lua/ge/extensions/mcp/tools/perf.lua:17
---@return string  JSON ou erreur.
---@return boolean  true si indisponible.
function mcp_tools_perf.get_fps_limit_reason() end

--- Métriques de la dernière frame (timings, mémoire, compteurs) via Engine.Debug.getLastPerformanceMetrics, en JSON.
---Source : lua/ge/extensions/mcp/tools/perf.lua:9
---@return string  JSON (objet vide si l'API manque).
---@return boolean  false.
function mcp_tools_perf.get_performance_metrics() end

--- Usage de la mémoire vidéo via Engine.Render.getVRAMUsage.
---Source : lua/ge/extensions/mcp/tools/perf.lua:22
---@return string  JSON (ou tostring si ce n'est pas une table).
---@return boolean  true si indisponible.
function mcp_tools_perf.get_vram_usage() end

--- Déclenche une capture Optick de `duration` secondes après `delay` et enregistre un fichier .opt ; renvoie son chemin et le délai de disponibilité.
---Source : lua/ge/extensions/mcp/tools/perf.lua:52
---@param args table|nil {duration?: number s (défaut 5), delay?: number s (défaut 0), path?: string}
---@return string  JSON {ok, path, duration, delay, readyInSeconds, note} ou erreur.
---@return boolean  true en cas d'erreur.
function mcp_tools_perf.profiler_run(args) end

--- Lance l'interface externe Optick (comme le raccourci Ctrl+Alt+O) en appelant la fonction globale launchOptick si elle existe.
---Source : lua/ge/extensions/mcp/tools/perf.lua:89
---@return string  JSON {ok=true} (même si launchOptick est absent).
---@return boolean  false.
function mcp_tools_perf.run_optick_ui() end

