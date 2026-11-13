# `util_trackBuilder_pieces`

*Fichier : `lua/ge/extensions/util/trackBuilder/pieces.lua` · VM : Game Engine (GE) · 564 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_pieces` : `extensions.load("util_trackBuilder_pieces")`, puis la globale `util_trackBuilder_pieces`

Catalogue géométrique des « pièces » du Track Builder (hex, square, free). Chaque fonction reçoit les paramètres d'une pièce et renvoie, à partir de la pièce précédente (la 'tipPiece' mémorisée par toSegment), une table décrivant la nouvelle extrémité : position, origin, hdg (cap en radians), polyMult (densité de points) et pointsType ('bezier', 'arc' ou 'custom'), avec points de contrôle (controlPointA/B), rayon/angle ou points personnalisés. toSegment est le point d'entrée : il choisit la fonction selon piece.piece (init, hexForward, hexCurve, freeBezier, hexLoop, etc.).

## Exemple

```lua
local seg = util_trackBuilder_pieces.toSegment({piece = 'hexCurve', length = 4, direction = 1, hardness = 0}, tip)
```

## Remarques

- Le cap hdg est en radians ; getHdgVector(hdg) = (sin hdg, cos hdg, 0) : le cap 0 pointe vers +Y.
- Échelle hex : décalage latéral multiplié par sqrt(3)/2 ; les courbes hex utilisent radiusMult = sqrt(3), square 1. Les angles hex sont des pas de pi/3, square de pi/2, free en degrés (convertis).
- toSegment mémorise tip dans une variable locale (tipPiece) utilisée par toutes les autres fonctions : elles ne sont utilisables qu'après un appel de toSegment (sauf si la tipPiece a été définie par un appel précédent).
- Bug probable : customBezier appelle toujours M.splineTrack.getTrackPosition(), même sans absolute, mais M.splineTrack est nil dans ce fichier (le champ doit être renseigné de l'extérieur par splineTrack) ; emptyOffset avec absolute l'utilise aussi.
- Bug : freeSpiral laisse forwardCPLength et backwardCPLength à nil si angle > 75° (pi*75/180), ce qui provoque une erreur arithmétique.
- fresnelSC référence une variable globale 'subs' non définie (nil, sans effet).
- emptyOffset avec absolute modifie tipPiece.position et tipPiece.hdg (effet de bord).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_pieces.bezierCurve(radius, angle, direction, hardness, radiusMult)` | Courbe de Bézier approchant un arc (constante 0,5523) ; hardness change la longueur des tangentes (négatif : réduit, positif : augmente). | 118 |
| `util_trackBuilder_pieces.curve(radius, angle, direction, hardness, radiusMult)` | Virage de rayon et d'angle donnés. Si hardness est non nul, passe par bezierCurve ; sinon renvoie un arc ('arc') avec radius, angle et direction. | 142 |
| `util_trackBuilder_pieces.customBezier(xOff, yOff, dirOff, forwardLen, backwardLen, isHex, absolute, empty)` | Bézier libre : décalage (xOff, yOff), changement de cap dirOff et longueurs des tangentes avant/arrière. En mode absolute, le décalage est calculé depuis la position courante du curseur de piste (splineTrack.getTrackPosition()). Renvoie aussi des positions/caps locaux et globaux. | 193 |
| `util_trackBuilder_pieces.emptyOffset(xOff, yOff, zOff, dirOff, absolute, isHex)` | Déplace le curseur de piste sans générer de géométrie (noPoints). Peut aussi changer le cap (dirOff en pas de pi/3 en hex, pi/2 sinon) et la hauteur (zOff). | 510 |
| `util_trackBuilder_pieces.forward(length)` | Ligne droite de la longueur donnée dans la direction de la tipPiece (points de contrôle à 25 % de la longueur). | 101 |
| `util_trackBuilder_pieces.freeSpiral(size, inside, dir, angle)` | Spirale à angle libre ; les longueurs de tangentes sont choisies par tranches de 15° jusqu'à 75°. | 314 |
| `util_trackBuilder_pieces.fresnelSC(d)` | Fonction auxiliaire pour les loopings : intègre numériquement la spirale d'Euler (clothoïde, intégrales de Fresnel cos/sin(t²·pi/2)) de 0 à d. | 375 |
| `util_trackBuilder_pieces.getHdgVector(hdg)` | Renvoie le vecteur unitaire horizontal du cap : (sin hdg, cos hdg, 0). | 87 |
| `util_trackBuilder_pieces.hexSpiral(size, inside, dir)` | Spirale hexagonale (virage de 60°) vers l'intérieur ou l'extérieur, décrite par une Bézier. | 249 |
| `util_trackBuilder_pieces.initialTrackPiece(p)` | Pièce initiale : position (0,0,0) et cap 0 par défaut, sans points. | 91 |
| `util_trackBuilder_pieces.loop(xOffset, radius, isHex)` | Looping vertical construit avec une clothoïde, avec décalage latéral xOffset réparti en pente douce ; renvoie jusqu'à 300 points personnalisés (position, rot). | 403 |
| `util_trackBuilder_pieces.offsetCurve(length, xOffset, hardness, isHex)` | Courbe en S de longueur donnée décalée latéralement de xOffset ; en hex, ajoute 0,5 à la longueur si xOffset est impair pour rester sur la grille triangulaire. | 165 |
| `util_trackBuilder_pieces.rotateVectorByQuat(v, q)` | Fonction auxiliaire : renvoie q * v. | 539 |
| `util_trackBuilder_pieces.squareSpiral(size, inside, dir)` | Spirale carrée (virage de 90°), même principe que hexSpiral. | 282 |
| `util_trackBuilder_pieces.toSegment(piece, tip)` | Convertit la description d'une pièce en table de segment. Mémorise tip comme pièce précédente puis délègue à initialTrackPiece, forward, curve, offsetCurve, customBezier, hexSpiral, squareSpiral, freeSpiral, loop ou emptyOffset selon piece.piece. Renvoie nil si le type est inconnu. | 12 |

### Détail des paramètres

#### `util_trackBuilder_pieces.bezierCurve(radius, angle, direction, hardness, radiusMult)`

Courbe de Bézier approchant un arc (constante 0,5523) ; hardness change la longueur des tangentes (négatif : réduit, positif : augmente).

- `radius` (*number*) : Rayon de base.
- `angle` (*number*) : Angle de virage (rad).
- `direction` (*number*) : Sens du virage : 1 ou -1.
- `hardness` (*number*) : Dureté de la courbe.
- `radiusMult` (*number*) : Multiplicateur du rayon (sqrt(3) en hex, 1 sinon).
- **renvoie** : table Pièce de type 'bezier'.

#### `util_trackBuilder_pieces.curve(radius, angle, direction, hardness, radiusMult)`

Virage de rayon et d'angle donnés. Si hardness est non nul, passe par bezierCurve ; sinon renvoie un arc ('arc') avec radius, angle et direction.

- `radius` (*number*) : Rayon.
- `angle` (*number*) : Angle (rad).
- `direction` (*number*) : 1 ou -1 (gauche/droite).
- `hardness` (*number|nil*) : Dureté ; 0 ou nil pour un arc pur.
- `radiusMult` (*number*) : Multiplicateur du rayon.
- **renvoie** : table Pièce de type 'arc' ou 'bezier'.

#### `util_trackBuilder_pieces.customBezier(xOff, yOff, dirOff, forwardLen, backwardLen, isHex, absolute, empty)`

Bézier libre : décalage (xOff, yOff), changement de cap dirOff et longueurs des tangentes avant/arrière. En mode absolute, le décalage est calculé depuis la position courante du curseur de piste (splineTrack.getTrackPosition()). Renvoie aussi des positions/caps locaux et globaux.

- `xOff` (*number*) : Décalage latéral.
- `yOff` (*number*) : Décalage vers l'avant.
- `dirOff` (*number*) : Changement de cap (rad).
- `forwardLen` (*number*) : Longueur de la tangente de départ.
- `backwardLen` (*number*) : Longueur de la tangente d'arrivée.
- `isHex` (*boolean*) : Grille hexagonale.
- `absolute` (*boolean|nil*) : Position relative au curseur de piste plutôt qu'à la dernière pièce.
- `empty` (*boolean|nil*) : Si vrai, aucune géométrie générée (noPoints).
- **renvoie** : table Pièce de type 'bezier' (avec globalPosition, localPosition, globalHdg, localHdg).

#### `util_trackBuilder_pieces.emptyOffset(xOff, yOff, zOff, dirOff, absolute, isHex)`

Déplace le curseur de piste sans générer de géométrie (noPoints). Peut aussi changer le cap (dirOff en pas de pi/3 en hex, pi/2 sinon) et la hauteur (zOff).

- `xOff` (*number*) : Décalage latéral.
- `yOff` (*number*) : Décalage vers l'avant.
- `zOff` (*number*) : Décalage vertical.
- `dirOff` (*number*) : Nombre de pas de rotation.
- `absolute` (*boolean|nil*) : Part de la position du curseur de piste.
- `isHex` (*boolean*) : Grille hexagonale.
- **renvoie** : table Pièce vide.

#### `util_trackBuilder_pieces.forward(length)`

Ligne droite de la longueur donnée dans la direction de la tipPiece (points de contrôle à 25 % de la longueur).

- `length` (*number*) : Longueur en mètres.
- **renvoie** : table Pièce de type 'bezier'.

#### `util_trackBuilder_pieces.freeSpiral(size, inside, dir, angle)`

Spirale à angle libre ; les longueurs de tangentes sont choisies par tranches de 15° jusqu'à 75°.

- `size` (*number*) : Taille.
- `inside` (*boolean*) : Spirale vers l'intérieur.
- `dir` (*number*) : Sens : 1 ou -1.
- `angle` (*number*) : Angle en radians (au plus 75° = 1,309 rad, sinon erreur).
- **renvoie** : table Pièce de type 'bezier'.

#### `util_trackBuilder_pieces.fresnelSC(d)`

Fonction auxiliaire pour les loopings : intègre numériquement la spirale d'Euler (clothoïde, intégrales de Fresnel cos/sin(t²·pi/2)) de 0 à d.

- `d` (*number*) : Borne supérieure d'intégration.
- **renvoie** : table {x, y} du point de la clothoïde.

#### `util_trackBuilder_pieces.getHdgVector(hdg)`

Renvoie le vecteur unitaire horizontal du cap : (sin hdg, cos hdg, 0).

- `hdg` (*number*) : Cap en radians.
- **renvoie** : vec3 Direction.

#### `util_trackBuilder_pieces.hexSpiral(size, inside, dir)`

Spirale hexagonale (virage de 60°) vers l'intérieur ou l'extérieur, décrite par une Bézier.

- `size` (*number*) : Taille de la spirale.
- `inside` (*boolean*) : Spirale vers l'intérieur.
- `dir` (*number*) : Sens : 1 ou -1.
- **renvoie** : table Pièce de type 'bezier'.

#### `util_trackBuilder_pieces.initialTrackPiece(p)`

Pièce initiale : position (0,0,0) et cap 0 par défaut, sans points.

- `p` (*table|nil*) : Table facultative avec position (vec3) et hdg (rad).
- **renvoie** : table Pièce avec noPoints = true.

#### `util_trackBuilder_pieces.loop(xOffset, radius, isHex)`

Looping vertical construit avec une clothoïde, avec décalage latéral xOffset réparti en pente douce ; renvoie jusqu'à 300 points personnalisés (position, rot).

- `xOffset` (*number*) : Décalage latéral entre l'entrée et la sortie.
- `radius` (*number*) : Rayon (minimum 1).
- `isHex` (*boolean*) : Grille hexagonale (décalage × sqrt(3)).
- **renvoie** : table Pièce de type 'custom' avec customPoints.

#### `util_trackBuilder_pieces.offsetCurve(length, xOffset, hardness, isHex)`

Courbe en S de longueur donnée décalée latéralement de xOffset ; en hex, ajoute 0,5 à la longueur si xOffset est impair pour rester sur la grille triangulaire.

- `length` (*number*) : Longueur vers l'avant.
- `xOffset` (*number*) : Décalage latéral (positif vers la droite du cap).
- `hardness` (*number|nil*) : Dureté (0 par défaut).
- `isHex` (*boolean*) : Grille hexagonale.
- **renvoie** : table Pièce de type 'bezier'.

#### `util_trackBuilder_pieces.rotateVectorByQuat(v, q)`

Fonction auxiliaire : renvoie q * v.

- `v` (*vec3*) : Vecteur.
- `q` (*quat*) : Rotation.
- **renvoie** : vec3 Vecteur tourné.

#### `util_trackBuilder_pieces.squareSpiral(size, inside, dir)`

Spirale carrée (virage de 90°), même principe que hexSpiral.

- `size` (*number*) : Taille.
- `inside` (*boolean*) : Spirale vers l'intérieur.
- `dir` (*number*) : Sens : 1 ou -1.
- **renvoie** : table Pièce de type 'bezier'.

#### `util_trackBuilder_pieces.toSegment(piece, tip)`

Convertit la description d'une pièce en table de segment. Mémorise tip comme pièce précédente puis délègue à initialTrackPiece, forward, curve, offsetCurve, customBezier, hexSpiral, squareSpiral, freeSpiral, loop ou emptyOffset selon piece.piece. Renvoie nil si le type est inconnu.

- `piece` (*table*) : Description de la pièce (champ piece = nom du type, plus length, direction, hardness, radius, xOffset, xOff, yOff, zOff, dirOff, size, inside, angle, absolute, empty… selon le type).
- `tip` (*table*) : Pièce précédente (position, hdg).
- **renvoie** : table|nil Table de segment.

## Champs

| Champ | Type | Description |
|---|---|---|
| `splineTrack` | table|nil | Référence vers le module splineTrack, nil dans ce fichier ; doit fournir getTrackPosition() pour les pièces à positionnement absolu. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/pieces.lua`.*
