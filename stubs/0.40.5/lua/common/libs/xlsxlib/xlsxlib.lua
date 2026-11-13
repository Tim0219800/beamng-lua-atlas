---@meta
-- tim19Atlas stub generated from lua/common/libs/xlsxlib/xlsxlib.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque BeamNG (Thomas Fischer, 2024) de lecture de classeurs Excel .xlsx. Elle ouvre l'archive ZIP avec l'objet moteur `ZipArchive`, lit les relations, la liste des feuilles et les chaînes partagées, puis extrait les cellules d'une feuille (valeurs, pas les formules) dans des tables Lua. Sert à importer des données de tableur (par ex. paramètres de contenu) ; s'appuie sur libs/slaxml/slaxdom.
--- Accès : `require("libs/xlsxlib/xlsxlib")`
---@class libs_xlsxlib_xlsxlib
local libs_xlsxlib_xlsxlib = {}

--- Lit les données d'une feuille d'un classeur chargé. Sans `range`, renvoie toute la feuille sous forme de tableau de lignes (rognée des bords vides). Avec `range`, renvoie la portion demandée (valeur seule pour une cellule, liste pour une colonne ou une ligne, tableau de lignes pour un bloc).
---Source : lua/common/libs/xlsxlib/xlsxlib.lua:467
---@param xlsx table Résultat de loadFileXLSX.
---@param sheetName string|nil Nom de la feuille (insensible à la casse) ; nil = première feuille trouvée.
---@param range string|nil Plage au format Excel (voir notes).
---@return table|string|number|boolean|nil  Données extraites ; les valeurs sont des nombres, chaînes ou booléens, et les cellules vides valent nil.
function libs_xlsxlib_xlsxlib.getSheetData(xlsx, sheetName, range) end

--- Charge un fichier .xlsx : ouvre l'archive, lit _rels/.rels et les relations du classeur, la liste des feuilles (nom -> chemin interne) et les chaînes partagées. Referme l'archive avant de renvoyer.
---Source : lua/common/libs/xlsxlib/xlsxlib.lua:402
---@param filepath string Chemin du fichier .xlsx (ouvert par ZipArchive:openArchiveName en lecture).
---@return table  {filepath = string, sharedStrings = string[], sheets = table<string, string>}.
function libs_xlsxlib_xlsxlib.loadFileXLSX(filepath) end

return libs_xlsxlib_xlsxlib
