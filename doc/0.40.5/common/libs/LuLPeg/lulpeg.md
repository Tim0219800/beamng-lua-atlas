# `libs_LuLPeg_lulpeg`

*Fichier : `lua/common/libs/LuLPeg/lulpeg.lua` · VM : Commun (GE + véhicule) · 2965 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/LuLPeg/lulpeg")`

LuLPeg : bibliothèque tierce (Pierre-Yves Gérardy, licence « Romantic WTF »), portage en Lua pur de LPeg (Parsing Expression Grammars de Roberto Ierusalimschy). Le fichier est un bundle de plusieurs sous-modules internes (util, compiler, datastructures, re, charsets, evaluator, printers, analyzer, locale, match, factorizer, API, constructors, init, compat, optimizer) et se termine par `return require"init"` : require("libs/LuLPeg/lulpeg") renvoie directement l'objet LL (équivalent du module lpeg) avec le sous-module `re`. Sert à écrire des analyseurs de texte (grammaires, motifs, captures).

## Exemple

```lua
local lpeg = require("libs/LuLPeg/lulpeg")
local P, C, R = lpeg.P, lpeg.C, lpeg.R
local nombre = C(R"09"^1)
print(nombre:match("123abc")) --> "123"
```

## Remarques

- Le fichier ne déclare aucune fonction globale à documenter : l'API publique est celle de l'objet renvoyé (LL), construite par les sous-modules.
- API principale de LL (lue dans le code) : P, S, R, V, B, L (constructeurs de motifs) ; C, Cs, Ct, Cc, Cg, Cb, Cf, Cmt, Cp, Carg (captures) ; match, dmatch (exécution), ispattern, type, locale, pprint, cprint, evaluate, compile, resetptcache ; version() renvoie "0.12", luversion() "0.1.0" ; setmaxstack est un stub sans effet ; new(options) crée une instance indépendante ; global(env) et register(env) installent lpeg/re dans un environnement ; sous-module LL.re (grammaires textuelles).
- Les opérateurs Lua sont surchargés sur les motifs : p1 * p2 (séquence), p1 + p2 (choix), p1 - p2 (différence), p^n (répétition), -p (négation), #p (prédicat « et »), p / x (capture de remplacement).
- La table renvoyée a un champ `__index` sur elle-même, donc les motifs ont aussi les méthodes (ex. pattern:match(s)).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/LuLPeg/lulpeg.lua`.*
