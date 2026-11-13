# `libs_StackTracePlus_StackTracePlus`

*Fichier : `lua/common/libs/StackTracePlus/StackTracePlus.lua` · VM : Commun (GE + véhicule) · 564 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/StackTracePlus/StackTracePlus")`

StackTracePlus : bibliothèque tierce (Ignacio Burgueño, licence MIT) qui produit des traces de pile Lua détaillées : noms de fonctions deviné quand ils manquent, fonctions et tables connues de la bibliothèque standard, et vidage des variables locales de chaque niveau. Utilisable comme gestionnaire d'erreur pour xpcall ou pcall. Le module renvoie la table _M.

## Exemple

```lua
local stp = require("libs/StackTracePlus/StackTracePlus")
local ok, trace = xpcall(maFonction, function(e) return (stp.stacktrace(e)) end)
```

## Remarques

- stacktrace et stacktraceSimple acceptent un premier argument thread facultatif : s'il n'est pas de type thread, les paramètres sont décalés (message, level, level_limit, dump_locals).
- dump_locals vaut true par défaut. level vaut 1 par défaut et level_limit arrête la remontée.
- stacktrace renvoie deux valeurs : la trace (string) et l'erreur d'origine (string ou rendu d'un objet d'erreur table).
- add_known_table et add_known_function lèvent une erreur si l'élément est déjà connu du module (« Cannot override… »).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_StackTracePlus_StackTracePlus.add_known_function(fun, description)` | Ajoute une fonction à la liste des fonctions connues, avec une description utilisée dans les traces. | 556 |
| `libs_StackTracePlus_StackTracePlus.add_known_table(tab, description)` | Ajoute une table à la liste des tables connues, avec une description utilisée à l'affichage des variables locales. | 547 |
| `libs_StackTracePlus_StackTracePlus.stacktrace(thread, message, level, level_limit, dump_locals)` | Collecte une trace de pile détaillée (bornée par « Stack Traceback >> START/END »), avec les variables locales de chaque niveau Lua. Adaptée comme gestionnaire d'erreur de xpcall. | 439 |
| `libs_StackTracePlus_StackTracePlus.stacktraceSimple(thread, message, level, level_limit, dump_locals)` | Variante de stacktrace avec les mêmes paramètres, produisant une trace plus simple (déduit du code : même squelette, sans la même mise en forme détaillée). | 326 |

### Détail des paramètres

#### `libs_StackTracePlus_StackTracePlus.add_known_function(fun, description)`

Ajoute une fonction à la liste des fonctions connues, avec une description utilisée dans les traces.

- `fun` (*function*) : Fonction à nommer
- `description` (*string*) : Nom affiché

#### `libs_StackTracePlus_StackTracePlus.add_known_table(tab, description)`

Ajoute une table à la liste des tables connues, avec une description utilisée à l'affichage des variables locales.

- `tab` (*table*) : Table à nommer
- `description` (*string*) : Nom affiché

#### `libs_StackTracePlus_StackTracePlus.stacktrace(thread, message, level, level_limit, dump_locals)`

Collecte une trace de pile détaillée (bornée par « Stack Traceback >> START/END »), avec les variables locales de chaque niveau Lua. Adaptée comme gestionnaire d'erreur de xpcall.

- `thread` (*thread|nil*) : Coroutine à inspecter (défaut : la coroutine courante)
- `message` (*string|table|nil*) : Message ou objet d'erreur placé en tête de la trace
- `level` (*integer|nil*) : Niveau de pile de départ (défaut 1)
- `level_limit` (*integer|nil*) : Niveau maximal à afficher
- `dump_locals` (*boolean|nil*) : Afficher les variables locales (défaut true)
- **renvoie** : string La trace complète
- **renvoie** : string|nil Le message d'erreur d'origine

#### `libs_StackTracePlus_StackTracePlus.stacktraceSimple(thread, message, level, level_limit, dump_locals)`

Variante de stacktrace avec les mêmes paramètres, produisant une trace plus simple (déduit du code : même squelette, sans la même mise en forme détaillée).

- `thread` (*thread|nil*) : Coroutine à inspecter
- `message` (*string|table|nil*) : Message d'erreur
- `level` (*integer|nil*) : Niveau de départ (défaut 1)
- `level_limit` (*integer|nil*) : Niveau maximal
- `dump_locals` (*boolean|nil*) : Afficher les locales (défaut true)
- **renvoie** : string La trace

## Classe `Dumper`

Objet interne qui analyse une pile (créé par Dumper.new(thread)) et accumule les lignes de la trace.

| Méthode | Description | Ligne |
|---|---|---|
| `Dumper:DumpLocals(level)` | Parcourt et ajoute à la trace les variables locales d'un niveau de pile. | 254 |
| `Dumper:add(text)` | Ajoute une ligne de texte au tampon. | 238 |
| `Dumper:add_f(fmt, ...)` | Ajoute du texte formaté (string.format). | 241 |
| `Dumper:concat_lines()` | Concatène les lignes accumulées en une chaîne. | 244 |
| `Dumper.new(thread)` | Crée un Dumper lié à une coroutine ; adapte getinfo/getlocal (décalage d'un niveau si c'est la coroutine courante). | 207 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/StackTracePlus/StackTracePlus.lua`.*
