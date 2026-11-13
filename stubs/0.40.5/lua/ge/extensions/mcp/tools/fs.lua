---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/fs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils MCP système de fichiers : lire/écrire des fichiers texte, lister, chercher, supprimer, copier, renommer, créer des dossiers. Lecture/écriture passent par io.open (relatif au dossier courant du jeu : fichiers « loose » sur disque seulement) ; le listage et la recherche passent par le VFS de BeamNG (voient aussi le contenu des zip).
--- Accès : extension `mcp_tools_fs` : `extensions.load("mcp_tools_fs")`, puis la globale `mcp_tools_fs`
---@class mcp_tools_fs
---@field schemas table<string, table> Schémas des outils de fichiers.
mcp_tools_fs = {}

--- Copie un fichier (FS:copyFile).
---Source : lua/ge/extensions/mcp/tools/fs.lua:62
---@param args table {from: string, to: string}
---@return string  Résultat.
---@return boolean  true si from/to manquants.
function mcp_tools_fs.copy_file(args) end

--- Supprime un fichier (FS:removeFile).
---Source : lua/ge/extensions/mcp/tools/fs.lua:56
---@param args table {path: string}
---@return string  « deleted … » ou « delete failed: … ».
---@return boolean  true seulement si path manquant.
function mcp_tools_fs.delete_file(args) end

--- Cherche des fichiers par motif glob (FS:findFiles).
---Source : lua/ge/extensions/mcp/tools/fs.lua:46
---@param args table|nil {path?: string (défaut '/'), pattern?: string (défaut '*'), depth?: integer (défaut 1, -1 = tout)}
---@return string  JSON {count, files}.
---@return boolean  false.
function mcp_tools_fs.find_files(args) end

--- Liste un dossier (VFS) en JSON via FS:directoryList.
---Source : lua/ge/extensions/mcp/tools/fs.lua:39
---@param args table|nil {path?: string (défaut '/'), files?: boolean, dirs?: boolean} ; si ni files ni dirs, les deux sont inclus.
---@return string  JSON.
---@return boolean  toujours false.
function mcp_tools_fs.list_dir(args) end

--- Crée un dossier de façon récursive (FS:directoryCreate).
---Source : lua/ge/extensions/mcp/tools/fs.lua:72
---@param args table {path: string}
---@return string  Résultat.
---@return boolean  true si path manquant.
function mcp_tools_fs.make_dir(args) end

--- Lit un fichier texte (jbeam, json, lua…) et le renvoie, tronqué à maxBytes.
---Source : lua/ge/extensions/mcp/tools/fs.lua:14
---@param args table {path: string, maxBytes?: integer}
---@return string  Contenu ou message d'erreur.
---@return boolean  true en cas d'erreur.
function mcp_tools_fs.read_file(args) end

--- Renomme ou déplace un fichier (FS:renameFile).
---Source : lua/ge/extensions/mcp/tools/fs.lua:67
---@param args table {from: string, to: string}
---@return string  Résultat.
---@return boolean  true si from/to manquants.
function mcp_tools_fs.rename_file(args) end

--- Écrit (écrase) un fichier texte, en créant les dossiers parents (FS:directoryCreate).
---Source : lua/ge/extensions/mcp/tools/fs.lua:26
---@param args table {path: string, content: string}
---@return string  « wrote N bytes to … » ou erreur.
---@return boolean  true en cas d'erreur.
function mcp_tools_fs.write_file(args) end

