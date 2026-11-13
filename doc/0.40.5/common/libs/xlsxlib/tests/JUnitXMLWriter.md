# `libs_xlsxlib_tests_JUnitXMLWriter`

*Fichier : `lua/common/libs/xlsxlib/tests/JUnitXMLWriter.lua` · VM : Commun (GE + véhicule) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/xlsxlib/tests/JUnitXMLWriter")`

Écrivain de résultats de tests au format XML JUnit pour les tests de xlsxlib. Construit un DOM (testsuites > testsuite > testcase, avec un élément failure pour chaque test en échec) puis le sérialise et l'écrit avec writeFile. Utilisé par libs/xlsxlib/tests/TestManager.

## Remarques

- Le fichier requiert `libs/slaxml/slaxml` (pas slaxdom) mais appelle `SLAXML:xml`, qui n'est défini que par slaxdom ; cela fonctionne seulement si slaxdom a déjà été chargé quelque part (il l'est via xlsxlib). Isolé, l'appel échouerait.
- Le nom de la suite est fixé à "LuaUnitTests". Les tests en échec ont type "ExpectedFailure" si le test devait échouer, sinon "Failure".

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_xlsxlib_tests_JUnitXMLWriter.write(results, outputFile)` | Écrit les résultats dans un fichier XML JUnit (indentation 2) et logue le chemin. | 19 |

### Détail des paramètres

#### `libs_xlsxlib_tests_JUnitXMLWriter.write(results, outputFile)`

Écrit les résultats dans un fichier XML JUnit (indentation 2) et logue le chemin.

- `results` (*table*) : {testResults = {{name, duration, passed, expectedToFail, errorMessage}}, testFailCount, totalDuration}.
- `outputFile` (*string*) : Chemin du fichier XML à écrire (writeFile).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/xlsxlib/tests/JUnitXMLWriter.lua`.*
