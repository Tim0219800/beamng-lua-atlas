# `json_ast`

*Fichier : `lua/common/json-ast.lua` · VM : Commun (GE + véhicule) · 526 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("json-ast")`

Parseur JSON/SJSON qui construit un arbre syntaxique (AST) sans perte : chaque espace, tabulation, saut de ligne, commentaire (// et /* */), délimiteur, chaîne, nombre (avec sa précision) devient un noeud. On peut ainsi relire un fichier .jbeam, modifier des valeurs et le réécrire à l'identique (stringify). Sert à l'éditeur de texte jbeam intégré ; en plus de l'AST il produit les données Lua natives et le schéma de tables jbeam déjà traité.

## Exemple

```lua
local jsonAst = require('json-ast')
local ctx = jsonAst.parse(readFile('vehicles/pickup/pickup.jbeam'))
if ctx then
  local data = ctx.transient.luaData  -- données natives (schéma jbeam traité)
  local text = jsonAst.stringify(ctx.ast) -- doit redonner le texte d'origine
end
```

## Remarques

- Un noeud est une table {type, valeur, précision?}. Types produits : object_begin, object_end, list_begin, list_end, array_delimiter, key_delimiter, newline, newline_windows, bool, string, string_single, number ({'number', valeur, nbDécimales}, avec prefixPlus et addPostfixDot), comment, comment_multiline, space ({'space', n}), tab, literal (repli quand rien n'est reconnu : journalisé en erreur).
- parse renvoie un contexte ctx (ou nil si plusieurs racines) avec : ctx.ast.nodes (liste de noeuds) ; ctx.transient.hierarchy (indice de noeud conteneur -> indices des enfants) ; ctx.transient.root (indice du noeud racine) ; ctx.transient.luaDataRaw (données natives brutes) ; ctx.transient.luaData (copie profonde après jbeamTableSchema.process sur chaque section et création de pos = vec3(posX,posY,posZ)) ; ctx.transient.linesIndexes (indice du premier noeud de chaque ligne) ; ctx.transient.nodeIdxToLineNum. ctx.str et ctx.pos sont supprimés.
- Avec addAstId vrai, chaque table native (liste ou objet) reçoit un champ __astNodeIdx qui renvoie à son noeud AST ; chaque section traitée reçoit aussi __schemaProcessed = true.
- Les chaînes à guillemets simples sont réécrites avec des guillemets doubles par stringify, et l'échappement n'est pas géré : une chaîne contenant un guillemet échappé ne s'écrit pas à l'identique (le parseur ne traite pas les séquences \ ).
- Le test jbeam compare aussi avec le parseur rapide (json.decode) et écrit des fichiers *_dump_ast.txt / *.ast.json en cas de différence : utilitaire de développement.
- La page extraite ne listait pas findDifferences : c'est une fonction locale (pas exportée).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `json_ast.parse(str, addAstId)` | Analyse un texte JSON/SJSON/jbeam et renvoie le contexte (AST + données Lua). Renvoie nil si le texte contient plusieurs noeuds racine. Les erreurs de nombre ou de caractère inconnu sont journalisées (log E) sans arrêter. | 391 |
| `json_ast.stringify(ast)` | Reconstitue le texte à partir d'un AST (concatène stringifyNodes(ast.nodes)). | 421 |
| `json_ast.stringifyNode(node)` | Texte d'un seul noeud (ex. '{' pour object_begin, '//commentaire', nombre formaté avec sa précision d'origine). Renvoie nil pour un type inconnu. | 294 |
| `json_ast.stringifyNodes(nodes)` | Concatène le texte de tous les noeuds d'une liste (erreur Lua si un noeud est de type inconnu, car stringifyNode renvoie nil). | 345 |
| `json_ast.testFile(filename, writeAST, addASTId)` | Outil de test : lit un fichier, le parse, compare avec json.decode, reconstruit le texte et vérifie qu'il est identique à l'original. Écrit des fichiers de diagnostic en cas de différence. Renvoie true si le cycle parse -> stringify est sans perte. | 445 |
| `json_ast.testFiles(writeAST, reportOK)` | Outil de test : exécute testFile sur tous les *.jbeam trouvés depuis la racine ('/') et journalise les erreurs (et les OK si reportOK). | 503 |

### Détail des paramètres

#### `json_ast.parse(str, addAstId)`

Analyse un texte JSON/SJSON/jbeam et renvoie le contexte (AST + données Lua). Renvoie nil si le texte contient plusieurs noeuds racine. Les erreurs de nombre ou de caractère inconnu sont journalisées (log E) sans arrêter.

- `str` (*string*) : texte source
- `addAstId` (*boolean|nil*) : ajoute __astNodeIdx dans les tables natives
- **renvoie** : table|nil contexte {ast = {nodes}, transient = {luaData, luaDataRaw, hierarchy, root, linesIndexes, nodeIdxToLineNum}}

#### `json_ast.stringify(ast)`

Reconstitue le texte à partir d'un AST (concatène stringifyNodes(ast.nodes)).

- `ast` (*table*) : ctx.ast (table avec champ nodes)
- **renvoie** : string texte

#### `json_ast.stringifyNode(node)`

Texte d'un seul noeud (ex. '{' pour object_begin, '//commentaire', nombre formaté avec sa précision d'origine). Renvoie nil pour un type inconnu.

- `node` (*table*) : noeud {type, valeur, précision}
- **renvoie** : string|nil texte du noeud

#### `json_ast.stringifyNodes(nodes)`

Concatène le texte de tous les noeuds d'une liste (erreur Lua si un noeud est de type inconnu, car stringifyNode renvoie nil).

- `nodes` (*table[]*) : liste de noeuds
- **renvoie** : string texte

#### `json_ast.testFile(filename, writeAST, addASTId)`

Outil de test : lit un fichier, le parse, compare avec json.decode, reconstruit le texte et vérifie qu'il est identique à l'original. Écrit des fichiers de diagnostic en cas de différence. Renvoie true si le cycle parse -> stringify est sans perte.

- `filename` (*string*) : chemin du fichier
- `writeAST` (*boolean|nil*) : écrit <fichier>.ast.json si succès
- `addASTId` (*boolean|nil*) : ajoute __astNodeIdx
- **renvoie** : boolean|nil true si OK, false/nil sinon

#### `json_ast.testFiles(writeAST, reportOK)`

Outil de test : exécute testFile sur tous les *.jbeam trouvés depuis la racine ('/') et journalise les erreurs (et les OK si reportOK).

- `writeAST` (*boolean|nil*) : écrire les .ast.json
- `reportOK` (*boolean|nil*) : journaliser aussi les fichiers OK

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/json-ast.lua`.*
