# `csvFile`

*Fichier : `lua/common/csvlib.lua` · VM : Commun (GE + véhicule) · 171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `csvFile`, `csvLog`, `csvfile`, `dataToCSV`, `trajectoryToCSV2`

Bibliothèque d'écriture et de lecture de fichiers CSV/TSV. newCSV/newTSV créent un enregistreur (csvWriter) où l'on ajoute des lignes avec add, puis on écrit le fichier avec write (nom horodaté) ou on récupère le texte avec dump. readFileCSV et decode relisent un CSV (RFC 4180) en tableau de lignes. Utile pour enregistrer des télémétries ou courbes depuis un mod.

## Exemple

```lua
local csv = require('csvlib').newCSV('t', 'rpm', 'torque')
csv:add(0.0, 800, 120)
csv:add(0.1, 900, 130)
local name = csv:write('mylog')  -- mylog_2026-...csv
local rows = require('csvlib').readFileCSV(name)
```

## Remarques

- Le fichier fait require 'utils' ; write utilise writeFile (global) et readFileCSV utilise readFile (global).
- Les nombres sont écrits au format %.10g ; les booléens valent 1/0 ; nil donne une cellule vide ; les chaînes sont mises entre guillemets si nécessaire (séparateur, guillemet, CR, LF, ou début par espace/caractère de contrôle).
- Le nom de fichier par défaut vient des premières lettres des en-têtes (headernym), sinon 'csv' ou 'tsv'.
- write ajoute _AAAA-MM-JJTHH_MM_SS.ext sauf si le 4e caractère depuis la fin du nom est un point (nom déjà avec extension de 3 lettres).
- decode convertit en nombre les champs non entre guillemets qui commencent par un chiffre, + ou - quand tonumber réussit ; ignore les espaces/tabulations autour des valeurs ; supprime les cellules vides finales et les lignes vides finales.
- Les cellules entre guillemets restent des chaînes, même si elles ressemblent à un nombre.
- Le champ headernym n'est défini que si des en-têtes sont passés à newCSV/newTSV, et la première lettre seulement est retenue (underscore pour un en-tête vide) ; add(...) avec les en-têtes écrit la première ligne.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `csvFile.decode(s, sep)` | Décode un texte CSV (RFC 4180) en tableau de lignes de cellules. | 99 |
| `csvFile.newCSV(...)` | Crée un enregistreur CSV (séparateur virgule). Les arguments éventuels forment la ligne d'en-tête. | 38 |
| `csvFile.newTSV(...)` | Crée un enregistreur TSV (séparateur tabulation). Les arguments éventuels forment la ligne d'en-tête. | 42 |
| `csvFile.readFileCSV(filename, sep)` | Lit un fichier via readFile puis le décode avec decode. | 163 |

### Détail des paramètres

#### `csvFile.decode(s, sep)`

Décode un texte CSV (RFC 4180) en tableau de lignes de cellules.

- `s` (*string|nil*) : Contenu CSV.
- `sep` (*string|nil*) : Séparateur (défaut ',').
- **renvoie** : table[]|nil Lignes de cellules (nombres ou chaînes) ; nil si s est nil.

#### `csvFile.newCSV(...)`

Crée un enregistreur CSV (séparateur virgule). Les arguments éventuels forment la ligne d'en-tête.

- `...` (*any*) : Noms de colonnes (facultatifs).
- **renvoie** : table Objet csvWriter.

#### `csvFile.newTSV(...)`

Crée un enregistreur TSV (séparateur tabulation). Les arguments éventuels forment la ligne d'en-tête.

- `...` (*any*) : Noms de colonnes (facultatifs).
- **renvoie** : table Objet csvWriter.

#### `csvFile.readFileCSV(filename, sep)`

Lit un fichier via readFile puis le décode avec decode.

- `filename` (*string*) : Chemin du fichier.
- `sep` (*string|nil*) : Séparateur (1er caractère utilisé, défaut ',').
- **renvoie** : table[]|nil Tableau de lignes, chaque ligne étant un tableau de valeurs ; nil si le fichier est illisible.

## Classe `csvWriter`

Objet renvoyé par newCSV/newTSV. Accumule le texte dans un string.buffer.

| Méthode | Description | Ligne |
|---|---|---|
| `csvWriter:add(...)` | Ajoute une ligne de cellules (nombres, booléens, chaînes ou nil). | 46 |
| `csvWriter:dump()` | Renvoie tout le contenu accumulé sous forme de texte. | 84 |
| `csvWriter:write(filename)` | Écrit le contenu dans un fichier (voir notes pour le nommage). | 88 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/csvlib.lua`.*
