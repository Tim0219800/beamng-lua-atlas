# `editor_heroRoadEditor_meshRefine`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua` · VM : Game Engine (GE) · 171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_meshRefine` : `extensions.load("editor_heroRoadEditor_meshRefine")`, puis la globale `editor_heroRoadEditor_meshRefine`

Décimation de maillage pour le Hero Road Editor, par l'algorithme de Ramer-Douglas-Peucker (RDP). decimateStations réduit le nombre de stations (tranches transversales) le long de la route ; decimateCols réduit le nombre de colonnes (points latéraux d'une coupe). Utilisé par mesh.lua pour construire les niveaux de détail (LOD) et le maillage de collision.

## Remarques

- Les deux fonctions renvoient des indices (1-based) triés des éléments conservés, jamais les points eux-mêmes.
- Les tolérances sont en mètres.
- colMaxDev et splitDev sont des fonctions locales de niveau module (non exportées) afin que LuaJIT puisse les compiler.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_meshRefine.decimateCols(ptsA, bandMat, tolM, m)` | Décimation latérale des colonnes. Force la conservation de la colonne 1, de la dernière et de toute frontière entre bandes de matériaux différents, puis applique RDP aux colonnes intérieures avec l'écart (o, dz) MAXIMAL sur toutes les stations : une colonne reste si le profil plie à n'importe quelle station (par exemple un bombé qui apparaît progressivement garde ses colonnes de sommet). | 129 |
| `editor_heroRoadEditor_meshRefine.decimateStations(centres, W, numCols, tolM, m, maxSegM, mustKeep, tolZM)` | RDP multi-canal sur les stations 1..m : une station est conservée si la ligne centrale, le bord gauche (colonne 1) ou le bord droit (colonne numCols) dévie de plus que la tolérance par rapport à la corde. Garde toujours les stations 1 et m et celles de mustKeep. Avec tolZM, tolM ne borne que l'écart en plan et tolZM l'écart vertical (une corde en plan décale seulement un bord, une corde verticale crée une bosse). Un plafond maxSegM réinsère des stations d'origine pour couper les segments trop longs en sous-segments à peu près égaux (au mieux jusqu'à l'espacement d'origine). | 49 |

### Détail des paramètres

#### `editor_heroRoadEditor_meshRefine.decimateCols(ptsA, bandMat, tolM, m)`

Décimation latérale des colonnes. Force la conservation de la colonne 1, de la dernière et de toute frontière entre bandes de matériaux différents, puis applique RDP aux colonnes intérieures avec l'écart (o, dz) MAXIMAL sur toutes les stations : une colonne reste si le profil plie à n'importe quelle station (par exemple un bombé qui apparaît progressivement garde ses colonnes de sommet).

- `ptsA` (*table*) : ptsA[s] = coupe de la station s, un tableau de {o, dz} par colonne (décalage latéral, écart vertical).
- `bandMat` (*table*) : Un matériau par bande (entre les colonnes c et c+1).
- `tolM` (*number*) : Tolérance en mètres.
- `m` (*integer*) : Nombre de stations.
- **renvoie** : integer[] Indices triés des colonnes conservées.

#### `editor_heroRoadEditor_meshRefine.decimateStations(centres, W, numCols, tolM, m, maxSegM, mustKeep, tolZM)`

RDP multi-canal sur les stations 1..m : une station est conservée si la ligne centrale, le bord gauche (colonne 1) ou le bord droit (colonne numCols) dévie de plus que la tolérance par rapport à la corde. Garde toujours les stations 1 et m et celles de mustKeep. Avec tolZM, tolM ne borne que l'écart en plan et tolZM l'écart vertical (une corde en plan décale seulement un bord, une corde verticale crée une bosse). Un plafond maxSegM réinsère des stations d'origine pour couper les segments trop longs en sous-segments à peu près égaux (au mieux jusqu'à l'espacement d'origine).

- `centres` (*table*) : Points de la ligne centrale par station (x, y, z).
- `W` (*table*) : Grille de points monde W[station][colonne]; seules les colonnes 1 et numCols sont lues.
- `numCols` (*integer*) : Nombre de colonnes de la grille.
- `tolM` (*number*) : Tolérance en mètres (plan seul si tolZM est fourni, sinon écart 3D).
- `m` (*integer*) : Nombre de stations.
- `maxSegM` (*number|nil*) : Longueur d'arc maximale entre deux stations conservées, en mètres ; nil ou 0 pour désactiver.
- `mustKeep` (*table<integer, boolean>|nil*) : Ensemble des indices de stations à conserver obligatoirement.
- `tolZM` (*number|nil*) : Tolérance verticale en mètres ; active le mode à deux tolérances.
- **renvoie** : integer[] Indices triés des stations conservées.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua`.*
