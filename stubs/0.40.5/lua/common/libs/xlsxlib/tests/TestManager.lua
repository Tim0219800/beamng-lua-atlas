---@meta
-- tim19Atlas stub generated from lua/common/libs/xlsxlib/tests/TestManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire de tests unitaires minimal (Thomas Fischer, 2024) propre aux tests de xlsxlib ; c'est l'ancêtre de testFramework/TestManager. Il collecte les fonctions dont le nom commence par "test" dans une table, les exécute dans l'ordre alphabétique, journalise PASSED/FAILED, et écrit un rapport XML JUnit si un fichier de sortie est donné. Un test dont le nom finit par `_shouldFail` doit échouer pour être considéré comme réussi.
--- Accès : `require("libs/xlsxlib/tests/TestManager")`
---@class libs_xlsxlib_tests_TestManager
local libs_xlsxlib_tests_TestManager = {}

--- Exécute les tests de la table `tests` (clés commençant par "test", triées), journalise le résultat de chacun, affiche les compteurs, puis écrit le XML JUnit si `outputFile` est donné. (assignée dynamiquement)
---Source : lua/common/libs/xlsxlib/tests/TestManager.lua:dyn
---@param self table TestManager.
---@param tests table<string, function> Fonctions de test ; les clés non "test*" provoquent un message d'erreur « Unknown test function ».
---@param outputFile string|nil Chemin du rapport JUnit XML.
function libs_xlsxlib_tests_TestManager.run(self, tests, outputFile) end

--- Définit le niveau de log par défaut (champ interne LogDefault ; non utilisé ensuite par run). (assignée dynamiquement)
---Source : lua/common/libs/xlsxlib/tests/TestManager.lua:dyn
---@param self table TestManager (appel avec les deux-points).
---@param logLevel integer LogAlways, LogErrors ou LogFails.
function libs_xlsxlib_tests_TestManager.setLogDefault(self, logLevel) end

return libs_xlsxlib_tests_TestManager
