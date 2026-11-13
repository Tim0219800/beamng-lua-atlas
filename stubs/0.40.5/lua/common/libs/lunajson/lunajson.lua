---@meta
-- tim19Atlas stub generated from lua/common/libs/lunajson/lunajson.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce lunajson (décodeur/encodeur JSON pur Lua, rapide). Ce fichier est le point d'entrée : il crée un décodeur et un encodeur par défaut et expose aussi l'analyseur SAX (événementiel). Pour avoir plusieurs contextes indépendants, on peut requérir directement lunajson/decoder ou lunajson/encoder. Le jeu fournit par ailleurs ses propres fonctions jsonEncode/jsonDecode ; ceci est la bibliothèque brute.
--- Accès : `require("libs/lunajson/lunajson")`
---@class libs_lunajson_lunajson
---@field decode function Décode une chaîne JSON en valeur Lua (voir lunajson/decoder).
---@field encode function Encode une valeur Lua en chaîne JSON (voir lunajson/encoder).
---@field newfileparser function Crée un analyseur SAX lisant un fichier par blocs de 8192 octets (voir lunajson/sax).
---@field newparser function Crée un analyseur SAX sur une chaîne ou une fonction source (voir lunajson/sax).
local libs_lunajson_lunajson = {}

return libs_lunajson_lunajson
