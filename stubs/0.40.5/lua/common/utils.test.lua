---@meta
-- tim19Atlas stub generated from lua/common/utils.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires des fonctions utilitaires globales de `utils` (couleurs, chaînes, tables, JSON, sérialisation, copie, chemins, itérateurs triés/mélangés), à exécuter avec testFramework/TestManager. Lancement : `require('testFramework/TestManager'):runTestFiles('utils')` dans la console GE. Utile à un moddeur comme exemples de comportement attendu (cas limites compris) des helpers globaux.
--- Accès : `require("utils.test")`
---@class utils_test
local utils_test = {}

--- Teste la concaténation de tableaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:575
---@param ctx table Contexte de test.
function utils_test.testArrayConcat(ctx) end

--- Teste la recherche de l'indice d'une valeur dans un tableau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:692
---@param ctx table Contexte de test.
function utils_test.testArrayFindValueIndex(ctx) end

--- Teste l'inversion d'un tableau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:724
---@param ctx table Contexte de test.
function utils_test.testArrayReverse(ctx) end

--- Teste que le mélange d'un tableau conserve les éléments et la taille.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:702
---@param ctx table Contexte de test.
function utils_test.testArrayShuffle(ctx) end

--- Teste le formatage de tailles en octets selon les unités et les cas limites.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:303
---@param ctx table Contexte de test.
function utils_test.testBytesToString(ctx) end

--- Teste le helper de validation des types de données d'une table.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:804
---@param ctx table Contexte de test.
function utils_test.testCheckTableDataTypes(ctx) end

--- Teste les conversions RGB/HSV et hexadécimal des couleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:36
---@param ctx table Contexte de test.
function utils_test.testColorConversion(ctx) end

--- Teste les constructeurs de couleur RGBA et de valeurs empaquetées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:83
---@param ctx table Contexte de test.
function utils_test.testColorCreation(ctx) end

--- Teste que les générateurs procéduraux de couleurs renvoient des couleurs valides.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:138
---@param ctx table Contexte de test.
function utils_test.testColorGenerators(ctx) end

--- Teste la copie profonde, y compris les références partagées en losange.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:777
---@param ctx table Contexte de test.
function utils_test.testDeepCopy(ctx) end

--- Teste le format de dumps pour quelques formes d'arguments (table, plusieurs arguments, aucun).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:149
---@param ctx table Contexte de test.
function utils_test.testDumps(ctx) end

--- Teste l'aplatissement de tables imbriquées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:922
---@param ctx table Contexte de test.
function utils_test.testFlattenTable(ctx) end

--- Teste la forme de la sortie du helper de formatage de l'heure courante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:325
---@param ctx table Contexte de test.
function utils_test.testFormatTimeStringNow(ctx) end

--- Teste le rendu de graphes ASCII (signes, écrêtage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:332
---@param ctx table Contexte de test.
function utils_test.testGraphs(ctx) end

--- Teste la gestion JSON des valeurs cdata vec3/quat de BeamNG.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:424
---@param ctx table Contexte de test.
function utils_test.testJsonCdataRoundtrip(ctx) end

--- Teste la stabilité de decode puis encodePretty.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:403
---@param ctx table Contexte de test.
function utils_test.testJsonDecodeEncodePrettyRoundtrip(ctx) end

--- Teste le comportement du décodage JSON invalide et la suppression des logs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:447
---@param ctx table Contexte de test.
function utils_test.testJsonDecodeInvalid(ctx) end

--- Teste l'encodage JSON avec un préfixe de sortie facultatif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:375
---@param ctx table Contexte de test.
function utils_test.testJsonEncodePrefix(ctx) end

--- Teste que l'encodage JSON lisible (pretty) contient des clés formatées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:365
---@param ctx table Contexte de test.
function utils_test.testJsonEncodePretty(ctx) end

--- Teste la stabilité de encodePretty puis decode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:382
---@param ctx table Contexte de test.
function utils_test.testJsonEncodePrettyDecodeRoundtrip(ctx) end

--- Teste l'aller-retour encode/decode JSON sur des tables simples.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:355
---@param ctx table Contexte de test.
function utils_test.testJsonRoundtrip(ctx) end

--- Teste l'analyse de fichiers INI et le traitement des lignes mal formées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:883
---@param ctx table Contexte de test.
function utils_test.testLoadIni(ctx) end

--- Teste les helpers de remplissage à gauche (lpad) et à droite (rpad).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:189
---@param ctx table Contexte de test.
function utils_test.testLpadRpad(ctx) end

--- Teste le budget de garbage (12288 octets) de dump/dumps pour les chemins d'appel courants, en un seul appel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:161
---@param ctx table Contexte de test.
function utils_test.testNoGarbageDumpDumpsSingleShot(ctx) end

--- Teste parseColor avec un hexadécimal, une table et des valeurs invalides.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:119
---@param ctx table Contexte de test.
function utils_test.testParseColor(ctx) end

--- Teste les helpers de chemins et d'extraction de nom de niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:828
---@param ctx table Contexte de test.
function utils_test.testPathUtils(ctx) end

--- Teste la génération de couleurs arc-en-ciel aux bornes de la plage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:70
---@param ctx table Contexte de test.
function utils_test.testRainbowColor(ctx) end

--- Teste les helpers de sérialisation et de désérialisation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:869
---@param ctx table Contexte de test.
function utils_test.testSerialization(ctx) end

--- Teste les helpers de type ensemble : appartenance et mises à jour.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:472
---@param ctx table Contexte de test.
function utils_test.testSetOperations(ctx) end

--- Teste que la copie superficielle conserve les références du premier niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:768
---@param ctx table Contexte de test.
function utils_test.testShallowCopy(ctx) end

--- Teste que shuffledPairs renvoie chaque paire exactement une fois.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:946
---@param ctx table Contexte de test.
function utils_test.testShuffledPairs(ctx) end

--- Teste l'ordre d'itération déterministe de sortedPairs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:934
---@param ctx table Contexte de test.
function utils_test.testSortedPairs(ctx) end

--- Teste split : limites et cas limites de délimiteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:203
---@param ctx table Contexte de test.
function utils_test.testSplit(ctx) end

--- Teste que le hachage de chaînes est déterministe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:281
---@param ctx table Contexte de test.
function utils_test.testStringHash(ctx) end

--- Teste la conversion en casse de phrase.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:275
---@param ctx table Contexte de test.
function utils_test.testStringSentenceCase(ctx) end

--- Teste les variantes de l'API string.split et ses limites.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:259
---@param ctx table Contexte de test.
function utils_test.testStringSplit(ctx) end

--- Teste les helpers startswith/endswith des chaînes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:235
---@param ctx table Contexte de test.
function utils_test.testStringStartEnd(ctx) end

--- Teste string.strip avec des classes de caractères explicites.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:248
---@param ctx table Contexte de test.
function utils_test.testStringStrip(ctx) end

--- Teste l'appartenance d'une valeur à une table sans tenir compte de la casse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:685
---@param ctx table Contexte de test.
function utils_test.testTableContainsCaseInsensitive(ctx) end

--- Teste le calcul récursif de la profondeur d'une table.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:739
---@param ctx table Contexte de test.
function utils_test.testTableDepth(ctx) end

--- Teste l'enveloppe du helper « fin de table » côté C.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:657
---@param ctx table Contexte de test.
function utils_test.testTableEndC(ctx) end

--- Teste la recherche d'une clé à partir d'une valeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:676
---@param ctx table Contexte de test.
function utils_test.testTableFindKey(ctx) end

--- Teste des helpers de table courants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:505
---@param ctx table Contexte de test.
function utils_test.testTableHelpers(ctx) end

--- Teste l'enveloppe du helper d'insertion côté C.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:665
---@param ctx table Contexte de test.
function utils_test.testTableInsertC(ctx) end

--- Teste la classification de tableIsArray.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:527
---@param ctx table Contexte de test.
function utils_test.testTableIsArray(ctx) end

--- Teste la détection de table vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:538
---@param ctx table Contexte de test.
function utils_test.testTableIsEmpty(ctx) end

--- Teste l'extraction triée des clés d'une table.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:548
---@param ctx table Contexte de test.
function utils_test.testTableKeysSorted(ctx) end

--- Teste la fusion superficielle de tables.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:591
---@param ctx table Contexte de test.
function utils_test.testTableMerge(ctx) end

--- Teste la protection des tables en lecture seule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:641
---@param ctx table Contexte de test.
function utils_test.testTableReadOnly(ctx) end

--- Teste la sémantique de la fusion récursive de tables.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:600
---@param ctx table Contexte de test.
function utils_test.testTableRecursive(ctx) end

--- Teste la fusion récursive quand les valeurs sont des tableaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:622
---@param ctx table Contexte de test.
function utils_test.testTableRecursiveArray(ctx) end

--- Teste le helper de sélection de clé en tourniquet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:752
---@param ctx table Contexte de test.
function utils_test.testTableRoundRobinKey(ctx) end

--- Teste l'enveloppe du helper de taille de table côté C.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:650
---@param ctx table Contexte de test.
function utils_test.testTableSizeC(ctx) end

--- Teste la conversion table vers couleur, y compris avec des valeurs nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:111
---@param ctx table Contexte de test.
function utils_test.testTableToColor(ctx) end

--- Teste la conversion d'un tableau de valeurs en dictionnaire de recherche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:562
---@param ctx table Contexte de test.
function utils_test.testTableValuesAsLookupDict(ctx) end

--- Teste la suppression des espaces en début et fin de chaîne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.test.lua:195
---@param ctx table Contexte de test.
function utils_test.testTrim(ctx) end

return utils_test
