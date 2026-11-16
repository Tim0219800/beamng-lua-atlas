# `testFramework_ExtensionTest`

*Fichier : `lua/common/testFramework/ExtensionTest.lua` · VM : Commun (GE + véhicule) · 409 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("testFramework/ExtensionTest")`

Lanceur de tests automatiques pour les extensions Lua du jeu (dossiers /lua/common/extensions/ et /lua/<vm>/extensions/). Pour chaque extension retenue, il joue 8 vérifications : analyse du fichier (loadfile), exécution dans un bac à sable sans fuite de globales, chargement via extensions.load, tests fournis par l'extension (table `_unittests`), appel de tous ses hooks `onXxx` avec des données factices (testFramework/MockGenerators), couverture des générateurs factices, stabilité de la sérialisation, déchargement. Écrit un JSON de résultats détaillé (par défaut /junit-results/lua-extension-tests.json) et journalise un résumé.

## Exemple

```lua
-- console GE :
local et = require('testFramework/ExtensionTest')
et.testExtensions('core_*')   -- extensions dont le nom correspond au motif (joker *)
```

## Remarques

- Bug : `M.run` appelle `getLuaNamespacesForVmType()`, fonction locale de testFramework/TestManager.lua et non définie ici ; l'appel lève « attempt to call a nil value ».
- Bug : le test 2 appelle `testManager:runSandboxedFunction(...)`, méthode qui n'existe pas dans testFramework/TestManager.lua de cette version.
- Ces deux appels indiquent que le lanceur est incomplet dans la version 0.40.5 : il ne fonctionne probablement pas tel quel.
- Les motifs de nom d'extension acceptent le joker `*` (converti en motif Lua ancré) ; la liste d'extensions est triée par nom.
- Une extension n'est retenue qu'une fois même si elle existe dans common et dans la VM courante (common prioritaire).
- Options de `run` : pattern (liste de jokers), outputPrefix (défaut /junit-results/lua-extension-tests), serializationIterations (défaut 3), writeAutoLog (appelle extensions/test/util/autoTest si présent).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `testFramework_ExtensionTest.run(testManager, options)` | Découvre les extensions (selon options.pattern), exécute pour chacune la série de 8 tests via testManager:run, agrège les résultats, écrit <outputPrefix>.json et journalise le bilan. Renvoie le résumé. | 322 |
| `testFramework_ExtensionTest.testExtensions(pattern, options)` | Raccourci : teste les extensions dont le nom correspond au motif (avec jokers). Journalise une erreur et renvoie nil si aucune ne correspond. | 395 |

### Détail des paramètres

#### `testFramework_ExtensionTest.run(testManager, options)`

Découvre les extensions (selon options.pattern), exécute pour chacune la série de 8 tests via testManager:run, agrège les résultats, écrit <outputPrefix>.json et journalise le bilan. Renvoie le résumé.

- `testManager` (*table*) : Gestionnaire de tests, normalement require('testFramework/TestManager').
- `options` (*table|nil*) : {pattern = string[], outputPrefix = string, serializationIterations = integer, writeAutoLog = boolean}.
- **renvoie** : table Résumé {vm, namespace, serializationIterations, extensions, testPassCount, testFailCount, failedExtensionCount, results, outputFiles}.

#### `testFramework_ExtensionTest.testExtensions(pattern, options)`

Raccourci : teste les extensions dont le nom correspond au motif (avec jokers). Journalise une erreur et renvoie nil si aucune ne correspond.

- `pattern` (*string*) : Motif de nom d'extension (ex. "gameplay_*").
- `options` (*table|nil*) : Options transmises à run.
- **renvoie** : table|nil Résumé comme run, ou nil.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/testFramework/ExtensionTest.lua`.*
