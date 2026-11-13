---@meta
-- tim19Atlas stub generated from lua/common/testFramework/ExtensionTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lanceur de tests automatiques pour les extensions Lua du jeu (dossiers /lua/common/extensions/ et /lua/<vm>/extensions/). Pour chaque extension retenue, il joue 8 vérifications : analyse du fichier (loadfile), exécution dans un bac à sable sans fuite de globales, chargement via extensions.load, tests fournis par l'extension (table `_unittests`), appel de tous ses hooks `onXxx` avec des données factices (testFramework/MockGenerators), couverture des générateurs factices, stabilité de la sérialisation, déchargement. Écrit un JSON de résultats détaillé (par défaut /junit-results/lua-extension-tests.json) et journalise un résumé.
--- Accès : `require("testFramework/ExtensionTest")`
---@class testFramework_ExtensionTest
local testFramework_ExtensionTest = {}

--- Découvre les extensions (selon options.pattern), exécute pour chacune la série de 8 tests via testManager:run, agrège les résultats, écrit <outputPrefix>.json et journalise le bilan. Renvoie le résumé.
---Source : lua/common/testFramework/ExtensionTest.lua:322
---@param testManager table Gestionnaire de tests, normalement require('testFramework/TestManager').
---@param options table|nil {pattern = string[], outputPrefix = string, serializationIterations = integer, writeAutoLog = boolean}.
---@return table  Résumé {vm, namespace, serializationIterations, extensions, testPassCount, testFailCount, failedExtensionCount, results, outputFiles}.
function testFramework_ExtensionTest.run(testManager, options) end

--- Raccourci : teste les extensions dont le nom correspond au motif (avec jokers). Journalise une erreur et renvoie nil si aucune ne correspond.
---Source : lua/common/testFramework/ExtensionTest.lua:395
---@param pattern string Motif de nom d'extension (ex. "gameplay_*").
---@param options table|nil Options transmises à run.
---@return table|nil  Résumé comme run, ou nil.
function testFramework_ExtensionTest.testExtensions(pattern, options) end

return testFramework_ExtensionTest
