# `editor_toolUtilities_profileSweep`

*Fichier : `lua/ge/extensions/editor/toolUtilities/profileSweep.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_profileSweep` : `extensions.load("editor_toolUtilities_profileSweep")`, puis la globale `editor_toolUtilities_profileSweep`

Balayage de profil : des bandes 2D ouvertes (latéral y, hauteur z) sont balayées le long d'une suite de stations portant chacune leur repère, pour produire un maillage unique par matériau. Contrairement à deckSweep, le repère est fourni par l'appelant (binormale inclinée et normale d'une route), donc la section tourne avec la route. Les stations sont décimées selon une tolérance de corde sur le centre et deux points clés de la section (meshRefine.decimateStations).

## Remarques

- Dépend de editor/toolUtilities/meshPart et editor/heroRoadEditor/meshRefine.
- Les UV sont {longueur d'arc de la station s, abscisse curviligne le long de la bande}.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_profileSweep.at(a, y, z)` | Point monde du point de section (y, z) à la station a : a.pos + a.b * y + a.n * z. | 22 |
| `editor_toolUtilities_profileSweep.build(st, strips, opts)` | Balaye les bandes le long des stations. Chaque station : { x,y,z, bx,by,bz (transversal), nx,ny,nz (haut), s (abscisse) }. Chaque bande : { pts = {{y,z},...}, nrm = {{ny,nz},...} (normales unitaires vers la face visible), mat }. Les faces quadrangulaires sont générées par meshPart.face4n. | 45 |

### Détail des paramètres

#### `editor_toolUtilities_profileSweep.at(a, y, z)`

Point monde du point de section (y, z) à la station a : a.pos + a.b * y + a.n * z.

- `a` (*table*) : Station avec x,y,z, bx,by,bz (vecteur transversal) et nx,ny,nz (vecteur haut).
- `y` (*number*) : Décalage latéral dans la section.
- `z` (*number*) : Hauteur dans la section.
- **renvoie** : table Point {x,y,z}.

#### `editor_toolUtilities_profileSweep.build(st, strips, opts)`

Balaye les bandes le long des stations. Chaque station : { x,y,z, bx,by,bz (transversal), nx,ny,nz (haut), s (abscisse) }. Chaque bande : { pts = {{y,z},...}, nrm = {{ny,nz},...} (normales unitaires vers la face visible), mat }. Les faces quadrangulaires sont générées par meshPart.face4n.

- `st` (*table*) : Liste de stations.
- `strips` (*table*) : Liste de bandes de profil.
- `opts` (*table*) : { tol, tolZ, maxSeg } pour la décimation, keyL et keyR = points de section {y,z} surveillés.
- **renvoie** : table|nil Parts (une par matériau) ; nil si moins de 2 stations.
- **renvoie** : table Indices des stations conservées.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/profileSweep.lua`.*
