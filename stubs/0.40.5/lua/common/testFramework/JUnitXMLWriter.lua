---@meta
-- tim19Atlas stub generated from lua/common/testFramework/JUnitXMLWriter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Écrivain de résultats de tests au format XML JUnit pour testFramework/TestManager. Construit un DOM (testsuites > testsuite > testcase, avec un élément failure pour chaque test en échec) avec libs/slaxml/slaxdom, le sérialise avec indentation de 2 espaces et l'écrit avec writeFile.
--- Accès : `require("testFramework/JUnitXMLWriter")`
---@class testFramework_JUnitXMLWriter
local testFramework_JUnitXMLWriter = {}

--- Écrit les résultats de tests dans un fichier XML JUnit et logue le chemin.
---Source : lua/common/testFramework/JUnitXMLWriter.lua:23
---@param results table {testResults = {{name, duration, passed, expectedToFail, errorMessage}}, testFailCount, totalDuration, suiteName?}.
---@param outputFile string Chemin du fichier XML (writeFile).
---@param suiteName string|nil Nom de la suite de tests.
function testFramework_JUnitXMLWriter.write(results, outputFile, suiteName) end

return testFramework_JUnitXMLWriter
