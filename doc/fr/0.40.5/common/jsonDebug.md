# `jsonDebug`

*Fichier : `lua/common/jsonDebug.lua` · VM : Commun (GE + véhicule) · 388 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jsonDebug")`

Variante de ljson (parseur SJSON en Lua pur) qui, en plus de décoder, renvoie une liste d'avertissements, notamment les clés dupliquées avec numéro de ligne. Sert à valider des fichiers de données (jbeam, config) pendant le développement ; une extension peut passer un nom de contexte pour étiqueter ces avertissements.

## Exemple

```lua
local data, warnings = require('jsonDebug').decode(text, 'monFichier.jbeam')
for _, w in ipairs(warnings) do log('W', 'x', w) end
```

## Remarques

- Même syntaxe acceptée que ljson (SJSON : commentaires, virgules facultatives, clés sans guillemets, ':' ou '=', dictionnaire racine sans accolades, Infinity) ; voir ljson.json.
- Les avertissements sont de la forme "<context>: Duplicate key found: 'clé' near line N, '<ligne>'". La clé dupliquée écrase la valeur précédente.
- decode(nil) renvoie nil et la liste d'avertissements (vide). Une erreur de syntaxe lève error() comme dans ljson.
- Le module remplace table.clear par une fonction qui ne vide pas la table si l'extension LuaJIT est absente (cas qui ne se produit pas en jeu normal).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jsonDebug.decode(si, context)` | Décode du SJSON et renvoie la valeur avec la liste des avertissements (clés dupliquées). | 250 |

### Détail des paramètres

#### `jsonDebug.decode(si, context)`

Décode du SJSON et renvoie la valeur avec la liste des avertissements (clés dupliquées).

- `si` (*string|nil*) : texte SJSON
- `context` (*string|nil*) : étiquette (par ex. nom de fichier) préfixée aux avertissements
- **renvoie** : table|nil valeur décodée
- **renvoie** : string[] avertissements

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jsonDebug.lua`.*
