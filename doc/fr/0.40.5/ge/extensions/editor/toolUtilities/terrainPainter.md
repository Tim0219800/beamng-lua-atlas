# `editor_toolUtilities_terrainPainter`

*Fichier : `lua/ge/extensions/editor/toolUtilities/terrainPainter.lua` · VM : Game Engine (GE) · 221 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_terrainPainter` : `extensions.load("editor_toolUtilities_terrainPainter")`, puis la globale `editor_toolUtilities_terrainPainter`

Peint le matériau de terrain sous une spline (route) et permet d'annuler. Calcule l'emprise de la route (bord réel du tablier pour les routes mesh, sinon ligne centrale et largeurs par station), pousse ce contour de group.paintMargin, remplit le polygone par lignes de balayage et mémorise les matériaux d'origine dans le groupe pour pouvoir les restaurer. Passe par editor_terrainEditor (bloc de terrain et terrain editor).

## Remarques

- Constantes : matériau par défaut = indice 1 ; marge de 2 m ajoutée à la boîte englobante de peinture.
- paint ne fait rien si le groupe porte déjà des données peintes (paintedDataVals non vide), a moins de 2 nœuds ou moins de 2 divPoints : il faut revert avant de repeindre.
- paintPolygon ne fait rien non plus si store.paintedDataVals est déjà rempli.
- Le groupe doit avoir paintedDataX, paintedDataY et paintedDataVals (tables) : revert et paint les indexent sans test pour les tailler, seul paintedDataVals est testé avant.
- revert restaure en ordre inverse, pour qu'une case peinte deux fois retrouve le matériau antérieur à la première peinture.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_terrainPainter.paint(group, runs)` | Peint la spline donnée : calcule d'abord son emprise puis la peint, avec le matériau group.paintMaterialIdx. Stocke coordonnées, anciennes valeurs et boîte dans le groupe. | 143 |
| `editor_toolUtilities_terrainPainter.paintPolygon(store, poly, materialIdx, skip)` | Peint un polygone fermé en XY monde avec le matériau de terrain donné, en enregistrant dans `store` ce qui s'y trouvait pour pouvoir le remettre. Met à jour la grille du terrain (updateGridMaterials, updateGrid). | 83 |
| `editor_toolUtilities_terrainPainter.revert(group)` | Remet sous la peinture l'état d'avant : restaure les indices de matériau, met à jour la grille, vide les données peintes du groupe. | 179 |
| `editor_toolUtilities_terrainPainter.revertAll(groups)` | Annule la peinture du terrain pour tous les groupes. | 207 |

### Détail des paramètres

#### `editor_toolUtilities_terrainPainter.paint(group, runs)`

Peint la spline donnée : calcule d'abord son emprise puis la peint, avec le matériau group.paintMaterialIdx. Stocke coordonnées, anciennes valeurs et boîte dans le groupe.

- `group` (*table*) : Groupe de spline (nodes, divPoints, binormals, divWidths, meshEdgeL/R, paintMargin, paintMaterialIdx, paintedData*).
- `runs` (*table|nil*) : Paires d'indices de divPoints { i0, i1 } : seulement ces tronçons, dans un seul enregistrement. Par défaut toute la route.

#### `editor_toolUtilities_terrainPainter.paintPolygon(store, poly, materialIdx, skip)`

Peint un polygone fermé en XY monde avec le matériau de terrain donné, en enregistrant dans `store` ce qui s'y trouvait pour pouvoir le remettre. Met à jour la grille du terrain (updateGridMaterials, updateGrid).

- `store` (*table*) : Table qui reçoit paintedDataX, paintedDataY, paintedDataVals et les bornes paintedDataBox*.
- `poly` (*table*) : Liste de points (x, y) du polygone, 3 au moins.
- `materialIdx` (*integer|nil*) : Indice du matériau de terrain (1 par défaut).
- `skip` (*function|nil*) : skip(x, y) interrogé pour chaque point ; si vrai le sol est laissé tel quel.

#### `editor_toolUtilities_terrainPainter.revert(group)`

Remet sous la peinture l'état d'avant : restaure les indices de matériau, met à jour la grille, vide les données peintes du groupe.

- `group` (*table*) : Groupe peint.

#### `editor_toolUtilities_terrainPainter.revertAll(groups)`

Annule la peinture du terrain pour tous les groupes.

- `groups` (*table*) : Liste de groupes.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/terrainPainter.lua`.*
