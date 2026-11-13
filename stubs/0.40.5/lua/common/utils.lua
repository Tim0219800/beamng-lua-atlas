---@meta
-- tim19Atlas stub generated from lua/common/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table globale `path` définie dans ce fichier : utilitaires de chemins de fichiers (séparateur '/').
---@class utils_path
local utils_path = {}

--- Renvoie le dossier d'un chemin, avec le '/' final ('.' si aucun dossier).
---Source : lua/common/utils.lua:dyn
---@param filename string Chemin
---@return string  Dossier
function utils_path:dirname(filename) end

--- Renvoie le dossier du fichier Lua de l'appelant (debug.getinfo(2).short_src).
---Source : lua/common/utils.lua:dyn
---@return string|nil  Dossier du script appelant
function utils_path:getCurrentPath() end

--- Chemin du fichier info.json d'un niveau, normalisé par sanitizePath.
---Source : lua/common/utils.lua:dyn
---@param levelName string Nom du niveau
---@return string  /levels/<nom>/info.json
function utils_path:getPathLevelInfo(levelName) end

--- Chemin du fichier main.level.json d'un niveau, normalisé par sanitizePath.
---Source : lua/common/utils.lua:dyn
---@param levelName string Nom du niveau
---@return string  /levels/<nom>/main.level.json
function utils_path:getPathLevelMain(levelName) end

--- Teste si le fichier peut être ouvert en lecture (io.open).
---Source : lua/common/utils.lua:dyn
---@param filename string Chemin
---@return boolean  true si ouvrable
function utils_path:is_file(filename) end

--- Extrait d'un chemin le nom de niveau (sous 'levels/') et le reste du chemin.
---Source : lua/common/utils.lua:dyn
---@param filepath string Chemin contenant 'levels/<nom>...'
---@return string|nil  Nom du niveau
---@return string|nil  Reste du chemin
function utils_path:levelFromPath(filepath) end

--- Sépare un chemin en dossier, nom de fichier (AVEC extension) et extension. Sans extension, ext vaut ''.
---Source : lua/common/utils.lua:dyn
---@param path string Chemin
---@param compositeExtension boolean|nil true : l'extension est tout ce qui suit le premier point du nom (ex. 'level.json')
---@return string|nil  Dossier avec '/' final (nil pour un simple nom de fichier)
---@return string  Nom avec extension
---@return string  Extension sans point
function utils_path:split(path, compositeExtension) end

--- Comme split mais le nom de fichier renvoyé n'a pas l'extension. Attention : retire via gsub('.'..ext) (le point est un joker de motif).
---Source : lua/common/utils.lua:dyn
---@param filepath string Chemin
---@param compositeExtension boolean|nil Voir path.split
---@return string|nil  Dossier
---@return string  Nom sans extension
---@return string  Extension
function utils_path:splitWithoutExt(filepath, compositeExtension) end

--- Convertit une couleur HSV en RGB, composantes dans [0..1].
---Source : lua/common/utils.lua:43
---@param h number Teinte [0..1]
---@param s number Saturation [0..1]
---@param v number Valeur [0..1]
---@return number  r [0..1]
---@return number  g [0..1]
---@return number  b [0..1]
function HSVtoRGB(h, s, v) end

--- Convertit une couleur RGB en HSV. Les entrées r,g,b sont dans [0..1] (déduit du code : pas de mise à l'échelle 255).
---Source : lua/common/utils.lua:30
---@param r number Rouge [0..1]
---@param g number Vert [0..1]
---@param b number Bleu [0..1]
---@return number  Teinte h dans [0..1]
---@return number  Saturation s dans [0..1]
---@return number  Valeur v (= max(r,g,b))
function RGBtoHSV(r, g, b) end

--- Aide utilisée par le texte produit par serialize : construit une table à partir d'une liste plate {k1, v1, k2, v2…}. Un moddeur n'a normalement pas à l'appeler.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.lua:1262
---@param kv table Liste plate clé, valeur, clé, valeur…
---@return table  Table {k1=v1, k2=v2…}
function _kv(kv) end

--- Ajoute une entrée au journal de niveau du moteur (Engine.Debug.addLevelLogLua), avec le fichier et la ligne de l'appelant (debug.getinfo(2)). Sans objet, utilise addLevelLogLuaNoObject.
---Source : lua/common/utils.lua:156
---@param object any|nil Objet auquel rattacher le log, nil pour aucun
---@param logLevel any Niveau de log (transmis tel quel au moteur)
---@param origin string Origine du message
---@param uniqueErrorCode any Code d'erreur unique (transmis au moteur)
---@param message string Message
function addLevelLog(object, logLevel, origin, uniqueErrorCode, message) end

--- Ajoute à la fin de dst tous les éléments du tableau src (inclut l'indice 0 de src s'il existe). Modifie dst.
---Source : lua/common/utils.lua:645
---@param dst table Tableau modifié
---@param src table Tableau ajouté
---@return table  dst
function arrayConcat(dst, src) end

--- Renvoie l'indice de la première occurrence de val dans le tableau t.
---Source : lua/common/utils.lua:773
---@param t table Tableau
---@param val any Valeur cherchée
---@return integer|boolean  Indice, ou false (et non nil) si absente
function arrayFindValueIndex(t, val) end

--- Inverse un tableau pur en place.
---Source : lua/common/utils.lua:792
---@param array table Tableau modifié
---@return table  array
function arrayReverse(array) end

--- Mélange un tableau pur en place (Fisher-Yates, math.random).
---Source : lua/common/utils.lua:783
---@param array table Tableau modifié
---@return table  array
function arrayShuffle(array) end

--- Convertit un nombre d'octets en texte lisible avec 2 décimales. Utilise des puissances de 1000 (KB, MB, GB), pas de 1024.
---Source : lua/common/utils.lua:257
---@param bytes number Nombre d'octets
---@return string  Ex. '1.50 MB'
function bytes_to_string(bytes) end

--- Valide les types d'un tableau de paramètres. Préfixer un type attendu par 'optional:' autorise nil. Uniquement pour des tableaux purs.
---Source : lua/common/utils.lua:867
---@param data table Tableau à vérifier
---@param expectedTypes table<integer, string> Noms de types Lua attendus, ex. {"string", "optional:number"}
---@return boolean  true si conforme
---@return string|nil  Message d'erreur si non conforme (nombre de paramètres trop grand ou mauvais type)
function checkTableDataTypes(data, expectedTypes) end

--- Vide les logs de niveau (Engine.Debug.clearLevelLogs).
---Source : lua/common/utils.lua:169
function clearLevelLogs() end

--- Fabrique un entier couleur RGBA 32 bits. Chaque composante est arrondie à l'entier inférieur et bornée à 0..255.
---Source : lua/common/utils.lua:50
---@param r number Rouge 0..255
---@param g number Vert 0..255
---@param b number Bleu 0..255
---@param a number|nil Alpha 0..255, 255 par défaut
---@return integer  r*16777216 + g*65536 + b*256 + a
function color(r, g, b, a) end

--- Opération inverse de color() : décompose un entier RGBA.
---Source : lua/common/utils.lua:54
---@param col integer Couleur RGBA 32 bits
---@return integer  r
---@return integer  g
---@return integer  b
---@return integer  a
function colorGetRGBA(col) end

--- Fabrique un entier couleur RGBA à partir d'un hexadécimal RGB (ex. 0xff8800) et d'un alpha.
---Source : lua/common/utils.lua:58
---@param rgbHex integer Couleur 0xRRGGBB
---@param a number|nil Alpha 0..255, 255 par défaut
---@return integer  Couleur RGBA 32 bits
function colorHex(rgbHex, a) end

--- Concatène les arguments (nombres, textes, booléens, ou tableaux de nombres) dans un buffer partagé. S'arrête au premier argument nil. Les nombres infinis/NaN sont écrits 9e999 / -9e999.
---Source : lua/common/utils.lua:550
---@param ... any Valeurs à concaténer
---@return userdata  Buffer partagé (réécrit au prochain appel)
function concatWorkBuffer(...) end

--- Copie récursive d'une table, en gérant les références circulaires/partagées et en conservant la métatable. Les structures FFI (vec3, quat) sont copiées superficiellement. Lent.
---Source : lua/common/utils.lua:854
---@param object any Valeur ou table à copier
---@return any  Copie profonde
function deepcopy(object) end

--- Relit du texte produit par serialize() en exécutant loadstring('return '..s). Renvoie nil si s est nil. Plante si le texte n'est pas du Lua valide (ex. cdata non sérialisable).
---Source : lua/common/utils.lua:1271
---@param s string|nil Texte sérialisé
---@return any  Valeur reconstruite
function deserialize(s) end

--- Restaure l'état produit par serializePackages : appelle extensions.deserialize, puis pour chaque package concerné appelle onDeserialize(data) ou fusionne les données (hors fonctions) dans M.state ou M, puis appelle onDeserialized(data).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.lua:1025
---@param data table|nil Données de serializePackages (nil : ne fait rien)
---@param filter string|nil Si donné, ne restaure que ce package
function deserializePackages(data, filter) end

--- Outil de debug : installe une métatable sur _G qui loggue (niveau W, avec trace) chaque création d'une nouvelle variable globale.
---Source : lua/common/utils.lua:1298
function detectGlobalWrites() end

--- Affiche dans le log (niveau 'A', origine 'lua.utils') le résultat de dumps(...). Fonction de debug la plus courante pour inspecter une table.
---Source : lua/common/utils.lua:135
---@param ... any Valeurs à afficher
function dump(...) end

--- Comme dump, mais n'affiche rien si x est nil (et ne prend qu'une valeur).
---Source : lua/common/utils.lua:150
---@param x any Valeur à afficher si non nil
function dumpNotNil(x) end

--- Écrit dans un fichier le texte inspect(...) de l'argument.
---Source : lua/common/utils.lua:889
---@param filename string Fichier de sortie (écrasé)
---@param ... any Valeur à inspecter (voir notes : le 2e argument est lu comme options d'inspect)
---@return boolean  true si le fichier a été écrit, false si ouverture impossible
function dumpToFile(filename, ...) end

--- Renvoie la représentation texte (via libs/inspect) des arguments, séparés par ', '. Sans argument renvoie ''. Pour un unique userdata ayant une métatable, inspecte la métatable.
---Source : lua/common/utils.lua:114
---@param ... any Valeurs à convertir en texte
---@return string  Texte inspecté
function dumps(...) end

--- Comme inspect mais avec profondeur illimitée par défaut (depth = math.huge).
---Source : lua/common/utils.lua:142
---@param o any Valeur à inspecter
---@param depth number|nil Profondeur maximale, illimitée par défaut
---@return string  Texte inspecté
function dumpsz(o, depth) end

--- Affiche dans le log (niveau 'A', origine 'lua.utils') le résultat de dumpsz(o, depth).
---Source : lua/common/utils.lua:146
---@param o any Valeur à inspecter
---@param depth number|nil Profondeur maximale, illimitée par défaut
function dumpz(o, depth) end

--- À partir d'une liste de noms d'actions, construit {action=...} puis appelle fillActionLabels.
---Source : lua/common/utils.lua:941
---@param actionSimple table<integer, string> Noms d'actions d'input
---@return table  Liste d'éléments {action, label, missing}
function fillActionLabelSimple(actionSimple) end

--- Pour chaque élément {action=...}, renseigne `missing` (true si l'action n'est pas active dans core_input_actions) et `label` (le titre de l'action, ou son nom si absent) si label est nil.
---Source : lua/common/utils.lua:949
---@param actionItems table Liste d'éléments avec le champ action
---@return table  actionItems (modifié)
function fillActionLabels(actionItems) end

--- Remplace dans tbl, en place, les références multiples à une même sous-table par un jeton texte '>#>/chemin' (pour sérialiser des graphes). Les clés sont parcourues triées.
---Source : lua/common/utils.lua:1373
---@param tbl table Table modifiée
---@return table|nil  tbl, ou nil si ce n'est pas une table
function flattenTable(tbl) end

--- Remplace dans res les jetons de date/heure locale courante : {YYYY} {YY} {Y} {MM} {M} {DD} {D} {HH} {H} {mm} {m} {ss} {s} (les formes doublées sont sur 2 chiffres, YYYY sur 4).
---Source : lua/common/utils.lua:269
---@param res string Modèle de texte contenant les jetons
---@return string  Texte avec la date/heure insérée
function formatTimeStringNow(res) end

--- Mesure les octets de garbage créés entre deux appels. Premier appel : arrête le GC et mémorise la mémoire. Second appel : relance le GC, imprime (si > 0 ou printZero) et renvoie la différence.
---Source : lua/common/utils.lua:1308
---@param printZero boolean|nil Imprimer aussi quand la différence est 0
---@param omitPrint boolean|nil Ne rien imprimer
---@return number|nil  Octets créés (second appel seulement)
function gcprobe(printZero, omitPrint) end

--- Liste les dossiers sous /levels/ (FS:findFiles) et renvoie leurs noms en minuscules.
---Source : lua/common/utils.lua:1112
---@return table<integer, string>  Identifiants de niveaux
function getAllLevelIdentifiers() end

--- Renvoie l'identifiant (dossier) du niveau courant en minuscules, déduit du chemin de getMissionFilename() sous /levels/. Renvoie nil si le chemin n'a pas de dossier.
---Source : lua/common/utils.lua:1104
---@param raw boolean|nil Sans effet réel (voir notes)
---@return string|nil  Nom de niveau en minuscules
function getCurrentLevelIdentifier(raw) end

--- Renvoie les logs de niveau accumulés (Engine.Debug.getLevelLogsLua).
---Source : lua/common/utils.lua:165
---@return any  Résultat du moteur (déduit du code : liste des logs)
function getLevelLogs() end

--- Construit un petit graphique ASCII d'une valeur : '[' + len signes (+ ou - selon le signe de v) + espaces + ']'.
---Source : lua/common/utils.lua:288
---@param v number Valeur (seule la partie entière de |v| compte)
---@param len integer Largeur de la jauge en caractères
---@return string  Jauge texte
function graphs(v, len) end

--- Niveau de gris.
---Source : lua/common/utils.lua:105
---@param x number Luminosité [0..1]
---@param a number|nil Alpha 0..255 (255 par défaut)
---@return integer  Couleur RGBA 32 bits
function greyColor(x, a) end

--- Imprime (print) un dump hexadécimal d'une chaîne, 8 octets par ligne avec la colonne ASCII.
---Source : lua/common/utils.lua:1450
---@param str string Données à afficher
function hex_dump(str) end

--- Couleur du spectre de teinte complet (saturation et valeur maximales). Utile pour des couleurs indexées : hueColor(indexedBlueNoise(i)).
---Source : lua/common/utils.lua:78
---@param x number Teinte [0..1]
---@param a number|nil Alpha 0..255 (255 par défaut)
---@return integer  Couleur RGBA 32 bits
function hueColor(x, a) end

--- Couleur de la palette thermique 'ironbow'.
---Source : lua/common/utils.lua:95
---@param x number Valeur [0..1]
---@param a number|nil Alpha 0..255 (255 par défaut)
---@return integer  Couleur RGBA 32 bits
function ironbowColor(x, a) end

--- Couleur de la palette 'jet' (bleu, vert, rouge). Palette par défaut recommandée pour visualiser une valeur.
---Source : lua/common/utils.lua:100
---@param x number Valeur [0..1]
---@param a number|nil Alpha 0..255 (255 par défaut)
---@return integer  Couleur RGBA 32 bits
function jetColor(x, a) end

--- Bascule la trace du compilateur JIT (jit.v) : activée au premier appel, désactivée au suivant.
---Source : lua/common/utils.lua:1341
function jitprobe() end

--- Décode du JSON (module json) dans un xpcall. En cas d'erreur, loggue le contexte et l'erreur et renvoie nil.
---Source : lua/common/utils.lua:428
---@param content string|userdata Texte JSON (ou buffer)
---@param context any Texte (souvent le nom de fichier) affiché dans le message d'erreur
---@return any|nil  Valeur décodée, nil en cas d'erreur
function jsonDecode(content, context) end

--- Encode une valeur Lua en texte JSON compact.
---Source : lua/common/utils.lua:355
---@param v any Valeur à encoder
---@return string  Texte JSON
function jsonEncode(v) end

--- Encode v en JSON compact, précédé de prefix et suivi (facultatif) de postfix.
---Source : lua/common/utils.lua:359
---@param prefix string Texte placé avant le JSON
---@param v any Valeur à encoder
---@param postfix string|nil Texte placé après le JSON
---@return string  prefix .. JSON .. postfix
function jsonEncodePrefix(prefix, v, postfix) end

--- Encode en JSON indenté (2 espaces par niveau), clés d'objet triées. Récursif.
---Source : lua/common/utils.lua:369
---@param v any Valeur à encoder
---@param lvl integer|nil Niveau d'indentation courant, 1 par défaut
---@param numberPrecision integer|nil Si donné, les nombres non entiers sont écrits avec ce nombre de décimales (format %N.Nf) ; nil = tostring
---@return string  Texte JSON indenté
function jsonEncodePretty(v, lvl, numberPrecision) end

--- Encode une valeur en JSON dans un buffer string.buffer partagé (sans copie en chaîne). Les nombres infinis/NaN sont écrits 9e999 / -9e999 ; les vec3/quat (cdata) deviennent {x,y,z[,w]} ; les types non supportés deviennent null. Une table dont la clé 1 existe est écrite comme tableau.
---Source : lua/common/utils.lua:349
---@param v any Valeur à encoder
---@return userdata  Buffer partagé (réécrit au prochain appel)
function jsonEncodeWorkBuffer(v) end

--- Lit et décode un fichier JSON. Renvoie nil si le fichier est illisible (sans log : l'appelant gère l'erreur) ou si le JSON est invalide (log E par jsonDecode).
---Source : lua/common/utils.lua:484
---@param filename string Chemin du fichier
---@return any|nil  Données décodées ou nil
function jsonReadFile(filename) end

--- Écrit une table dans un fichier JSON. Refuse (log E + false) si obj n'est pas une table. Avec atomicWrite, écrit d'abord dans un fichier temporaire puis le renomme (FS:renameFile).
---Source : lua/common/utils.lua:466
---@param filename string Fichier de destination
---@param obj table Données à écrire
---@param pretty boolean|nil true : JSON indenté (jsonEncodePretty), sinon compact
---@param numberPrecision integer|nil Décimales pour le mode pretty (voir jsonEncodePretty)
---@param atomicWrite boolean|string|nil Truthy : écriture atomique via fichier temporaire ; si c'est une chaîne, elle sert de nom de fichier temporaire, sinon filename..'.tmp'
---@return boolean  true si l'écriture a réussi
function jsonWriteFile(filename, obj, pretty, numberPrecision, atomicWrite) end

--- Lit un fichier INI simple (clé = valeur, sans sections). Ignore les lignes vides et celles commençant par #, ; ou /. Convertit les valeurs en nombre ou booléen quand c'est possible ; une ligne illisible est loguée en erreur.
---Source : lua/common/utils.lua:1122
---@param filename string Chemin du fichier
---@return table<string, number|boolean|string>|nil  Paires clé/valeur, nil si le fichier ne s'ouvre pas
function loadIni(filename) end

--- Complète s à gauche avec le caractère c jusqu'à la longueur l. s est converti par tostring.
---Source : lua/common/utils.lua:173
---@param s any Valeur à compléter
---@param l integer Longueur cible
---@param c string Caractère de remplissage
---@return string  Texte complété (inchangé s'il est déjà assez long)
function lpad(s, l, c) end

--- Décide si un objet s'est téléporté entre deux images, d'après sa position et sa vitesse précédentes. Pas de téléportation si le déplacement est inférieur à 1,5 m ou à 277*dt (1000 km/h), ou si la vitesse est cohérente avec la précédente. Sans données précédentes, renvoie true.
---Source : lua/common/utils.lua:1470
---@param curPos vec3 Position actuelle (m)
---@param prevPos vec3 Position à l'image précédente (m)
---@param prevVel vec3 Vitesse précédente (m/s)
---@param dt number Pas de temps (s)
---@return boolean  true si téléportation détectée
function objectTeleported(curPos, prevPos, prevVel, dt) end

--- Convertit en entier couleur une table {r,g,b,a}, une chaîne '#RRGGBBAA' (au moins 8 caractères avec le #) ou nil (donne transparent 0,0,0,0). Tout autre type renvoie nil.
---Source : lua/common/utils.lua:66
---@param v table|string|nil Table {r,g,b,a}, chaîne '#RRGGBBAA' ou nil
---@return integer|nil  Couleur RGBA 32 bits, nil si le format n'est pas reconnu
function parseColor(v) end

--- Couleur arc-en-ciel pour l'étape step sur numOfSteps. Le code recommande plutôt jetColor sauf raison contraire.
---Source : lua/common/utils.lua:84
---@param numOfSteps number Nombre total d'étapes
---@param step number Étape courante
---@param format number|nil 255 (défaut) pour des composantes entières 0..255, toute autre valeur pour des composantes [0..1]
---@return table  {r,g,b,a} (a vaut 255 ou 1 selon le format)
function rainbowColor(numOfSteps, step, format) end

--- Lit un JSON de tableaux 'en-têtes + lignes' : pour chaque entrée, la première ligne donne les noms de colonnes, et chaque ligne suivante est transformée en table nommée ; la ligne d'en-tête est ensuite supprimée (v[1] = nil).
---Source : lua/common/utils.lua:492
---@param filename string Chemin du fichier JSON
---@return table|nil  Données transformées, nil si lecture impossible
function readDictJSONTable(filename) end

--- Lit tout le contenu d'un fichier texte (io.open en mode 'r', avec événement profileur 'readFile').
---Source : lua/common/utils.lua:900
---@param filename string Chemin du fichier
---@return string|nil  Contenu, nil si le fichier n'existe pas ou ne s'ouvre pas
function readFile(filename) end

--- Complète s à droite avec le caractère c jusqu'à la longueur l. s est converti par tostring.
---Source : lua/common/utils.lua:178
---@param s any Valeur à compléter
---@param l integer Longueur cible
---@param c string Caractère de remplissage
---@return string  Texte complété
function rpad(s, l, c) end

--- Écrit un INI simple : 3 lignes de commentaire d'en-tête (titre de fenêtre, version du jeu, date), puis les clés triées au format 'clé = valeur'.
---Source : lua/common/utils.lua:1151
---@param filename string Fichier de sortie
---@param d table Paires clé/valeur
function saveIni(filename, d) end

--- Sérialise une valeur en texte Lua que deserialize() sait relire.
---Source : lua/common/utils.lua:1258
---@param v any Valeur à sérialiser
---@return string  Code Lua
function serialize(v) end

--- Collecte l'état à conserver avant un rechargement Lua : pour chaque package chargé définissant onSerialize ou onDeserialized, appelle onSerialize(reason), sinon prend M.state, sinon M. Ajoute les données d'extensions (extensions.getSerializationData). Les erreurs sont loguées et ignorées. Appelé par le moteur lors des rechargements.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils.lua:994
---@param reason string|nil Motif du rechargement, 'reload' par défaut
---@return table  Données indexées par nom de package
function serializePackages(reason) end

--- Sérialise une valeur en code Lua (rechargeable par deserialize) dans un buffer partagé. Gère _noSerialize (écrit nil), _serialize (table ou true : restreint ou non les clés, format _kv{...}), QuatF (userdata), cdata (tostring). Les fonctions deviennent nil.
---Source : lua/common/utils.lua:1252
---@param v any Valeur à sérialiser
---@return userdata  Buffer partagé (réécrit au prochain appel)
function serializeWorkBuffer(v) end

--- Retire de dst toutes les valeurs présentes dans src. Modifie dst et change l'ordre de ses éléments.
---Source : lua/common/utils.lua:534
---@param dst table Tableau modifié
---@param src table Valeurs à retirer
---@return table  dst
function setDifference(dst, src) end

--- Teste si deux tableaux contiennent les mêmes valeurs (comparaison de longueur puis d'appartenance ; ignore l'ordre).
---Source : lua/common/utils.lua:512
---@param set1 table Premier tableau
---@param set2 table Second tableau
---@return boolean  true si égaux en tant qu'ensembles
function setEqual(set1, set2) end

--- Ajoute à dst toutes les valeurs de src absentes de dst (modifie dst).
---Source : lua/common/utils.lua:522
---@param dst table Tableau modifié
---@param src table Tableau source
---@return table  dst
function setUnion(dst, src) end

--- Copie non récursive d'une table (les sous-tables restent partagées). Les valeurs non-table sont renvoyées telles quelles. La métatable n'est pas copiée.
---Source : lua/common/utils.lua:825
---@param orig any Valeur ou table à copier
---@return any  Copie
function shallowcopy(orig) end

--- Comme pairs mais dans un ordre aléatoire.
---Source : lua/common/utils.lua:1432
---@param t table Table à parcourir
---@param ctx table|nil Table de travail réutilisable
---@return function  Itérateur
---@return table  État de l'itérateur
function shuffledPairs(t, ctx) end

--- Dessine via debugDrawer un texte 3D, une sphère et/ou trois petites sphères d'axes orientées par dir.
---Source : lua/common/utils.lua:1497
---@param text any|nil Texte (converti par tostring)
---@param pos vec3 Position monde
---@param radius number|nil Rayon de la sphère (m), rien si nil ou <= 0
---@param sphereColor ColorF|nil Couleur de la sphère (blanc translucide par défaut)
---@param dir quat|nil Orientation : dessine les axes X (rouge), Y (vert), Z (bleu) à distance radius
function simpleDebugText3d(text, pos, radius, sphereColor, dir) end

--- Comme pairs mais dans l'ordre trié des clés (types mixtes acceptés, ou fonction de tri f). Les clés sont figées au départ ; une valeur mise à nil pendant la boucle est sautée.
---Source : lua/common/utils.lua:1415
---@param t table Table à parcourir
---@param ctx table|nil Table de travail réutilisable pour éviter les allocations
---@param f function|nil Comparateur de clés (défaut : tri multi-types)
---@return function  Itérateur
---@return table  État de l'itérateur
function sortedPairs(t, ctx, f) end

--- Découpe str selon le séparateur delim (recherche textuelle simple, pas une regex). Une chaîne vide renvoie un tableau vide. Les champs vides sont conservés.
---Source : lua/common/utils.lua:188
---@param str string Texte à découper
---@param delim string Séparateur littéral
---@param nMax integer|nil Nombre maximal de coupures (défaut -1 = illimité) ; le reste de la chaîne est mis dans le dernier élément
---@return table<integer, string>  Tableau des morceaux
function split(str, delim, nMax) end

--- Équivalent de string.format écrit dans un buffer partagé (buffer:putf), sans allocation de chaîne.
---Source : lua/common/utils.lua:575
---@param ... any Format puis valeurs
---@return userdata  Buffer partagé
function stringFormatWorkBuffer(...) end

--- Calcule un hash numérique d'une chaîne (algorithme StringHash du wiki WoW).
---Source : lua/common/utils.lua:242
---@param text string Texte à hacher
---@return number  Hash dans [0..4294967291)
function stringHash(text) end

--- Teste si la table contient la valeur element (non récursif).
---Source : lua/common/utils.lua:758
---@param t table Table parcourue
---@param element any Valeur cherchée
---@return boolean  true si présente
function tableContains(t, element) end

--- Teste si la table contient la chaîne element, sans tenir compte de la casse. Les valeurs de la table doivent être des chaînes.
---Source : lua/common/utils.lua:763
---@param table table Table de chaînes
---@param element string Chaîne cherchée
---@return boolean  true si présente
function tableContainsCaseInsensitive(table, element) end

--- Calcule la profondeur d'imbrication d'une table (clés et valeurs tables). Récursif et très lent ; 0 pour un non-table.
---Source : lua/common/utils.lua:802
---@param tbl any Table à mesurer
---@param lookup table|nil Cache interne de récursion (laisser nil)
---@return integer  Profondeur
function tableDepth(tbl, lookup) end

--- Renvoie l'indice où insérer le prochain élément dans un tableau à base 0 : 0 si la table est vide, sinon #tbl + 1.
---Source : lua/common/utils.lua:736
---@param tbl table Tableau
---@return integer  Prochain indice
function tableEndC(tbl) end

--- Renvoie la première clé associée à la valeur element (non récursif, ordre pairs).
---Source : lua/common/utils.lua:749
---@param t table Table parcourue
---@param element any Valeur cherchée
---@return any|nil  Clé trouvée ou nil
function tableFindKey(t, element) end

--- Insère data en fin de tableau à base 0 : en tbl[0] si l'indice 0 est libre, sinon table.insert.
---Source : lua/common/utils.lua:740
---@param tbl table Tableau modifié
---@param data any Élément à insérer
function tableInsertC(tbl, data) end

--- Vérifie strictement que toutes les clés sont des entiers de 1 à #tbl sans trou. Parcourt toute la table.
---Source : lua/common/utils.lua:588
---@param tbl table Table à tester
---@return boolean  true si tableau pur
function tableIsArraySlow(tbl) end

--- Renvoie true si tbl est une table dont le premier élément n'a pas la clé 1 (test rapide : next(tbl) ~= 1). Une table vide compte donc comme dictionnaire. Renvoie false si ce n'est pas une table.
---Source : lua/common/utils.lua:581
---@param tbl any Valeur à tester
---@return boolean  true si dictionnaire
function tableIsDict(tbl) end

--- Renvoie true si tbl n'est pas une table ou si elle est vide.
---Source : lua/common/utils.lua:601
---@param tbl any Valeur à tester
---@return boolean  true si vide ou non-table
function tableIsEmpty(tbl) end

--- Renvoie un tableau de toutes les clés de tbl (ordre non défini).
---Source : lua/common/utils.lua:606
---@param tbl table Table source
---@param target table|nil Tableau réutilisé comme sortie (créé sinon)
---@return table  Tableau des clés
function tableKeys(tbl, target) end

--- Comme tableKeys, mais trié. Le tri accepte des types mixtes : d'abord par nom de type, puis par valeur (nombres, chaînes), booléens true d'abord, autres par tostring.
---Source : lua/common/utils.lua:629
---@param tbl table Table source
---@param target table|nil Tableau réutilisé comme sortie
---@return table  Tableau trié des clés
function tableKeysSorted(tbl, target) end

--- Copie toutes les paires clé/valeur de src dans dst (écrase les clés existantes, non récursif).
---Source : lua/common/utils.lua:654
---@param dst table Table modifiée
---@param src table Table source
---@return table  dst
function tableMerge(dst, src) end

--- Fusion récursive des sous-tables de t2 dans t1. Attention : les tableaux ne sont pas concaténés, leurs éléments s'écrasent par indice.
---Source : lua/common/utils.lua:663
---@param t1 table Table modifiée
---@param t2 table Table source
---@return table  t1
function tableMergeRecursive(t1, t2) end

--- Fusion récursive qui concatène les tableaux purs (au lieu de les écraser) et fusionne les tables associatives. Les tables absentes de t1 sont copiées.
---Source : lua/common/utils.lua:675
---@param t1 table Table modifiée
---@param t2 table Table source
---@return table  t1
function tableMergeRecursiveArray(t1, t2) end

--- Renvoie une table proxy en lecture seule (metatable __index vers l'original ; toute écriture lève une erreur). Seul le premier niveau est protégé.
---Source : lua/common/utils.lua:722
---@param table table Table à protéger
---@return table  Proxy en lecture seule
function tableReadOnly(table) end

--- Itère en rond sur les clés : renvoie la clé suivant lastKey, ou la première clé si on arrive à la fin ou si lastKey est nil/absente.
---Source : lua/common/utils.lua:819
---@param tbl table Table parcourue
---@param lastKey any|nil Clé renvoyée à l'appel précédent
---@return any|nil  Clé suivante (nil si la table est vide)
function tableRoundRobinKey(tbl, lastKey) end

--- Compte les entrées d'une table (tableau ou dictionnaire) en la parcourant entièrement. Renvoie 0 pour un non-table.
---Source : lua/common/utils.lua:706
---@param tbl any Table à compter
---@return integer  Nombre d'entrées
function tableSize(tbl) end

--- Taille d'un tableau en comptant aussi l'élément d'indice 0 (convention C) s'il existe.
---Source : lua/common/utils.lua:731
---@param tbl table Tableau
---@return integer  #tbl + 1 si tbl[0] existe, sinon #tbl
function tableSizeC(tbl) end

--- Convertit une table {r,g,b,a} (0..255) en entier couleur. Renvoie 0 si la table est nil.
---Source : lua/common/utils.lua:62
---@param v table|nil Table avec les champs r, g, b, a
---@return integer  Couleur RGBA 32 bits
function tableToColor(v) end

--- Construit un dictionnaire valeur -> 1 à partir des valeurs de tbl, pour tester l'appartenance en O(1).
---Source : lua/common/utils.lua:636
---@param tbl table Table dont on prend les valeurs
---@param target table|nil Table réutilisée comme sortie
---@return table<any, integer>  Dictionnaire {valeur = 1}
function tableValuesAsLookupDict(tbl, target) end

--- Premier appel : démarre le chrono. Second appel : imprime la durée en millisecondes et la renvoie en secondes.
---Source : lua/common/utils.lua:1328
---@param omitPrint boolean|nil Ne rien imprimer
---@return number|nil  Durée en secondes (second appel seulement)
function timeprobe(omitPrint) end

--- Démarre toujours un chronomètre (os.clockhp), même si un timeprobe était en cours.
---Source : lua/common/utils.lua:1323
function timeprobeStart() end

--- Supprime les espaces au début et à la fin d'une chaîne.
---Source : lua/common/utils.lua:183
---@param s string Chaîne à nettoyer
---@return string  Chaîne sans espaces aux extrémités
function trim(s) end

--- Affiche un message à l'écran via guihooks.message. Raccourci utilisé par beaucoup de scripts.
---Source : lua/common/utils.lua:927
---@param msg string Texte (ou clé de traduction)
---@param ttl number|nil Durée d'affichage en secondes, 5 par défaut
---@param category string|nil Catégorie du message, '' par défaut
---@param icon string|nil Icône, 'info' par défaut
function ui_message(msg, ttl, category, icon) end

--- Affiche une notification 'toast' dans l'interface (évènement UI toastrMsg).
---Source : lua/common/utils.lua:931
---@param msg string Texte
---@param title string|nil Titre
---@param type string|nil 'info' (défaut), 'success', 'warning' ou 'error'
---@param _config table|nil Options supplémentaires copiées dans config
function ui_toast(msg, title, type, _config) end

--- Inverse de flattenTable : remplace les jetons '>#>/chemin' par les sous-tables d'origine. Loggue une erreur si le lien n'existe pas.
---Source : lua/common/utils.lua:1396
---@param tbl table Table modifiée
---@return table|nil  tbl, ou nil si ce n'est pas une table
function unflattenTable(tbl) end

--- Écrit du texte dans un fichier (mode 'w', écrase). En cas d'échec d'ouverture, loggue un avertissement.
---Source : lua/common/utils.lua:914
---@param filename string Chemin du fichier
---@param data string Texte à écrire
---@return boolean|nil  true si écrit, nil si ouverture impossible
function writeFile(filename, data) end

---@type any
lpack = nil
---@type table
path = nil
