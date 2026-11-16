# `zone`

*Fichier : `lua/common/libs/LuaJIT/zone.lua` · VM : Commun (GE + véhicule) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `zone`

Module jit.zone de LuaJIT (Mike Pall, licence MIT) : pile hiérarchique de « zones » nommées, utilisée par le profileur LuaJIT pour étiqueter les portions de code. Le module renvoie une table appelable : zone("nom") empile une zone, zone() en dépile une et la renvoie. Un moddeur n'en a normalement pas besoin.

## Exemple

```lua
local zone = require("jit.zone")
zone("AI")
  print(zone:get()) --> "AI"
zone()
```

## Remarques

- zone() sans argument dépile ; sur une pile vide, assert échoue avec "empty zone stack".

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `zone.flush(t)` | Vide la pile de zones (méthode : zone:flush()). (assignée dynamiquement) | dyn |
| `zone.get(t)` | Renvoie la zone courante, c'est-à-dire le sommet de la pile (zone:get()), ou nil si vide. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `zone.flush(t)`

Vide la pile de zones (méthode : zone:flush()). (assignée dynamiquement)

- `t` (*table*) : La table zone (self)

#### `zone.get(t)`

Renvoie la zone courante, c'est-à-dire le sommet de la pile (zone:get()), ou nil si vide. (assignée dynamiquement)

- `t` (*table*) : La table zone (self)
- **renvoie** : string|nil Nom de la zone courante

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/LuaJIT/zone.lua`.*
