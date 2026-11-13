# `utils_heatmap`

*Fichier : `lua/common/utils/heatmap.lua` · VM : Commun (GE + véhicule) · 128 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/heatmap")`

Preuve de concept : génère une image SVG (2048x2048) du réseau routier de la carte (map.getMap()) avec un point rouge par véhicule à chaque appel de update(). Se charge avec require('utils/heatmap'). Sert à visualiser des trajectoires ; l'image est écrite avec la bibliothèque libs/EzSVG.

## Exemple

```lua
local heatmap = require('utils/heatmap')
heatmap.init('trace.svg')
-- chaque frame : heatmap.update()
heatmap.destroy() -- sauvegarde puis libère
```

## Remarques

- Taille fixée à 2048 (terrainSize), non lue du terrain (commentaire dans le code) ; les coordonnées sont décalées par la position du TerrainBlock et l'axe Y est inversé.
- Routes dont la valeur de lien (difficulté) est < 0.7 : brun (terre), sinon noir. Largeur = 2 x rayon du noeud.
- init() suppose qu'un TerrainBlock existe dans la scène (scenetree.findClassObjects('TerrainBlock')[1]) : plante sinon.
- update() ajoute un cercle SVG par véhicule et par appel : le document grossit à chaque frame.
- destroy() appelle save() avant de libérer ; init() appelle destroy() d'abord, ce qui sauvegarde l'ancien document éventuel (dans le NOUVEAU nom de fichier, car filename est déjà remplacé).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_heatmap.destroy()` | Sauvegarde puis libère le document et la position du terrain. | 74 |
| `utils_heatmap.init(_filename)` | Crée le document SVG, mémorise la position du terrain et dessine les routes et noeuds de la carte. | 80 |
| `utils_heatmap.save()` | Écrit le SVG courant dans le fichier choisi à init(). Ne fait rien si aucun document. | 69 |
| `utils_heatmap.update()` | À appeler à chaque frame (y compris en menu, sans rendu 3D) : dessine un cercle rouge à la position de chaque objet de map.objects. | 96 |

### Détail des paramètres

#### `utils_heatmap.init(_filename)`

Crée le document SVG, mémorise la position du terrain et dessine les routes et noeuds de la carte.

- `_filename` (*string*) : Fichier SVG de sortie

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/heatmap.lua`.*
