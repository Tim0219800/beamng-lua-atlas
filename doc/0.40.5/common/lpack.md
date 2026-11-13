# `lpack`

*Fichier : `lua/common/lpack.lua` · VM : Commun (GE + véhicule) · 568 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `lpack`

Sérialiseur/désérialiseur rapide de valeurs Lua (tables, nombres, chaînes, booléens, vec3, quat) vers des chaînes compactes, utilisé pour échanger des données entre VM (GE <-> véhicule) et pour la sauvegarde. Trois formats : texte propriétaire ('a...~'), binaire basé sur string.buffer ('b...'), et source Lua (encodeLua). decode reconnaît automatiquement le texte ou le binaire. Un tableau de doubles peut aussi être empaqueté en 8 octets par valeur.

## Exemple

```lua
local s = lpack.encode({a = 1, b = {1, 2, 3}, pos = vec3(1, 2, 3)})
local t = lpack.decode(s)
-- binaire :
local sb = lpack.encodeBin(t)
local t2 = lpack.decode(sb)
```

## Remarques

- SÉCURITÉ : decodeLua(s) exécute loadstring('return ' .. s)() : n'appeler qu'avec des données de confiance (produites par encodeLua), jamais avec du texte externe.
- decode(is, target) : `is` peut être une chaîne ou un string.buffer. Si la donnée est au format binaire ('b'), `target` permet de décoder 'sur place' dans une table/vec3/quat existants pour éviter les allocations (la table cible est vidée puis remplie). Pour le format texte, target est ignoré.
- encode(nil) et encodeBin(nil) renvoient '' ; decode('') et decode(nil) renvoient nil. Le ramasse-miettes est arrêté pendant decode puis relancé.
- encodeBinWorkBuffer renvoie le string.buffer INTERNE partagé du module (bufTmp), pas une chaîne : son contenu est écrasé à l'appel suivant d'encodeBin/encodeLua/encodeBinWorkBuffer. À consommer immédiatement.
- encodeDoubleArray(tbl) : emballe les éléments tbl[1..n] (et tbl[0] s'il existe) en doubles little-endian ; decodeDoubleArray(sda, tbl) fait l'inverse en remplissant tbl[1..n] (l'élément d'indice 0 d'entrée n'est pas restitué à l'indice 0 mais à 1 : décalage).
- Le format texte encode les nombres sous forme 'signe + valeur absolue' (préfixe '-' positif, '=' négatif) et les infinis/NaN sont mal formés dans le code ('-9e+999' pour v >= 0 et '=9e+999' pour v < 0) : les NaN sont donc décodés comme +infini.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `lpack.decode(is, target)` | Désérialise une valeur produite par encode ou encodeBin (détecte le format au premier caractère : 'b' = binaire). Accepte une chaîne ou un string.buffer. | 268 |
| `lpack.decodeDoubleArray(sda, tbl)` | Convertit une chaîne de doubles (8 octets chacun, little-endian) en tableau Lua. Remplit tbl s'il est donné. | 76 |
| `lpack.decodeLua(s)` | Évalue une chaîne produite par encodeLua (loadstring('return '..s)()). Dangereux avec des données non fiables. Renvoie nil si s est nil. | 91 |
| `lpack.encode(v)` | Sérialise v au format texte compact (début 'a', fin '~'). Renvoie '' si v est nil. | 96 |
| `lpack.encodeBin(v)` | Sérialise v au format binaire (string.buffer encode, préfixe 'b') avec types spéciaux pour vec3 et quat. Renvoie '' si nil. | 105 |
| `lpack.encodeBinWorkBuffer(v)` | Comme encodeBin mais renvoie le buffer de travail partagé du module au lieu d'une chaîne (zéro copie). Le contenu est écrasé à l'appel suivant. | 112 |
| `lpack.encodeDoubleArray(tbl)` | Convertit un tableau de nombres en chaîne binaire de doubles (8 octets par valeur, via ffi). | 71 |
| `lpack.encodeLua(v)` | Sérialise v en texte source Lua (chaînes avec %q, tables avec crochets pour les clés non séquentielles) à relire avec decodeLua. | 85 |

### Détail des paramètres

#### `lpack.decode(is, target)`

Désérialise une valeur produite par encode ou encodeBin (détecte le format au premier caractère : 'b' = binaire). Accepte une chaîne ou un string.buffer.

- `is` (*string|table|nil*) : chaîne sérialisée ou string.buffer
- `target` (*table|vec3|quat|nil*) : objet à remplir sur place (format binaire seulement)
- **renvoie** : any valeur décodée, nil si entrée vide

#### `lpack.decodeDoubleArray(sda, tbl)`

Convertit une chaîne de doubles (8 octets chacun, little-endian) en tableau Lua. Remplit tbl s'il est donné.

- `sda` (*string*) : chaîne binaire
- `tbl` (*table|nil*) : table de destination, nouvelle table si nil
- **renvoie** : number[] valeurs décodées à partir de l'indice 1

#### `lpack.decodeLua(s)`

Évalue une chaîne produite par encodeLua (loadstring('return '..s)()). Dangereux avec des données non fiables. Renvoie nil si s est nil.

- `s` (*string|nil*) : source Lua d'une valeur
- **renvoie** : any valeur

#### `lpack.encode(v)`

Sérialise v au format texte compact (début 'a', fin '~'). Renvoie '' si v est nil.

- `v` (*any*) : valeur Lua (table, nombre, chaîne, booléen, vec3, quat)
- **renvoie** : string chaîne sérialisée

#### `lpack.encodeBin(v)`

Sérialise v au format binaire (string.buffer encode, préfixe 'b') avec types spéciaux pour vec3 et quat. Renvoie '' si nil.

- `v` (*any*) : valeur Lua
- **renvoie** : string chaîne binaire

#### `lpack.encodeBinWorkBuffer(v)`

Comme encodeBin mais renvoie le buffer de travail partagé du module au lieu d'une chaîne (zéro copie). Le contenu est écrasé à l'appel suivant.

- `v` (*any*) : valeur Lua
- **renvoie** : string.buffer|string buffer de travail (ou '' si v est nil)

#### `lpack.encodeDoubleArray(tbl)`

Convertit un tableau de nombres en chaîne binaire de doubles (8 octets par valeur, via ffi).

- `tbl` (*number[]*) : tableau de nombres (indice 0 inclus s'il existe)
- **renvoie** : string chaîne binaire

#### `lpack.encodeLua(v)`

Sérialise v en texte source Lua (chaînes avec %q, tables avec crochets pour les clés non séquentielles) à relire avec decodeLua.

- `v` (*any*) : valeur Lua
- **renvoie** : string source Lua

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/lpack.lua`.*
