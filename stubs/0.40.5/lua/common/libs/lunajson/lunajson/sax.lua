---@meta
-- tim19Atlas stub generated from lua/common/libs/lunajson/lunajson/sax.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce lunajson : analyseur JSON de type SAX (événementiel). On lui fournit une table de callbacks ; il les appelle au fil de la lecture sans construire l'arbre complet, ce qui permet de traiter de gros fichiers ou des flux découpés en morceaux.
--- Accès : `require("libs/lunajson/lunajson/sax")`
---@class libs_lunajson_lunajson_sax
local libs_lunajson_lunajson_sax = {}

--- Comme newparser, mais lit le fichier `fn` par blocs de 8192 octets (le fichier est ouvert avec io.open puis refermé en fin de lecture).
---Source : lua/common/libs/lunajson/lunajson/sax.lua:700
---@param fn string Chemin du fichier JSON (io.open, chemin disque réel).
---@param saxtbl table Table de callbacks (voir newparser).
---@return table  Objet {run, tryc, read, tellpos}.
function libs_lunajson_lunajson_sax.newfileparser(fn, saxtbl) end

--- Crée un analyseur SAX sur une chaîne JSON ou sur une fonction source qui fournit le texte par morceaux.
---Source : lua/common/libs/lunajson/lunajson/sax.lua:30
---@param src string|function Texte JSON, ou fonction renvoyant le morceau suivant (nil quand terminé).
---@param saxtbl table Table de callbacks : startobject, key, endobject, startarray, endarray, string, number, boolean, null.
---@return table  Objet {run, tryc, read, tellpos}.
function libs_lunajson_lunajson_sax.newparser(src, saxtbl) end

return libs_lunajson_lunajson_sax
