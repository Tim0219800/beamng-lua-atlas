---@meta
-- tim19Atlas stub generated from lua/common/jbeamWriter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Variante de l'encodeur JSON 'joli' qui n'indente (met en forme multi-lignes) que jusqu'à une certaine profondeur, pour écrire des fichiers jbeam lisibles. Elle n'est pas fusionnée avec l'encodeur principal pour des raisons de performance. Un moddeur l'utilise pour sauvegarder une table Lua en fichier .jbeam.
--- Accès : `require("jbeamWriter")`
---@class jbeamWriter
local jbeamWriter = {}

--- Écrit la table obj dans filename au format JSON joli limité en profondeur. Renvoie true si réussi ; en cas d'échec d'ouverture, journalise une erreur et renvoie false.
---Source : lua/common/jbeamWriter.lua:93
---@param filename string chemin du fichier à écrire (écrasé)
---@param obj table données à écrire
---@return boolean  succès
function jbeamWriter.writeFile(filename, obj) end

return jbeamWriter
