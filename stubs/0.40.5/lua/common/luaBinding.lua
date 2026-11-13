---@meta
-- tim19Atlas stub generated from lua/common/luaBinding.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Appelée par le moteur une fois toutes les classes C++ enregistrées dans la VM : installe les accès SimObject (hors VM véhicule) puis optimise les metatables sans parent (supprime __newindex sans setters, aplatit les getters).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/luaBinding.lua:195
---@param classes table<string, table> classes exposées (nom -> metatable)
---@param luaVMname string nom de la VM ('vlua' pour le véhicule)
function __finalizeLuaBindings(classes, luaVMname) end

--- __index d'une instance de classe C++ : cherche d'abord un champ de la metatable, puis un getter de la classe, puis remonte la chaîne des classes parentes (en mettant en cache). Renvoie nil si introuvable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/luaBinding.lua:6
---@param t userdata|table instance
---@param k any clé demandée
---@return any  valeur, méthode ou résultat du getter
function __luaBindIndex(t, k) end

--- __index des classes à membres statiques : comme __luaBindIndex mais les getters sont appelés sans instance, et une constante non fonction est renvoyée telle quelle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/luaBinding.lua:43
---@param t table table de la classe statique
---@param k any clé demandée
---@return any  valeur
function __luaBindIndexStatic(t, k) end

--- __newindex d'une instance : appelle le setter de la classe (ou d'un parent) ; ignore silencieusement si aucun setter.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/luaBinding.lua:84
---@param t userdata|table instance
---@param k any clé
---@param v any valeur à écrire
function __luaBindNewindex(t, k, v) end

--- __newindex pour classes statiques : appelle le setter sans instance (setFunc(v)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/luaBinding.lua:112
---@param t table table de la classe
---@param k any clé
---@param v any valeur
function __luaBindNewindexStatic(t, k, v) end

--- Test unitaire des liaisons (classes TestNamespace.TestClassA/B) : assignations, appels, destruction et ramasse-miettes ; affiche *** Unittest start *** / *** DONE ***.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/luaBinding.lua:249
function testBindings() end

