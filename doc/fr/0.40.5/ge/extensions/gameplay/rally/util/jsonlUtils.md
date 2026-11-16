# `gameplay_rally_util_jsonlUtils`

*Fichier : `lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua` · VM : Game Engine (GE) · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_util_jsonlUtils` : `extensions.load("gameplay_rally_util_jsonlUtils")`, puis la globale `gameplay_rally_util_jsonlUtils`

Utilitaires de lecture de fichiers JSONL (un objet JSON par ligne), utilisés pour charger les enregistrements de reconnaissance du rallye (driveline, cuts, transcriptions). Les lignes vides et celles commençant par `//` sont ignorées par parseJsonlFile.

## Exemple

```lua
local objs, err = gameplay_rally_util_jsonlUtils.parseJsonlFile(fname, function(o) return o end, rallyUtil)
```

## Remarques

- parseJsonlFile appelle rallyUtil.trimString : l'appelant doit passer le module gameplay/rally/util.
- readJsonlLines ne saute ni les lignes vides ni les commentaires `//` ; jsonDecode sera appelé sur chaque ligne telle quelle.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_util_jsonlUtils.parseJsonlFile(fname, processLine, rallyUtil)` | Lit un fichier JSONL, décode chaque ligne non vide et non commentée, applique éventuellement processLine à l'objet et accumule les résultats non nil. | 39 |
| `gameplay_rally_util_jsonlUtils.readFileToMemory(fname)` | Lit tout un fichier en mémoire avec io.open. | 17 |
| `gameplay_rally_util_jsonlUtils.readJsonlLines(fname, callback)` | Lecteur simple basé sur io.lines (compatibilité). Appelle callback(obj) pour chaque ligne décodée. | 70 |
| `gameplay_rally_util_jsonlUtils.splitIntoLines(content)` | Découpe un texte en lignes sur \r et \n ; les lignes vides disparaissent. | 27 |
| `gameplay_rally_util_jsonlUtils.startsWithDoubleSlash(line)` | Teste si la ligne commence par `//` (marqueur de commentaire). | 11 |

### Détail des paramètres

#### `gameplay_rally_util_jsonlUtils.parseJsonlFile(fname, processLine, rallyUtil)`

Lit un fichier JSONL, décode chaque ligne non vide et non commentée, applique éventuellement processLine à l'objet et accumule les résultats non nil.

- `fname` (*string*) : Chemin du fichier.
- `processLine` (*function|nil*) : Reçoit l'objet décodé, renvoie l'objet à garder ou nil pour l'ignorer.
- `rallyUtil` (*table*) : Module rally util (fournit trimString).
- **renvoie** : table|nil Liste des objets, ou nil en cas d'erreur.
- **renvoie** : string|nil Message d'erreur : "file not found" ou "failed to read file".

#### `gameplay_rally_util_jsonlUtils.readFileToMemory(fname)`

Lit tout un fichier en mémoire avec io.open.

- `fname` (*string*) : Chemin du fichier.
- **renvoie** : string|nil Contenu, ou nil si l'ouverture échoue.

#### `gameplay_rally_util_jsonlUtils.readJsonlLines(fname, callback)`

Lecteur simple basé sur io.lines (compatibilité). Appelle callback(obj) pour chaque ligne décodée.

- `fname` (*string*) : Chemin du fichier.
- `callback` (*function|nil*) : Appelée avec l'objet décodé de chaque ligne.
- **renvoie** : boolean false si le fichier n'existe pas, sinon true.

#### `gameplay_rally_util_jsonlUtils.splitIntoLines(content)`

Découpe un texte en lignes sur \r et \n ; les lignes vides disparaissent.

- `content` (*string*) : Texte à découper.
- **renvoie** : string[] Liste des lignes non vides.

#### `gameplay_rally_util_jsonlUtils.startsWithDoubleSlash(line)`

Teste si la ligne commence par `//` (marqueur de commentaire).

- `line` (*string*) : Ligne à tester.
- **renvoie** : boolean true si la ligne commence par //.

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua`.*
