---@meta
-- tim19Atlas stub generated from lua/common/utils/interactiveShell.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Console Lua interactive (REPL) pour l'exécutable console (console.x64.exe) : require('utils/interactiveShell').start() lit des lignes sur l'entrée standard et les exécute. Sert au développement et aux tests hors interface ; un moddeur ne l'utilise normalement pas dans le jeu normal. Définit aussi des globales d'aide.
--- Accès : `require("utils/interactiveShell")`
---@class utils_interactiveShell
local utils_interactiveShell = {}

--- Boucle bloquante : affiche l'invite '> ', lit une ligne, gère les raccourcis puis exécute la ligne avec loadstring/xpcall et affiche le résultat ou l'erreur avec trace. Quitte sur fin d'entrée, 'exit', 'quit' ou Ctrl-D. Appelle updateLuaCore() à chaque tour s'il existe (nettoyage et GC).
---Source : lua/common/utils/interactiveShell.lua:66
function utils_interactiveShell.start() end

--- GLOBALE d'aide (alias sp) : supprime tous les objets puis fait apparaître n véhicules.
---Source : lua/common/utils/interactiveShell.lua:12
---@param n integer|nil Nombre de véhicules, 1 par défaut
---@param v string|nil Nom du dossier de véhicule sous 'vehicles/', 'pickup' par défaut
function spawnObjects(n, v) end

--- GLOBALE d'aide (alias ul) : n+1 mises à jour du moteur de simulation à 1/2000 s.
---Source : lua/common/utils/interactiveShell.lua:31
---@param n integer|nil Nombre d'itérations, 10 par défaut
function updateLoop(n) end

--- GLOBALE d'aide : une mise à jour du moteur de simulation (BeamEngine:update(1/2000, 1/2000)).
---Source : lua/common/utils/interactiveShell.lua:27
---@param n any Ignoré
function updateOnce(n) end

---@type any
sp = nil
---@type any
ul = nil
return utils_interactiveShell
