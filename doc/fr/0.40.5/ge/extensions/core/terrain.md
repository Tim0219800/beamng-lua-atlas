# `core_terrain`

*Fichier : `lua/ge/extensions/core/terrain.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_terrain` : `extensions.load("core_terrain")`, puis la globale `core_terrain`

Accès simplifié au premier TerrainBlock de la scène : hauteur et normale du terrain en un point. Un moddeur s'en sert pour poser des objets au sol ou orienter un élément selon la pente. Le bloc trouvé est mis en cache par son id.

## Exemple

```lua
local z = core_terrain.getTerrainHeight(vec3(x, y, 0))
local n = core_terrain.getTerrainNormal(vec3(x, y, 0))
```

## Remarques

- Toutes les fonctions renvoient nil s'il n'y a aucun TerrainBlock dans la scène.
- Seul le premier TerrainBlock trouvé est utilisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_terrain.getTerrain()` | Renvoie l'objet TerrainBlock (cache par id, sinon premier résultat de scenetree.findClassObjects("TerrainBlock")). | 9 |
| `core_terrain.getTerrainHeight(point)` | Hauteur du terrain au point donné (terrain:getHeight). | 21 |
| `core_terrain.getTerrainNormal(point)` | Normale du terrain au point (terrain:getNormal(point, true, true)). | 28 |
| `core_terrain.getTerrainSmoothNormal(point)` | Normale lissée du terrain au point (terrain:getSmoothNormal(point, true, true)). | 35 |

### Détail des paramètres

#### `core_terrain.getTerrain()`

Renvoie l'objet TerrainBlock (cache par id, sinon premier résultat de scenetree.findClassObjects("TerrainBlock")).

- **renvoie** : userdata|nil Objet TerrainBlock ou nil.

#### `core_terrain.getTerrainHeight(point)`

Hauteur du terrain au point donné (terrain:getHeight).

- `point` (*vec3*) : Position monde ; seuls x et y comptent (déduit du code).
- **renvoie** : number|nil Altitude, nil sans terrain.

#### `core_terrain.getTerrainNormal(point)`

Normale du terrain au point (terrain:getNormal(point, true, true)).

- `point` (*vec3*) : Position monde.
- **renvoie** : vec3|nil Normale, nil sans terrain.

#### `core_terrain.getTerrainSmoothNormal(point)`

Normale lissée du terrain au point (terrain:getSmoothNormal(point, true, true)).

- `point` (*vec3*) : Position monde.
- **renvoie** : vec3|nil Normale lissée, nil sans terrain.

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/terrain.lua`.*
