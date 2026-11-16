# `editor_toolUtilities_terrainPolyPaint`

*Fichier : `lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua` · VM : Game Engine (GE) · 219 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_terrainPolyPaint` : `extensions.load("editor_toolUtilities_terrainPolyPaint")`, puis la globale `editor_toolUtilities_terrainPolyPaint`

Peinture de matériau de terrain sur un anneau polygonal (remplissage par lignes de balayage) ou sur une liste de cellules, avec un enregistrement d'annulation. Un enregistrement est { xs, ys, prev, cnt } : coordonnées monde de chaque cellule peinte et son indice de matériau d'ORIGINE, pour restaurer exactement l'état d'avant. Chaque enregistrement est une surcouche vivante jusqu'à revert ou release ; les enregistrements s'empilent dans l'ordre de peinture, et liftAll/layAll les retirent et les remettent tous (sauvegarde du terrain, repeinture du réseau dessous). Une seule mise à jour de grille est faite sur la zone touchée.

## Remarques

- Les trous du terrain (indice 255) ne sont jamais repeints ni restaurés par-dessus.
- liftAll/layAll s'emboîtent par compteur : seul l'appel le plus externe travaille. Toujours les appeler en paire dans la même frame.
- liftAll oublie les enregistrements peints sur un bloc de terrain qui n'existe plus.
- Toutes les fonctions utilisent extensions.editor_terrainEditor ; sans bloc de terrain ou sans terrain editor, paintRing et paintCells renvoient nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_terrainPolyPaint.layAll()` | Remet la peinture, du plus ancien au plus récent, par-dessus ce qui se trouve maintenant dessous, puis rafraîchit la grille sur la zone touchée. | 191 |
| `editor_toolUtilities_terrainPolyPaint.liftAll()` | Retire la peinture de tous les enregistrements vivants, du plus récent au plus ancien. S'emboîte : seul l'appel le plus externe agit. Pas de rafraîchissement de grille, layAll suit toujours dans la même frame. | 173 |
| `editor_toolUtilities_terrainPolyPaint.paintCells(xs, ys, matIdx, prev)` | Peint une liste explicite de cellules (xs/ys monde) toutes avec `matIdx`. | 113 |
| `editor_toolUtilities_terrainPolyPaint.paintRing(ring, mat)` | Peint les cellules du terrain à l'intérieur de `ring` (remplissage par balayage), puis rafraîchit la grille sur la boîte touchée. Renvoie l'enregistrement d'annulation, nil si rien n'a été peint. | 82 |
| `editor_toolUtilities_terrainPolyPaint.release(rec)` | Cède la peinture d'un enregistrement au terrain (gravure, cuisson) : elle reste peinte et n'est plus retirée avec le reste. | 166 |
| `editor_toolUtilities_terrainPolyPaint.revert(rec)` | Remet les cellules d'un enregistrement dans leurs matériaux d'origine puis fait une mise à jour de grille unique. Les enregistrements peints par-dessus depuis sont retirés d'abord puis remis, pour que chaque cellule retrouve ce qui était vraiment dessous. | 135 |

### Détail des paramètres

#### `editor_toolUtilities_terrainPolyPaint.paintCells(xs, ys, matIdx, prev)`

Peint une liste explicite de cellules (xs/ys monde) toutes avec `matIdx`.

- `xs` (*number[]*) : X monde des cellules.
- `ys` (*number[]*) : Y monde des cellules.
- `matIdx` (*integer*) : Indice de matériau.
- `prev` (*integer[]|nil*) : Matériaux d'origine déjà connus ; s'ils sont absents ou vides, ils sont lus sur le terrain.
- **renvoie** : table|nil Enregistrement d'annulation, nil si la liste est vide ou sans terrain.

#### `editor_toolUtilities_terrainPolyPaint.paintRing(ring, mat)`

Peint les cellules du terrain à l'intérieur de `ring` (remplissage par balayage), puis rafraîchit la grille sur la boîte touchée. Renvoie l'enregistrement d'annulation, nil si rien n'a été peint.

- `ring` (*table*) : Anneau de points en XY monde (3 au moins).
- `mat` (*integer|function*) : Indice de couche pour tout l'anneau, ou fonction mat(gx, gy, wx, wy) interrogée par cellule qui renvoie un indice, ou nil pour laisser la cellule.
- **renvoie** : table|nil Enregistrement { xs, ys, prev, cnt, ... }.

#### `editor_toolUtilities_terrainPolyPaint.release(rec)`

Cède la peinture d'un enregistrement au terrain (gravure, cuisson) : elle reste peinte et n'est plus retirée avec le reste.

- `rec` (*table|nil*) : Enregistrement.

#### `editor_toolUtilities_terrainPolyPaint.revert(rec)`

Remet les cellules d'un enregistrement dans leurs matériaux d'origine puis fait une mise à jour de grille unique. Les enregistrements peints par-dessus depuis sont retirés d'abord puis remis, pour que chaque cellule retrouve ce qui était vraiment dessous.

- `rec` (*table|nil*) : Enregistrement renvoyé par paintRing ou paintCells.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua`.*
