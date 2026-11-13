# `libs_xlsxlib_tests_tests`

*Fichier : `lua/common/libs/xlsxlib/tests/tests.lua` · VM : Commun (GE + véhicule) · 131 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/xlsxlib/tests/tests")`

Tests unitaires de xlsxlib (Thomas Fischer, 2024). Chaque test charge `test_input_1.xlsx`, lit une feuille ou une plage et compare le résultat au fichier JSON attendu situé dans lua/common/libs/xlsxlib/tests/. Si le fichier attendu n'existe pas, il est créé à partir du résultat courant (avec un avertissement : à vérifier à la main). Lancement : `rerequire('libs/xlsxlib/tests/tests').runTests()`.

## Exemple

```lua
rerequire('libs/xlsxlib/tests/tests').runTests()
```

## Remarques

- `runTests` crée le dossier /junit-results/ et écrit le rapport dans /junit-results/xlsxlib-results.xml.
- Les tests utilisent le gestionnaire libs/xlsxlib/tests/TestManager ; les noms finissant par `_shouldFail` doivent échouer.
- Utilise les fonctions globales du jeu serialize, jsonEncodePretty, writeFile, jsonReadFile, dumps, log et le moteur FS:fileExists.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_xlsxlib_tests_tests.runTests()` | Crée /junit-results/ puis exécute tous les tests de la table Tests via TestManager et écrit /junit-results/xlsxlib-results.xml. | 123 |

## Classe `Tests`

Table des cas de test (méthodes appelées par TestManager avec un contexte `context`).

| Méthode | Description | Ligne |
|---|---|---|
| `Tests:test_firstSheet(context)` | Lit la première feuille du classeur (sans nom de feuille). | 81 |
| `Tests:test_nonExistentSheet_shouldFail(context)` | Demande une feuille inexistante ; doit échouer (erreur « Sheet not found »). | 77 |
| `Tests:test_selectCellRange(context)` | Sélectionne une plage de cellules. | 105 |
| `Tests:test_selectColumnRange(context)` | Sélectionne une plage de colonnes. | 97 |
| `Tests:test_selectEntireColumn(context)` | Sélectionne une colonne entière. | 89 |
| `Tests:test_selectEntireRow(context)` | Sélectionne une ligne entière. | 93 |
| `Tests:test_selectEntireSheet(context)` | Sélectionne toute la feuille « Sheet1 ». | 117 |
| `Tests:test_selectInvalidRange_shouldFail(context)` | Plage invalide ; doit échouer. | 113 |
| `Tests:test_selectMixedAbsoluteRelative(context)` | Sélectionne une plage mêlant références absolues et relatives. | 109 |
| `Tests:test_selectRowRange(context)` | Sélectionne une plage de lignes. | 101 |
| `Tests:test_selectSingleCell(context)` | Sélectionne une cellule unique. | 85 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/xlsxlib/tests/tests.lua`.*
