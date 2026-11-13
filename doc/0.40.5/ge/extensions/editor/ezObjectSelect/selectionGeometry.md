# `editor_ezObjectSelect_selectionGeometry`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua` · VM : Game Engine (GE) · 473 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionGeometry` : `extensions.load("editor_ezObjectSelect_selectionGeometry")`, puis la globale `editor_ezObjectSelect_selectionGeometry`

Géométrie de la sélection de l'outil Easy Select : validation de boîtes, calcul des 8 coins monde d'un objet (boîte orientée via getObjBox + transform + scale, boîte alignée monde pour les véhicules ou en repli), contexte caméra, signatures de bornes pour détecter qu'un objet a bougé, et création de « proxies » projetés à l'écran (polygone d'enveloppe convexe, aire, centroïde, distances, volume). Ces proxies servent à choisir l'objet sous la souris.

## Remarques

- Types de bornes : "vehicleWorldAabb" (BeamNGVehicle), "oriented", "worldAabb". Raisons d'échec de création de proxy : invalidBounds, degenerateBounds, outsideNearPlane, degenerateProjection.
- createCameraContext calcule rangeOrigin : point d'impact d'un rayon de 5000 m devant la caméra ; sinon hauteur du terrain sous la caméra ; sinon impact d'un rayon vers le bas. Les distances d'un proxy (cameraDistance) sont mesurées depuis ce point.
- Les coordonnées écran des polygones sont relatives au viewport (0..width, 0..height), alors que modalOperatorCommon.projectToScreen ajoute viewportX/Y.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionGeometry.boundsSignaturesEqual(first, second)` | Compare deux signatures élément par élément. | 91 |
| `editor_ezObjectSelect_selectionGeometry.createCameraContext()` | Capture la caméra de l'éditeur (core_camera position, quat, FOV) et le viewport imgui principal. | 99 |
| `editor_ezObjectSelect_selectionGeometry.createProjectedProxy(obj, camera, boundsSignature)` | Construit le proxy d'un objet pour la caméra : polygone écran de l'enveloppe convexe des coins (découpée au plan proche), aire, centroïde, distances caméra/vue, volume, boîte orientée. | 414 |
| `editor_ezObjectSelect_selectionGeometry.createProxy(obj, camera, mousePosition, rayOrigin, rayDirection)` | Raccourci : createProjectedProxy puis updateCursorMetrics puis updateRayEntry. | 464 |
| `editor_ezObjectSelect_selectionGeometry.getBoundsSignature(obj, result)` | Renvoie une liste de nombres décrivant les bornes courantes d'un objet (type, transform, échelle, boîte). Sert à comparer deux états avec boundsSignaturesEqual. La table result est réutilisée si fournie. | 55 |
| `editor_ezObjectSelect_selectionGeometry.getObjectVolume(obj)` | Volume de la boîte (étendues x échelle absolue pour les objets orientés). | 185 |
| `editor_ezObjectSelect_selectionGeometry.getWorldCorners(obj)` | Les 8 coins monde de la boîte d'un objet. | 181 |
| `editor_ezObjectSelect_selectionGeometry.updateCursorMetrics(proxy, mousePosition)` | Ajoute au proxy cursorDistance (distance en pixels du curseur au polygone, 0 si dedans) et centerBias (distance au centroïde divisée par racine de l'aire). | 449 |
| `editor_ezObjectSelect_selectionGeometry.updateRayEntry(proxy, rayOrigin, rayDirection)` | Ajoute proxy.rayEntry : distance d'entrée du rayon dans la boîte orientée (math.huge s'il la manque ou sans rayon). | 458 |
| `editor_ezObjectSelect_selectionGeometry.validBox(box)` | Teste qu'une boîte a minExtents/maxExtents finis (\|v\| < 1e10, pas de NaN) et min <= max sur chaque axe. | 23 |

### Détail des paramètres

#### `editor_ezObjectSelect_selectionGeometry.boundsSignaturesEqual(first, second)`

Compare deux signatures élément par élément.

- `first` (*table|nil*) : 
- `second` (*table|nil*) : 
- **renvoie** : boolean false si l'une est nil ou de longueur différente

#### `editor_ezObjectSelect_selectionGeometry.createCameraContext()`

Capture la caméra de l'éditeur (core_camera position, quat, FOV) et le viewport imgui principal.

- **renvoie** : table|nil {pos, rangeOrigin, right, forward, up, halfTan, aspect, width, height, viewportX, viewportY, nearDistance} ou nil si une donnée manque ou si le viewport est vide

#### `editor_ezObjectSelect_selectionGeometry.createProjectedProxy(obj, camera, boundsSignature)`

Construit le proxy d'un objet pour la caméra : polygone écran de l'enveloppe convexe des coins (découpée au plan proche), aire, centroïde, distances caméra/vue, volume, boîte orientée.

- `obj` (*userdata*) : Objet de la scène
- `camera` (*table*) : Contexte de createCameraContext
- `boundsSignature` (*table|nil*) : Signature déjà calculée (sinon calculée)
- **renvoie** : table|nil {source, sourceId, boundsType, worldCorners, polygon, area, centroid, cameraDistance, viewDistance, volume, cameraInside, orientedBox, boundsSignature}
- **renvoie** : string|nil raison de l'échec si nil

#### `editor_ezObjectSelect_selectionGeometry.createProxy(obj, camera, mousePosition, rayOrigin, rayDirection)`

Raccourci : createProjectedProxy puis updateCursorMetrics puis updateRayEntry.

- `obj` (*userdata*) : 
- `camera` (*table*) : 
- `mousePosition` (*table*) : {x, y}
- `rayOrigin` (*vec3|nil*) : 
- `rayDirection` (*vec3|nil*) : 
- **renvoie** : table|nil proxy
- **renvoie** : string|nil raison de l'échec

#### `editor_ezObjectSelect_selectionGeometry.getBoundsSignature(obj, result)`

Renvoie une liste de nombres décrivant les bornes courantes d'un objet (type, transform, échelle, boîte). Sert à comparer deux états avec boundsSignaturesEqual. La table result est réutilisée si fournie.

- `obj` (*userdata*) : Objet de la scène
- `result` (*table|nil*) : Table à remplir (réutilisée)
- **renvoie** : table|nil signature, ou nil si aucune boîte valide

#### `editor_ezObjectSelect_selectionGeometry.getObjectVolume(obj)`

Volume de la boîte (étendues x échelle absolue pour les objets orientés).

- `obj` (*userdata|nil*) : Objet de la scène
- **renvoie** : number|nil volume en m3 (unités monde), nil si invalide ou non fini

#### `editor_ezObjectSelect_selectionGeometry.getWorldCorners(obj)`

Les 8 coins monde de la boîte d'un objet.

- `obj` (*userdata*) : Objet de la scène
- **renvoie** : table|nil liste de 8 vec3 (ou nil)
- **renvoie** : string type de bornes, ou "invalidBounds"

#### `editor_ezObjectSelect_selectionGeometry.updateCursorMetrics(proxy, mousePosition)`

Ajoute au proxy cursorDistance (distance en pixels du curseur au polygone, 0 si dedans) et centerBias (distance au centroïde divisée par racine de l'aire).

- `proxy` (*table*) : Proxy
- `mousePosition` (*table*) : {x, y} relatif au viewport
- **renvoie** : table le même proxy

#### `editor_ezObjectSelect_selectionGeometry.updateRayEntry(proxy, rayOrigin, rayDirection)`

Ajoute proxy.rayEntry : distance d'entrée du rayon dans la boîte orientée (math.huge s'il la manque ou sans rayon).

- `proxy` (*table*) : Proxy
- `rayOrigin` (*vec3|nil*) : 
- `rayDirection` (*vec3|nil*) : 
- **renvoie** : table le même proxy

#### `editor_ezObjectSelect_selectionGeometry.validBox(box)`

Teste qu'une boîte a minExtents/maxExtents finis (|v| < 1e10, pas de NaN) et min <= max sur chaque axe.

- `box` (*table|nil*) : Boîte avec minExtents et maxExtents
- **renvoie** : boolean 

## Appels vers le moteur (C++)

- `Engine.` `castRay`, `sceneGetCameraFrustum`
- `obj:` `getID`, `getObjBox`, `getScale`, `getTransform`, `getWorldBox`, `isSubClassOf`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua`.*
