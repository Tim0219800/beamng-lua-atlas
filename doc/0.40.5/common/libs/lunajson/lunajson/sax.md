# `libs_lunajson_lunajson_sax`

*Fichier : `lua/common/libs/lunajson/lunajson/sax.lua` · VM : Commun (GE + véhicule) · 719 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lunajson/lunajson/sax")`

Bibliothèque tierce lunajson : analyseur JSON de type SAX (événementiel). On lui fournit une table de callbacks ; il les appelle au fil de la lecture sans construire l'arbre complet, ce qui permet de traiter de gros fichiers ou des flux découpés en morceaux.

## Exemple

```lua
local sax = require('libs/lunajson/lunajson.sax')
local p = sax.newparser('{"a":[1,2]}', {
  startobject = function() print('{') end,
  key = function(k) print('key', k) end,
  number = function(n) print('num', n) end,
  endobject = function() print('}') end,
})
p.run()
```

## Remarques

- Callbacks reconnus dans `saxtbl` (tous facultatifs) : startobject, key, endobject, startarray, endarray, string, number, boolean, null.
- L'objet renvoyé par newparser contient run() (lance l'analyse), tryc() (lit un caractère non blanc suivant), read(n) (lit n octets bruts, n >= 0) et tellpos() (position absolue dans le flux).
- `src` peut être une chaîne ou une fonction sans argument qui renvoie successivement des morceaux de texte (nil à la fin).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lunajson_lunajson_sax.newfileparser(fn, saxtbl)` | Comme newparser, mais lit le fichier `fn` par blocs de 8192 octets (le fichier est ouvert avec io.open puis refermé en fin de lecture). | 700 |
| `libs_lunajson_lunajson_sax.newparser(src, saxtbl)` | Crée un analyseur SAX sur une chaîne JSON ou sur une fonction source qui fournit le texte par morceaux. | 30 |

### Détail des paramètres

#### `libs_lunajson_lunajson_sax.newfileparser(fn, saxtbl)`

Comme newparser, mais lit le fichier `fn` par blocs de 8192 octets (le fichier est ouvert avec io.open puis refermé en fin de lecture).

- `fn` (*string*) : Chemin du fichier JSON (io.open, chemin disque réel).
- `saxtbl` (*table*) : Table de callbacks (voir newparser).
- **renvoie** : table Objet {run, tryc, read, tellpos}.

#### `libs_lunajson_lunajson_sax.newparser(src, saxtbl)`

Crée un analyseur SAX sur une chaîne JSON ou sur une fonction source qui fournit le texte par morceaux.

- `src` (*string|function*) : Texte JSON, ou fonction renvoyant le morceau suivant (nil quand terminé).
- `saxtbl` (*table*) : Table de callbacks : startobject, key, endobject, startarray, endarray, string, number, boolean, null.
- **renvoie** : table Objet {run, tryc, read, tellpos}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lunajson/lunajson/sax.lua`.*
