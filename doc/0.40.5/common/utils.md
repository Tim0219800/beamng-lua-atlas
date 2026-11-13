# `utils`

*Fichier : `lua/common/utils.lua` · VM : Commun (GE + véhicule) · 1511 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils")`

Boîte à outils commune (GE et véhicule) chargée au démarrage de chaque VM Lua. Ce fichier ne renvoie pas de table M : il définit directement des centaines de fonctions GLOBALES (dump, deepcopy, tableMerge, jsonReadFile, jsonWriteFile, readFile, split, couleurs, sérialisation, etc.), étend la bibliothèque `string` (string.startswith, string.split…), crée la table globale `path` et assigne la globale `lpack`. Un moddeur les appelle directement, sans require. Il charge aussi `filters`, `inputFilters`, `lpack` et `libs/inspect/inspect`.

## Exemple

```lua
local data = jsonReadFile('/settings/monfichier.json') or {}
data.compteur = (data.compteur or 0) + 1
jsonWriteFile('/settings/monfichier.json', data, true)
dump(tableKeysSorted(data))
local parties = split('a,b,c', ',')  -- {'a','b','c'}
local copie = deepcopy(data)
```

## Remarques

- Les chemins de fichiers sont ceux du système de fichiers virtuel du jeu (ex. '/settings/...', '/levels/...') ou des chemins disque pour io.open.
- Couleurs : color(r,g,b,a) renvoie un entier 32 bits RGBA (r*2^24 + g*2^16 + b*2^8 + a), composantes 0..255 ; hueColor/jetColor/ironbowColor/greyColor prennent x dans [0..1].
- tableSize/tableDepth/deepcopy sont lents (parcourent toute la table) : à éviter dans une boucle par image.
- Beaucoup de fonctions renvoient un buffer partagé (jsonEncodeWorkBuffer, serializeWorkBuffer, concatWorkBuffer, stringFormatWorkBuffer) : le contenu est écrasé au prochain appel, il faut le convertir (tostring) tout de suite.
- jsonEncode et jsonEncodeWorkBuffer partagent le même buffer interne que serialize : ne pas imbriquer ces appels.
- Bug/incohérence : getCurrentLevelIdentifier(raw) -> le paramètre raw ne change rien (le résultat de string.gsub est ignoré quand raw est vrai, la valeur renvoyée est toujours en minuscules).
- Bug/incohérence : concatWorkBuffer, dans la branche table, teste `vtype == 'boolean'` au lieu de `vtype1` et met `v` (la table) au lieu de `v1` dans le buffer pour les éléments non numériques : cela déclenche une erreur si un élément de la table n'est pas un nombre.
- Bug/incohérence : dumpToFile appelle inspect(...) avec tous les arguments : le deuxième argument éventuel est interprété comme la table d'options d'inspect, pas comme une seconde valeur à écrire.
- Incohérence : arrayFindValueIndex renvoie false (et non nil) quand la valeur est absente.
- Incohérence : saveIni ne renvoie rien (ni true ni false), alors que loadIni renvoie nil en cas d'échec.
- Incohérence : string.rstripchars et string.stripchars renvoient deux valeurs (le résultat de gsub : texte puis nombre de remplacements).
- Incohérence : dump et dumpz loguent avec le niveau 'A' et l'origine 'lua.utils' ; dumpNotNil passe par Lua:log avec une origine vide.
- Le code commenté `pairs = sortedPairs` en bas de fichier montre comment rendre les boucles pairs déterministes (la vraie fonction pairs est conservée dans `unsortedPairs` local).

## Classe `path`

Table globale `path` définie dans ce fichier : utilitaires de chemins de fichiers (séparateur '/').

| Méthode | Description | Ligne |
|---|---|---|
| `path:dirname(filename)` | Renvoie le dossier d'un chemin, avec le '/' final ('.' si aucun dossier). | dyn |
| `path:getCurrentPath()` | Renvoie le dossier du fichier Lua de l'appelant (debug.getinfo(2).short_src). | dyn |
| `path:getPathLevelInfo(levelName)` | Chemin du fichier info.json d'un niveau, normalisé par sanitizePath. | dyn |
| `path:getPathLevelMain(levelName)` | Chemin du fichier main.level.json d'un niveau, normalisé par sanitizePath. | dyn |
| `path:is_file(filename)` | Teste si le fichier peut être ouvert en lecture (io.open). | dyn |
| `path:levelFromPath(filepath)` | Extrait d'un chemin le nom de niveau (sous 'levels/') et le reste du chemin. | dyn |
| `path:split(path, compositeExtension)` | Sépare un chemin en dossier, nom de fichier (AVEC extension) et extension. Sans extension, ext vaut ''. | dyn |
| `path:splitWithoutExt(filepath, compositeExtension)` | Comme split mais le nom de fichier renvoyé n'a pas l'extension. Attention : retire via gsub('.'..ext) (le point est un joker de motif). | dyn |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `HSVtoRGB(h, s, v)` | Convertit une couleur HSV en RGB, composantes dans [0..1]. | 43 |
| `RGBtoHSV(r, g, b)` | Convertit une couleur RGB en HSV. Les entrées r,g,b sont dans [0..1] (déduit du code : pas de mise à l'échelle 255). | 30 |
| `_kv(kv)` | Aide utilisée par le texte produit par serialize : construit une table à partir d'une liste plate {k1, v1, k2, v2…}. Un moddeur n'a normalement pas à l'appeler. | 1262 |
| `addLevelLog(object, logLevel, origin, uniqueErrorCode, message)` | Ajoute une entrée au journal de niveau du moteur (Engine.Debug.addLevelLogLua), avec le fichier et la ligne de l'appelant (debug.getinfo(2)). Sans objet, utilise addLevelLogLuaNoObject. | 156 |
| `arrayConcat(dst, src)` | Ajoute à la fin de dst tous les éléments du tableau src (inclut l'indice 0 de src s'il existe). Modifie dst. | 645 |
| `arrayFindValueIndex(t, val)` | Renvoie l'indice de la première occurrence de val dans le tableau t. | 773 |
| `arrayReverse(array)` | Inverse un tableau pur en place. | 792 |
| `arrayShuffle(array)` | Mélange un tableau pur en place (Fisher-Yates, math.random). | 783 |
| `bytes_to_string(bytes)` | Convertit un nombre d'octets en texte lisible avec 2 décimales. Utilise des puissances de 1000 (KB, MB, GB), pas de 1024. | 257 |
| `checkTableDataTypes(data, expectedTypes)` | Valide les types d'un tableau de paramètres. Préfixer un type attendu par 'optional:' autorise nil. Uniquement pour des tableaux purs. | 867 |
| `clearLevelLogs()` | Vide les logs de niveau (Engine.Debug.clearLevelLogs). | 169 |
| `color(r, g, b, a)` | Fabrique un entier couleur RGBA 32 bits. Chaque composante est arrondie à l'entier inférieur et bornée à 0..255. | 50 |
| `colorGetRGBA(col)` | Opération inverse de color() : décompose un entier RGBA. | 54 |
| `colorHex(rgbHex, a)` | Fabrique un entier couleur RGBA à partir d'un hexadécimal RGB (ex. 0xff8800) et d'un alpha. | 58 |
| `concatWorkBuffer(...)` | Concatène les arguments (nombres, textes, booléens, ou tableaux de nombres) dans un buffer partagé. S'arrête au premier argument nil. Les nombres infinis/NaN sont écrits 9e999 / -9e999. | 550 |
| `deepcopy(object)` | Copie récursive d'une table, en gérant les références circulaires/partagées et en conservant la métatable. Les structures FFI (vec3, quat) sont copiées superficiellement. Lent. | 854 |
| `deserialize(s)` | Relit du texte produit par serialize() en exécutant loadstring('return '..s). Renvoie nil si s est nil. Plante si le texte n'est pas du Lua valide (ex. cdata non sérialisable). | 1271 |
| `deserializePackages(data, filter)` | Restaure l'état produit par serializePackages : appelle extensions.deserialize, puis pour chaque package concerné appelle onDeserialize(data) ou fusionne les données (hors fonctions) dans M.state ou M, puis appelle onDeserialized(data). | 1025 |
| `detectGlobalWrites()` | Outil de debug : installe une métatable sur _G qui loggue (niveau W, avec trace) chaque création d'une nouvelle variable globale. | 1298 |
| `dump(...)` | Affiche dans le log (niveau 'A', origine 'lua.utils') le résultat de dumps(...). Fonction de debug la plus courante pour inspecter une table. | 135 |
| `dumpNotNil(x)` | Comme dump, mais n'affiche rien si x est nil (et ne prend qu'une valeur). | 150 |
| `dumpToFile(filename, ...)` | Écrit dans un fichier le texte inspect(...) de l'argument. | 889 |
| `dumps(...)` | Renvoie la représentation texte (via libs/inspect) des arguments, séparés par ', '. Sans argument renvoie ''. Pour un unique userdata ayant une métatable, inspecte la métatable. | 114 |
| `dumpsz(o, depth)` | Comme inspect mais avec profondeur illimitée par défaut (depth = math.huge). | 142 |
| `dumpz(o, depth)` | Affiche dans le log (niveau 'A', origine 'lua.utils') le résultat de dumpsz(o, depth). | 146 |
| `fillActionLabelSimple(actionSimple)` | À partir d'une liste de noms d'actions, construit {action=...} puis appelle fillActionLabels. | 941 |
| `fillActionLabels(actionItems)` | Pour chaque élément {action=...}, renseigne `missing` (true si l'action n'est pas active dans core_input_actions) et `label` (le titre de l'action, ou son nom si absent) si label est nil. | 949 |
| `flattenTable(tbl)` | Remplace dans tbl, en place, les références multiples à une même sous-table par un jeton texte '>#>/chemin' (pour sérialiser des graphes). Les clés sont parcourues triées. | 1373 |
| `formatTimeStringNow(res)` | Remplace dans res les jetons de date/heure locale courante : {YYYY} {YY} {Y} {MM} {M} {DD} {D} {HH} {H} {mm} {m} {ss} {s} (les formes doublées sont sur 2 chiffres, YYYY sur 4). | 269 |
| `gcprobe(printZero, omitPrint)` | Mesure les octets de garbage créés entre deux appels. Premier appel : arrête le GC et mémorise la mémoire. Second appel : relance le GC, imprime (si > 0 ou printZero) et renvoie la différence. | 1308 |
| `getAllLevelIdentifiers()` | Liste les dossiers sous /levels/ (FS:findFiles) et renvoie leurs noms en minuscules. | 1112 |
| `getCurrentLevelIdentifier(raw)` | Renvoie l'identifiant (dossier) du niveau courant en minuscules, déduit du chemin de getMissionFilename() sous /levels/. Renvoie nil si le chemin n'a pas de dossier. | 1104 |
| `getLevelLogs()` | Renvoie les logs de niveau accumulés (Engine.Debug.getLevelLogsLua). | 165 |
| `graphs(v, len)` | Construit un petit graphique ASCII d'une valeur : '[' + len signes (+ ou - selon le signe de v) + espaces + ']'. | 288 |
| `greyColor(x, a)` | Niveau de gris. | 105 |
| `hex_dump(str)` | Imprime (print) un dump hexadécimal d'une chaîne, 8 octets par ligne avec la colonne ASCII. | 1450 |
| `hueColor(x, a)` | Couleur du spectre de teinte complet (saturation et valeur maximales). Utile pour des couleurs indexées : hueColor(indexedBlueNoise(i)). | 78 |
| `ironbowColor(x, a)` | Couleur de la palette thermique 'ironbow'. | 95 |
| `jetColor(x, a)` | Couleur de la palette 'jet' (bleu, vert, rouge). Palette par défaut recommandée pour visualiser une valeur. | 100 |
| `jitprobe()` | Bascule la trace du compilateur JIT (jit.v) : activée au premier appel, désactivée au suivant. | 1341 |
| `jsonDecode(content, context)` | Décode du JSON (module json) dans un xpcall. En cas d'erreur, loggue le contexte et l'erreur et renvoie nil. | 428 |
| `jsonEncode(v)` | Encode une valeur Lua en texte JSON compact. | 355 |
| `jsonEncodePrefix(prefix, v, postfix)` | Encode v en JSON compact, précédé de prefix et suivi (facultatif) de postfix. | 359 |
| `jsonEncodePretty(v, lvl, numberPrecision)` | Encode en JSON indenté (2 espaces par niveau), clés d'objet triées. Récursif. | 369 |
| `jsonEncodeWorkBuffer(v)` | Encode une valeur en JSON dans un buffer string.buffer partagé (sans copie en chaîne). Les nombres infinis/NaN sont écrits 9e999 / -9e999 ; les vec3/quat (cdata) deviennent {x,y,z[,w]} ; les types non supportés deviennent null. Une table dont la clé 1 existe est écrite comme tableau. | 349 |
| `jsonReadFile(filename)` | Lit et décode un fichier JSON. Renvoie nil si le fichier est illisible (sans log : l'appelant gère l'erreur) ou si le JSON est invalide (log E par jsonDecode). | 484 |
| `jsonWriteFile(filename, obj, pretty, numberPrecision, atomicWrite)` | Écrit une table dans un fichier JSON. Refuse (log E + false) si obj n'est pas une table. Avec atomicWrite, écrit d'abord dans un fichier temporaire puis le renomme (FS:renameFile). | 466 |
| `loadIni(filename)` | Lit un fichier INI simple (clé = valeur, sans sections). Ignore les lignes vides et celles commençant par #, ; ou /. Convertit les valeurs en nombre ou booléen quand c'est possible ; une ligne illisible est loguée en erreur. | 1122 |
| `lpad(s, l, c)` | Complète s à gauche avec le caractère c jusqu'à la longueur l. s est converti par tostring. | 173 |
| `objectTeleported(curPos, prevPos, prevVel, dt)` | Décide si un objet s'est téléporté entre deux images, d'après sa position et sa vitesse précédentes. Pas de téléportation si le déplacement est inférieur à 1,5 m ou à 277*dt (1000 km/h), ou si la vitesse est cohérente avec la précédente. Sans données précédentes, renvoie true. | 1470 |
| `parseColor(v)` | Convertit en entier couleur une table {r,g,b,a}, une chaîne '#RRGGBBAA' (au moins 8 caractères avec le #) ou nil (donne transparent 0,0,0,0). Tout autre type renvoie nil. | 66 |
| `rainbowColor(numOfSteps, step, format)` | Couleur arc-en-ciel pour l'étape step sur numOfSteps. Le code recommande plutôt jetColor sauf raison contraire. | 84 |
| `readDictJSONTable(filename)` | Lit un JSON de tableaux 'en-têtes + lignes' : pour chaque entrée, la première ligne donne les noms de colonnes, et chaque ligne suivante est transformée en table nommée ; la ligne d'en-tête est ensuite supprimée (v[1] = nil). | 492 |
| `readFile(filename)` | Lit tout le contenu d'un fichier texte (io.open en mode 'r', avec événement profileur 'readFile'). | 900 |
| `rpad(s, l, c)` | Complète s à droite avec le caractère c jusqu'à la longueur l. s est converti par tostring. | 178 |
| `saveIni(filename, d)` | Écrit un INI simple : 3 lignes de commentaire d'en-tête (titre de fenêtre, version du jeu, date), puis les clés triées au format 'clé = valeur'. | 1151 |
| `serialize(v)` | Sérialise une valeur en texte Lua que deserialize() sait relire. | 1258 |
| `serializePackages(reason)` | Collecte l'état à conserver avant un rechargement Lua : pour chaque package chargé définissant onSerialize ou onDeserialized, appelle onSerialize(reason), sinon prend M.state, sinon M. Ajoute les données d'extensions (extensions.getSerializationData). Les erreurs sont loguées et ignorées. Appelé par le moteur lors des rechargements. | 994 |
| `serializeWorkBuffer(v)` | Sérialise une valeur en code Lua (rechargeable par deserialize) dans un buffer partagé. Gère _noSerialize (écrit nil), _serialize (table ou true : restreint ou non les clés, format _kv{...}), QuatF (userdata), cdata (tostring). Les fonctions deviennent nil. | 1252 |
| `setDifference(dst, src)` | Retire de dst toutes les valeurs présentes dans src. Modifie dst et change l'ordre de ses éléments. | 534 |
| `setEqual(set1, set2)` | Teste si deux tableaux contiennent les mêmes valeurs (comparaison de longueur puis d'appartenance ; ignore l'ordre). | 512 |
| `setUnion(dst, src)` | Ajoute à dst toutes les valeurs de src absentes de dst (modifie dst). | 522 |
| `shallowcopy(orig)` | Copie non récursive d'une table (les sous-tables restent partagées). Les valeurs non-table sont renvoyées telles quelles. La métatable n'est pas copiée. | 825 |
| `shuffledPairs(t, ctx)` | Comme pairs mais dans un ordre aléatoire. | 1432 |
| `simpleDebugText3d(text, pos, radius, sphereColor, dir)` | Dessine via debugDrawer un texte 3D, une sphère et/ou trois petites sphères d'axes orientées par dir. | 1497 |
| `sortedPairs(t, ctx, f)` | Comme pairs mais dans l'ordre trié des clés (types mixtes acceptés, ou fonction de tri f). Les clés sont figées au départ ; une valeur mise à nil pendant la boucle est sautée. | 1415 |
| `split(str, delim, nMax)` | Découpe str selon le séparateur delim (recherche textuelle simple, pas une regex). Une chaîne vide renvoie un tableau vide. Les champs vides sont conservés. | 188 |
| `stringFormatWorkBuffer(...)` | Équivalent de string.format écrit dans un buffer partagé (buffer:putf), sans allocation de chaîne. | 575 |
| `stringHash(text)` | Calcule un hash numérique d'une chaîne (algorithme StringHash du wiki WoW). | 242 |
| `tableContains(t, element)` | Teste si la table contient la valeur element (non récursif). | 758 |
| `tableContainsCaseInsensitive(table, element)` | Teste si la table contient la chaîne element, sans tenir compte de la casse. Les valeurs de la table doivent être des chaînes. | 763 |
| `tableDepth(tbl, lookup)` | Calcule la profondeur d'imbrication d'une table (clés et valeurs tables). Récursif et très lent ; 0 pour un non-table. | 802 |
| `tableEndC(tbl)` | Renvoie l'indice où insérer le prochain élément dans un tableau à base 0 : 0 si la table est vide, sinon #tbl + 1. | 736 |
| `tableFindKey(t, element)` | Renvoie la première clé associée à la valeur element (non récursif, ordre pairs). | 749 |
| `tableInsertC(tbl, data)` | Insère data en fin de tableau à base 0 : en tbl[0] si l'indice 0 est libre, sinon table.insert. | 740 |
| `tableIsArraySlow(tbl)` | Vérifie strictement que toutes les clés sont des entiers de 1 à #tbl sans trou. Parcourt toute la table. | 588 |
| `tableIsDict(tbl)` | Renvoie true si tbl est une table dont le premier élément n'a pas la clé 1 (test rapide : next(tbl) ~= 1). Une table vide compte donc comme dictionnaire. Renvoie false si ce n'est pas une table. | 581 |
| `tableIsEmpty(tbl)` | Renvoie true si tbl n'est pas une table ou si elle est vide. | 601 |
| `tableKeys(tbl, target)` | Renvoie un tableau de toutes les clés de tbl (ordre non défini). | 606 |
| `tableKeysSorted(tbl, target)` | Comme tableKeys, mais trié. Le tri accepte des types mixtes : d'abord par nom de type, puis par valeur (nombres, chaînes), booléens true d'abord, autres par tostring. | 629 |
| `tableMerge(dst, src)` | Copie toutes les paires clé/valeur de src dans dst (écrase les clés existantes, non récursif). | 654 |
| `tableMergeRecursive(t1, t2)` | Fusion récursive des sous-tables de t2 dans t1. Attention : les tableaux ne sont pas concaténés, leurs éléments s'écrasent par indice. | 663 |
| `tableMergeRecursiveArray(t1, t2)` | Fusion récursive qui concatène les tableaux purs (au lieu de les écraser) et fusionne les tables associatives. Les tables absentes de t1 sont copiées. | 675 |
| `tableReadOnly(table)` | Renvoie une table proxy en lecture seule (metatable __index vers l'original ; toute écriture lève une erreur). Seul le premier niveau est protégé. | 722 |
| `tableRoundRobinKey(tbl, lastKey)` | Itère en rond sur les clés : renvoie la clé suivant lastKey, ou la première clé si on arrive à la fin ou si lastKey est nil/absente. | 819 |
| `tableSize(tbl)` | Compte les entrées d'une table (tableau ou dictionnaire) en la parcourant entièrement. Renvoie 0 pour un non-table. | 706 |
| `tableSizeC(tbl)` | Taille d'un tableau en comptant aussi l'élément d'indice 0 (convention C) s'il existe. | 731 |
| `tableToColor(v)` | Convertit une table {r,g,b,a} (0..255) en entier couleur. Renvoie 0 si la table est nil. | 62 |
| `tableValuesAsLookupDict(tbl, target)` | Construit un dictionnaire valeur -> 1 à partir des valeurs de tbl, pour tester l'appartenance en O(1). | 636 |
| `timeprobe(omitPrint)` | Premier appel : démarre le chrono. Second appel : imprime la durée en millisecondes et la renvoie en secondes. | 1328 |
| `timeprobeStart()` | Démarre toujours un chronomètre (os.clockhp), même si un timeprobe était en cours. | 1323 |
| `trim(s)` | Supprime les espaces au début et à la fin d'une chaîne. | 183 |
| `ui_message(msg, ttl, category, icon)` | Affiche un message à l'écran via guihooks.message. Raccourci utilisé par beaucoup de scripts. | 927 |
| `ui_toast(msg, title, type, _config)` | Affiche une notification 'toast' dans l'interface (évènement UI toastrMsg). | 931 |
| `unflattenTable(tbl)` | Inverse de flattenTable : remplace les jetons '>#>/chemin' par les sous-tables d'origine. Loggue une erreur si le lien n'existe pas. | 1396 |
| `writeFile(filename, data)` | Écrit du texte dans un fichier (mode 'w', écrase). En cas d'échec d'ouverture, loggue un avertissement. | 914 |

**Globales affectées :** `lpack`, `path`

**Évènements UI (guihooks.trigger) :** `toastrMsg`

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `renameFile`
- `Lua:` `log`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils.lua`.*
