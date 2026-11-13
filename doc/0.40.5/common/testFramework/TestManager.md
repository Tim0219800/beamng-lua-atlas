# `testFramework_TestManager`

*Fichier : `lua/common/testFramework/TestManager.lua` · VM : Commun (GE + véhicule) · 528 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("testFramework/TestManager")`

Gestionnaire de tests unitaires du jeu (BeamNG GmbH, Thomas Fischer, 2024). Il exécute des fonctions de test regroupées dans une table (clés commençant par "test", triées), fournit à chaque test un contexte `ctx` riche (assert, assertEqual, assertNear, fail, success, setDescription, vérifications de garbage collector), mesure la durée et la mémoire allouée, et renvoie un résumé. `runTestFiles` découvre tous les fichiers `*.test.lua` de /lua/common/ et de /lua/<vm>/ et les exécute (ex. mathlib.test.lua, utils.test.lua).

## Exemple

```lua
-- console GE :
require('testFramework/TestManager'):runTestFiles()          -- tous les *.test.lua
require('testFramework/TestManager'):runTestFiles('mathlib')  -- filtre par motif
```

## Remarques

- Contexte `ctx` passé à chaque test : fail(message, withTraceback?), success(message), setDescription(texte), assert(cond, msg), assertEqual(actual, expected, msg), assertNear(actual, expected, tolerance=0.001, msg), resetGarbageCheckpoint(), checkGarbage(maxBytes=0, msg), allowGarbage(octets), buildFailureMessage(kind, message). Un test se définit `function M.testXxx(ctx)` (un seul paramètre : ctx).
- Un nom de test se terminant par `_shouldFail` doit échouer pour être considéré comme réussi.
- Options de `run` : resultNamePrefix, writeXml (écrit le XML JUnit si outputFile est aussi donné), suppressLogs, captureLogs (capture Engine.getFrameLog), failOnErrorLogs, testPattern (filtre sur le nom), context, enableJit. Par défaut le JIT est coupé (`jit.off()`, de manière permanente pour la session) pour la reproductibilité.
- Chaque test s'exécute avec setfenv(func, _G), un collectgarbage("collect") puis `collectgarbage("stop")` : la mémoire allouée pendant le test (garbageBytes) est mesurée entre le début et la fin, puis le GC est relancé.
- L'exemple en fin de fichier appelle `testManager:run(tests, 'test-results.xml')` ; sans `options.writeXml = true`, aucun fichier n'est écrit.
- Les tests utilisent des API moteur : HighPerfTimer/hptimer, os.clockhp, Engine.getFrameLog, FS:findFiles, jsonWriteFile, log.
- ExtensionTest.lua attend une méthode `runSandboxedFunction` sur ce gestionnaire qui n'y existe pas, et la fonction locale getLuaNamespacesForVmType n'est pas exportée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `testFramework_TestManager.drainFrameLogs(self)` | Lit le journal de la frame (Engine.getFrameLog, sous pcall) et le convertit en liste {timestamp, level, origin, message}. Sert à capturer les logs d'un test. (assignée dynamiquement) *(interne)* | dyn |
| `testFramework_TestManager.logsContainErrors(self, logs)` | Indique si une liste de logs contient une entrée de niveau erreur (premier caractère du niveau = E). (assignée dynamiquement) *(interne)* | dyn |
| `testFramework_TestManager.run(self, tests, outputFile, options)` | Exécute les tests de la table `tests` et renvoie les résultats. Journalise chaque test (durée, octets de garbage), un résumé final, et écrit éventuellement un XML JUnit. (assignée dynamiquement) | dyn |
| `testFramework_TestManager.runTestFiles(self, pattern, options)` | Trouve tous les fichiers `*.test.lua` sous /lua/common/ et /lua/<vm>/ (vm "game" -> dossier ge), les charge et exécute les tests de ceux dont le chemin (ou un nom de test) correspond à `pattern`. Agrège les résultats. (assignée dynamiquement) | dyn |
| `testFramework_TestManager.setLogDefault(self, logLevel)` | Définit le niveau de log par défaut (champ interne LogDefault ; non utilisé ensuite par run). (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `testFramework_TestManager.drainFrameLogs(self)`

Lit le journal de la frame (Engine.getFrameLog, sous pcall) et le convertit en liste {timestamp, level, origin, message}. Sert à capturer les logs d'un test. (assignée dynamiquement)

- `self` (*table*) : TestManager.
- **renvoie** : table[] Entrées de log (liste vide en cas d'échec).

#### `testFramework_TestManager.logsContainErrors(self, logs)`

Indique si une liste de logs contient une entrée de niveau erreur (premier caractère du niveau = E). (assignée dynamiquement)

- `self` (*table*) : TestManager.
- `logs` (*table[]|nil*) : Entrées produites par drainFrameLogs.
- **renvoie** : boolean true s'il y a au moins une erreur.

#### `testFramework_TestManager.run(self, tests, outputFile, options)`

Exécute les tests de la table `tests` et renvoie les résultats. Journalise chaque test (durée, octets de garbage), un résumé final, et écrit éventuellement un XML JUnit. (assignée dynamiquement)

- `self` (*table*) : TestManager (appel avec les deux-points).
- `tests` (*table<string, function>*) : Fonctions de test (nom commençant par "test").
- `outputFile` (*string|nil*) : Chemin du rapport JUnit XML (utilisé seulement si options.writeXml).
- `options` (*table|nil*) : {resultNamePrefix, resultNameSeparator, writeXml, suppressLogs, captureLogs, failOnErrorLogs, testPattern, context, enableJit}.
- **renvoie** : table {testPassCount, testFailCount, testResults, totalDuration (s), totalGarbageBytes}. Chaque résultat : {name, passed, description, duration, garbageBytes, allowedGarbageBytes, expectedToFail?, errorMessage?, successMessage?, logs?}.

#### `testFramework_TestManager.runTestFiles(self, pattern, options)`

Trouve tous les fichiers `*.test.lua` sous /lua/common/ et /lua/<vm>/ (vm "game" -> dossier ge), les charge et exécute les tests de ceux dont le chemin (ou un nom de test) correspond à `pattern`. Agrège les résultats. (assignée dynamiquement)

- `self` (*table*) : TestManager.
- `pattern` (*string|nil*) : Motif Lua appliqué au chemin du fichier puis au nom des tests ; nil = tout exécuter.
- `options` (*table|nil*) : {writeResults = boolean} : écrit <fichier>.results.json à côté de chaque fichier de test.
- **renvoie** : table {testPassCount, testFailCount, totalDuration, files = {{file, results}}}.

#### `testFramework_TestManager.setLogDefault(self, logLevel)`

Définit le niveau de log par défaut (champ interne LogDefault ; non utilisé ensuite par run). (assignée dynamiquement)

- `self` (*table*) : TestManager.
- `logLevel` (*integer*) : LogAlways, LogErrors ou LogFails.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/testFramework/TestManager.lua`.*
