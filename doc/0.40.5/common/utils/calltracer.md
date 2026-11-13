# `utils_calltracer`

*Fichier : `lua/common/utils/calltracer.lua` · VM : Commun (GE + véhicule) · 97 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/calltracer")`

Outil de profilage/diagnostic : enregistre, grâce à un hook debug.sethook sur les appels de fonctions, qui appelle qui pendant une période, puis exporte le graphe d'appels au format TGF (ouvrable dans yEd). Se charge avec require('utils/calltracer'). Réservé au débogage.

## Exemple

```lua
local calltracer = require('utils/calltracer')
calltracer.reset()
calltracer.start()
-- code à examiner
calltracer.stop()
calltracer.save('callgraph.tgf')
```

## Remarques

- Les fonctions C et les fonctions sans nom (debug.getinfo().name nil) sont ignorées.
- Chaque noeud est identifié par nom + source + ligne de définition ; une arête relie l'appelant de l'appelant (s2) à l'appelant immédiat (s1).
- Le hook remplace tout hook debug existant (debug.sethook / debug.sethook() sans argument pour l'arrêt).
- save() écrit via la globale writeFile ; le tableau des noeuds n'est pas vidé après sauvegarde, utiliser reset().

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_calltracer.reset()` | Efface tous les noeuds et arêtes enregistrés. | 86 |
| `utils_calltracer.save(filename)` | Écrit le graphe d'appels enregistré au format TGF (liste de noeuds numérotés, ligne '#', puis les arêtes) dans un fichier. | 61 |
| `utils_calltracer.start()` | Installe le hook d'appels (debug.sethook(trace, 'c')) : les appels sont enregistrés dès cet instant. | 52 |
| `utils_calltracer.stop()` | Retire le hook (debug.sethook()). Les noeuds déjà enregistrés sont conservés. | 56 |

### Détail des paramètres

#### `utils_calltracer.save(filename)`

Écrit le graphe d'appels enregistré au format TGF (liste de noeuds numérotés, ligne '#', puis les arêtes) dans un fichier.

- `filename` (*string*) : Fichier de sortie, ex. 'callgraph.tgf'

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/calltracer.lua`.*
