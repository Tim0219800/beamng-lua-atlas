---@meta
-- tim19Atlas stub generated from lua/common/libs/StackTracePlus/StackTracePlus.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- StackTracePlus : bibliothèque tierce (Ignacio Burgueño, licence MIT) qui produit des traces de pile Lua détaillées : noms de fonctions deviné quand ils manquent, fonctions et tables connues de la bibliothèque standard, et vidage des variables locales de chaque niveau. Utilisable comme gestionnaire d'erreur pour xpcall ou pcall. Le module renvoie la table _M.
--- Accès : `require("libs/StackTracePlus/StackTracePlus")`
---@class libs_StackTracePlus_StackTracePlus
local libs_StackTracePlus_StackTracePlus = {}

--- Ajoute une fonction à la liste des fonctions connues, avec une description utilisée dans les traces.
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:556
---@param fun function Fonction à nommer
---@param description string Nom affiché
function libs_StackTracePlus_StackTracePlus.add_known_function(fun, description) end

--- Ajoute une table à la liste des tables connues, avec une description utilisée à l'affichage des variables locales.
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:547
---@param tab table Table à nommer
---@param description string Nom affiché
function libs_StackTracePlus_StackTracePlus.add_known_table(tab, description) end

--- Collecte une trace de pile détaillée (bornée par « Stack Traceback >> START/END »), avec les variables locales de chaque niveau Lua. Adaptée comme gestionnaire d'erreur de xpcall.
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:439
---@param thread thread|nil Coroutine à inspecter (défaut : la coroutine courante)
---@param message string|table|nil Message ou objet d'erreur placé en tête de la trace
---@param level integer|nil Niveau de pile de départ (défaut 1)
---@param level_limit integer|nil Niveau maximal à afficher
---@param dump_locals boolean|nil Afficher les variables locales (défaut true)
---@return string  La trace complète
---@return string|nil  Le message d'erreur d'origine
function libs_StackTracePlus_StackTracePlus.stacktrace(thread, message, level, level_limit, dump_locals) end

--- Variante de stacktrace avec les mêmes paramètres, produisant une trace plus simple (déduit du code : même squelette, sans la même mise en forme détaillée).
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:326
---@param thread thread|nil Coroutine à inspecter
---@param message string|table|nil Message d'erreur
---@param level integer|nil Niveau de départ (défaut 1)
---@param level_limit integer|nil Niveau maximal
---@param dump_locals boolean|nil Afficher les locales (défaut true)
---@return string  La trace
function libs_StackTracePlus_StackTracePlus.stacktraceSimple(thread, message, level, level_limit, dump_locals) end

--- Objet interne qui analyse une pile (créé par Dumper.new(thread)) et accumule les lignes de la trace.
---@class libs_StackTracePlus_StackTracePlus_Dumper
local libs_StackTracePlus_StackTracePlus_Dumper = {}

--- Parcourt et ajoute à la trace les variables locales d'un niveau de pile.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:254
---@param level integer Niveau de pile de la fonction
function libs_StackTracePlus_StackTracePlus_Dumper:DumpLocals(level) end

--- Ajoute une ligne de texte au tampon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:238
---@param text string Texte
function libs_StackTracePlus_StackTracePlus_Dumper:add(text) end

--- Ajoute du texte formaté (string.format).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:241
---@param fmt string Format
---@param ... any Valeurs
function libs_StackTracePlus_StackTracePlus_Dumper:add_f(fmt, ...) end

--- Concatène les lignes accumulées en une chaîne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:244
---@return string  Texte final
function libs_StackTracePlus_StackTracePlus_Dumper:concat_lines() end

--- Crée un Dumper lié à une coroutine ; adapte getinfo/getlocal (décalage d'un niveau si c'est la coroutine courante).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/StackTracePlus/StackTracePlus.lua:207
---@param thread thread Coroutine inspectée
function libs_StackTracePlus_StackTracePlus_Dumper.new(thread) end

return libs_StackTracePlus_StackTracePlus
