# `introspection`

*Fichier : `lua/common/introspection.lua` · VM : Commun (GE + véhicule) · 86 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("introspection")`

Outil de debug qui parcourt _G et les modules standard (table, math, string, coroutine, os, io, debug, package) pour lister les fonctions des classes exposées par le moteur (tables ayant un champ ___type de la forme class<...> ou static_class<...>). S'utilise à la console : require('introspection').gather_methods().

## Exemple

```lua
local m = require('introspection').gather_methods()
for _, e in ipairs(m) do print(e.class_name, e.method_name, e.is_static) end
```

## Remarques

- La globale 'extensions' est ignorée explicitement.
- Les clés commençant par '__' sont ignorées.
- signature vaut "nom (what)" où what vient de debug.getinfo(f, 'S') (Lua, C, main).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `introspection.gather_methods()` | Construit et renvoie la liste des méthodes de toutes les classes C++/Lua exposées (et des modules standard), avec nom de classe, nom de méthode, signature et indicateur statique. | 10 |

### Détail des paramètres

#### `introspection.gather_methods()`

Construit et renvoie la liste des méthodes de toutes les classes C++/Lua exposées (et des modules standard), avec nom de classe, nom de méthode, signature et indicateur statique.

- **renvoie** : table[] Tableau d'entrées {class_name=string, method_name=string, signature=string, is_static=boolean}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/introspection.lua`.*
