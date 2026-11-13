---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/organizationsDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Organizations ». Deux entrées de triche : donner une réputation aléatoire (-50 à 150) à environ 30 % des organisations (via career_modules_playerAttributes.addAttributes) et marquer environ 30 % des facilités de livraison comme 'interacted'.
--- Accès : extension `career_modules_debug_organizationsDebug` : `extensions.load("career_modules_debug_organizationsDebug")`, puis la globale `career_modules_debug_organizationsDebug`
---@class career_modules_debug_organizationsDebug
---@field debugName string 'Organizations'.
---@field debugOrder number Ordre de tri (3).
career_modules_debug_organizationsDebug = {}

--- Dessine les entrées '> Give random reputation to 30% of organizations' et 'Interact with random facilities'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/organizationsDebug.lua:9
function career_modules_debug_organizationsDebug.drawDebugFunctions() end

