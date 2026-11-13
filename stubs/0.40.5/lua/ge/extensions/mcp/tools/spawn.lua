---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/spawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP de spawn : lister les configurations d'un modèle, faire apparaître ou remplacer un véhicule, et tester automatiquement toutes les configurations d'un modèle (spawn de chacune puis relevé des erreurs de log et des instabilités physiques). Utile pour valider un mod de véhicule.
--- Accès : extension `mcp_tools_spawn` : `extensions.load("mcp_tools_spawn")`, puis la globale `mcp_tools_spawn`
---@class mcp_tools_spawn
---@field schemas table<string, table> Schémas de get_configs, spawn et test_configs.
mcp_tools_spawn = {}

--- Liste triée des clés de configuration (.pc) d'un modèle via core_vehicles.getModel.
---Source : lua/ge/extensions/mcp/tools/spawn.lua:44
---@param args table|nil {model?: string} (défaut : modèle du véhicule joueur).
---@return string  JSON {model, configs}.
---@return boolean  true en cas d'erreur.
function mcp_tools_spawn.get_configs(args) end

--- Appelé chaque frame : avance le test de configurations (spawn, attente, analyse du log et de shared.instabilityLog, passage à la config suivante, rapport final dans shared.asyncResults.testConfigs).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/mcp/tools/spawn.lua:12
---@param dtReal number Durée réelle (s).
function mcp_tools_spawn.onUpdate(dtReal) end

--- Fait apparaître un véhicule : remplace le véhicule courant (core_vehicles.replaceVehicle) ou, avec add=true, en ajoute un (core_vehicles.spawnNewVehicle).
---Source : lua/ge/extensions/mcp/tools/spawn.lua:56
---@param args table|nil {model?: string, config?: string (clé ou chemin .pc), add?: boolean}
---@return string  Message de confirmation.
---@return boolean  true en cas d'erreur.
function mcp_tools_spawn.spawn(args) end

--- Teste chaque config d'un modèle (asynchrone, long). Voir les notes pour le protocole d'appels.
---Source : lua/ge/extensions/mcp/tools/spawn.lua:67
---@param args table|nil {model?: string, delay?: number s d'attente par config (défaut 3)}
---@return string  JSON de progression ou rapport {model, total, results:[{config, ok, errorCount, errors, unstable}]}.
---@return boolean  true en cas d'erreur.
function mcp_tools_spawn.test_configs(args) end

