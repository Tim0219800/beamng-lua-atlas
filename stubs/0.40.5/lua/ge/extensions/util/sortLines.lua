---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/sortLines.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de développement qui trie, par champ « name », les fichiers JSON de sons d'un niveau. Ces fichiers contiennent un objet JSON par ligne (format « JSON lines ») dans /levels/<niveau>/main/MissionGroup/Audio/. handleLevel parcourt les *.json de ce dossier et handleFile réécrit chaque fichier avec ses lignes triées par nom. Il modifie les fichiers sur place.
--- Accès : extension `util_sortLines` : `extensions.load("util_sortLines")`, puis la globale `util_sortLines`
---@class util_sortLines
util_sortLines = {}

--- Lit un fichier JSON lines, trie les lignes selon leur champ name (ordre croissant) et réécrit le fichier.
---Source : lua/ge/extensions/util/sortLines.lua:11
---@param path string Chemin du fichier à trier.
function util_sortLines.handleFile(path) end

--- Trie tous les fichiers *.json (non récursif) du dossier /levels/<level>/main/MissionGroup/Audio/.
---Source : lua/ge/extensions/util/sortLines.lua:35
---@param level string Nom du dossier du niveau.
function util_sortLines.handleLevel(level) end

