# `libs_xlsxlib_tests_TestManager`

*Fichier : `lua/common/libs/xlsxlib/tests/TestManager.lua` · VM : Commun (GE + véhicule) · 195 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/xlsxlib/tests/TestManager")`

Gestionnaire de tests unitaires minimal (Thomas Fischer, 2024) propre aux tests de xlsxlib ; c'est l'ancêtre de testFramework/TestManager. Il collecte les fonctions dont le nom commence par "test" dans une table, les exécute dans l'ordre alphabétique, journalise PASSED/FAILED, et écrit un rapport XML JUnit si un fichier de sortie est donné. Un test dont le nom finit par `_shouldFail` doit échouer pour être considéré comme réussi.

## Exemple

```lua
local tm = require('libs/xlsxlib/tests/TestManager')
local tests = {}
function tests:testExemple(ctx) ctx:success('ok') end
tm:run(tests, '/junit-results/exemple.xml')
```

## Remarques

- `run` appelle chaque test avec `func(tests, ctx)` : il faut donc écrire les tests avec la syntaxe `function Tests:test_x(context)` (le contexte est le second argument). L'exemple du fichier (`function tests.testExampleSuccess(context)`) est incorrect : `context` y reçoit la table de tests.
- Contexte fourni : `ctx:fail(message)` (lève une erreur), `ctx:success(message)` (message affiché si le test réussit).
- Le fichier fait `require('socket')` pour `socket.gettime` (durées) et `require('json')`, `libs.xlsxlib.xlsxlib`.
- Les compteurs (`__internal.testPassCount/testFailCount/testResults`) sont remis à zéro après chaque run.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_xlsxlib_tests_TestManager.run(self, tests, outputFile)` | Exécute les tests de la table `tests` (clés commençant par "test", triées), journalise le résultat de chacun, affiche les compteurs, puis écrit le XML JUnit si `outputFile` est donné. (assignée dynamiquement) | dyn |
| `libs_xlsxlib_tests_TestManager.setLogDefault(self, logLevel)` | Définit le niveau de log par défaut (champ interne LogDefault ; non utilisé ensuite par run). (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `libs_xlsxlib_tests_TestManager.run(self, tests, outputFile)`

Exécute les tests de la table `tests` (clés commençant par "test", triées), journalise le résultat de chacun, affiche les compteurs, puis écrit le XML JUnit si `outputFile` est donné. (assignée dynamiquement)

- `self` (*table*) : TestManager.
- `tests` (*table<string, function>*) : Fonctions de test ; les clés non "test*" provoquent un message d'erreur « Unknown test function ».
- `outputFile` (*string|nil*) : Chemin du rapport JUnit XML.

#### `libs_xlsxlib_tests_TestManager.setLogDefault(self, logLevel)`

Définit le niveau de log par défaut (champ interne LogDefault ; non utilisé ensuite par run). (assignée dynamiquement)

- `self` (*table*) : TestManager (appel avec les deux-points).
- `logLevel` (*integer*) : LogAlways, LogErrors ou LogFails.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/xlsxlib/tests/TestManager.lua`.*
