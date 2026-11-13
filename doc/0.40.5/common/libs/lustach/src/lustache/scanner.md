# `libs_lustach_src_lustache_scanner`

*Fichier : `lua/common/libs/lustach/src/lustache/scanner.lua` · VM : Commun (GE + véhicule) · 58 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lustach/src/lustache/scanner")`

Bibliothèque tierce lustache : scanneur de chaîne utilisé par l'analyseur de gabarits. Il garde la « queue » restante de la chaîne (`tail`) et la position courante (`pos`) et avance en consommant du texte par motifs Lua.

## Remarques

- Instance créée par `Scanner:new(str)` : champs str, tail (reste à lire) et pos (position, commence à 1).
- Les commentaires du source parlent de « null » ; en Lua, `scan` renvoie nil quand le motif ne correspond pas en début de queue.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lustach_src_lustache_scanner.eos(self)` | Vrai si la queue est vide (fin de chaîne). | 7 |
| `libs_lustach_src_lustache_scanner.new(self, str)` | Crée un scanneur sur `str` (tail = str, pos = 1). | 48 |
| `libs_lustach_src_lustache_scanner.scan(self, pattern)` | Essaie de faire correspondre `pattern` exactement au début de la queue ; si oui, consomme et renvoie le texte trouvé, sinon renvoie nil. | 13 |
| `libs_lustach_src_lustache_scanner.scan_until(self, pattern)` | Avance jusqu'à la prochaine correspondance de `pattern` et renvoie le texte sauté. Renvoie toute la queue si aucune correspondance ; renvoie nil si le motif correspond dès la position courante. | 28 |

### Détail des paramètres

#### `libs_lustach_src_lustache_scanner.eos(self)`

Vrai si la queue est vide (fin de chaîne).

- `self` (*any*) : 
- **renvoie** : boolean true à la fin.

#### `libs_lustach_src_lustache_scanner.new(self, str)`

Crée un scanneur sur `str` (tail = str, pos = 1).

- `self` (*table*) : Classe scanner (appel avec les deux-points).
- `str` (*string*) : Texte à parcourir.
- **renvoie** : table Instance de scanneur.

#### `libs_lustach_src_lustache_scanner.scan(self, pattern)`

Essaie de faire correspondre `pattern` exactement au début de la queue ; si oui, consomme et renvoie le texte trouvé, sinon renvoie nil.

- `self` (*any*) : 
- `pattern` (*string*) : Motif Lua.
- **renvoie** : string|nil Texte consommé ou nil.

#### `libs_lustach_src_lustache_scanner.scan_until(self, pattern)`

Avance jusqu'à la prochaine correspondance de `pattern` et renvoie le texte sauté. Renvoie toute la queue si aucune correspondance ; renvoie nil si le motif correspond dès la position courante.

- `self` (*any*) : 
- `pattern` (*string*) : Motif Lua.
- **renvoie** : string|nil Texte sauté, ou nil.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lustach/src/lustache/scanner.lua`.*
