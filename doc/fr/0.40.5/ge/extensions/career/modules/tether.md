# `career_modules_tether`

*Fichier : `lua/ge/extensions/career/modules/tether.lua` · VM : Game Engine (GE) · 287 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tether` : `extensions.load("career_modules_tether")`, puis la globale `career_modules_tether`

Système de « laisses » (tethers) du mode carrière : une zone (boîte, sphère, capsule, porte ou véhicule) autour de laquelle le joueur doit rester. Quand le joueur (véhicule joueur 0, ou unicycle à pied) sort de la zone, le callback est appelé une fois et la laisse est retirée. Le hook onUpdate de l'extension n'est branché que tant qu'au moins une laisse est active.

## Exemple

```lua
local t = career_modules_tether.startSphereTether(vec3(100,200,50), 30, function(tether) log('I','','trop loin') end)
-- plus tard, pour annuler sans déclencher le callback :
career_modules_tether.removeTether(t)
```

## Remarques

- Distances en mètres. Les laisses sont testées à chaque onUpdate ; le callback reçoit la table de la laisse.
- Bug : startCapsuleTetherBetweenStaticAndVehicle utilise checkfun = checkWalkawayCapsuleTether, qui n'est pas défini dans le fichier (nil) ; la fonction checkCapsuleTetherWithVeh, qui semble prévue pour cet usage, n'est jamais utilisée. Une telle laisse provoquerait une erreur dans onUpdate.
- Bug mineur : startVehicleTether lit une variable globale `data` inexistante (data = data or {}) : data vaut toujours {} ; le paramètre callback est bien utilisé mais aucun paramètre data n'existe.
- Si le véhicule cible d'une laisse véhicule n'existe plus, la laisse se déclenche (callback appelé).
- Les fonctions check* retournent nil (pas de déclenchement) si aucun véhicule joueur n'existe.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tether.addTether(t)` | Ajoute une table de laisse (avec checkfun et callback) à la liste active et active le hook onUpdate si c'est la première. | 205 |
| `career_modules_tether.drawAxisBox(corner, x, y, z, clr)` | Dessine une boîte translucide avec debugDrawer (faces en triangles, arêtes noires), utile pour visualiser une laisse en boîte. | 228 |
| `career_modules_tether.removeTether(t)` | Retire une laisse de la liste sans appeler son callback. Sans effet si t est nil ou absente. | 213 |
| `career_modules_tether.startBoxTether(p1, x1, y1, z1, callback, data)` | Crée une laisse en boîte orientée : se déclenche quand le joueur sort de la boîte définie par le coin p1 et les vecteurs d'arêtes x1, y1, z1. | 27 |
| `career_modules_tether.startCapsuleTetherBetweenStaticAndVehicle(p1, r1, vehId, r2, callback, data)` | Prévue pour une capsule entre un point fixe et un véhicule (p2 suit le véhicule). Voir notes : checkfun référence une fonction non définie. | 112 |
| `career_modules_tether.startCapsuleTetherBetweenStatics(p1, r1, p2, r2, callback, data)` | Crée une laisse en capsule conique entre deux points fixes, le rayon variant linéairement de r1 à r2 le long du segment. | 94 |
| `career_modules_tether.startDoorTether(door, bufferLength, callback, data)` | Crée une laisse en boîte à partir d'un objet de zone de la scène (door[1] = nom de l'objet), agrandie de bufferLength mètres sur chaque axe. Ne retourne rien si l'objet n'est pas trouvé. | 38 |
| `career_modules_tether.startSphereTether(p1, r1, callback, data)` | Crée une laisse sphérique : se déclenche quand le véhicule du joueur est à plus de r1 mètres de p1. | 63 |
| `career_modules_tether.startVehicleTether(vehId, radius, inverse, callback)` | Crée une laisse autour d'un véhicule : se déclenche quand le joueur est à plus de radius mètres du véhicule, ou, si inverse est vrai, quand il est à moins de radius mètres. | 156 |

### Détail des paramètres

#### `career_modules_tether.addTether(t)`

Ajoute une table de laisse (avec checkfun et callback) à la liste active et active le hook onUpdate si c'est la première.

- `t` (*table*) : Laisse avec checkfun(t) et callback(t).

#### `career_modules_tether.drawAxisBox(corner, x, y, z, clr)`

Dessine une boîte translucide avec debugDrawer (faces en triangles, arêtes noires), utile pour visualiser une laisse en boîte.

- `corner` (*vec3*) : Coin de la boîte.
- `x` (*vec3*) : Vecteur d'arête X.
- `y` (*vec3*) : Vecteur d'arête Y.
- `z` (*vec3*) : Vecteur d'arête Z.
- `clr` (*any*) : Couleur des faces, défaut color(128,64,64,32).

#### `career_modules_tether.removeTether(t)`

Retire une laisse de la liste sans appeler son callback. Sans effet si t est nil ou absente.

- `t` (*table|nil*) : Laisse retournée par un start*Tether.

#### `career_modules_tether.startBoxTether(p1, x1, y1, z1, callback, data)`

Crée une laisse en boîte orientée : se déclenche quand le joueur sort de la boîte définie par le coin p1 et les vecteurs d'arêtes x1, y1, z1.

- `p1` (*vec3*) : Coin de la boîte.
- `x1` (*vec3*) : Vecteur d'arête X.
- `y1` (*vec3*) : Vecteur d'arête Y.
- `z1` (*vec3*) : Vecteur d'arête Z.
- `callback` (*function*) : Appelé avec la laisse quand le joueur est sorti.
- `data` (*any*) : Données libres conservées dans la laisse (t.data).
- **renvoie** : table La table de la laisse (à passer à removeTether).

#### `career_modules_tether.startCapsuleTetherBetweenStaticAndVehicle(p1, r1, vehId, r2, callback, data)`

Prévue pour une capsule entre un point fixe et un véhicule (p2 suit le véhicule). Voir notes : checkfun référence une fonction non définie.

- `p1` (*vec3*) : Point fixe.
- `r1` (*number*) : Rayon au point fixe.
- `vehId` (*integer*) : Id du véhicule.
- `r2` (*number*) : Rayon côté véhicule.
- `callback` (*function*) : Appelé quand le joueur sort.
- `data` (*any*) : Données libres.
- **renvoie** : table La laisse.

#### `career_modules_tether.startCapsuleTetherBetweenStatics(p1, r1, p2, r2, callback, data)`

Crée une laisse en capsule conique entre deux points fixes, le rayon variant linéairement de r1 à r2 le long du segment.

- `p1` (*vec3*) : Premier point.
- `r1` (*number*) : Rayon au premier point.
- `p2` (*vec3*) : Second point.
- `r2` (*number*) : Rayon au second point.
- `callback` (*function*) : Appelé quand le joueur sort.
- `data` (*any*) : Données libres.
- **renvoie** : table La laisse.

#### `career_modules_tether.startDoorTether(door, bufferLength, callback, data)`

Crée une laisse en boîte à partir d'un objet de zone de la scène (door[1] = nom de l'objet), agrandie de bufferLength mètres sur chaque axe. Ne retourne rien si l'objet n'est pas trouvé.

- `door` (*table*) : Table dont le premier élément est le nom de l'objet de la scène.
- `bufferLength` (*number|nil*) : Marge ajoutée à chaque axe, défaut 1.
- `callback` (*function*) : Appelé quand le joueur sort.
- `data` (*any*) : Données libres.
- **renvoie** : table|nil La laisse, ou nil si l'objet est introuvable.

#### `career_modules_tether.startSphereTether(p1, r1, callback, data)`

Crée une laisse sphérique : se déclenche quand le véhicule du joueur est à plus de r1 mètres de p1.

- `p1` (*vec3*) : Centre.
- `r1` (*number*) : Rayon en mètres.
- `callback` (*function*) : Appelé quand le joueur sort.
- `data` (*any*) : Données libres.
- **renvoie** : table La laisse.

#### `career_modules_tether.startVehicleTether(vehId, radius, inverse, callback)`

Crée une laisse autour d'un véhicule : se déclenche quand le joueur est à plus de radius mètres du véhicule, ou, si inverse est vrai, quand il est à moins de radius mètres.

- `vehId` (*integer*) : Id du véhicule suivi.
- `radius` (*number*) : Rayon en mètres.
- `inverse` (*boolean|nil*) : Si vrai, déclenche à l'approche plutôt qu'à l'éloignement.
- `callback` (*function*) : Appelé au déclenchement.
- **renvoie** : table La laisse.

## Champs

| Champ | Type | Description |
|---|---|---|
| `onUpdate` | function | Vaut nop au départ ; remplacé par la vraie boucle de vérification dès qu'une laisse est ajoutée, remis à nil quand la dernière est retirée (avec extensions.hookUpdate pour (dés)enregistrer le hook). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTriSolid`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tether.lua`.*
