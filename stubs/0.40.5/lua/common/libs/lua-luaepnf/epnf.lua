---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-luaepnf/epnf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- lua-luaepnf : bibliothèque tierce (Gerhard Lipp) qui facilite la définition de grammaires LPeg en syntaxe EBNF-like, avec arbre syntaxique (AST) automatique et messages d'erreur de parsing. Ici elle repose sur LuLPeg (libs/LuLPeg/lulpeg), une réimplémentation de LPeg en Lua pur. Rôle limité pour un moddeur : analyser un langage ou un format texte personnalisé.
--- Accès : globale `epnf`
---@class epnf
epnf = {}

--- Prépare un environnement où l'on définit des règles de grammaire par simple assignation (nom = motif) avec des raccourcis LPeg (majuscules) et les assistants START, SUPPRESS, E, EOF, ID, W, WS. Chaque règle produit un nœud d'AST {id=nom, pos=position, ...}.
---Source : lua/common/libs/lua-luaepnf/epnf.lua:108
---@param func function Fonction de définition ; reçoit l'environnement en argument (et son environnement est remplacé sous Lua 5.1).
---@param g table|nil Table de grammaire existante à compléter.
---@param e table|nil Environnement de repli pour les noms inconnus (défaut : environnement de func, ou _G).
---@return table  Grammaire utilisable avec parse/parsestring/parsefile.
function epnf.define(func, g, e) end

--- Écrit une représentation indentée de l'AST sur stderr (débogage).
---Source : lua/common/libs/lua-luaepnf/epnf.lua:208
---@param node table Nœud racine.
function epnf.dumpast(node) end

--- Applique une grammaire à une chaîne et renvoie l'AST.
---Source : lua/common/libs/lua-luaepnf/epnf.lua:158
---@param g table Grammaire.
---@param name string Nom de l'entrée pour les messages d'erreur.
---@param input string Texte à analyser.
---@param ... any Arguments supplémentaires passés à la correspondance.
---@return table|nil  AST.
---@return string  name.
---@return string  input.
function epnf.parse(g, name, input, ...) end

--- Lit un fichier entier puis applique la grammaire. Lève une erreur si le fichier ne peut pas être ouvert.
---Source : lua/common/libs/lua-luaepnf/epnf.lua:164
---@param g table Grammaire.
---@param fname string Chemin du fichier.
---@param ... any Arguments supplémentaires.
---@return table|nil  AST.
---@return string  Nom (le chemin).
---@return string  Contenu.
function epnf.parsefile(g, fname, ...) end

--- Comme parse, avec un nom d'entrée généré à partir des 20 premiers caractères du texte.
---Source : lua/common/libs/lua-luaepnf/epnf.lua:174
---@param g table Grammaire.
---@param str string Texte.
---@param ... any Arguments supplémentaires.
---@return table|nil  AST.
---@return string  Nom généré.
---@return string  Texte.
function epnf.parsestring(g, str, ...) end

--- Signale une erreur de validation sémantique de l'AST : affiche 'nom:ligne: message', la ligne fautive et un marqueur sous la position (assert p <= #s).
---Source : lua/common/libs/lua-luaepnf/epnf.lua:51
---@param n string Nom de l'entrée.
---@param msg string Message.
---@param s string Texte analysé.
---@param p integer Position dans le texte.
function epnf.raise(n, msg, s, p) end

--- Table d'assistants visibles dans la fonction passée à define (avec START et SUPPRESS en plus).
---@class epnf_env_index
local epnf_env_index = {}

--- Motif LPeg qui signale une erreur de parsing avec le message donné.
---Source : lua/common/libs/lua-luaepnf/epnf.lua:91
---@param msg string Message d'erreur.
function epnf_env_index.E(msg) end

--- Motif LPeg : fin de l'entrée, sinon erreur avec le message donné.
---Source : lua/common/libs/lua-luaepnf/epnf.lua:94
---@param msg string Message d'erreur.
function epnf_env_index.EOF(msg) end

--- Motif LPeg : mot-clé s, non suivi d'une lettre, chiffre ou _ .
---Source : lua/common/libs/lua-luaepnf/epnf.lua:100
---@param s string Mot-clé.
function epnf_env_index.W(s) end

