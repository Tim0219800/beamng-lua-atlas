---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaires de lecture de fichiers JSONL (un objet JSON par ligne), utilisés pour charger les enregistrements de reconnaissance du rallye (driveline, cuts, transcriptions). Les lignes vides et celles commençant par `//` sont ignorées par parseJsonlFile.
--- Accès : extension `gameplay_rally_util_jsonlUtils` : `extensions.load("gameplay_rally_util_jsonlUtils")`, puis la globale `gameplay_rally_util_jsonlUtils`
---@class gameplay_rally_util_jsonlUtils
gameplay_rally_util_jsonlUtils = {}

--- Lit un fichier JSONL, décode chaque ligne non vide et non commentée, applique éventuellement processLine à l'objet et accumule les résultats non nil.
---Source : lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:39
---@param fname string Chemin du fichier.
---@param processLine function|nil Reçoit l'objet décodé, renvoie l'objet à garder ou nil pour l'ignorer.
---@param rallyUtil table Module rally util (fournit trimString).
---@return table|nil  Liste des objets, ou nil en cas d'erreur.
---@return string|nil  Message d'erreur : "file not found" ou "failed to read file".
function gameplay_rally_util_jsonlUtils.parseJsonlFile(fname, processLine, rallyUtil) end

--- Lit tout un fichier en mémoire avec io.open.
---Source : lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:17
---@param fname string Chemin du fichier.
---@return string|nil  Contenu, ou nil si l'ouverture échoue.
function gameplay_rally_util_jsonlUtils.readFileToMemory(fname) end

--- Lecteur simple basé sur io.lines (compatibilité). Appelle callback(obj) pour chaque ligne décodée.
---Source : lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:70
---@param fname string Chemin du fichier.
---@param callback function|nil Appelée avec l'objet décodé de chaque ligne.
---@return boolean  false si le fichier n'existe pas, sinon true.
function gameplay_rally_util_jsonlUtils.readJsonlLines(fname, callback) end

--- Découpe un texte en lignes sur \r et \n ; les lignes vides disparaissent.
---Source : lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:27
---@param content string Texte à découper.
---@return string[]  Liste des lignes non vides.
function gameplay_rally_util_jsonlUtils.splitIntoLines(content) end

--- Teste si la ligne commence par `//` (marqueur de commentaire).
---Source : lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:11
---@param line string Ligne à tester.
---@return boolean  true si la ligne commence par //.
function gameplay_rally_util_jsonlUtils.startsWithDoubleSlash(line) end

