# `json`

*Fichier : `lua/common/json.lua` · VM : Commun (GE + véhicule) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `json`

Fin enrobage de string.buffer de LuaJIT pour lire et écrire du JSON/SJSON (https://github.com/Autodesk/sjson). `json.decode` lit du texte ou un buffer ; `json.encode` est directement buffer.jsonencode. L'ancien parseur SJSON en Lua pur a été déplacé dans ljson.lua.

## Exemple

```lua
local t = json.decode('{"a": 1, "b": [1,2,3]}')
local s = json.encode(t)
```

## Remarques

- decode(nil) renvoie nil. Le code évite buffer.jsondecode directement car il lèverait une erreur si le buffer n'est pas entièrement consommé ; il utilise un buffer partagé du module (_buf), donc decode n'est pas réentrant (pas un problème hors coroutines).
- M.encode est buffer.jsonencode de LuaJIT : l'extraction automatique le signale comme champ de type inconnu ; c'est bien une fonction.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `json.decode(si)` | Décode du JSON/SJSON. Accepte une chaîne ou un objet string.buffer (qui doit avoir une méthode jsondecode). Renvoie nil si l'argument est nil. | 25 |

### Détail des paramètres

#### `json.decode(si)`

Décode du JSON/SJSON. Accepte une chaîne ou un objet string.buffer (qui doit avoir une méthode jsondecode). Renvoie nil si l'argument est nil.

- `si` (*string|table|nil*) : texte JSON ou string.buffer
- **renvoie** : any valeur Lua décodée (table, nombre, chaîne, booléen…) ; erreur levée si JSON invalide (comportement de string.buffer)

## Champs

| Champ | Type | Description |
|---|---|---|
| `encode` | function | string.buffer.jsonencode : sérialise une valeur Lua (table, nombre, chaîne, booléen) en texte JSON. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/json.lua`.*
