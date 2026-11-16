# `jbeam_expressionParser`

*Fichier : `lua/common/jbeam/expressionParser.lua` · VM : Commun (GE + véhicule) · 190 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/expressionParser")`

Évalue les expressions JBeam de la forme "$=..." (valeurs calculées dans les fichiers jbeam). L'expression est transformée en code Lua (le préfixe '$=' est retiré, chaque '$' devient 'var_'), compilée dans un environnement restreint (fonctions math, round, square, clamp, smoothstep, case, vec3, quat, include...) puis exécutée. Les variables jbeam ($nom) sont lues dans la table vars fournie. Utilisé par le chargeur jbeam, pas par les mods directement.

## Exemple

```lua
local ep = require('jbeam/expressionParser')
local v = ep.parseSafe('$=$width * 2 + sin(0.5)', {['$width'] = 1.5})
local f, vars = ep.compileSafe('$=$a + 1')
vars['$a'] = 4
print(f())  -- 5
```

## Remarques

- Les affectations (un '=' isolé) sont refusées ; les opérateurs >=, <=, == et ~= restent permis.
- Environnement de l'expression : toutes les fonctions de math, round, square, clamp, smoothstep, smootherstep, smoothmin, sign, case, vec3, quat, concat (table.concat), include, print(val, label) (affiche et renvoie val), var(nom) (renvoie '$nom'), et la lecture de variables par var_nom. La table est en lecture seule (toute écriture lève une erreur).
- Variables jbeam : une valeur de vars qui est une table est lue via son champ val.
- case(selector, ...) : avec un booléen, renvoie le 1er argument suivant le sélecteur si true, le 2e si false ; avec un nombre n, renvoie le n-ième argument (indice 1-based sur les arguments après le sélecteur, tronqué), et le dernier si n est hors plage ou 0. Le commentaire du code parle de n+1 mais le code indexe directement arg[floor(n)].
- include(uri, feuille, cellule) lit un fichier .csv (csvlib.readFileCSV) ou .xlsx (libs/xlsxlib) ; autre extension : erreur journalisée et renvoie nil, message.
- parse n'a aucune protection : une expression qui ne compile pas fait appeler nil (erreur Lua) et une erreur d'exécution n'est pas interceptée. Préférer parseSafe ou compileSafe.
- Dans compileSafe, le contexte est recréé à chaque appel ; la table de variables renvoyée est celle qu'il faut remplir avant d'appeler la fonction compilée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_expressionParser.compileSafe(expr)` | Compile une expression pour la réutiliser sans recompiler : renvoie la fonction et la table de variables qu'elle lira. | 154 |
| `jbeam_expressionParser.parse(expr, vars)` | Évalue l'expression sans protection (voir notes). Les assignations sont refusées et renvoient nil. | 131 |
| `jbeam_expressionParser.parseSafe(expr, vars)` | Évalue l'expression dans un pcall : en cas d'assignation interdite, de syntaxe invalide ou d'erreur d'exécution, journalise une erreur et renvoie nil. | 98 |

### Détail des paramètres

#### `jbeam_expressionParser.compileSafe(expr)`

Compile une expression pour la réutiliser sans recompiler : renvoie la fonction et la table de variables qu'elle lira.

- `expr` (*string*) : Expression commençant par '$='.
- **renvoie** : function|nil Fonction sans argument qui évalue l'expression ; nil en cas d'erreur.
- **renvoie** : table|nil Table de variables (clés '$nom') à remplir avant l'appel.

#### `jbeam_expressionParser.parse(expr, vars)`

Évalue l'expression sans protection (voir notes). Les assignations sont refusées et renvoient nil.

- `expr` (*string*) : Expression commençant par '$='.
- `vars` (*table<string, any>*) : Variables jbeam.
- **renvoie** : any|nil Résultat.

#### `jbeam_expressionParser.parseSafe(expr, vars)`

Évalue l'expression dans un pcall : en cas d'assignation interdite, de syntaxe invalide ou d'erreur d'exécution, journalise une erreur et renvoie nil.

- `expr` (*string*) : Expression commençant par '$='.
- `vars` (*table<string, any>*) : Variables jbeam (clés '$nom').
- **renvoie** : any|nil Résultat de l'expression, nil en cas d'erreur.

## Classe `c`

Objet `c` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `c.case(selector, ...)` | function used as a case selector, input can be both int and bool as the first argument, any number of arguments after that<br>in case it's a bool, it works like a ternary if, returning the second param if true, the third if false<br>if the selector is an int n, it simply returns the nth+1 param it was given, if n > #params it returns the last given param | 13 |
| `c.include(resourceURI, sheetName, cellRef)` |  | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/expressionParser.lua`.*
