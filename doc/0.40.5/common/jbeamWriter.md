# `jbeamWriter`

*Fichier : `lua/common/jbeamWriter.lua` · VM : Commun (GE + véhicule) · 109 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeamWriter")`

Variante de l'encodeur JSON 'joli' qui n'indente (met en forme multi-lignes) que jusqu'à une certaine profondeur, pour écrire des fichiers jbeam lisibles. Elle n'est pas fusionnée avec l'encodeur principal pour des raisons de performance. Un moddeur l'utilise pour sauvegarder une table Lua en fichier .jbeam.

## Exemple

```lua
local ok = require('jbeamWriter').writeFile('mods/unpacked/mon.jbeam', jbeamTable)
```

## Remarques

- writeFile encode avec maxLevel = 2 : au-delà de la profondeur 2, les sous-tables sont écrites en une ligne via la globale jsonEncode. Exception : la clé 'components' du niveau 1 est toujours mise en forme complètement (maxLevel 999).
- Les clés des objets sont triées (tableKeysSorted). Les nombres utilisent %.10g ; les NaN/infinis deviennent 9e999 / -9e999. Les vec3/quat (cdata) sont écrits {"x":..,"y":..,"z":..[,"w":..]}.
- Le fichier est ouvert en écriture ('w') et écrasé. Il dépend de globales du jeu : jsonEncode, tableKeysSorted, ffi, log, dumps. Le paramètre numberPrecision passé à l'encodeur est une variable globale `numberPrecision` (nil sauf définition ailleurs), donc normalement indéfini.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeamWriter.writeFile(filename, obj)` | Écrit la table obj dans filename au format JSON joli limité en profondeur. Renvoie true si réussi ; en cas d'échec d'ouverture, journalise une erreur et renvoie false. | 93 |

### Détail des paramètres

#### `jbeamWriter.writeFile(filename, obj)`

Écrit la table obj dans filename au format JSON joli limité en profondeur. Renvoie true si réussi ; en cas d'échec d'ouverture, journalise une erreur et renvoie false.

- `filename` (*string*) : chemin du fichier à écrire (écrasé)
- `obj` (*table*) : données à écrire
- **renvoie** : boolean succès

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeamWriter.lua`.*
