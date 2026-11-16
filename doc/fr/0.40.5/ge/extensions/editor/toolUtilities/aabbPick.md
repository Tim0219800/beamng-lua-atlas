# `editor_toolUtilities_aabbPick`

*Fichier : `lua/ge/extensions/editor/toolUtilities/aabbPick.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_aabbPick` : `extensions.load("editor_toolUtilities_aabbPick")`, puis la globale `editor_toolUtilities_aabbPick`

Utilitaire de sélection par rayon contre des boîtes alignées sur les axes (AABB), sans allocation. Sert aux outils de l'éditeur qui doivent choisir un objet du monde par sa boîte englobante (ex. instances de bâtiments posées). Parcours linéaire des candidats.

## Exemple

```lua
local id, t = editor_toolUtilities_aabbPick.pickNearest(ox,oy,oz, dx,dy,dz, function(visit)
  for id, b in pairs(boxes) do visit(id, b.minx,b.miny,b.minz, b.maxx,b.maxy,b.maxz) end
end)
```

## Remarques

- La direction du rayon n'a pas besoin d'être normalisée ; la distance t est alors exprimée en multiples de cette direction.
- Un rayon démarrant à l'intérieur de la boîte renvoie 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_aabbPick.pickNearest(ox, oy, oz, dx, dy, dz, provider)` | Renvoie l'id de la boîte la plus proche (par distance d'entrée) que le rayon traverse. Le fournisseur provider(visit) doit appeler visit(id, minx, miny, minz, maxx, maxy, maxz) une fois par boîte candidate. | 49 |
| `editor_toolUtilities_aabbPick.rayAabb(ox, oy, oz, dx, dy, dz, minx, miny, minz, maxx, maxy, maxz)` | Test rayon/AABB par la méthode des slabs. Renvoie la distance d'entrée t le long du rayon (>= 0) si touché, sinon nil. | 16 |

### Détail des paramètres

#### `editor_toolUtilities_aabbPick.pickNearest(ox, oy, oz, dx, dy, dz, provider)`

Renvoie l'id de la boîte la plus proche (par distance d'entrée) que le rayon traverse. Le fournisseur provider(visit) doit appeler visit(id, minx, miny, minz, maxx, maxy, maxz) une fois par boîte candidate.

- `ox` (*number*) : Origine du rayon, x
- `oy` (*number*) : Origine du rayon, y
- `oz` (*number*) : Origine du rayon, z
- `dx` (*number*) : Direction, x
- `dy` (*number*) : Direction, y
- `dz` (*number*) : Direction, z
- `provider` (*function*) : function(visit) qui énumère les boîtes via visit(id, minx, miny, minz, maxx, maxy, maxz).
- **renvoie** : any|nil Id gagnant, ou nil si aucune boîte touchée.
- **renvoie** : number Distance d'entrée du gagnant (absente si nil).

#### `editor_toolUtilities_aabbPick.rayAabb(ox, oy, oz, dx, dy, dz, minx, miny, minz, maxx, maxy, maxz)`

Test rayon/AABB par la méthode des slabs. Renvoie la distance d'entrée t le long du rayon (>= 0) si touché, sinon nil.

- `ox` (*number*) : Origine du rayon, x
- `oy` (*number*) : Origine du rayon, y
- `oz` (*number*) : Origine du rayon, z
- `dx` (*number*) : Direction, x
- `dy` (*number*) : Direction, y
- `dz` (*number*) : Direction, z
- `minx` (*number*) : Coin min de la boîte, x
- `miny` (*number*) : Coin min de la boîte, y
- `minz` (*number*) : Coin min de la boîte, z
- `maxx` (*number*) : Coin max de la boîte, x
- `maxy` (*number*) : Coin max de la boîte, y
- `maxz` (*number*) : Coin max de la boîte, z
- **renvoie** : number|nil Distance d'entrée, ou nil si le rayon rate la boîte ou si elle est derrière lui.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/aabbPick.lua`.*
