---@meta
-- tim19Atlas stub generated from lua/common/csvlib.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque d'écriture et de lecture de fichiers CSV/TSV. newCSV/newTSV créent un enregistreur (csvWriter) où l'on ajoute des lignes avec add, puis on écrit le fichier avec write (nom horodaté) ou on récupère le texte avec dump. readFileCSV et decode relisent un CSV (RFC 4180) en tableau de lignes. Utile pour enregistrer des télémétries ou courbes depuis un mod.
--- Accès : globale `csvFile`, `csvLog`, `csvfile`, `dataToCSV`, `trajectoryToCSV2`
---@class csvFile
csvFile = {}

--- Décode un texte CSV (RFC 4180) en tableau de lignes de cellules.
---Source : lua/common/csvlib.lua:99
---@param s string|nil Contenu CSV.
---@param sep string|nil Séparateur (défaut ',').
---@return table[]|nil  Lignes de cellules (nombres ou chaînes) ; nil si s est nil.
function csvFile.decode(s, sep) end

--- Crée un enregistreur CSV (séparateur virgule). Les arguments éventuels forment la ligne d'en-tête.
---Source : lua/common/csvlib.lua:38
---@param ... any Noms de colonnes (facultatifs).
---@return table  Objet csvWriter.
function csvFile.newCSV(...) end

--- Crée un enregistreur TSV (séparateur tabulation). Les arguments éventuels forment la ligne d'en-tête.
---Source : lua/common/csvlib.lua:42
---@param ... any Noms de colonnes (facultatifs).
---@return table  Objet csvWriter.
function csvFile.newTSV(...) end

--- Lit un fichier via readFile puis le décode avec decode.
---Source : lua/common/csvlib.lua:163
---@param filename string Chemin du fichier.
---@param sep string|nil Séparateur (1er caractère utilisé, défaut ',').
---@return table[]|nil  Tableau de lignes, chaque ligne étant un tableau de valeurs ; nil si le fichier est illisible.
function csvFile.readFileCSV(filename, sep) end

--- Objet renvoyé par newCSV/newTSV. Accumule le texte dans un string.buffer.
---@class csvFile_csvWriter
local csvFile_csvWriter = {}

--- Ajoute une ligne de cellules (nombres, booléens, chaînes ou nil).
---Source : lua/common/csvlib.lua:46
---@param ... number|string|boolean|nil Valeurs de la ligne.
---@return table  L'enregistreur lui-même (chaînable).
function csvFile_csvWriter:add(...) end

--- Renvoie tout le contenu accumulé sous forme de texte.
---Source : lua/common/csvlib.lua:84
---@return string  Texte CSV/TSV.
function csvFile_csvWriter:dump() end

--- Écrit le contenu dans un fichier (voir notes pour le nommage).
---Source : lua/common/csvlib.lua:88
---@param filename string|nil Nom ou chemin ; par défaut dérivé des en-têtes.
---@return string  Nom de fichier réellement utilisé.
function csvFile_csvWriter:write(filename) end

