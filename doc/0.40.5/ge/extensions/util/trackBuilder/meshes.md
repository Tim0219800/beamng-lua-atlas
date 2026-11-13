# `util_trackBuilder_meshes`

*Fichier : `lua/ge/extensions/util/trackBuilder/meshes.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_meshes` : `extensions.load("util_trackBuilder_meshes")`, puis la globale `util_trackBuilder_meshes`

Table de profils de sections (cross-sections) prédéfinis du Track Builder : murs latéraux, murs inclinés et tubes. Chaque profil est une table {crossPoints, cap, uv, material, flipUVRight, [sharp]} destinée à être extrudée le long d'un segment de piste. Tous utilisent le matériau 'track_editor_border'. Le fichier retourne directement la table (pas de M) ; les noms indiquent la taille : sideWall10 = 1 m de haut, tube5m = rayon 5 m.

## Remarques

- createSideWall(height, angle) : profil de 3 points ; angle (rad, 0 par défaut) incline le mur. sideWallNN : hauteur NN/10 m (01 = 0,1 m, 10 = 1 m, 50 = 5 m, 100 = 10 m). rotWallNN : hauteur 2 m, inclinaison de NN degrés.
- createTube(radius, steps, wallHeight) : profil en arc de cercle (steps segments) de rayon radius, avec une épaisseur de 1 m. Les variantes 'High' ont un mur plus haut ; 'Full' (20 pas, sans mur) fait un tube complet.
- Le mur du tube n'est ajouté que si wallHeight > 0 et steps == 10.
- Les types des champs sont déduits du code : chacun est une table de profil.

## Champs

| Champ | Type | Description |
|---|---|---|
| `rotWall15` | table | Mur de 2 m incliné de 15° (pi/12). |
| `rotWall30` | table | Mur de 2 m incliné de 30° (pi/6). |
| `rotWall45` | table | Mur de 2 m incliné de 45° (pi/4). |
| `rotWall90` | table | Mur de 2 m incliné de 90° (pi/2). |
| `sideWall01` | table | Mur latéral de 0,1 m de haut. |
| `sideWall03` | table | Mur latéral de 0,3 m de haut. |
| `sideWall05` | table | Mur latéral de 0,5 m de haut. |
| `sideWall10` | table | Mur latéral de 1 m de haut. |
| `sideWall100` | table | Mur latéral de 10 m de haut. |
| `sideWall50` | table | Mur latéral de 5 m de haut. |
| `tube10m` | table | Tube de rayon 10 m avec mur de 2 m. |
| `tube10mFull` | table | Tube de rayon 10 m complet (20 pas). |
| `tube10mHigh` | table | Tube de rayon 10 m avec mur de 10 m. |
| `tube5m` | table | Tube de rayon 5 m avec mur de 1 m. |
| `tube5mFull` | table | Tube de rayon 5 m complet (20 pas). |
| `tube5mHigh` | table | Tube de rayon 5 m avec mur de 5 m. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/meshes.lua`.*
