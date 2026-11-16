# `editor_cameraV2_validation`

*Fichier : `lua/ge/extensions/editor/cameraV2/validation.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraV2_validation` : `extensions.load("editor_cameraV2_validation")`, puis la globale `editor_cameraV2_validation`

Contrôles partagés de Camera V2 pour rejeter les NaN, infinis et coordonnées extrêmes issus de raycasts ou de calculs de caméra défaillants, avant d'appliquer une position ou rotation. Utile à un moddeur qui veut valider des points, quaternions ou hauteurs de terrain avant de les passer à la caméra.

## Remarques

- Limite 'raisonnable' des coordonnées : 10 000 000 (worldCoordinateLimit). Limite de hauteur de terrain : 1 000 000.
- Un quaternion est jugé valide si le carré de sa norme est compris entre 0,25 et 2,25 (il n'est pas exigé unitaire).
- isValidXY/isValidPoint/isReasonableXY/isReasonablePoint renvoient nil (et non false) quand point vaut nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraV2_validation.isFinite(value)` | Vrai si value est un nombre ni NaN ni infini. | 14 |
| `editor_cameraV2_validation.isPointOnRaySegment(point, origin, direction, maximumDistance)` | Vrai si point se trouve près du segment de rayon origin -> origin + direction*maximumDistance : projection sur le rayon normalisé comprise entre -0,01 et maximumDistance+0,01, et distance perpendiculaire <= 1. | 76 |
| `editor_cameraV2_validation.isReasonableCoordinate(value)` | Vrai si la valeur est finie et sa valeur absolue ne dépasse pas 10 000 000. | 35 |
| `editor_cameraV2_validation.isReasonablePoint(point)` | Vrai si x, y et z sont des coordonnées raisonnables. | 45 |
| `editor_cameraV2_validation.isReasonableXY(point)` | Vrai si x et y sont des coordonnées raisonnables. | 39 |
| `editor_cameraV2_validation.isValidCoordinate(value)` | Alias de isFinite pour une coordonnée. | 21 |
| `editor_cameraV2_validation.isValidPoint(point)` | Vrai si x, y et z sont des nombres finis. | 31 |
| `editor_cameraV2_validation.isValidQuaternion(rotation)` | Vrai si x, y, z, w sont finis et si x²+y²+z²+w² est dans [0,25 ; 2,25]. | 49 |
| `editor_cameraV2_validation.isValidTerrainHeight(value)` | Vrai si la hauteur est finie et \|hauteur\| <= 1 000 000. | 66 |
| `editor_cameraV2_validation.isValidXY(point)` | Vrai si point.x et point.y sont des nombres finis. | 25 |
| `editor_cameraV2_validation.terrainHeightAt(point)` | Interroge core_terrain.getTerrainHeight(vec3(x, y, 0)) pour un point raisonnable et renvoie la hauteur si elle est valide. | 70 |
| `editor_cameraV2_validation.worldCoordinateLimit()` | Renvoie la limite de coordonnée utilisée par les tests 'raisonnable'. | 98 |

### Détail des paramètres

#### `editor_cameraV2_validation.isFinite(value)`

Vrai si value est un nombre ni NaN ni infini.

- `value` (*any*) : Valeur à tester
- **renvoie** : boolean true si nombre fini

#### `editor_cameraV2_validation.isPointOnRaySegment(point, origin, direction, maximumDistance)`

Vrai si point se trouve près du segment de rayon origin -> origin + direction*maximumDistance : projection sur le rayon normalisé comprise entre -0,01 et maximumDistance+0,01, et distance perpendiculaire <= 1.

- `point` (*vec3*) : Point à tester
- `origin` (*vec3*) : Origine du rayon
- `direction` (*vec3*) : Direction (normalisée en interne ; longueur <= 0,0001 refusée)
- `maximumDistance` (*number*) : Longueur maximale du segment (>= 0)
- **renvoie** : boolean true si sur le segment

#### `editor_cameraV2_validation.isReasonableCoordinate(value)`

Vrai si la valeur est finie et sa valeur absolue ne dépasse pas 10 000 000.

- `value` (*any*) : Coordonnée
- **renvoie** : boolean true si raisonnable

#### `editor_cameraV2_validation.isReasonablePoint(point)`

Vrai si x, y et z sont des coordonnées raisonnables.

- `point` (*table|nil*) : Point avec x, y, z
- **renvoie** : boolean|nil true/false, ou nil si point est nil

#### `editor_cameraV2_validation.isReasonableXY(point)`

Vrai si x et y sont des coordonnées raisonnables.

- `point` (*table|nil*) : Point avec x, y
- **renvoie** : boolean|nil true/false, ou nil si point est nil

#### `editor_cameraV2_validation.isValidCoordinate(value)`

Alias de isFinite pour une coordonnée.

- `value` (*any*) : Coordonnée
- **renvoie** : boolean true si finie

#### `editor_cameraV2_validation.isValidPoint(point)`

Vrai si x, y et z sont des nombres finis.

- `point` (*table|nil*) : Point avec x, y, z
- **renvoie** : boolean|nil true/false, ou nil si point est nil

#### `editor_cameraV2_validation.isValidQuaternion(rotation)`

Vrai si x, y, z, w sont finis et si x²+y²+z²+w² est dans [0,25 ; 2,25].

- `rotation` (*table|nil*) : Quaternion avec x, y, z, w
- **renvoie** : boolean true si valide

#### `editor_cameraV2_validation.isValidTerrainHeight(value)`

Vrai si la hauteur est finie et |hauteur| <= 1 000 000.

- `value` (*any*) : Hauteur
- **renvoie** : boolean true si valide

#### `editor_cameraV2_validation.isValidXY(point)`

Vrai si point.x et point.y sont des nombres finis.

- `point` (*table|nil*) : Table avec champs x et y (vec3 possible)
- **renvoie** : boolean|nil true/false, ou nil si point est nil

#### `editor_cameraV2_validation.terrainHeightAt(point)`

Interroge core_terrain.getTerrainHeight(vec3(x, y, 0)) pour un point raisonnable et renvoie la hauteur si elle est valide.

- `point` (*table*) : Point avec x, y
- **renvoie** : number|nil Hauteur du terrain, ou nil si le point ou la hauteur est invalide

#### `editor_cameraV2_validation.worldCoordinateLimit()`

Renvoie la limite de coordonnée utilisée par les tests 'raisonnable'.

- **renvoie** : number 10000000

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraV2/validation.lua`.*
