# `profiling_zone`

*Fichier : `lua/vehicle/extensions/profiling/zone.lua` · VM : Véhicule · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/profiling/zone")` (fichier sous extensions/ mais pas une extension classique)

Bibliothèque tierce : jit.zone de LuaJIT (Mike Pall), copyright 2005-2016, licence MIT. Implémente un modèle simple de zones hiérarchiques (une pile de noms) utilisé par le profileur LuaJIT (mode z de profiling_p) pour regrouper les échantillons par zone nommée. Le module retourne une table appelable : zone('nom') empile une zone, zone() la dépile.

## Exemple

```lua
local zone = require('extensions/profiling/zone')
zone('AI')
  zone('A*')
  print(zone:get()) --> 'A*'
  zone()
print(zone:get()) --> 'AI'
zone()
```

## Remarques

- Dépiler une pile vide déclenche l'erreur « empty zone stack » (assert).
- Le module n'est pas une extension du jeu : il se charge par require sur ce chemin (l'exemple d'origine citait require('jit.zone')).
- Aucune fonction M : l'API est la table retournée (méthodes flush et get, plus le métamethode __call).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/profiling/zone.lua`.*
