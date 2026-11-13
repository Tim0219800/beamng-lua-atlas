---@meta
-- tim19Atlas stub generated from lua/common/libs/inspect/inspect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- inspect.lua 3.1.0 : bibliothèque tierce (Enrique García Cota, licence MIT) qui transforme n'importe quelle valeur Lua en chaîne lisible : tables triées, indentation, références circulaires repérées par <id>, métatables affichées. Le module est appelable : inspect(t, options). Pratique pour déboguer.
--- Accès : `require("libs/inspect/inspect")`
---@class libs_inspect_inspect
---@field KEY any Marqueur de clé utilisé dans le chemin passé à options.process.
---@field METATABLE any Marqueur de métatable utilisé dans le chemin passé à options.process.
local libs_inspect_inspect = {}

--- Renvoie une représentation textuelle de root. Peut aussi s'appeler directement : inspect(root, options).
---Source : lua/common/libs/inspect/inspect.lua:298
---@param root any Valeur à afficher
---@param options table|nil {depth, newline, indent, process}
---@return string  Texte formaté
function libs_inspect_inspect.inspect(root, options) end

--- Objet interne qui accumule le texte dans un tampon pendant le parcours de la valeur.
---@class libs_inspect_inspect_Inspector
local libs_inspect_inspect_Inspector = {}

--- Indique si la valeur a déjà un identifiant (table déjà rencontrée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/inspect/inspect.lua:208
---@param v any Valeur
function libs_inspect_inspect_Inspector:alreadyVisited(v) end

--- Exécute f un niveau plus profond (incrémente puis décrémente le niveau).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/inspect/inspect.lua:198
---@param f function Fonction à exécuter
function libs_inspect_inspect_Inspector:down(f) end

--- Renvoie l'identifiant numérique de la valeur, selon son type, en le créant au besoin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/inspect/inspect.lua:212
---@param v any Valeur
function libs_inspect_inspect_Inspector:getId(v) end

--- Écrit une clé de table : identifiant brut ou [clé] entre crochets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/inspect/inspect.lua:223
---@param k any Clé
function libs_inspect_inspect_Inspector:putKey(k) end

--- Écrit une table : parties séquentielle et non séquentielle, métatable, limite de profondeur, références répétées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/inspect/inspect.lua:230
---@param t table Table
function libs_inspect_inspect_Inspector:putTable(t) end

--- Écrit une valeur selon son type (chaîne échappée, nombre, booléen, table, ou <type id>).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/inspect/inspect.lua:281
---@param v any Valeur
function libs_inspect_inspect_Inspector:putValue(v) end

--- Ajoute des morceaux de texte au tampon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/inspect/inspect.lua:188
---@param ... any
function libs_inspect_inspect_Inspector:puts(...) end

--- Ajoute un saut de ligne suivi de l'indentation du niveau courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/inspect/inspect.lua:204
function libs_inspect_inspect_Inspector:tabify() end

---@type number
i = nil
return libs_inspect_inspect
