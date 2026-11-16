# `utils_test`

*Fichier : `lua/common/utils.test.lua` · VM : Commun (GE + véhicule) · 955 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils.test")`

Tests unitaires des fonctions utilitaires globales de `utils` (couleurs, chaînes, tables, JSON, sérialisation, copie, chemins, itérateurs triés/mélangés), à exécuter avec testFramework/TestManager. Lancement : `require('testFramework/TestManager'):runTestFiles('utils')` dans la console GE. Utile à un moddeur comme exemples de comportement attendu (cas limites compris) des helpers globaux.

## Exemple

```lua
require('testFramework/TestManager'):runTestFiles('utils')
```

## Remarques

- Chaque fonction prend un contexte `ctx` fourni par TestManager et n'est pas destinée à être appelée directement ; le fichier fait `require('utils')` pour charger les helpers.
- Plusieurs tests « NoGarbage »/« single-shot » vérifient un budget d'allocation (ctx:allowGarbage / checkGarbage).
- Les tests de table testTableEndC, testTableInsertC et testTableSizeC couvrent les enveloppes de fonctions C du moteur (table.new-like).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_test.testArrayConcat(ctx)` | Teste la concaténation de tableaux. *(interne)* | 575 |
| `utils_test.testArrayFindValueIndex(ctx)` | Teste la recherche de l'indice d'une valeur dans un tableau. *(interne)* | 692 |
| `utils_test.testArrayReverse(ctx)` | Teste l'inversion d'un tableau. *(interne)* | 724 |
| `utils_test.testArrayShuffle(ctx)` | Teste que le mélange d'un tableau conserve les éléments et la taille. *(interne)* | 702 |
| `utils_test.testBytesToString(ctx)` | Teste le formatage de tailles en octets selon les unités et les cas limites. *(interne)* | 303 |
| `utils_test.testCheckTableDataTypes(ctx)` | Teste le helper de validation des types de données d'une table. *(interne)* | 804 |
| `utils_test.testColorConversion(ctx)` | Teste les conversions RGB/HSV et hexadécimal des couleurs. *(interne)* | 36 |
| `utils_test.testColorCreation(ctx)` | Teste les constructeurs de couleur RGBA et de valeurs empaquetées. *(interne)* | 83 |
| `utils_test.testColorGenerators(ctx)` | Teste que les générateurs procéduraux de couleurs renvoient des couleurs valides. *(interne)* | 138 |
| `utils_test.testDeepCopy(ctx)` | Teste la copie profonde, y compris les références partagées en losange. *(interne)* | 777 |
| `utils_test.testDumps(ctx)` | Teste le format de dumps pour quelques formes d'arguments (table, plusieurs arguments, aucun). *(interne)* | 149 |
| `utils_test.testFlattenTable(ctx)` | Teste l'aplatissement de tables imbriquées. *(interne)* | 922 |
| `utils_test.testFormatTimeStringNow(ctx)` | Teste la forme de la sortie du helper de formatage de l'heure courante. *(interne)* | 325 |
| `utils_test.testGraphs(ctx)` | Teste le rendu de graphes ASCII (signes, écrêtage). *(interne)* | 332 |
| `utils_test.testJsonCdataRoundtrip(ctx)` | Teste la gestion JSON des valeurs cdata vec3/quat de BeamNG. *(interne)* | 424 |
| `utils_test.testJsonDecodeEncodePrettyRoundtrip(ctx)` | Teste la stabilité de decode puis encodePretty. *(interne)* | 403 |
| `utils_test.testJsonDecodeInvalid(ctx)` | Teste le comportement du décodage JSON invalide et la suppression des logs. *(interne)* | 447 |
| `utils_test.testJsonEncodePrefix(ctx)` | Teste l'encodage JSON avec un préfixe de sortie facultatif. *(interne)* | 375 |
| `utils_test.testJsonEncodePretty(ctx)` | Teste que l'encodage JSON lisible (pretty) contient des clés formatées. *(interne)* | 365 |
| `utils_test.testJsonEncodePrettyDecodeRoundtrip(ctx)` | Teste la stabilité de encodePretty puis decode. *(interne)* | 382 |
| `utils_test.testJsonRoundtrip(ctx)` | Teste l'aller-retour encode/decode JSON sur des tables simples. *(interne)* | 355 |
| `utils_test.testLoadIni(ctx)` | Teste l'analyse de fichiers INI et le traitement des lignes mal formées. *(interne)* | 883 |
| `utils_test.testLpadRpad(ctx)` | Teste les helpers de remplissage à gauche (lpad) et à droite (rpad). *(interne)* | 189 |
| `utils_test.testNoGarbageDumpDumpsSingleShot(ctx)` | Teste le budget de garbage (12288 octets) de dump/dumps pour les chemins d'appel courants, en un seul appel. *(interne)* | 161 |
| `utils_test.testParseColor(ctx)` | Teste parseColor avec un hexadécimal, une table et des valeurs invalides. *(interne)* | 119 |
| `utils_test.testPathUtils(ctx)` | Teste les helpers de chemins et d'extraction de nom de niveau. *(interne)* | 828 |
| `utils_test.testRainbowColor(ctx)` | Teste la génération de couleurs arc-en-ciel aux bornes de la plage. *(interne)* | 70 |
| `utils_test.testSerialization(ctx)` | Teste les helpers de sérialisation et de désérialisation. *(interne)* | 869 |
| `utils_test.testSetOperations(ctx)` | Teste les helpers de type ensemble : appartenance et mises à jour. *(interne)* | 472 |
| `utils_test.testShallowCopy(ctx)` | Teste que la copie superficielle conserve les références du premier niveau. *(interne)* | 768 |
| `utils_test.testShuffledPairs(ctx)` | Teste que shuffledPairs renvoie chaque paire exactement une fois. *(interne)* | 946 |
| `utils_test.testSortedPairs(ctx)` | Teste l'ordre d'itération déterministe de sortedPairs. *(interne)* | 934 |
| `utils_test.testSplit(ctx)` | Teste split : limites et cas limites de délimiteur. *(interne)* | 203 |
| `utils_test.testStringHash(ctx)` | Teste que le hachage de chaînes est déterministe. *(interne)* | 281 |
| `utils_test.testStringSentenceCase(ctx)` | Teste la conversion en casse de phrase. *(interne)* | 275 |
| `utils_test.testStringSplit(ctx)` | Teste les variantes de l'API string.split et ses limites. *(interne)* | 259 |
| `utils_test.testStringStartEnd(ctx)` | Teste les helpers startswith/endswith des chaînes. *(interne)* | 235 |
| `utils_test.testStringStrip(ctx)` | Teste string.strip avec des classes de caractères explicites. *(interne)* | 248 |
| `utils_test.testTableContainsCaseInsensitive(ctx)` | Teste l'appartenance d'une valeur à une table sans tenir compte de la casse. *(interne)* | 685 |
| `utils_test.testTableDepth(ctx)` | Teste le calcul récursif de la profondeur d'une table. *(interne)* | 739 |
| `utils_test.testTableEndC(ctx)` | Teste l'enveloppe du helper « fin de table » côté C. *(interne)* | 657 |
| `utils_test.testTableFindKey(ctx)` | Teste la recherche d'une clé à partir d'une valeur. *(interne)* | 676 |
| `utils_test.testTableHelpers(ctx)` | Teste des helpers de table courants. *(interne)* | 505 |
| `utils_test.testTableInsertC(ctx)` | Teste l'enveloppe du helper d'insertion côté C. *(interne)* | 665 |
| `utils_test.testTableIsArray(ctx)` | Teste la classification de tableIsArray. *(interne)* | 527 |
| `utils_test.testTableIsEmpty(ctx)` | Teste la détection de table vide. *(interne)* | 538 |
| `utils_test.testTableKeysSorted(ctx)` | Teste l'extraction triée des clés d'une table. *(interne)* | 548 |
| `utils_test.testTableMerge(ctx)` | Teste la fusion superficielle de tables. *(interne)* | 591 |
| `utils_test.testTableReadOnly(ctx)` | Teste la protection des tables en lecture seule. *(interne)* | 641 |
| `utils_test.testTableRecursive(ctx)` | Teste la sémantique de la fusion récursive de tables. *(interne)* | 600 |
| `utils_test.testTableRecursiveArray(ctx)` | Teste la fusion récursive quand les valeurs sont des tableaux. *(interne)* | 622 |
| `utils_test.testTableRoundRobinKey(ctx)` | Teste le helper de sélection de clé en tourniquet. *(interne)* | 752 |
| `utils_test.testTableSizeC(ctx)` | Teste l'enveloppe du helper de taille de table côté C. *(interne)* | 650 |
| `utils_test.testTableToColor(ctx)` | Teste la conversion table vers couleur, y compris avec des valeurs nil. *(interne)* | 111 |
| `utils_test.testTableValuesAsLookupDict(ctx)` | Teste la conversion d'un tableau de valeurs en dictionnaire de recherche. *(interne)* | 562 |
| `utils_test.testTrim(ctx)` | Teste la suppression des espaces en début et fin de chaîne. *(interne)* | 195 |

### Détail des paramètres

#### `utils_test.testArrayConcat(ctx)`

Teste la concaténation de tableaux.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testArrayFindValueIndex(ctx)`

Teste la recherche de l'indice d'une valeur dans un tableau.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testArrayReverse(ctx)`

Teste l'inversion d'un tableau.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testArrayShuffle(ctx)`

Teste que le mélange d'un tableau conserve les éléments et la taille.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testBytesToString(ctx)`

Teste le formatage de tailles en octets selon les unités et les cas limites.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testCheckTableDataTypes(ctx)`

Teste le helper de validation des types de données d'une table.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testColorConversion(ctx)`

Teste les conversions RGB/HSV et hexadécimal des couleurs.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testColorCreation(ctx)`

Teste les constructeurs de couleur RGBA et de valeurs empaquetées.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testColorGenerators(ctx)`

Teste que les générateurs procéduraux de couleurs renvoient des couleurs valides.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testDeepCopy(ctx)`

Teste la copie profonde, y compris les références partagées en losange.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testDumps(ctx)`

Teste le format de dumps pour quelques formes d'arguments (table, plusieurs arguments, aucun).

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testFlattenTable(ctx)`

Teste l'aplatissement de tables imbriquées.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testFormatTimeStringNow(ctx)`

Teste la forme de la sortie du helper de formatage de l'heure courante.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testGraphs(ctx)`

Teste le rendu de graphes ASCII (signes, écrêtage).

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testJsonCdataRoundtrip(ctx)`

Teste la gestion JSON des valeurs cdata vec3/quat de BeamNG.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testJsonDecodeEncodePrettyRoundtrip(ctx)`

Teste la stabilité de decode puis encodePretty.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testJsonDecodeInvalid(ctx)`

Teste le comportement du décodage JSON invalide et la suppression des logs.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testJsonEncodePrefix(ctx)`

Teste l'encodage JSON avec un préfixe de sortie facultatif.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testJsonEncodePretty(ctx)`

Teste que l'encodage JSON lisible (pretty) contient des clés formatées.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testJsonEncodePrettyDecodeRoundtrip(ctx)`

Teste la stabilité de encodePretty puis decode.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testJsonRoundtrip(ctx)`

Teste l'aller-retour encode/decode JSON sur des tables simples.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testLoadIni(ctx)`

Teste l'analyse de fichiers INI et le traitement des lignes mal formées.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testLpadRpad(ctx)`

Teste les helpers de remplissage à gauche (lpad) et à droite (rpad).

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testNoGarbageDumpDumpsSingleShot(ctx)`

Teste le budget de garbage (12288 octets) de dump/dumps pour les chemins d'appel courants, en un seul appel.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testParseColor(ctx)`

Teste parseColor avec un hexadécimal, une table et des valeurs invalides.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testPathUtils(ctx)`

Teste les helpers de chemins et d'extraction de nom de niveau.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testRainbowColor(ctx)`

Teste la génération de couleurs arc-en-ciel aux bornes de la plage.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testSerialization(ctx)`

Teste les helpers de sérialisation et de désérialisation.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testSetOperations(ctx)`

Teste les helpers de type ensemble : appartenance et mises à jour.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testShallowCopy(ctx)`

Teste que la copie superficielle conserve les références du premier niveau.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testShuffledPairs(ctx)`

Teste que shuffledPairs renvoie chaque paire exactement une fois.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testSortedPairs(ctx)`

Teste l'ordre d'itération déterministe de sortedPairs.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testSplit(ctx)`

Teste split : limites et cas limites de délimiteur.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testStringHash(ctx)`

Teste que le hachage de chaînes est déterministe.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testStringSentenceCase(ctx)`

Teste la conversion en casse de phrase.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testStringSplit(ctx)`

Teste les variantes de l'API string.split et ses limites.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testStringStartEnd(ctx)`

Teste les helpers startswith/endswith des chaînes.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testStringStrip(ctx)`

Teste string.strip avec des classes de caractères explicites.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableContainsCaseInsensitive(ctx)`

Teste l'appartenance d'une valeur à une table sans tenir compte de la casse.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableDepth(ctx)`

Teste le calcul récursif de la profondeur d'une table.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableEndC(ctx)`

Teste l'enveloppe du helper « fin de table » côté C.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableFindKey(ctx)`

Teste la recherche d'une clé à partir d'une valeur.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableHelpers(ctx)`

Teste des helpers de table courants.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableInsertC(ctx)`

Teste l'enveloppe du helper d'insertion côté C.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableIsArray(ctx)`

Teste la classification de tableIsArray.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableIsEmpty(ctx)`

Teste la détection de table vide.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableKeysSorted(ctx)`

Teste l'extraction triée des clés d'une table.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableMerge(ctx)`

Teste la fusion superficielle de tables.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableReadOnly(ctx)`

Teste la protection des tables en lecture seule.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableRecursive(ctx)`

Teste la sémantique de la fusion récursive de tables.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableRecursiveArray(ctx)`

Teste la fusion récursive quand les valeurs sont des tableaux.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableRoundRobinKey(ctx)`

Teste le helper de sélection de clé en tourniquet.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableSizeC(ctx)`

Teste l'enveloppe du helper de taille de table côté C.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableToColor(ctx)`

Teste la conversion table vers couleur, y compris avec des valeurs nil.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTableValuesAsLookupDict(ctx)`

Teste la conversion d'un tableau de valeurs en dictionnaire de recherche.

- `ctx` (*table*) : Contexte de test.

#### `utils_test.testTrim(ctx)`

Teste la suppression des espaces en début et fin de chaîne.

- `ctx` (*table*) : Contexte de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils.test.lua`.*
