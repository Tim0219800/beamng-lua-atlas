# `editor_rallyEditor_zSnap`

*Fichier : `lua/ge/extensions/editor/rallyEditor/zSnap.lua` · VM : Game Engine (GE) · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor_zSnap` : `extensions.load("editor_rallyEditor_zSnap")`, puis la globale `editor_rallyEditor_zSnap`

Aide de l'éditeur de rallye pour « coller » la hauteur (z) d'un point au terrain. Trois méthodes : aucune, hauteur du terrain (core_terrain.getTerrainHeight) ou lancer de rayon vertical (editorUtil.vertRaycast). La méthode courante vient de la préférence de l'éditeur de rallye (editor_rallyEditor.getPrefWaypointSnapMethod). Sert aussi à adapter la géométrie d'une spline au terrain.

## Exemple

```lua
local zSnap = extensions.editor_rallyEditor_zSnap
local p = zSnap.zSnap(vec3(100, 200, 0), zSnap.methods.vertRaycast, 10)
```

## Remarques

- Les fonctions « InPlace » modifient le vec3 passé en argument (pos.z) et le renvoient ; zSnap() travaille sur une copie.
- Une méthode inconnue dans snapInPlace retombe sur defaultMethod (getTerrainHeight).
- snapTerrainHeightInPlace ne change rien si core_terrain.getTerrainHeight est absent ou renvoie nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor_zSnap.conformSplineGeometry(spline, useRaycast, minNumDivisions, minSpacing, rayRaise)` | Génère la géométrie d'une spline Catmull-Rom collée au terrain, par raycast (geom.catmullRomRaycast) ou par hauteur du terrain (geom.catmullRomConformToTerrain). | 81 |
| `editor_rallyEditor_zSnap.getCurrentMethod()` | Renvoie la méthode choisie dans les préférences de l'éditeur de rallye, ou defaultMethod si absente/invalide. | 60 |
| `editor_rallyEditor_zSnap.isValidMethod(method)` | Indique si le libellé est une méthode connue. | 47 |
| `editor_rallyEditor_zSnap.methodForUseRaycast(useRaycast)` | Convertit un booléen en méthode : vertRaycast si true, sinon getTerrainHeight. | 73 |
| `editor_rallyEditor_zSnap.noSnappingInPlace(pos)` | Ne fait rien, renvoie pos tel quel. | 24 |
| `editor_rallyEditor_zSnap.snapDrivelineInPlace(pos, useRaycast, rayRaise)` | Colle un point de driveline au terrain avec la méthode déduite de useRaycast. | 77 |
| `editor_rallyEditor_zSnap.snapInPlace(pos, method, rayRaise)` | Applique la méthode choisie (ou la méthode par défaut si inconnue) à pos, en place. | 51 |
| `editor_rallyEditor_zSnap.snapInPlaceWithCurrentMethod(pos, rayRaise)` | snapInPlace avec la méthode courante. | 69 |
| `editor_rallyEditor_zSnap.snapRaycastInPlace(pos, rayRaise)` | Ajuste pos.z par un lancer de rayon vertical (editorUtil.vertRaycast). | 36 |
| `editor_rallyEditor_zSnap.snapTerrainHeightInPlace(pos)` | Met pos.z à la hauteur du terrain en (x, y) si disponible. | 28 |
| `editor_rallyEditor_zSnap.zSnap(pos, method, rayRaise)` | Comme snapInPlace mais sur une copie de pos. | 56 |
| `editor_rallyEditor_zSnap.zSnapWithCurrentMethod(pos)` | zSnap avec la méthode courante, sur une copie. | 65 |

### Détail des paramètres

#### `editor_rallyEditor_zSnap.conformSplineGeometry(spline, useRaycast, minNumDivisions, minSpacing, rayRaise)`

Génère la géométrie d'une spline Catmull-Rom collée au terrain, par raycast (geom.catmullRomRaycast) ou par hauteur du terrain (geom.catmullRomConformToTerrain).

- `spline` (*table*) : Spline source.
- `useRaycast` (*boolean*) : Choix de la méthode.
- `minNumDivisions` (*integer*) : Nombre minimal de subdivisions (transmis à geom).
- `minSpacing` (*number*) : Espacement minimal (transmis à geom).
- `rayRaise` (*number|nil*) : Relèvement du rayon.
- **renvoie** : table Résultat de la fonction geom appelée.

#### `editor_rallyEditor_zSnap.getCurrentMethod()`

Renvoie la méthode choisie dans les préférences de l'éditeur de rallye, ou defaultMethod si absente/invalide.

- **renvoie** : string Libellé de méthode.

#### `editor_rallyEditor_zSnap.isValidMethod(method)`

Indique si le libellé est une méthode connue.

- `method` (*string*) : Libellé de méthode.
- **renvoie** : boolean true si valide.

#### `editor_rallyEditor_zSnap.methodForUseRaycast(useRaycast)`

Convertit un booléen en méthode : vertRaycast si true, sinon getTerrainHeight.

- `useRaycast` (*boolean*) : Utiliser le raycast.
- **renvoie** : string Libellé de méthode.

#### `editor_rallyEditor_zSnap.noSnappingInPlace(pos)`

Ne fait rien, renvoie pos tel quel.

- `pos` (*vec3*) : Position.
- **renvoie** : vec3 pos inchangé.

#### `editor_rallyEditor_zSnap.snapDrivelineInPlace(pos, useRaycast, rayRaise)`

Colle un point de driveline au terrain avec la méthode déduite de useRaycast.

- `pos` (*vec3*) : Position modifiée en place.
- `useRaycast` (*boolean*) : true = raycast, false = hauteur du terrain.
- `rayRaise` (*number|nil*) : Relèvement du rayon.
- **renvoie** : vec3 pos.

#### `editor_rallyEditor_zSnap.snapInPlace(pos, method, rayRaise)`

Applique la méthode choisie (ou la méthode par défaut si inconnue) à pos, en place.

- `pos` (*vec3*) : Position modifiée en place.
- `method` (*string*) : Libellé de méthode.
- `rayRaise` (*number|nil*) : Relèvement du rayon (méthode raycast).
- **renvoie** : vec3 pos.

#### `editor_rallyEditor_zSnap.snapInPlaceWithCurrentMethod(pos, rayRaise)`

snapInPlace avec la méthode courante.

- `pos` (*vec3*) : Position modifiée en place.
- `rayRaise` (*number|nil*) : Relèvement du rayon.
- **renvoie** : vec3 pos.

#### `editor_rallyEditor_zSnap.snapRaycastInPlace(pos, rayRaise)`

Ajuste pos.z par un lancer de rayon vertical (editorUtil.vertRaycast).

- `pos` (*vec3*) : Position modifiée en place.
- `rayRaise` (*number|nil*) : Hauteur dont le rayon est relevé avant de tirer (transmis à vertRaycast).
- **renvoie** : vec3 pos.

#### `editor_rallyEditor_zSnap.snapTerrainHeightInPlace(pos)`

Met pos.z à la hauteur du terrain en (x, y) si disponible.

- `pos` (*vec3*) : Position modifiée en place.
- **renvoie** : vec3 pos.

#### `editor_rallyEditor_zSnap.zSnap(pos, method, rayRaise)`

Comme snapInPlace mais sur une copie de pos.

- `pos` (*vec3*) : Position source (non modifiée).
- `method` (*string*) : Libellé de méthode.
- `rayRaise` (*number|nil*) : Relèvement du rayon.
- **renvoie** : vec3 Nouvelle position.

#### `editor_rallyEditor_zSnap.zSnapWithCurrentMethod(pos)`

zSnap avec la méthode courante, sur une copie.

- `pos` (*vec3*) : Position source.
- **renvoie** : vec3 Nouvelle position.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultMethod` | string | Méthode par défaut : methods.getTerrainHeight. |
| `methodValues` | string[] | Liste ordonnée des libellés de méthodes (pour un menu déroulant). |
| `methods` | table<string, string> | Noms des méthodes : noSnapping, getTerrainHeight, vertRaycast (valeurs = libellés affichables). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/zSnap.lua`.*
