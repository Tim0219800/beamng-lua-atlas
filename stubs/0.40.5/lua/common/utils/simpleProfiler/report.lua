---@meta
-- tim19Atlas stub generated from lua/common/utils/simpleProfiler/report.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génère un rapport de profilage à partir du journal du 'simpleProfiler' du moteur (global simpleProfilerGetJournal) : une page HTML interactive (diagramme en barres/flammes, via un gabarit mustache) et un résumé Markdown 'AI summary' à côté. Accessible comme extension : extensions.utils_simpleProfiler_report.createReport('vehicle_spawn'). Un moddeur s'en sert pour analyser où le temps passe (ex. chargement d'un véhicule).
--- Accès : `require("utils/simpleProfiler/report")`
---@class utils_simpleProfiler_report
local utils_simpleProfiler_report = {}

--- Récupère le journal du profiler (simpleProfilerGetJournal(true, filtre)), produit la page HTML via lustache et le résumé Markdown, puis loggue les chemins créés.
---Source : lua/common/utils/simpleProfiler/report.lua:241
---@param filebasename string|nil Nom de base des fichiers de sortie (sans extension), 'profilerReport' par défaut
---@param reportTitle string|nil Titre du rapport, 'Profiler Summary' par défaut
---@param meta table|nil Métadonnées optionnelles (voir notes)
function utils_simpleProfiler_report.createReport(filebasename, reportTitle, meta) end

return utils_simpleProfiler_report
