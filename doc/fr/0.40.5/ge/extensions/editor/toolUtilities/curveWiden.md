# `editor_toolUtilities_curveWiden`

*Fichier : `lua/ge/extensions/editor/toolUtilities/curveWiden.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_curveWiden` : `extensions.load("editor_toolUtilities_curveWiden")`, puis la globale `editor_toolUtilities_curveWiden`

Élargissement de chaussée dans les virages pour les routes « engineered » des outils de route de l'éditeur. Calcule, par station de la ligne centrale (group.divPoints), un élargissement automatique selon la courbure soutenue (plus le virage est serré par rapport au rayon de conception group.engRadiusM, plus la route s'élargit, jusqu'à curveWidenMaxM) auquel s'ajoutent les extraWidenM par virage. Tout est lissé sur une distance physique (longueur d'arc), pas sur un nombre de stations.

## Remarques

- Actif uniquement si group.geometryMode == 'engineered' ; les routes lisses (Catmull-Rom) ne s'élargissent pas.
- Champs lus du groupe : curveWidenMaxM (défaut 2.5 m, total des deux côtés), curveWidenRunoffM (défaut 20 m, longueur d'entrée/sortie), engRadiusM (défaut 40 m), divCurv (courbure exacte si de longueur n), discMap, corners[i].extraWidenM, divWidths.
- Début d'élargissement au rayon de conception, plein élargissement à 0.35 x ce rayon (plancher 6 m) ; rampe en smoothstep.
- edgeWiden : véhicule de conception de 6 m (offtrackLenM), seuil minimal par voie 0.3 m.
- smoothByDistance modifie le tableau en place.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_curveWiden.applyDivWidthWiden(group)` | Ajoute l'élargissement par station à group.divWidths en place (à appeler une fois par passe 'dirty', juste après l'échantillonnage des largeurs de base). Pour les outils dont le mesh est symétrique selon divWidths, cela élargit le bitume lui-même ; heroRoad élargit son mesh séparément et ne s'en sert que pour déplacer marquages/ruban. Sans effet si rien ne s'élargit. | 161 |
| `editor_toolUtilities_curveWiden.arcLengths(div, n)` | Longueur d'arc cumulée le long des divPoints (s[1] = 0), en 3D. Sert à exprimer le runoff en vraie distance. | 44 |
| `editor_toolUtilities_curveWiden.edgeWiden(group, div, s, n, lanesL, lanesR, divided)` | Élargissement réel par station sur chaque bord (gauche et droit par rapport au sens de marche) : chaque voie prend le « offtracking » du véhicule de conception sur le rayon soutenu, R - sqrt(R^2 - L^2) avec L = 6 m, supprimé sous 0.3 m, le tout plafonné à curveWidenMaxM. Va sur le bord intérieur du virage ; une route à chaussées séparées élargit chaque chaussée sur son bord extérieur (le terre-plein n'a pas de place). | 175 |
| `editor_toolUtilities_curveWiden.signedCurvatureAt(div, i, n)` | Courbure horizontale signée à la station i (0 aux extrémités ou si dégénérée). Positif = virage à gauche, négatif = à droite. | 28 |
| `editor_toolUtilities_curveWiden.smoothByDistance(arr, s, n, hw)` | Lisse en place un tableau signé par moyenne en boîte sur une demi-fenêtre physique hw (m), chaque échantillon étant pondéré par la longueur d'arc qu'il représente. Évite que la zone dense d'un virage domine la moyenne et crée un décrochement latéral à la jonction droite/arc. | 62 |
| `editor_toolUtilities_curveWiden.stationWiden(group, div, s, n)` | Élargissement TOTAL par station (m, réparti sur les deux côtés) : élargissement automatique de courbure plus extraWidenM par virage, lissé en longueur d'arc. Zéro en ligne droite, si curveWidenMaxM = 0 sans surcharge de virage, et hors mode engineered. | 125 |

### Détail des paramètres

#### `editor_toolUtilities_curveWiden.applyDivWidthWiden(group)`

Ajoute l'élargissement par station à group.divWidths en place (à appeler une fois par passe 'dirty', juste après l'échantillonnage des largeurs de base). Pour les outils dont le mesh est symétrique selon divWidths, cela élargit le bitume lui-même ; heroRoad élargit son mesh séparément et ne s'en sert que pour déplacer marquages/ruban. Sans effet si rien ne s'élargit.

- `group` (*table*) : Groupe avec divPoints et divWidths.

#### `editor_toolUtilities_curveWiden.arcLengths(div, n)`

Longueur d'arc cumulée le long des divPoints (s[1] = 0), en 3D. Sert à exprimer le runoff en vraie distance.

- `div` (*table*) : Points {x,y,z}
- `n` (*integer*) : Nombre de points
- **renvoie** : number[] Tableau s des longueurs cumulées (m).

#### `editor_toolUtilities_curveWiden.edgeWiden(group, div, s, n, lanesL, lanesR, divided)`

Élargissement réel par station sur chaque bord (gauche et droit par rapport au sens de marche) : chaque voie prend le « offtracking » du véhicule de conception sur le rayon soutenu, R - sqrt(R^2 - L^2) avec L = 6 m, supprimé sous 0.3 m, le tout plafonné à curveWidenMaxM. Va sur le bord intérieur du virage ; une route à chaussées séparées élargit chaque chaussée sur son bord extérieur (le terre-plein n'a pas de place).

- `group` (*table*) : Groupe/route.
- `div` (*table*) : divPoints
- `s` (*number[]*) : Longueurs d'arc
- `n` (*integer*) : Nombre de stations
- `lanesL` (*number*) : Nombre de voies à gauche
- `lanesR` (*number*) : Nombre de voies à droite
- `divided` (*boolean*) : true si chaussées séparées
- **renvoie** : number[] Élargissement du bord gauche par station (m)
- **renvoie** : number[] Élargissement du bord droit par station (m)

#### `editor_toolUtilities_curveWiden.signedCurvatureAt(div, i, n)`

Courbure horizontale signée à la station i (0 aux extrémités ou si dégénérée). Positif = virage à gauche, négatif = à droite.

- `div` (*table*) : Points de la ligne centrale {x,y,z}
- `i` (*integer*) : Indice de station
- `n` (*integer*) : Nombre de stations
- **renvoie** : number Courbure en 1/m.

#### `editor_toolUtilities_curveWiden.smoothByDistance(arr, s, n, hw)`

Lisse en place un tableau signé par moyenne en boîte sur une demi-fenêtre physique hw (m), chaque échantillon étant pondéré par la longueur d'arc qu'il représente. Évite que la zone dense d'un virage domine la moyenne et crée un décrochement latéral à la jonction droite/arc.

- `arr` (*number[]*) : Valeurs à lisser (modifié en place)
- `s` (*number[]*) : Table de longueurs d'arc
- `n` (*integer*) : Nombre d'échantillons
- `hw` (*number*) : Demi-fenêtre en mètres ; sans effet si <= 0 ou n < 3

#### `editor_toolUtilities_curveWiden.stationWiden(group, div, s, n)`

Élargissement TOTAL par station (m, réparti sur les deux côtés) : élargissement automatique de courbure plus extraWidenM par virage, lissé en longueur d'arc. Zéro en ligne droite, si curveWidenMaxM = 0 sans surcharge de virage, et hors mode engineered.

- `group` (*table*) : Groupe/route (geometryMode, curveWidenMaxM, curveWidenRunoffM, engRadiusM, divCurv, discMap, corners).
- `div` (*table*) : divPoints
- `s` (*number[]*) : Résultat de arcLengths
- `n` (*integer*) : Nombre de stations
- **renvoie** : number[] Élargissement par station (m).

## Champs

| Champ | Type | Description |
|---|---|---|
| `DEFAULT_MAX` | number | Élargissement maximal par défaut (2.5 m au total, répartis sur les deux côtés). |
| `DEFAULT_RUNOFF` | number | Longueur par défaut (20 m) sur laquelle l'élargissement entre/sort. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/curveWiden.lua`.*
