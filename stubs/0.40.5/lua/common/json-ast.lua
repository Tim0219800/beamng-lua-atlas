---@meta
-- tim19Atlas stub generated from lua/common/json-ast.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Parseur JSON/SJSON qui construit un arbre syntaxique (AST) sans perte : chaque espace, tabulation, saut de ligne, commentaire (// et /* */), délimiteur, chaîne, nombre (avec sa précision) devient un noeud. On peut ainsi relire un fichier .jbeam, modifier des valeurs et le réécrire à l'identique (stringify). Sert à l'éditeur de texte jbeam intégré ; en plus de l'AST il produit les données Lua natives et le schéma de tables jbeam déjà traité.
--- Accès : `require("json-ast")`
---@class json_ast
local json_ast = {}

--- Analyse un texte JSON/SJSON/jbeam et renvoie le contexte (AST + données Lua). Renvoie nil si le texte contient plusieurs noeuds racine. Les erreurs de nombre ou de caractère inconnu sont journalisées (log E) sans arrêter.
---Source : lua/common/json-ast.lua:391
---@param str string texte source
---@param addAstId boolean|nil ajoute __astNodeIdx dans les tables natives
---@return table|nil  contexte {ast = {nodes}, transient = {luaData, luaDataRaw, hierarchy, root, linesIndexes, nodeIdxToLineNum}}
function json_ast.parse(str, addAstId) end

--- Reconstitue le texte à partir d'un AST (concatène stringifyNodes(ast.nodes)).
---Source : lua/common/json-ast.lua:421
---@param ast table ctx.ast (table avec champ nodes)
---@return string  texte
function json_ast.stringify(ast) end

--- Texte d'un seul noeud (ex. '{' pour object_begin, '//commentaire', nombre formaté avec sa précision d'origine). Renvoie nil pour un type inconnu.
---Source : lua/common/json-ast.lua:294
---@param node table noeud {type, valeur, précision}
---@return string|nil  texte du noeud
function json_ast.stringifyNode(node) end

--- Concatène le texte de tous les noeuds d'une liste (erreur Lua si un noeud est de type inconnu, car stringifyNode renvoie nil).
---Source : lua/common/json-ast.lua:345
---@param nodes table[] liste de noeuds
---@return string  texte
function json_ast.stringifyNodes(nodes) end

--- Outil de test : lit un fichier, le parse, compare avec json.decode, reconstruit le texte et vérifie qu'il est identique à l'original. Écrit des fichiers de diagnostic en cas de différence. Renvoie true si le cycle parse -> stringify est sans perte.
---Source : lua/common/json-ast.lua:445
---@param filename string chemin du fichier
---@param writeAST boolean|nil écrit <fichier>.ast.json si succès
---@param addASTId boolean|nil ajoute __astNodeIdx
---@return boolean|nil  true si OK, false/nil sinon
function json_ast.testFile(filename, writeAST, addASTId) end

--- Outil de test : exécute testFile sur tous les *.jbeam trouvés depuis la racine ('/') et journalise les erreurs (et les OK si reportOK).
---Source : lua/common/json-ast.lua:503
---@param writeAST boolean|nil écrire les .ast.json
---@param reportOK boolean|nil journaliser aussi les fichiers OK
function json_ast.testFiles(writeAST, reportOK) end

return json_ast
