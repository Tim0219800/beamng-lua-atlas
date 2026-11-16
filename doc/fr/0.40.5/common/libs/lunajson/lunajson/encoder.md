# `libs_lunajson_lunajson_encoder`

*Fichier : `lua/common/libs/lunajson/lunajson/encoder.lua` · VM : Commun (GE + véhicule) · 185 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lunajson/lunajson/encoder")`

Bibliothèque tierce lunajson : encodeur JSON. Le module renvoie une fabrique `newencoder()` ; chaque appel crée un contexte indépendant et renvoie la fonction `encode(valeur, nullv?)` qui sérialise booléens, nombres, chaînes et tables (tableau ou objet, détection automatique) en chaîne JSON compacte.

## Exemple

```lua
local newencoder = require('libs/lunajson/lunajson.encoder')
local encode = newencoder()
local s = encode({a = {1, 2, 3}})
```

## Remarques

- Le module renvoie directement la fonction fabrique `newencoder`.
- encode(valeur, nullv) : toute valeur égale à `nullv` est écrite `null`.
- Erreurs levées : « loop detected » (table qui se contient elle-même), « non-string key » (objet avec une clé non chaîne), « invalid number » (NaN ou infini), « invalid type value » (fonction, userdata, nil non remplacé par nullv…).
- Les nombres sont écrits avec `%.17g` (précision aller-retour complète).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lunajson/lunajson/encoder.lua`.*
