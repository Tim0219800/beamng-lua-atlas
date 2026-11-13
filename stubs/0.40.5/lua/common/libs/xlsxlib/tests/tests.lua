---@meta
-- tim19Atlas stub generated from lua/common/libs/xlsxlib/tests/tests.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de xlsxlib (Thomas Fischer, 2024). Chaque test charge `test_input_1.xlsx`, lit une feuille ou une plage et compare le résultat au fichier JSON attendu situé dans lua/common/libs/xlsxlib/tests/. Si le fichier attendu n'existe pas, il est créé à partir du résultat courant (avec un avertissement : à vérifier à la main). Lancement : `rerequire('libs/xlsxlib/tests/tests').runTests()`.
--- Accès : `require("libs/xlsxlib/tests/tests")`
---@class libs_xlsxlib_tests_tests
local libs_xlsxlib_tests_tests = {}

--- Crée /junit-results/ puis exécute tous les tests de la table Tests via TestManager et écrit /junit-results/xlsxlib-results.xml.
---Source : lua/common/libs/xlsxlib/tests/tests.lua:123
function libs_xlsxlib_tests_tests.runTests() end

--- Table des cas de test (méthodes appelées par TestManager avec un contexte `context`).
---@class libs_xlsxlib_tests_tests_Tests
local libs_xlsxlib_tests_tests_Tests = {}

--- Lit la première feuille du classeur (sans nom de feuille).
---Source : lua/common/libs/xlsxlib/tests/tests.lua:81
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_firstSheet(context) end

--- Demande une feuille inexistante ; doit échouer (erreur « Sheet not found »).
---Source : lua/common/libs/xlsxlib/tests/tests.lua:77
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_nonExistentSheet_shouldFail(context) end

--- Sélectionne une plage de cellules.
---Source : lua/common/libs/xlsxlib/tests/tests.lua:105
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_selectCellRange(context) end

--- Sélectionne une plage de colonnes.
---Source : lua/common/libs/xlsxlib/tests/tests.lua:97
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_selectColumnRange(context) end

--- Sélectionne une colonne entière.
---Source : lua/common/libs/xlsxlib/tests/tests.lua:89
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_selectEntireColumn(context) end

--- Sélectionne une ligne entière.
---Source : lua/common/libs/xlsxlib/tests/tests.lua:93
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_selectEntireRow(context) end

--- Sélectionne toute la feuille « Sheet1 ».
---Source : lua/common/libs/xlsxlib/tests/tests.lua:117
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_selectEntireSheet(context) end

--- Plage invalide ; doit échouer.
---Source : lua/common/libs/xlsxlib/tests/tests.lua:113
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_selectInvalidRange_shouldFail(context) end

--- Sélectionne une plage mêlant références absolues et relatives.
---Source : lua/common/libs/xlsxlib/tests/tests.lua:109
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_selectMixedAbsoluteRelative(context) end

--- Sélectionne une plage de lignes.
---Source : lua/common/libs/xlsxlib/tests/tests.lua:101
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_selectRowRange(context) end

--- Sélectionne une cellule unique.
---Source : lua/common/libs/xlsxlib/tests/tests.lua:85
---@param context table Contexte de test.
function libs_xlsxlib_tests_tests_Tests:test_selectSingleCell(context) end

return libs_xlsxlib_tests_tests
