---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/windowsConsole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pont entre la fenêtre console native de Windows (C++) et Lua. Il remplit la liste déroulante des contextes d'exécution (GE-Lua, véhicule courant, chaque véhicule actif, GE-TorqueScript, CEF/UI - JS) et exécute la commande saisie dans le contexte choisi. Tout est appelé par le moteur ; un moddeur peut seulement écouter le hook onConsoleExecuteCommand.
--- Accès : extension `core_windowsConsole` : `extensions.load("core_windowsConsole")`, puis la globale `core_windowsConsole`
---@class core_windowsConsole
core_windowsConsole = {}

--- Reconstruit la liste des contextes disponibles dans la console (alias de refreshCombo). Appelé par le C++ quand la fenêtre console est activée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/windowsConsole.lua:47
function core_windowsConsole.configure() end

--- Exécute une commande dans un contexte et émet le hook onConsoleExecuteCommand(context, cmd). 'GE-TorqueScript' passe par TorqueScript.eval, 'CEF/UI - JS' par be:queueJS, un nom de véhicule par queueLuaCommand sur ce véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/windowsConsole.lua:10
---@param context string Nom du contexte choisi dans la console.
---@param cmd string Texte de la commande.
function core_windowsConsole.executeCommand(context, cmd) end

--- Hook appelé au chargement : active l'extension si les fonctions console du C++ existent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/windowsConsole.lua:77
---@return boolean|nil  false si la console n'est pas disponible sur la plateforme.
function core_windowsConsole.onExtensionLoaded() end

--- Hook appelé quand un véhicule devient actif ou inactif : rafraîchit la liste des contextes (même fonction que configure).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/windowsConsole.lua:47
function core_windowsConsole.onVehicleActiveChanged() end

--- Hook appelé à la destruction d'un véhicule : rafraîchit la liste des contextes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/windowsConsole.lua:47
function core_windowsConsole.onVehicleDestroyed() end

--- Hook appelé à l'apparition d'un véhicule : rafraîchit la liste des contextes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/windowsConsole.lua:47
function core_windowsConsole.onVehicleSpawned() end

--- Hook appelé au changement de véhicule joueur : rafraîchit la liste des contextes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/windowsConsole.lua:47
function core_windowsConsole.onVehicleSwitched() end

--- Exécute du texte Lua dans la VM GE : essaie loadstring(cmd), sinon loadstring('return ' .. cmd) pour afficher la valeur d'une expression, puis dump le résultat s'il n'est pas nil. Journalise « syntax error » si rien ne compile.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/windowsConsole.lua:28
---@param cmd string Code ou expression Lua.
function core_windowsConsole.tryRunCommand(cmd) end

