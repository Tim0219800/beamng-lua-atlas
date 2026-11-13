---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/system.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP système : exécuter du Lua dans la VM GE, lire les logs, recharger l'UI ou le Lua, infos de rendu, captures d'écran, infos fichier, chargement de fichiers Lua et d'extensions, lecture/écriture de variables du VariableRegistry.
--- Accès : extension `mcp_tools_system` : `extensions.load("mcp_tools_system")`, puis la globale `mcp_tools_system`
---@class mcp_tools_system
---@field schemas table<string, table> Schémas des outils système.
mcp_tools_system = {}

--- Informations sur un chemin : exists, isDir, realPath (VFS vers disque), virtualPath, expanded et stat.
---Source : lua/ge/extensions/mcp/tools/system.lua:99
---@param args table {path: string} chemin VFS ou réel.
---@return string  JSON.
---@return boolean  true si path manquant.
function mcp_tools_system.file_info(args) end

--- Lit beamng.log (voir notes pour la logique premier appel / appels suivants).
---Source : lua/ge/extensions/mcp/tools/system.lua:24
---@param args table|nil {lines?: integer}
---@return string  Lignes de log.
---@return boolean  true si le fichier est illisible.
function mcp_tools_system.get_logs(args) end

--- Infos de rendu en JSON : adapterType, available, vulkanEnabled, gpu (Engine.Render / Engine.Platform).
---Source : lua/ge/extensions/mcp/tools/system.lua:56
---@return string  JSON.
---@return boolean  false.
function mcp_tools_system.get_render_info() end

--- Lit une variable moteur/préférence (VariableRegistry.get), ex. $pref::Video::gpu.
---Source : lua/ge/extensions/mcp/tools/system.lua:144
---@param args table {name: string, default?: any}
---@return string  Valeur.
---@return boolean  true si name manquant.
function mcp_tools_system.get_var(args) end

--- Charge une extension GE par son nom (forme avec underscore).
---Source : lua/ge/extensions/mcp/tools/system.lua:128
---@param args table {name: string}
---@return string  « loaded » ou « load failed for ».
---@return boolean  true si name manquant.
function mcp_tools_system.load_extension(args) end

--- Charge et exécute un fichier Lua dans la VM GE (le chemin VFS est résolu vers le chemin réel).
---Source : lua/ge/extensions/mcp/tools/system.lua:116
---@param args table {path: string}
---@return string  « loaded … » ou erreur.
---@return boolean  true en cas d'erreur.
function mcp_tools_system.load_file(args) end

--- Demande le rechargement du VM Lua GE (comme Ctrl+L) via Lua:requestReload ; différé à la frame suivante.
---Source : lua/ge/extensions/mcp/tools/system.lua:50
---@return string  Message.
---@return boolean  true si indisponible.
function mcp_tools_system.reload_lua() end

--- Recharge complètement l'UI (CEF) en ignorant le cache, via reloadUI().
---Source : lua/ge/extensions/mcp/tools/system.lua:43
---@return string  Message.
---@return boolean  true si reloadUI absent.
function mcp_tools_system.reload_ui() end

--- Compile (loadstring) et exécute du code Lua dans la VM GE, renvoie tostring du résultat du chunk.
---Source : lua/ge/extensions/mcp/tools/system.lua:14
---@param args table {code: string}. Le code doit faire `return …` pour renvoyer une valeur.
---@return string  Résultat ou « compile error / error: … ».
---@return boolean  true en cas d'erreur.
function mcp_tools_system.run_lua(args) end

--- Prend une capture (module `screenshot`, createScreenshotTracked) et renvoie son chemin absolu.
---Source : lua/ge/extensions/mcp/tools/system.lua:66
---@param args table|nil {jpg?: boolean} (défaut PNG).
---@return string  Chemin du fichier.
---@return boolean  true si la capture échoue.
function mcp_tools_system.screenshot(args) end

--- Capture un JPG réduit et le renvoie en base64 (asynchrone en deux appels).
---Source : lua/ge/extensions/mcp/tools/system.lua:80
---@param args table|nil {scale?: number 0..1 (défaut 0.4)}
---@return table|string  {data, mimeType} une fois prêt, sinon message « capturing… ».
---@return boolean  true si la capture échoue.
function mcp_tools_system.screenshot_image(args) end

--- Écrit une variable moteur (VariableRegistry.set) et renvoie la valeur relue.
---Source : lua/ge/extensions/mcp/tools/system.lua:150
---@param args table {name: string, value: any}
---@return string  « nom = valeur ».
---@return boolean  true si paramètre manquant.
function mcp_tools_system.set_var(args) end

--- Décharge une extension GE (mcp_server et mcp_tools protégées).
---Source : lua/ge/extensions/mcp/tools/system.lua:135
---@param args table {name: string}
---@return string  Message.
---@return boolean  true en cas de refus ou d'erreur.
function mcp_tools_system.unload_extension(args) end

