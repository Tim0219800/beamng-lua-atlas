# `epnf`

*Fichier : `lua/common/libs/lua-luaepnf/epnf.lua` · VM : Commun (GE + véhicule) · 219 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `epnf`

lua-luaepnf : bibliothèque tierce (Gerhard Lipp) qui facilite la définition de grammaires LPeg en syntaxe EBNF-like, avec arbre syntaxique (AST) automatique et messages d'erreur de parsing. Ici elle repose sur LuLPeg (libs/LuLPeg/lulpeg), une réimplémentation de LPeg en Lua pur. Rôle limité pour un moddeur : analyser un langage ou un format texte personnalisé.

## Exemple

```lua
local epnf = require('libs/lua-luaepnf/epnf')
local g = epnf.define(function(_ENV)
  START 'expr'
  expr = ID * (P'+' * ID)^0 * EOF()
end)
local ast = epnf.parsestring(g, 'a+b')
```

## Remarques

- Dans le fichier, 'epnf' est une variable locale du module (le doc auto la dit globale).
- raise (et les erreurs de parsing) écrivent le message avec print() dans la sortie standard (la ligne fautive et un marqueur ^), sans lever d'exception ; seul define lève une assertion 'no start rule defined' si aucune règle START n'est définie.
- Les noms de règles sont créés par assignation dans l'environnement ; ceux déclarés par SUPPRESS ne génèrent pas de nœud d'AST.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `epnf.define(func, g, e)` | Prépare un environnement où l'on définit des règles de grammaire par simple assignation (nom = motif) avec des raccourcis LPeg (majuscules) et les assistants START, SUPPRESS, E, EOF, ID, W, WS. Chaque règle produit un nœud d'AST {id=nom, pos=position, ...}. | 108 |
| `epnf.dumpast(node)` | Écrit une représentation indentée de l'AST sur stderr (débogage). | 208 |
| `epnf.parse(g, name, input, ...)` | Applique une grammaire à une chaîne et renvoie l'AST. | 158 |
| `epnf.parsefile(g, fname, ...)` | Lit un fichier entier puis applique la grammaire. Lève une erreur si le fichier ne peut pas être ouvert. | 164 |
| `epnf.parsestring(g, str, ...)` | Comme parse, avec un nom d'entrée généré à partir des 20 premiers caractères du texte. | 174 |
| `epnf.raise(n, msg, s, p)` | Signale une erreur de validation sémantique de l'AST : affiche 'nom:ligne: message', la ligne fautive et un marqueur sous la position (assert p <= #s). | 51 |

### Détail des paramètres

#### `epnf.define(func, g, e)`

Prépare un environnement où l'on définit des règles de grammaire par simple assignation (nom = motif) avec des raccourcis LPeg (majuscules) et les assistants START, SUPPRESS, E, EOF, ID, W, WS. Chaque règle produit un nœud d'AST {id=nom, pos=position, ...}.

- `func` (*function*) : Fonction de définition ; reçoit l'environnement en argument (et son environnement est remplacé sous Lua 5.1).
- `g` (*table|nil*) : Table de grammaire existante à compléter.
- `e` (*table|nil*) : Environnement de repli pour les noms inconnus (défaut : environnement de func, ou _G).
- **renvoie** : table Grammaire utilisable avec parse/parsestring/parsefile.

#### `epnf.dumpast(node)`

Écrit une représentation indentée de l'AST sur stderr (débogage).

- `node` (*table*) : Nœud racine.

#### `epnf.parse(g, name, input, ...)`

Applique une grammaire à une chaîne et renvoie l'AST.

- `g` (*table*) : Grammaire.
- `name` (*string*) : Nom de l'entrée pour les messages d'erreur.
- `input` (*string*) : Texte à analyser.
- `...` (*any*) : Arguments supplémentaires passés à la correspondance.
- **renvoie** : table|nil AST.
- **renvoie** : string name.
- **renvoie** : string input.

#### `epnf.parsefile(g, fname, ...)`

Lit un fichier entier puis applique la grammaire. Lève une erreur si le fichier ne peut pas être ouvert.

- `g` (*table*) : Grammaire.
- `fname` (*string*) : Chemin du fichier.
- `...` (*any*) : Arguments supplémentaires.
- **renvoie** : table|nil AST.
- **renvoie** : string Nom (le chemin).
- **renvoie** : string Contenu.

#### `epnf.parsestring(g, str, ...)`

Comme parse, avec un nom d'entrée généré à partir des 20 premiers caractères du texte.

- `g` (*table*) : Grammaire.
- `str` (*string*) : Texte.
- `...` (*any*) : Arguments supplémentaires.
- **renvoie** : table|nil AST.
- **renvoie** : string Nom généré.
- **renvoie** : string Texte.

#### `epnf.raise(n, msg, s, p)`

Signale une erreur de validation sémantique de l'AST : affiche 'nom:ligne: message', la ligne fautive et un marqueur sous la position (assert p <= #s).

- `n` (*string*) : Nom de l'entrée.
- `msg` (*string*) : Message.
- `s` (*string*) : Texte analysé.
- `p` (*integer*) : Position dans le texte.

## Classe `env_index`

Table d'assistants visibles dans la fonction passée à define (avec START et SUPPRESS en plus).

Objet `env_index` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `env_index.E(msg)` | Motif LPeg qui signale une erreur de parsing avec le message donné. | 91 |
| `env_index.EOF(msg)` | Motif LPeg : fin de l'entrée, sinon erreur avec le message donné. | 94 |
| `env_index.W(s)` | Motif LPeg : mot-clé s, non suivi d'une lettre, chiffre ou _ . | 100 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-luaepnf/epnf.lua`.*
