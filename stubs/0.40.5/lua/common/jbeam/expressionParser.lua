---@meta
-- tim19Atlas stub generated from lua/common/jbeam/expressionParser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Évalue les expressions JBeam de la forme "$=..." (valeurs calculées dans les fichiers jbeam). L'expression est transformée en code Lua (le préfixe '$=' est retiré, chaque '$' devient 'var_'), compilée dans un environnement restreint (fonctions math, round, square, clamp, smoothstep, case, vec3, quat, include...) puis exécutée. Les variables jbeam ($nom) sont lues dans la table vars fournie. Utilisé par le chargeur jbeam, pas par les mods directement.
--- Accès : `require("jbeam/expressionParser")`
---@class jbeam_expressionParser
local jbeam_expressionParser = {}

--- Compile une expression pour la réutiliser sans recompiler : renvoie la fonction et la table de variables qu'elle lira.
---Source : lua/common/jbeam/expressionParser.lua:154
---@param expr string Expression commençant par '$='.
---@return function|nil  Fonction sans argument qui évalue l'expression ; nil en cas d'erreur.
---@return table|nil  Table de variables (clés '$nom') à remplir avant l'appel.
function jbeam_expressionParser.compileSafe(expr) end

--- Évalue l'expression sans protection (voir notes). Les assignations sont refusées et renvoient nil.
---Source : lua/common/jbeam/expressionParser.lua:131
---@param expr string Expression commençant par '$='.
---@param vars table<string, any> Variables jbeam.
---@return any|nil  Résultat.
function jbeam_expressionParser.parse(expr, vars) end

--- Évalue l'expression dans un pcall : en cas d'assignation interdite, de syntaxe invalide ou d'erreur d'exécution, journalise une erreur et renvoie nil.
---Source : lua/common/jbeam/expressionParser.lua:98
---@param expr string Expression commençant par '$='.
---@param vars table<string, any> Variables jbeam (clés '$nom').
---@return any|nil  Résultat de l'expression, nil en cas d'erreur.
function jbeam_expressionParser.parseSafe(expr, vars) end

--- Classe locale `c` de lua/common/jbeam/expressionParser.lua
---@class jbeam_expressionParser_c
local jbeam_expressionParser_c = {}

--- function used as a case selector, input can be both int and bool as the first argument, any number of arguments after that
--- in case it's a bool, it works like a ternary if, returning the second param if true, the third if false
--- if the selector is an int n, it simply returns the nth+1 param it was given, if n > #params it returns the last given param
---Source : lua/common/jbeam/expressionParser.lua:13
---@param selector any
---@param ... any
function jbeam_expressionParser_c.case(selector, ...) end

---Source : lua/common/jbeam/expressionParser.lua:29
---@param resourceURI any
---@param sheetName any
---@param cellRef any
function jbeam_expressionParser_c.include(resourceURI, sheetName, cellRef) end

return jbeam_expressionParser
