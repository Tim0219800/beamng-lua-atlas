# `testFramework_JUnitXMLWriter`

*Fichier : `lua/common/testFramework/JUnitXMLWriter.lua` · VM : Commun (GE + véhicule) · 101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("testFramework/JUnitXMLWriter")`

Écrivain de résultats de tests au format XML JUnit pour testFramework/TestManager. Construit un DOM (testsuites > testsuite > testcase, avec un élément failure pour chaque test en échec) avec libs/slaxml/slaxdom, le sérialise avec indentation de 2 espaces et l'écrit avec writeFile.

## Remarques

- Le nom de la suite est `suiteName`, ou `results.suiteName`, ou "LuaUnitTests" par défaut.
- Un test en échec porte un élément <failure type="ExpectedFailure"|"Failure"> dont le texte est errorMessage.
- Appelé par TestManager:run seulement si options.writeXml == true et qu'un fichier de sortie est donné.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `testFramework_JUnitXMLWriter.write(results, outputFile, suiteName)` | Écrit les résultats de tests dans un fichier XML JUnit et logue le chemin. | 23 |

### Détail des paramètres

#### `testFramework_JUnitXMLWriter.write(results, outputFile, suiteName)`

Écrit les résultats de tests dans un fichier XML JUnit et logue le chemin.

- `results` (*table*) : {testResults = {{name, duration, passed, expectedToFail, errorMessage}}, testFailCount, totalDuration, suiteName?}.
- `outputFile` (*string*) : Chemin du fichier XML (writeFile).
- `suiteName` (*string|nil*) : Nom de la suite de tests.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/testFramework/JUnitXMLWriter.lua`.*
