# `libs_xlsxlib_tests_tests`

*Fichier : `lua/common/libs/xlsxlib/tests/tests.lua` · VM : Commun (GE + véhicule) · 131 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/xlsxlib/tests/tests")`

Unit tests for the xlsx library
 Copyright 2024 BeamNG GmbH, Thomas Fischer <tfischer@beamng.gmbh>
 how to use:
 rerequire('libs/xlsxlib/tests/tests').runTests()

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_xlsxlib_tests_tests.runTests()` |  | 123 |

## Classe `Tests`

| Méthode | Description | Ligne |
|---|---|---|
| `Tests:test_firstSheet(context)` |  | 81 |
| `Tests:test_nonExistentSheet_shouldFail(context)` |  | 77 |
| `Tests:test_selectCellRange(context)` |  | 105 |
| `Tests:test_selectColumnRange(context)` |  | 97 |
| `Tests:test_selectEntireColumn(context)` |  | 89 |
| `Tests:test_selectEntireRow(context)` |  | 93 |
| `Tests:test_selectEntireSheet(context)` |  | 117 |
| `Tests:test_selectInvalidRange_shouldFail(context)` |  | 113 |
| `Tests:test_selectMixedAbsoluteRelative(context)` |  | 109 |
| `Tests:test_selectRowRange(context)` |  | 101 |
| `Tests:test_selectSingleCell(context)` |  | 85 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/xlsxlib/tests/tests.lua`.*
