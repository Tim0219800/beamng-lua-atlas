# `util_trackBuilder_proceduralPrimitives`

*Fichier : `lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua` · VM : Game Engine (GE) · 681 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_proceduralPrimitives` : `extensions.load("util_trackBuilder_proceduralPrimitives")`, puis la globale `util_trackBuilder_proceduralPrimitives`

Générateurs de formes simples pour les obstacles du Track Builder : tore (ring), cylindre, cône, cube, bosse (bump) et rampe. Chaque fonction renvoie une table de mesh procédural {verts, uvs, normals, faces, material} prête à être passée à ProceduralMesh:createMesh({{mesh}}) (verts et normals sont des {x,y,z}, uvs des {u,v}, faces des {v,n,u} indexés depuis 0). Le matériau par défaut est 'track_editor_A_border'.

## Exemple

```lua
local mesh = util_trackBuilder_proceduralPrimitives.createCylinder(2, 5)
local obj = createObject('ProceduralMesh')
obj:registerObject('monCylindre')
scenetree.MissionGroup:add(obj.obj)
obj:createMesh({{mesh}})
```

## Remarques

- Les paramètres sont d'abord normalisés (valeur absolue, valeurs par défaut) ; certains sont des diamètres : createCylinder et createCone divisent le paramètre radius par 2, et createRing multiplie radius par 2.
- Le nombre de segments dépend de la taille (par exemple cylindre : radius*8 borné entre 12 et 72), donc les gros objets sont plus détaillés.
- createCube échange les axes : size.x et size.y sont inversés (size = vec3(|size.y|, |size.x|, |size.z|)).
- Le fichier contient aussi createIcosphere (locale, non exportée, avec appel à be:reloadCollision) ; elle n'est pas accessible depuis l'extérieur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_proceduralPrimitives.createBump(length, width, height, upperLength, upperWidth, material)` | Bosse (dos d'âne) : base de length × width et plateau supérieur de upperLength × upperWidth, d'une hauteur height. | 289 |
| `util_trackBuilder_proceduralPrimitives.createCone(radius, height, material)` | Cône d'axe Z centré sur l'origine, pointe en haut. | 406 |
| `util_trackBuilder_proceduralPrimitives.createCube(size, material, uvStyle)` | Parallélépipède centré sur l'origine. uvStyle choisit la disposition des UV (1 par défaut). | 472 |
| `util_trackBuilder_proceduralPrimitives.createCylinder(radius, height, material)` | Cylindre d'axe Z centré sur l'origine, avec faces haut et bas. | 66 |
| `util_trackBuilder_proceduralPrimitives.createRamp(width, len, hei, thinning, attack, twist, material)` | Rampe de longueur len, qui monte jusqu'à la hauteur hei. thinning rétrécit la largeur en haut, attack règle la courbure du profil (puissance), twist ajoute une torsion le long de la rampe. | 160 |
| `util_trackBuilder_proceduralPrimitives.createRing(radius, thickness, material)` | Tore (anneau) centré sur l'origine, dans le plan YZ. | 8 |

### Détail des paramètres

#### `util_trackBuilder_proceduralPrimitives.createBump(length, width, height, upperLength, upperWidth, material)`

Bosse (dos d'âne) : base de length × width et plateau supérieur de upperLength × upperWidth, d'une hauteur height.

- `length` (*number|nil*) : Longueur de la base (2 par défaut).
- `width` (*number|nil*) : Largeur de la base (5 par défaut).
- `height` (*number|nil*) : Hauteur (1 par défaut).
- `upperLength` (*number|nil*) : Longueur du plateau (0,5 par défaut).
- `upperWidth` (*number|nil*) : Largeur du plateau (4 par défaut).
- `material` (*string|nil*) : Matériau.
- **renvoie** : table Mesh procédural.

#### `util_trackBuilder_proceduralPrimitives.createCone(radius, height, material)`

Cône d'axe Z centré sur l'origine, pointe en haut.

- `radius` (*number*) : Diamètre de la base (divisé par 2 en interne).
- `height` (*number*) : Hauteur en mètres.
- `material` (*string|nil*) : Matériau.
- **renvoie** : table Mesh procédural.

#### `util_trackBuilder_proceduralPrimitives.createCube(size, material, uvStyle)`

Parallélépipède centré sur l'origine. uvStyle choisit la disposition des UV (1 par défaut).

- `size` (*vec3|nil*) : Dimensions ; vec3(1,1,1) par défaut. x et y sont échangés en interne.
- `material` (*string|nil*) : Matériau.
- `uvStyle` (*any*) : Style d'UV (1 par défaut ; la valeur est comparée à 1).
- **renvoie** : table Mesh procédural.

#### `util_trackBuilder_proceduralPrimitives.createCylinder(radius, height, material)`

Cylindre d'axe Z centré sur l'origine, avec faces haut et bas.

- `radius` (*number*) : Diamètre (divisé par 2 en interne).
- `height` (*number*) : Hauteur en mètres.
- `material` (*string|nil*) : Matériau.
- **renvoie** : table Mesh procédural.

#### `util_trackBuilder_proceduralPrimitives.createRamp(width, len, hei, thinning, attack, twist, material)`

Rampe de longueur len, qui monte jusqu'à la hauteur hei. thinning rétrécit la largeur en haut, attack règle la courbure du profil (puissance), twist ajoute une torsion le long de la rampe.

- `width` (*number|nil*) : Largeur de la base (5 par défaut).
- `len` (*number|nil*) : Longueur (10 par défaut).
- `hei` (*number|nil*) : Hauteur finale (2 par défaut).
- `thinning` (*number|nil*) : Facteur de largeur en haut, borné à [0, 2] (0,5 par défaut).
- `attack` (*number|nil*) : Exposant du profil de hauteur, minimum 1.
- `twist` (*number|nil*) : Torsion totale (0 par défaut ; unité déduite du code : radians).
- `material` (*string|nil*) : Matériau.
- **renvoie** : table Mesh procédural.

#### `util_trackBuilder_proceduralPrimitives.createRing(radius, thickness, material)`

Tore (anneau) centré sur l'origine, dans le plan YZ.

- `radius` (*number*) : Paramètre de rayon ; multiplié par 2 en interne.
- `thickness` (*number*) : Épaisseur du tube ; divisée par 2 en interne.
- `material` (*string|nil*) : Matériau (défaut 'track_editor_A_border').
- **renvoie** : table Mesh procédural.

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua`.*
