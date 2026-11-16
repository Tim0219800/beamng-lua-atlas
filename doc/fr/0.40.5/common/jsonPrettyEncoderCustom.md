# `jsonPrettyEncoderCustom`

*Fichier : `lua/common/jsonPrettyEncoderCustom.lua` · VM : Commun (GE + véhicule) · 149 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jsonPrettyEncoderCustom")`

Encodeur JSON 'joli' personnalisable : trie les clés par poids (tableWeights), et laisse un callback décider quelles tables sont repliées sur une seule ligne et lesquelles sont indentées. Sert à écrire des fichiers de configuration lisibles (ex. fichiers de contrôles/bindings).

## Exemple

```lua
local exampleTable = {control = 5, bindings = {{1,2}, {4,5,6,7}}}
local function foldingCallback(item, lvl, path)
  return path:sub(1,10) == '/bindings/' and tableSize(item) < 4
end
local tblWeights = {control = 10, bindings = 99} -- 1 = premier, 99 = dernier, défaut 50
local json = require('jsonPrettyEncoderCustom').encode(exampleTable, nil, nil, tblWeights, foldingCallback)
```

## Remarques

- Sans foldingCallback, fold vaut true : TOUTES les tables sont écrites sur une seule ligne ('{"a":1, ...}' / '[1, 2]'). Pour obtenir l'indentation, le callback doit renvoyer false pour la table concernée.
- Les clés de tableWeights doivent être en MINUSCULES (le code cherche weights[tostring(clé):lower()]). Clé absente = poids 50. À poids égal, tri par type puis par valeur.
- Le chemin passé au callback est de la forme '/clé/sousclé/3' (indices de tableau inclus) ; lvl est la profondeur (1 pour la racine).
- Les tableaux sont détectés par next(v) == 1 et next(v, #v) == nil (tableau séquentiel sans trous). Un tableau vide est écrit '{}'. Les NaN et infinis deviennent 9e999 / -9e999. numberPrecision (si non nil) formate les non-entiers en %<n>.<n>f (le même entier n sert de largeur et de précision) et les entiers en %d. Les vec3/quat (cdata) sont écrits {"x":..,"y":..,"z":..[,"w":..]}. Les autres types (fonction, userdata) donnent null.
- Dépend de require('utils') (tableKeys).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jsonPrettyEncoderCustom.encode(v, lvl, numberPrecision, tableWeights, foldingCallback, _levelPath)` | Encode v en texte JSON avec clés triées par poids et repliement piloté par foldingCallback. Les trois derniers arguments sont facultatifs ; _levelPath est interne (récursion). | 76 |

### Détail des paramètres

#### `jsonPrettyEncoderCustom.encode(v, lvl, numberPrecision, tableWeights, foldingCallback, _levelPath)`

Encode v en texte JSON avec clés triées par poids et repliement piloté par foldingCallback. Les trois derniers arguments sont facultatifs ; _levelPath est interne (récursion).

- `v` (*any*) : valeur à encoder (nil -> 'null')
- `lvl` (*integer|nil*) : niveau d'indentation de départ, défaut 1
- `numberPrecision` (*integer|nil*) : nombre de décimales des non-entiers ; nil = %.10g
- `tableWeights` (*table<string, number>|nil*) : poids de tri des clés (minuscules), défaut 50 ; la valeur nil provoque une erreur dans le tri car weights est indexé (fournir au moins {})
- `foldingCallback` (*fun(item: table, lvl: integer, path: string): boolean|nil*) : renvoie true pour replier la table sur une ligne, false pour l'indenter
- `_levelPath` (*string|nil*) : interne : chemin courant
- **renvoie** : string texte JSON

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jsonPrettyEncoderCustom.lua`.*
