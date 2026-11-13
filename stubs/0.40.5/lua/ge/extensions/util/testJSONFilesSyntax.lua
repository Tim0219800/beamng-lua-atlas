---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/testJSONFilesSyntax.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de diagnostic : au chargement, il parcourt tout le système de fichiers virtuel du jeu (racine '/') à la recherche des fichiers *.jbeam, *.pc et *.json, puis les décode un par un avec la bibliothèque jsonDebug. Les erreurs de syntaxe et les avertissements sont écrits dans le journal. Utile à un moddeur pour trouver un JSON ou un jbeam invalide.
--- Accès : extension `util_testJSONFilesSyntax` : `extensions.load("util_testJSONFilesSyntax")`, puis la globale `util_testJSONFilesSyntax`
---@class util_testJSONFilesSyntax
util_testJSONFilesSyntax = {}

--- Appelé au chargement de l'extension. Liste récursivement les fichiers .jbeam, .pc et .json, les lit avec readFile et les décode avec jsonDebug.decode sous xpcall ; logue les erreurs (E) et avertissements (W) sous le tag 'jsonDecode'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/testJSONFilesSyntax.lua:22
function util_testJSONFilesSyntax.onExtensionLoaded() end

