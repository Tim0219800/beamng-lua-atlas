# `libs_lunajson_lunajson_decoder`

*Fichier : `lua/common/libs/lunajson/lunajson/decoder.lua` · VM : Commun (GE + véhicule) · 515 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lunajson/lunajson/decoder")`

Bibliothèque tierce lunajson : décodeur JSON. Le module renvoie une fabrique `newdecoder()` ; chaque appel crée un contexte de décodage indépendant et renvoie la fonction `decode(json, pos?, nullv?, arraylen?)`. Le décodeur gère les nombres (entiers et flottants), les chaînes avec échappements et paires de substitution Unicode, et limite la profondeur d'imbrication à 1000.

## Exemple

```lua
local newdecoder = require('libs/lunajson/lunajson.decoder')
local decode = newdecoder()
local t = decode('[1, 2, {"a": null}]', nil, false)
```

## Remarques

- Le module ne définit pas de fonction exportée nommée : il renvoie directement la fonction fabrique `newdecoder`.
- decode(json, pos, nullv, arraylen) : `json` est la chaîne ; `pos` (optionnel) est la position de départ, et s'il est fourni la fonction renvoie (valeur, position suivante) sans exiger la fin de la chaîne ; `nullv` remplace les null JSON (nil par défaut) ; `arraylen` à vrai stocke la longueur de chaque tableau dans ary[0].
- Erreurs levées sous la forme « parse error at <pos>: <message> » (valeur invalide, nombre invalide, chaîne non terminée, séquence d'échappement invalide, imbrication > 1000, fin inattendue, contenu après la valeur).
- Le contexte (position, valeur null…) est partagé dans la fermeture : un même décodeur ne doit pas être réentré pendant un décodage.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lunajson/lunajson/decoder.lua`.*
