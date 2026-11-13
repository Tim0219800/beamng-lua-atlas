# `editor_toolUtilities_walkRibbon`

*Fichier : `lua/ge/extensions/editor/toolUtilities/walkRibbon.lua` · VM : Game Engine (GE) · 335 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_walkRibbon` : `extensions.load("editor_toolUtilities_walkRibbon")`, puis la globale `editor_toolUtilities_walkRibbon`

Génère un trottoir bordé (bordure et dalles) balayé le long de deux rails, sous forme d'un seul mesh unique, pour les outils de routes de l'éditeur. Les parties de mesh sont regroupées par matériau (deux trottoirs de même pierre partagent un même mesh, donc un seul draw). Gère aussi les bordures abaissées au droit des passages piétons : le trottoir s'affleure sur la zone du passage et remonte en rampe de chaque côté. Utilise meshPart (face4, face4n) et kerbSpec (matériaux et cotes de bordure).

## Exemple

```lua
local wr = require('editor/toolUtilities/walkRibbon')
local inner2, outer2, scale = wr.crossingDips(road.crossings, road.divPoints, inner, outer)
local tris = wr.build(inner2, outer2, { parts = parts, scale = scale, paving = 'slab_mat', uvs = 1.0 })
```

## Remarques

- Constantes : rampe de 1.5 m (crossingRampM), partie à plat de 3.5 m (crossingDepthM) quand le passage n'indique rien, rééchantillonnage tous les 0.4 m dans la zone d'un passage.
- Sans densification, un rail grossier peut n'avoir aucune station dans la bande du passage et le trottoir resterait plein hauteur : c'est pourquoi crossingDips redécoupe les segments.
- build renvoie 0 s'il y a moins de 2 stations communes ou si opts.parts est absent.
- Les rails sont des listes de points { x, y, z } de même longueur : la ligne de bordure côté route (inner) et le fond du pavage (outer).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_walkRibbon.build(inner, outer, opts)` | Balaie le trottoir entre deux rails correspondants : la ligne de bordure sur la route et le fond du pavage. Ajoute des faces dans opts.parts (un mesh par matériau). Les options : parts (obligatoire, liste de parties), paving (matériau des dalles, défaut celui de kerbSpec), variant (variante de bordure), caps (fermer les extrémités, vrai par défaut), scale (hauteur de bordure par station, 0 = bordure supprimée), uvs (nombre de dalles au mètre), worldUv (poser le pavage depuis x,y monde), uRail (rail sur lequel mesurer les UV en long), bury (profondeur enterrée), back (faux pour ne pas fermer le fond). | 73 |
| `editor_toolUtilities_walkRibbon.crossingDips(crossings, div, inner, outer)` | Densifie inner/outer dans la bande de chaque passage (environ tous les 0.4 m) et renvoie les rails densifiés avec le multiplicateur d'abaissement par station. Les centres des passages sont projetés sur le rail à partir de la position t le long de la ligne centrale. Renvoie les rails d'ORIGINE et nil si la route n'a pas de passage ou de ligne centrale. | 261 |
| `editor_toolUtilities_walkRibbon.dropScale(cum, centres, depths)` | Multiplicateur de hauteur de bordure par station pour un trottoir traversé par des passages piétons : 0 (à ras) sur chaque passage, rampe de part et d'autre, 1 ailleurs. `cum`, `centres` et `depths` sont des abscisses curvilignes sur le rail. nil si aucun passage n'atteint le trottoir. | 190 |
| `editor_toolUtilities_walkRibbon.rise()` | Hauteur de la surface de marche au-dessus de la route sur laquelle repose le rail intérieur (kerbH de kerbSpec). | 320 |
| `editor_toolUtilities_walkRibbon.width()` | Distance dont le rail extérieur doit s'écarter de l'intérieur : la bordure plus une dalle (kerbW + slabW de kerbSpec). | 315 |

### Détail des paramètres

#### `editor_toolUtilities_walkRibbon.build(inner, outer, opts)`

Balaie le trottoir entre deux rails correspondants : la ligne de bordure sur la route et le fond du pavage. Ajoute des faces dans opts.parts (un mesh par matériau). Les options : parts (obligatoire, liste de parties), paving (matériau des dalles, défaut celui de kerbSpec), variant (variante de bordure), caps (fermer les extrémités, vrai par défaut), scale (hauteur de bordure par station, 0 = bordure supprimée), uvs (nombre de dalles au mètre), worldUv (poser le pavage depuis x,y monde), uRail (rail sur lequel mesurer les UV en long), bury (profondeur enterrée), back (faux pour ne pas fermer le fond).

- `inner` (*table*) : Rail intérieur, liste de { x, y, z } (ligne de bordure).
- `outer` (*table*) : Rail extérieur, liste de { x, y, z } (fond du pavage).
- `opts` (*table*) : Options décrites ci-dessus ; opts.parts requis.
- **renvoie** : integer Nombre de triangles écrits (0 si rien).

#### `editor_toolUtilities_walkRibbon.crossingDips(crossings, div, inner, outer)`

Densifie inner/outer dans la bande de chaque passage (environ tous les 0.4 m) et renvoie les rails densifiés avec le multiplicateur d'abaissement par station. Les centres des passages sont projetés sur le rail à partir de la position t le long de la ligne centrale. Renvoie les rails d'ORIGINE et nil si la route n'a pas de passage ou de ligne centrale.

- `crossings` (*table|nil*) : Passages de la route, liste de { t (0..1, 0.5 par défaut), depthM }.
- `div` (*table*) : Ligne centrale de la route (liste de points).
- `inner` (*table*) : Rail intérieur.
- `outer` (*table*) : Rail extérieur.
- **renvoie** : table Rail intérieur (densifié ou d'origine).
- **renvoie** : table Rail extérieur.
- **renvoie** : number[]|nil Multiplicateur par station, nil s'il n'y a pas de passage.

#### `editor_toolUtilities_walkRibbon.dropScale(cum, centres, depths)`

Multiplicateur de hauteur de bordure par station pour un trottoir traversé par des passages piétons : 0 (à ras) sur chaque passage, rampe de part et d'autre, 1 ailleurs. `cum`, `centres` et `depths` sont des abscisses curvilignes sur le rail. nil si aucun passage n'atteint le trottoir.

- `cum` (*number[]*) : Abscisse curviligne cumulée de chaque station.
- `centres` (*number[]*) : Abscisse du centre de chaque passage.
- `depths` (*number[]|nil*) : Profondeur (m) de chaque passage ; 3.5 par défaut.
- **renvoie** : number[]|nil Un multiplicateur par station entre 0 et 1.

#### `editor_toolUtilities_walkRibbon.rise()`

Hauteur de la surface de marche au-dessus de la route sur laquelle repose le rail intérieur (kerbH de kerbSpec).

- **renvoie** : number Hauteur en mètres.

#### `editor_toolUtilities_walkRibbon.width()`

Distance dont le rail extérieur doit s'écarter de l'intérieur : la bordure plus une dalle (kerbW + slabW de kerbSpec).

- **renvoie** : number Largeur en mètres.

## Champs

| Champ | Type | Description |
|---|---|---|
| `crossingDepthM` | number | Longueur par défaut de la partie à plat quand le passage n'indique rien (3.5 m). |
| `crossingRampM` | number | Longueur de la rampe de chaque côté d'un passage abaissé (1.5 m). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/walkRibbon.lua`.*
