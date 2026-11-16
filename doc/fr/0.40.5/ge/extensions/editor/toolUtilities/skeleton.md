# `editor_toolUtilities_skeleton`

*Fichier : `lua/ge/extensions/editor/toolUtilities/skeleton.lua` · VM : Game Engine (GE) · 718 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_skeleton` : `extensions.load("editor_toolUtilities_skeleton")`, puis la globale `editor_toolUtilities_skeleton`

Suite d'utilitaires pour squelettiser et vectoriser des masques binaires. La fonction principale getPathsFromPng convertit un PNG en masque, le squelettise (algorithme Guo-Hall), détecte extrémités et jonctions, extrait les chemins, estime les largeurs, puis simplifie par RDP (tolérance 6.0). Sert aux outils de splines pour transformer une image de routes en polylignes.

## Exemple

```lua
local sk = extensions.editor_toolUtilities_skeleton
local paths = sk.getPathsFromPng('/levels/x/roads.png')
for _, p in ipairs(paths or {}) do print(#p.points, #p.widths) end
```

## Remarques

- Le seuil par défaut de conversion bitmap -> masque est 0.5 ; la RDP utilise 6.0 de tolérance (constantes en tête du fichier).
- Pipeline de getPathsFromPng : retournement vertical du bitmap, dilatation du masque (rayon 3), squelettisation, chemins de moins de 20 points écartés, fragments proches (40) rejoints, largeurs estimées sur le masque non dilaté, puis effilement, lissage et plafond de largeur aux extrémités (15.0).
- Les points sont des vec3 en coordonnées pixel du masque (2D, déduit du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_skeleton.estimateWidths(paths, mask)` | Estime la largeur le long de chaque chemin à partir du masque issu du PNG d'origine (utilise les tangentes locales). | 451 |
| `editor_toolUtilities_skeleton.extractPaths(mask)` | Extrait tous les chemins d'un masque déjà squelettisé. | 331 |
| `editor_toolUtilities_skeleton.getPathsFromPng(filepath)` | Convertit un PNG en masque squelettisé et le vectorise en polylignes. Renvoie nil (avec une erreur loggée) si le fichier ne se charge pas ou si la conversion échoue. | 652 |
| `editor_toolUtilities_skeleton.skeletonise(mask)` | Squelettise un masque avec l'algorithme Guo-Hall, en alternant deux passes jusqu'à stabilité. Le masque est modifié en place puis renvoyé. | 155 |

### Détail des paramètres

#### `editor_toolUtilities_skeleton.estimateWidths(paths, mask)`

Estime la largeur le long de chaque chemin à partir du masque issu du PNG d'origine (utilise les tangentes locales).

- `paths` (*table*) : Chemins extraits.
- `mask` (*table*) : Masque d'origine, non squelettisé.
- **renvoie** : table Largeurs, une liste par chemin (déduit du code).

#### `editor_toolUtilities_skeleton.extractPaths(mask)`

Extrait tous les chemins d'un masque déjà squelettisé.

- `mask` (*table*) : Masque squelettisé.
- **renvoie** : table Liste de chemins (déduit du code).

#### `editor_toolUtilities_skeleton.getPathsFromPng(filepath)`

Convertit un PNG en masque squelettisé et le vectorise en polylignes. Renvoie nil (avec une erreur loggée) si le fichier ne se charge pas ou si la conversion échoue.

- `filepath` (*string*) : Chemin d'un PNG d'un format supporté.
- **renvoie** : table<integer, {points: vec3[], widths: number[]}>|nil Un élément par chemin : points (2D en vec3) et widths correspondantes.

#### `editor_toolUtilities_skeleton.skeletonise(mask)`

Squelettise un masque avec l'algorithme Guo-Hall, en alternant deux passes jusqu'à stabilité. Le masque est modifié en place puis renvoyé.

- `mask` (*table*) : Masque 2D (lignes de 0 ou 1).
- **renvoie** : table Le même masque, squelettisé.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/skeleton.lua`.*
