---@meta
-- tim19Atlas stub generated from lua/common/libs/xlsxlib/tests/JUnitXMLWriter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Écrivain de résultats de tests au format XML JUnit pour les tests de xlsxlib. Construit un DOM (testsuites > testsuite > testcase, avec un élément failure pour chaque test en échec) puis le sérialise et l'écrit avec writeFile. Utilisé par libs/xlsxlib/tests/TestManager.
--- Accès : `require("libs/xlsxlib/tests/JUnitXMLWriter")`
---@class libs_xlsxlib_tests_JUnitXMLWriter
local libs_xlsxlib_tests_JUnitXMLWriter = {}

--- Écrit les résultats dans un fichier XML JUnit (indentation 2) et logue le chemin.
---Source : lua/common/libs/xlsxlib/tests/JUnitXMLWriter.lua:19
---@param results table {testResults = {{name, duration, passed, expectedToFail, errorMessage}}, testFailCount, totalDuration}.
---@param outputFile string Chemin du fichier XML à écrire (writeFile).
function libs_xlsxlib_tests_JUnitXMLWriter.write(results, outputFile) end

return libs_xlsxlib_tests_JUnitXMLWriter
