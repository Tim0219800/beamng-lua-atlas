# `editor_toolUtilities_deckSweep`

*Fichier : `lua/ge/extensions/editor/toolUtilities/deckSweep.lua` · VM : Game Engine (GE) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_deckSweep` : `extensions.load("editor_toolUtilities_deckSweep")`, puis la globale `editor_toolUtilities_deckSweep`

« Deck sweep » : balaie une dalle bombée le long d'une ligne centrale quelconque pour produire UN mesh unique. La section (chaussée bombée à la ligne, trottoirs plats à l'extérieur, côtés verticaux, sous-face plate) est posée à chaque station de la ligne dense ; les stations sont décimées selon une tolérance de corde (plan et vertical séparés) ; chaque extrémité peut s'effiler en jupe (dessus incliné, sous-face remontée en lèvre fine) pour se raccorder au sol. Les largeurs peuvent varier par station. Dépend de editor/toolUtilities/meshPart et editor/heroRoadEditor/meshRefine.

## Remarques

- La tolérance opts.tol est requise (utilisée par meshRefine.decimateStations) ; opts.tolZ nil = tol borne aussi le vertical.
- chamfer.atStart / chamfer.atEnd = false laissent l'extrémité carrée (la dalle bute sur une autre).
- Si sec.topMat == sec.bodyMat un seul part est renvoyé, sinon deux (corps puis dessus).
- Les UV sont métriques : u = abscisse le long du tablier, v = décalage latéral (dessus/soffite) ou hauteur (côtés).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_deckSweep.build(dp, sec, opts)` | Balaye le tablier le long de la ligne dense `dp`. Renvoie les parts de mesh et les indices des stations denses conservées, ou nil si la ligne est dégénérée (moins de 2 points ou longueur < 1 mm). | 126 |

### Détail des paramètres

#### `editor_toolUtilities_deckSweep.build(dp, sec, opts)`

Balaye le tablier le long de la ligne dense `dp`. Renvoie les parts de mesh et les indices des stations denses conservées, ou nil si la ligne est dégénérée (moins de 2 points ou longueur < 1 mm).

- `dp` (*table*) : Ligne dense de vec3 ou tables {x,y,z}.
- `sec` (*table*) : { extL, extR, fwL, fwR (nombres ou tableaux par station : demi-largeur chaussée gauche/droite et largeur de trottoir), crown (creux du bombement), flatEnd (m sur lesquels le bombement s'efface vers le plat à chaque extrémité ; nil/0 = aucun), slabT (épaisseur de dalle), topMat, bodyMat, chamfer = { len, drop, lipT, atStart?, atEnd? } | nil }
- `opts` (*table*) : { tol (tolérance de corde en plan, m), tolZ (tolérance verticale, m ; nil = tol), maxSeg (plus grand intervalle conservé, m) }
- **renvoie** : table|nil Liste de parts de mesh ({ bodyPart[, topPart] }).
- **renvoie** : integer[] Indices de stations denses conservées.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/deckSweep.lua`.*
