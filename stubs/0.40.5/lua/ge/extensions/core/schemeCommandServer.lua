---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/schemeCommandServer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ancien serveur UDP local (127.0.0.1:22137) qui recevait les commandes du schéma d'URL 'beamng:' et les passait à commandhandler.onSchemeCommand. Le code est marqué OBSOLÈTE : le gestionnaire de schéma par défaut est désormais un tube Windows (pipe).
--- Accès : extension `core_schemeCommandServer` : `extensions.load("core_schemeCommandServer")`, puis la globale `core_schemeCommandServer`
---@class core_schemeCommandServer
core_schemeCommandServer = {}

--- Hook de première mise à jour : ouvre le socket UDP 127.0.0.1:22137 (non bloquant). Journalise un avertissement si l'ouverture échoue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/schemeCommandServer.lua:11
---@return boolean|nil  false si le socket n'a pas pu être ouvert.
function core_schemeCommandServer.onFirstUpdate() end

--- Hook de mise à jour : lit un paquet UDP ; si le texte commence par 'beamng:', appelle commandhandler.onSchemeCommand avec la suite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/schemeCommandServer.lua:22
function core_schemeCommandServer.onUpdate() end

