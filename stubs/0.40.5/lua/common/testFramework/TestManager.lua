---@meta
-- tim19Atlas stub generated from lua/common/testFramework/TestManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire de tests unitaires du jeu (BeamNG GmbH, Thomas Fischer, 2024). Il exécute des fonctions de test regroupées dans une table (clés commençant par "test", triées), fournit à chaque test un contexte `ctx` riche (assert, assertEqual, assertNear, fail, success, setDescription, vérifications de garbage collector), mesure la durée et la mémoire allouée, et renvoie un résumé. `runTestFiles` découvre tous les fichiers `*.test.lua` de /lua/common/ et de /lua/<vm>/ et les exécute (ex. mathlib.test.lua, utils.test.lua).
--- Accès : `require("testFramework/TestManager")`
---@class testFramework_TestManager
local testFramework_TestManager = {}

--- Lit le journal de la frame (Engine.getFrameLog, sous pcall) et le convertit en liste {timestamp, level, origin, message}. Sert à capturer les logs d'un test. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/testFramework/TestManager.lua:dyn
---@param self table TestManager.
---@return table[]  Entrées de log (liste vide en cas d'échec).
function testFramework_TestManager.drainFrameLogs(self) end

--- Indique si une liste de logs contient une entrée de niveau erreur (premier caractère du niveau = E). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/testFramework/TestManager.lua:dyn
---@param self table TestManager.
---@param logs table[]|nil Entrées produites par drainFrameLogs.
---@return boolean  true s'il y a au moins une erreur.
function testFramework_TestManager.logsContainErrors(self, logs) end

--- Exécute les tests de la table `tests` et renvoie les résultats. Journalise chaque test (durée, octets de garbage), un résumé final, et écrit éventuellement un XML JUnit. (assignée dynamiquement)
---Source : lua/common/testFramework/TestManager.lua:dyn
---@param self table TestManager (appel avec les deux-points).
---@param tests table<string, function> Fonctions de test (nom commençant par "test").
---@param outputFile string|nil Chemin du rapport JUnit XML (utilisé seulement si options.writeXml).
---@param options table|nil {resultNamePrefix, resultNameSeparator, writeXml, suppressLogs, captureLogs, failOnErrorLogs, testPattern, context, enableJit}.
---@return table  {testPassCount, testFailCount, testResults, totalDuration (s), totalGarbageBytes}. Chaque résultat : {name, passed, description, duration, garbageBytes, allowedGarbageBytes, expectedToFail?, errorMessage?, successMessage?, logs?}.
function testFramework_TestManager.run(self, tests, outputFile, options) end

--- Trouve tous les fichiers `*.test.lua` sous /lua/common/ et /lua/<vm>/ (vm "game" -> dossier ge), les charge et exécute les tests de ceux dont le chemin (ou un nom de test) correspond à `pattern`. Agrège les résultats. (assignée dynamiquement)
---Source : lua/common/testFramework/TestManager.lua:dyn
---@param self table TestManager.
---@param pattern string|nil Motif Lua appliqué au chemin du fichier puis au nom des tests ; nil = tout exécuter.
---@param options table|nil {writeResults = boolean} : écrit <fichier>.results.json à côté de chaque fichier de test.
---@return table  {testPassCount, testFailCount, totalDuration, files = {{file, results}}}.
function testFramework_TestManager.runTestFiles(self, pattern, options) end

--- Définit le niveau de log par défaut (champ interne LogDefault ; non utilisé ensuite par run). (assignée dynamiquement)
---Source : lua/common/testFramework/TestManager.lua:dyn
---@param self table TestManager.
---@param logLevel integer LogAlways, LogErrors ou LogFails.
function testFramework_TestManager.setLogDefault(self, logLevel) end

return testFramework_TestManager
