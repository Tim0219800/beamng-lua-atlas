# `libs_lua_MessagePack_MessagePack`

*Fichier : `lua/common/libs/lua-MessagePack/MessagePack.lua` · VM : Commun (GE + véhicule) · 592 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-MessagePack/MessagePack")`

lua-MessagePack (François Perrad, licence MIT, version de base 0.5.1, adaptée par BeamNG en 2022) : sérialisation binaire MessagePack. Cette version utilise string.buffer de LuaJIT et un tampon de travail partagé ; elle sait aussi sérialiser les vec3 et quat (cdata). Un moddeur s'en sert pour encoder/décoder des tables Lua en chaînes binaires compactes (échange réseau, fichiers).

## Exemple

```lua
local mp = require('libs/lua-MessagePack/MessagePack')
local bin = mp.pack({a = 1, b = {1, 2, 3}})
local data = mp.unpack(bin)
```

## Remarques

- Tous les nombres sont écrits en double (0xCB), jamais en entier compact. À la lecture, les entiers MessagePack sont convertis en nombres Lua.
- Une chaîne Lua est écrite comme binaire (bin8/16/32), pas comme str MessagePack ; à la lecture, str et bin deviennent tous deux des chaînes Lua.
- Mode de tableau par défaut : 'without_hole' (appelé à la fin du fichier) : une table est écrite comme tableau si ses clés sont 1..n sans trou, sinon comme map. Changer avec set_array.
- Les vec3 sont écrits en map {x,y,z} et les quat en map {x,y,z,w} ; tout autre cdata est écrit comme la chaîne '?'.
- packWorkBuffer et packPrefixWorkBuffer renvoient le tampon interne partagé (bufTmp) : son contenu est écrasé à l'appel de pack suivant ; le consommer immédiatement.
- Les types non gérés (function, thread) lèvent l'erreur "pack '<type>' is unimplemented".
- Les types d'extension (ext) : build_ext renvoie nil par défaut, donc les valeurs ext lues deviennent nil sauf si build_ext est remplacée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lua_MessagePack_MessagePack.build_ext(tag, data)` | Crochet appelé pour chaque valeur d'extension lue ; l'implémentation par défaut renvoie nil. À remplacer pour décoder vos types d'extension. | 457 |
| `libs_lua_MessagePack_MessagePack.pack(data)` | Sérialise une valeur Lua en chaîne MessagePack. | 255 |
| `libs_lua_MessagePack_MessagePack.packPrefix(prefix, data)` | Sérialise data précédé de la chaîne prefix. | 265 |
| `libs_lua_MessagePack_MessagePack.packPrefixWorkBuffer(prefix, data)` | Comme packPrefix, mais renvoie le tampon de travail partagé. | 259 |
| `libs_lua_MessagePack_MessagePack.packWorkBuffer(data)` | Comme pack, mais renvoie le tampon de travail partagé sans le convertir en chaîne (évite une copie). | 249 |
| `libs_lua_MessagePack_MessagePack.set_array(array)` | Choisit comment les tables Lua sont sérialisées : 'without_hole' (tableau si indices consécutifs sans trou, sinon map), 'with_hole' (tableau jusqu'à l'indice max si toutes les clés sont des nombres positifs), 'always_as_map' (toujours une map). Toute autre valeur lève une erreur. | 130 |
| `libs_lua_MessagePack_MessagePack.unpack(s)` | Désérialise une chaîne contenant exactement une valeur MessagePack. Lève une erreur 'missing bytes' si elle est tronquée et 'extra bytes' s'il reste des octets. | 558 |
| `libs_lua_MessagePack_MessagePack.unpack_cursor(c)` | Décode la valeur suivante à partir d'un curseur {s, i, j, underflow}, en avançant c.i. | 271 |
| `libs_lua_MessagePack_MessagePack.unpacker(src)` | Renvoie un itérateur qui décode successivement plusieurs valeurs : depuis une chaîne (renvoie la position et la valeur) ou depuis une fonction fournissant des morceaux de données (renvoie true et la valeur). | 568 |

### Détail des paramètres

#### `libs_lua_MessagePack_MessagePack.build_ext(tag, data)`

Crochet appelé pour chaque valeur d'extension lue ; l'implémentation par défaut renvoie nil. À remplacer pour décoder vos types d'extension.

- `tag` (*integer*) : Numéro d'extension.
- `data` (*string*) : Octets de l'extension.
- **renvoie** : any Valeur construite.

#### `libs_lua_MessagePack_MessagePack.pack(data)`

Sérialise une valeur Lua en chaîne MessagePack.

- `data` (*any*) : nil, boolean, number, string, table, vec3, quat, string.buffer.
- **renvoie** : string Données binaires.

#### `libs_lua_MessagePack_MessagePack.packPrefix(prefix, data)`

Sérialise data précédé de la chaîne prefix.

- `prefix` (*string*) : Octets à écrire avant les données.
- `data` (*any*) : Valeur.
- **renvoie** : string prefix suivi des données.

#### `libs_lua_MessagePack_MessagePack.packPrefixWorkBuffer(prefix, data)`

Comme packPrefix, mais renvoie le tampon de travail partagé.

- `prefix` (*string*) : Préfixe.
- `data` (*any*) : Valeur.
- **renvoie** : userdata string.buffer interne.

#### `libs_lua_MessagePack_MessagePack.packWorkBuffer(data)`

Comme pack, mais renvoie le tampon de travail partagé sans le convertir en chaîne (évite une copie).

- `data` (*any*) : Valeur à sérialiser.
- **renvoie** : userdata string.buffer interne, réutilisé à chaque appel.

#### `libs_lua_MessagePack_MessagePack.set_array(array)`

Choisit comment les tables Lua sont sérialisées : 'without_hole' (tableau si indices consécutifs sans trou, sinon map), 'with_hole' (tableau jusqu'à l'indice max si toutes les clés sont des nombres positifs), 'always_as_map' (toujours une map). Toute autre valeur lève une erreur.

- `array` (*string*) : 'without_hole', 'with_hole' ou 'always_as_map'.

#### `libs_lua_MessagePack_MessagePack.unpack(s)`

Désérialise une chaîne contenant exactement une valeur MessagePack. Lève une erreur 'missing bytes' si elle est tronquée et 'extra bytes' s'il reste des octets.

- `s` (*string*) : Données.
- **renvoie** : any Valeur décodée.

#### `libs_lua_MessagePack_MessagePack.unpack_cursor(c)`

Décode la valeur suivante à partir d'un curseur {s, i, j, underflow}, en avançant c.i.

- `c` (*table*) : Curseur sur la chaîne source.
- **renvoie** : any Valeur décodée.

#### `libs_lua_MessagePack_MessagePack.unpacker(src)`

Renvoie un itérateur qui décode successivement plusieurs valeurs : depuis une chaîne (renvoie la position et la valeur) ou depuis une fonction fournissant des morceaux de données (renvoie true et la valeur).

- `src` (*string|function*) : Chaîne, ou fonction renvoyant le morceau suivant (ou nil).
- **renvoie** : function Itérateur.

**Globales affectées :** `k`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-MessagePack/MessagePack.lua`.*
