# `libs_xlsxlib_xlsxlib`

*Fichier : `lua/common/libs/xlsxlib/xlsxlib.lua` · VM : Commun (GE + véhicule) · 514 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/xlsxlib/xlsxlib")`

Bibliothèque BeamNG (Thomas Fischer, 2024) de lecture de classeurs Excel .xlsx. Elle ouvre l'archive ZIP avec l'objet moteur `ZipArchive`, lit les relations, la liste des feuilles et les chaînes partagées, puis extrait les cellules d'une feuille (valeurs, pas les formules) dans des tables Lua. Sert à importer des données de tableur (par ex. paramètres de contenu) ; s'appuie sur libs/slaxml/slaxdom.

## Exemple

```lua
local xlsx = require('libs/xlsxlib/xlsxlib')
local book = xlsx.loadFileXLSX('lua/common/libs/xlsxlib/tests/test_input_1.xlsx')
local tout = xlsx.getSheetData(book, 'Sheet1')
local bloc = xlsx.getSheetData(book, 'Sheet1', 'A1:C3')
local cell = xlsx.getSheetData(book, 'Sheet1', 'B2')
```

## Remarques

- Syntaxe des plages (parseRange) : "B2" (une cellule, renvoie la valeur seule), "A1:C3", colonne seule "B" (liste), plage de colonnes "C:E", ligne seule "2" (liste), plage de lignes "2:5". Les références absolues $A$1 sont acceptées pour les cellules. Colonnes en majuscules uniquement.
- Les plages générales (cellules ou colonnes/lignes combinées) sont rognées : les lignes/colonnes vides en bordure sont supprimées avant extraction, donc la position retournée n'est pas forcément celle demandée.
- Types de cellules : chaîne partagée (t='s'), booléen (t='b'), chaîne/inlineStr, sinon nombre si convertible. Les formules ne sont pas évaluées (cellule ignorée) et les cellules vides sont omises.
- Erreurs levées via error() : fichier impossible à ouvrir, archive vide, relation du classeur introuvable, feuille introuvable (« Sheet not found: ... »), plage invalide, référence de cellule invalide.
- Le nom de feuille est recherché sans tenir compte de la casse ; si `sheetName` est nil, la première feuille renvoyée par next() (ordre non garanti) est utilisée.
- getSheetData rouvre l'archive à chaque appel (le chemin est conservé dans xlsx.filepath).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_xlsxlib_xlsxlib.getSheetData(xlsx, sheetName, range)` | Lit les données d'une feuille d'un classeur chargé. Sans `range`, renvoie toute la feuille sous forme de tableau de lignes (rognée des bords vides). Avec `range`, renvoie la portion demandée (valeur seule pour une cellule, liste pour une colonne ou une ligne, tableau de lignes pour un bloc). | 467 |
| `libs_xlsxlib_xlsxlib.loadFileXLSX(filepath)` | Charge un fichier .xlsx : ouvre l'archive, lit _rels/.rels et les relations du classeur, la liste des feuilles (nom -> chemin interne) et les chaînes partagées. Referme l'archive avant de renvoyer. | 402 |

### Détail des paramètres

#### `libs_xlsxlib_xlsxlib.getSheetData(xlsx, sheetName, range)`

Lit les données d'une feuille d'un classeur chargé. Sans `range`, renvoie toute la feuille sous forme de tableau de lignes (rognée des bords vides). Avec `range`, renvoie la portion demandée (valeur seule pour une cellule, liste pour une colonne ou une ligne, tableau de lignes pour un bloc).

- `xlsx` (*table*) : Résultat de loadFileXLSX.
- `sheetName` (*string|nil*) : Nom de la feuille (insensible à la casse) ; nil = première feuille trouvée.
- `range` (*string|nil*) : Plage au format Excel (voir notes).
- **renvoie** : table|string|number|boolean|nil Données extraites ; les valeurs sont des nombres, chaînes ou booléens, et les cellules vides valent nil.

#### `libs_xlsxlib_xlsxlib.loadFileXLSX(filepath)`

Charge un fichier .xlsx : ouvre l'archive, lit _rels/.rels et les relations du classeur, la liste des feuilles (nom -> chemin interne) et les chaînes partagées. Referme l'archive avant de renvoyer.

- `filepath` (*string*) : Chemin du fichier .xlsx (ouvert par ZipArchive:openArchiveName en lecture).
- **renvoie** : table {filepath = string, sharedStrings = string[], sheets = table<string, string>}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/xlsxlib/xlsxlib.lua`.*
