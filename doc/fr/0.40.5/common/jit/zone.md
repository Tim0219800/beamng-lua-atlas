# `zone`

*Fichier : `lua/common/jit/zone.lua` · VM : Commun (GE + véhicule) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `zone`

Module jit.zone de LuaJIT (Mike Pall, licence MIT, 2005-2026) : pile hiérarchique de « zones » nommées utilisée par le profileur (jit.p avec l'option z) pour regrouper les échantillons par zone logique. Le module est un objet appelable : zone('nom') empile une zone, zone() sans argument en dépile une (erreur « empty zone stack » si vide).

## Exemple

```lua
local zone = require('jit.zone')
zone('IA')
  zone('A*')
  print(zone:get()) --> 'A*'
  zone()
print(zone:get()) --> 'IA'
zone()
```

## Remarques

- L'appel zone() renvoie la zone dépilée.
- Le profileur détecte la zone courante via la pile : toute zone empilée doit être dépilée, sinon les zones suivantes sont faussées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `zone.flush(t)` | Vide complètement la pile de zones. (assignée dynamiquement) | dyn |
| `zone.get(t)` | Renvoie le nom de la zone courante (sommet de pile), nil si la pile est vide. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `zone.flush(t)`

Vide complètement la pile de zones. (assignée dynamiquement)

- `t` (*table*) : Le module lui-même (appel avec ':' : zone:flush()).

#### `zone.get(t)`

Renvoie le nom de la zone courante (sommet de pile), nil si la pile est vide. (assignée dynamiquement)

- `t` (*table*) : Le module lui-même (appel zone:get()).
- **renvoie** : string|nil Nom de la zone courante.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jit/zone.lua`.*
