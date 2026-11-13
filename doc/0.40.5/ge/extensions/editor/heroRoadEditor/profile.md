# `editor_heroRoadEditor_profile`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/profile.lua` · VM : Game Engine (GE) · 375 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_profile` : `extensions.load("editor_heroRoadEditor_profile")`, puis la globale `editor_heroRoadEditor_profile`

Profil en travers d'un groupe du Hero Road Editor. Transforme les paramètres de voie, de bombé (crown) et d'accotement en une coupe 2D par station (décalage latéral o, écart vertical dz par rapport au plan de la ligne centrale) et en un angle de dévers (bank) piloté par la courbure. mesh.lua balaie ces coupes le long de la route pour fabriquer la surface. Gère aussi l'élargissement en courbe, les élargissements posés (laybys, voies, carrefours), les extrémités plates et un plafond anti-repli du bord intérieur.

## Remarques

- Paramètres lus sur le groupe (défaut) : leftExtM/rightExtM 5.0 m, crownOn (true sauf false), crossfallPct 2.5 %, shoulderWidthM 0, shoulderFallPct 6 %, superElevMaxDeg 6 degrés, superMinRadiusM 80 m (min 1), latRes 4 sous-divisions par côté, curveWidenMaxM, flatEnds / flatEndLenM, sideChamfers / chamferWidthM 0.6 m.
- Le bombé est parabolique (sommet plat au centre, pas de pli central) ; il s'efface en courbe (facteur 1 - |t|) et aux extrémités plates.
- Le dévers atteint son maximum quand le rayon vaut superMinRadiusM ; il est lissé sur une demi-fenêtre de 18 m. En mode group.geometryMode == 'engineered', des superElevDeg par virage (group.corners) peuvent le remplacer.
- Anti-repli : le côté intérieur est limité à 0.8 fois le rayon de virage local (foldSafety), la courbure exacte divCurv étant utilisée si elle est alignée sur les stations, sinon une estimation par trame discrète ; la contrainte est érodée sur 8 m.
- Le nombre de colonnes est constant (accotement + 2*latRes + accotement) : toutes les stations ont la même forme de coupe.
- build renvoie nil, nil si divPoints a moins de 2 points ou si tangents est absent.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_profile.build(group)` | Construit les coupes par station et le dévers pour le groupe. Chaque coupe est une liste de points {o, dz} de gauche à droite. | 283 |
| `editor_heroRoadEditor_profile.minSafeRadius(group)` | Plus petit rayon (m) de ligne centrale que le groupe peut arrondir avant que le plafond de repli du bord intérieur ne morde : demi-largeur intérieure (largeur max + accotement + chanfrein + moitié de l'élargissement max) divisée par 0.8, plus 1.5 m de marge. | 349 |
| `editor_heroRoadEditor_profile.previewCrossSection(group)` | Coupe d'une section droite (bombé complet, sans dévers ni plafond de repli) pour l'aperçu en lecture seule de l'interface. | 360 |

### Détail des paramètres

#### `editor_heroRoadEditor_profile.build(group)`

Construit les coupes par station et le dévers pour le groupe. Chaque coupe est une liste de points {o, dz} de gauche à droite.

- `group` (*table*) : Groupe Hero Road (divPoints, tangents, divCurv, discMap, corners, widenings, junctions, paramètres de profil).
- **renvoie** : table|nil Tableau sur divPoints de { pts = {{o, dz}, ...}, bank = angle en radians }, ou nil si la géométrie n'est pas prête.
- **renvoie** : string[]|nil Clé de matériau par bande (MAT_ROAD ou MAT_SHOULDER), une entrée par segment de coupe.

#### `editor_heroRoadEditor_profile.minSafeRadius(group)`

Plus petit rayon (m) de ligne centrale que le groupe peut arrondir avant que le plafond de repli du bord intérieur ne morde : demi-largeur intérieure (largeur max + accotement + chanfrein + moitié de l'élargissement max) divisée par 0.8, plus 1.5 m de marge.

- `group` (*table*) : Groupe Hero Road.
- **renvoie** : number Rayon minimal sûr en mètres.

#### `editor_heroRoadEditor_profile.previewCrossSection(group)`

Coupe d'une section droite (bombé complet, sans dévers ni plafond de repli) pour l'aperçu en lecture seule de l'interface.

- `group` (*table*) : Groupe Hero Road.
- **renvoie** : table Liste de points {o, dz}.
- **renvoie** : string[] Matériau par bande.

## Champs

| Champ | Type | Description |
|---|---|---|
| `MAT_ROAD` | string | Clé de matériau de bande 'road' (résolue en vrai matériau dans mesh.lua). |
| `MAT_SHOULDER` | string | Clé de matériau de bande 'shoulder'. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/profile.lua`.*
