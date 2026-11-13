# `luaCore`

*Fichier : `lua/common/luaCore.lua` · VM : Commun (GE + véhicule) · 42 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("luaCore")`

Petit module de base chargé dans les deux VM, qui ajoute des utilitaires de langage utilisés partout : require_optional, unrequire, rerequire, nop, et compléments LuaJIT (table.clear, table.new, variable globale ffi). Il ne retourne pas de table : tout est global.

## Exemple

```lua
local ok = require_optional('some.module')   -- nil si absent
local m = rerequire('mymodule')              -- force le rechargement depuis le disque
table.clear(t)
```

## Remarques

- Définit la globale `ffi` (= require('ffi') ou nil si indisponible).
- Si les extensions LuaJIT table.clear / table.new ne se chargent pas, des remplaçants en Lua pur sont installés (table.new(...) ignore alors ses arguments et renvoie {}).
- `nop` est une fonction vide globale utilisée comme valeur par défaut de hooks (ex. extensions.onSerialize = nop).

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `nop()` | Fonction qui ne fait rien (valeur par défaut pour des callbacks). | 41 |
| `require_optional(module)` | Fait require(module) dans un pcall : renvoie le module, ou nil si le chargement échoue (module absent ou erreur dans le module). | 8 |
| `rerequire(module)` | Force le rechargement d'un fichier : vide package.loaded[module] puis fait require. Journalise un avertissement si le module est falsy après chargement. | 21 |
| `unrequire(m)` | Décharge un module : supprime package.loaded[m] et la globale du même nom. | 15 |

**Globales affectées :** `ffi`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/luaCore.lua`.*
