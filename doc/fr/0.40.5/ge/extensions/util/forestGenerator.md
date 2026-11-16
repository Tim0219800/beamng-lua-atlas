# `util_forestGenerator`

*Fichier : `lua/ge/extensions/util/forestGenerator.lua` · VM : Game Engine (GE) · 198 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_forestGenerator` : `extensions.load("util_forestGenerator")`, puis la globale `util_forestGenerator`

Utilitaire pour créer, modifier, lister et supprimer des objets de la forêt (système Forest) du niveau chargé : arbres, buissons, rochers, etc. Au chargement, il lit l'objet forêt du niveau (core_forest.getForestObject()) et indexe les templates de ForestItemData par nom interne. Un moddeur ou un script d'éditeur s'en sert pour semer de la végétation de façon aléatoire (rectangle avec bruit bleu, ou disque) ou pour déplacer/supprimer des éléments.

## Exemple

```lua
local fg = extensions.util_forestGenerator
local types = fg.getForestItemTypes()
fg.createRandomForestRadial({types[1]}, 50, vec3(0,0,0), 30)
```

## Remarques

- initForest() est exécuté dès le chargement du fichier : si aucun niveau (scenetree.MissionGroup) ou aucun objet forêt n'existe à ce moment, forestData reste nil et les autres fonctions échouent. Appeler initForest() de nouveau après le chargement du niveau.
- Les angles de rotation sont en degrés, autour de l'axe Z uniquement. La position Z est ajustée à la hauteur du terrain s'il existe un terrain (core_terrain.getTerrain()).
- createRandomForestRect/Radial insèrent le résultat de createForestItem dans la table : si un type est introuvable, createForestItem renvoie nil (rien n'est inséré, mais l'erreur est loguée par createForestItem).
- clearForest ne supprime pas les éléments templates (celui dont la clé est celle du dictionnaire).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_forestGenerator.clearForest()` | Supprime tous les éléments de la forêt sauf les templates, puis rappelle initForest(). | 176 |
| `util_forestGenerator.createForestItem(itemType, pos, rotDeg, scl)` | Crée un élément de forêt à partir d'un template. | 57 |
| `util_forestGenerator.createRandomForestRadial(itemTypeArray, amount, pos, radius, rotSteps, minScl, maxScl)` | Crée amount éléments aléatoires dans un disque de rayon radius autour de pos (getRandomPointInCircle). | 109 |
| `util_forestGenerator.createRandomForestRect(itemTypeArray, amount, pos, minX, maxX, minY, maxY, rotSteps, minScl, maxScl)` | Crée amount éléments aléatoires dans un rectangle autour de pos. Les positions XY suivent un bruit bleu (getBlueNoise2d), le type est choisi au hasard dans itemTypeArray, la rotation par pas, l'échelle entre minScl et maxScl. | 68 |
| `util_forestGenerator.deleteForestItem(item)` | Supprime un élément de la forêt. | 171 |
| `util_forestGenerator.getForestItemDict()` | Renvoie le dictionnaire nom interne -> élément template. | 52 |
| `util_forestGenerator.getForestItemTypes()` | Renvoie la liste triée des noms internes des templates de forêt. | 47 |
| `util_forestGenerator.getForestItemsPolygon(polygon)` | Renvoie les éléments situés dans un polygone 2D (projeté sur XY) ; sans polygone, renvoie tous les éléments. | 148 |
| `util_forestGenerator.getForestItemsRadius(pos, radius)` | Renvoie les éléments situés dans un cercle autour d'une position. | 164 |
| `util_forestGenerator.initForest()` | (Ré)initialise forestData depuis l'objet forêt du niveau, reconstruit le dictionnaire des templates par nom interne et la liste triée des types. Avertit (log W) si le niveau ou l'objet forêt est absent. | 23 |
| `util_forestGenerator.updateForestItem(item, pos, rotDeg, scl)` | Met à jour la position, la rotation Z et l'échelle d'un élément existant (forestData:updateItem). | 141 |

### Détail des paramètres

#### `util_forestGenerator.createForestItem(itemType, pos, rotDeg, scl)`

Crée un élément de forêt à partir d'un template.

- `itemType` (*string*) : Nom interne du template (voir getForestItemTypes)
- `pos` (*vec3|nil*) : Position monde (défaut vec3())
- `rotDeg` (*number|nil*) : Rotation en degrés autour de Z (défaut 0)
- `scl` (*number|nil*) : Échelle uniforme (défaut 1)
- **renvoie** : userdata|nil Élément créé, ou nil si le template n'existe pas (erreur loguée)

#### `util_forestGenerator.createRandomForestRadial(itemTypeArray, amount, pos, radius, rotSteps, minScl, maxScl)`

Crée amount éléments aléatoires dans un disque de rayon radius autour de pos (getRandomPointInCircle).

- `itemTypeArray` (*string[]|nil*) : Types possibles (défaut : tous les templates)
- `amount` (*integer*) : Nombre d'éléments à créer
- `pos` (*vec3|nil*) : Centre du disque (défaut 0,0,0)
- `radius` (*number|nil*) : Rayon en mètres (défaut 50)
- `rotSteps` (*number|nil*) : Nombre de pas de rotation sur 360° (défaut 360)
- `minScl` (*number|nil*) : Échelle minimale (défaut 0.75)
- `maxScl` (*number|nil*) : Échelle maximale (défaut 1.25)
- **renvoie** : table Liste des éléments créés

#### `util_forestGenerator.createRandomForestRect(itemTypeArray, amount, pos, minX, maxX, minY, maxY, rotSteps, minScl, maxScl)`

Crée amount éléments aléatoires dans un rectangle autour de pos. Les positions XY suivent un bruit bleu (getBlueNoise2d), le type est choisi au hasard dans itemTypeArray, la rotation par pas, l'échelle entre minScl et maxScl.

- `itemTypeArray` (*string[]|nil*) : Types possibles (défaut : tous les templates)
- `amount` (*integer*) : Nombre d'éléments à créer
- `pos` (*vec3|nil*) : Centre de référence (défaut 0,0,0)
- `minX` (*number|nil*) : Décalage minimal en X par rapport à pos (défaut -100)
- `maxX` (*number|nil*) : Décalage maximal en X (défaut 100)
- `minY` (*number|nil*) : Décalage minimal en Y (défaut -100)
- `maxY` (*number|nil*) : Décalage maximal en Y (défaut 100)
- `rotSteps` (*number|nil*) : Nombre de pas de rotation sur 360° (défaut 360, minimum 1)
- `minScl` (*number|nil*) : Échelle minimale (défaut 0.75)
- `maxScl` (*number|nil*) : Échelle maximale (défaut 1.25)
- **renvoie** : table Liste des éléments créés

#### `util_forestGenerator.deleteForestItem(item)`

Supprime un élément de la forêt.

- `item` (*userdata*) : Élément à supprimer

#### `util_forestGenerator.getForestItemDict()`

Renvoie le dictionnaire nom interne -> élément template.

- **renvoie** : table<string, userdata> Templates

#### `util_forestGenerator.getForestItemTypes()`

Renvoie la liste triée des noms internes des templates de forêt.

- **renvoie** : string[] Types d'éléments

#### `util_forestGenerator.getForestItemsPolygon(polygon)`

Renvoie les éléments situés dans un polygone 2D (projeté sur XY) ; sans polygone, renvoie tous les éléments.

- `polygon` (*vec3[]|nil*) : Sommets du polygone
- **renvoie** : table Éléments de forêt

#### `util_forestGenerator.getForestItemsRadius(pos, radius)`

Renvoie les éléments situés dans un cercle autour d'une position.

- `pos` (*vec3|nil*) : Centre (défaut : position de la caméra)
- `radius` (*number|nil*) : Rayon en mètres (défaut 20)
- **renvoie** : table Éléments de forêt

#### `util_forestGenerator.updateForestItem(item, pos, rotDeg, scl)`

Met à jour la position, la rotation Z et l'échelle d'un élément existant (forestData:updateItem).

- `item` (*userdata*) : Élément de forêt existant
- `pos` (*vec3*) : Nouvelle position
- `rotDeg` (*number|nil*) : Rotation Z en degrés (défaut 0)
- `scl` (*number|nil*) : Échelle (défaut 1)
- **renvoie** : userdata Élément mis à jour (retour de updateItem)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/forestGenerator.lua`.*
