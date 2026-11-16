# `gameplay_rally_snaproad_geoPacenotes`

*Fichier : `lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua` · VM : Game Engine (GE) · 850 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_snaproad_geoPacenotes` : `extensions.load("gameplay_rally_snaproad_geoPacenotes")`, puis la globale `gameplay_rally_snaproad_geoPacenotes`

Mesure géométrique des virages des pacenotes à partir de la route (snaproad). À partir des points d'une partition, il ajuste un ou plusieurs cercles (méthode 2D à trois points) pour obtenir rayon, diamètre, longueur d'arc, angle et qualité d'ajustement, en trois variantes : 'single' (un cercle), 'split2' (deux parties), 'split3' (trois parties). Il en déduit l'intensité du virage (selon le compositeur de texte du notebook), le sens, les candidats d'épingle à cheveux et l'évolution du diamètre. Il dessine aussi la mesure en debug. Appelé par Snaproad:measurePartition dans l'éditeur de rallye.

## Remarques

- measurePartition écrit dans pn.measurements : variants (single/split2/split3), diagnostics, corner1 (alias de variants.single), corner2 (nil), selectedType, selected, hairpinCandidate, diameterChange {change, changePercent, isOpening, isTightening}. Les alias corner1/corner2 sont gardés pour la compatibilité des exports et outils de debug.
- Il faut au moins 3 points focus et un halfpoint (halfpointPos ou halfpoint) sur le pacenote, sinon la mesure est abandonnée sans erreur.
- Qualité d'ajustement du cercle : RMSE normalisé par le rayon ; < 0,05 excellent, 0,05 à 0,15 bon, > 0,15 mauvais ou virage composé (commentaire du code).
- Le paramètre skipAuto de measurePartition n'est pas utilisé.
- Le module dépend de editor/roadArchitect/utilities (circle2DFrom3Points) : il n'est utilisable que dans un contexte où l'éditeur est disponible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_snaproad_geoPacenotes.calculateCircleFromPoints2(p1, p2, p3)` | Calcule le cercle passant par trois points avec la méthode 2D (XY) : centre (Z moyen des trois points), rayon (distance 2D du centre à p1) et longueur d'arc de p1 à p3 par p2 (sens déterminé par le produit vectoriel). | 220 |
| `gameplay_rally_snaproad_geoPacenotes.calculateMiddlePoint(pn, startPos, endPos, partition)` | Point milieu d'un virage : halfpointPos ou halfpoint du pacenote s'il existe, sinon le point focus de la partition le plus proche du milieu géométrique entre début et fin. | 515 |
| `gameplay_rally_snaproad_geoPacenotes.drawPacenoteMeasurement(center, radius, arcDistance, p1, p2, p3, clr, alpha, prefix, fitQuality, arcDegrees)` | Dessine une mesure avec debugDrawer : arc de cercle en prismes, rayons, et texte d'arc (longueur, diamètre, qualité d'ajustement, angle). Ne dessine rien si le centre est nil ou le rayon <= 0. | 773 |
| `gameplay_rally_snaproad_geoPacenotes.measurePartition(pn, focusPoints, skipAuto)` | Mesure le virage d'un pacenote à partir des points focus de la partition : construit le chemin, ajuste les cercles des trois variantes, annote intensité, sens et épingle à cheveux, et renseigne pn.measurements (voir notes). | 800 |
| `gameplay_rally_snaproad_geoPacenotes.measurementTypeOptions()` | Liste ordonnée des définitions de types de mesure (pour une liste déroulante). | 32 |
| `gameplay_rally_snaproad_geoPacenotes.normalizeMeasurementType(measurementType)` | Renvoie le type s'il existe, sinon le type par défaut ('single'). | 27 |

### Détail des paramètres

#### `gameplay_rally_snaproad_geoPacenotes.calculateCircleFromPoints2(p1, p2, p3)`

Calcule le cercle passant par trois points avec la méthode 2D (XY) : centre (Z moyen des trois points), rayon (distance 2D du centre à p1) et longueur d'arc de p1 à p3 par p2 (sens déterminé par le produit vectoriel).

- `p1` (*vec3*) : Premier point
- `p2` (*vec3*) : Point intermédiaire
- `p3` (*vec3*) : Dernier point
- **renvoie** : vec3|nil Centre ; nil si les points sont alignés
- **renvoie** : number Rayon en mètres (0 si échec)
- **renvoie** : number Longueur d'arc en mètres (0 si échec)

#### `gameplay_rally_snaproad_geoPacenotes.calculateMiddlePoint(pn, startPos, endPos, partition)`

Point milieu d'un virage : halfpointPos ou halfpoint du pacenote s'il existe, sinon le point focus de la partition le plus proche du milieu géométrique entre début et fin.

- `pn` (*table*) : Pacenote
- `startPos` (*vec3*) : Début du virage
- `endPos` (*vec3*) : Fin du virage
- `partition` (*table*) : Partition avec focus_points
- **renvoie** : vec3 Position du milieu

#### `gameplay_rally_snaproad_geoPacenotes.drawPacenoteMeasurement(center, radius, arcDistance, p1, p2, p3, clr, alpha, prefix, fitQuality, arcDegrees)`

Dessine une mesure avec debugDrawer : arc de cercle en prismes, rayons, et texte d'arc (longueur, diamètre, qualité d'ajustement, angle). Ne dessine rien si le centre est nil ou le rayon <= 0.

- `center` (*vec3|nil*) : Centre du cercle
- `radius` (*number*) : Rayon (m)
- `arcDistance` (*number*) : Longueur d'arc (m)
- `p1` (*vec3*) : Début de l'arc
- `p2` (*vec3*) : Point intermédiaire
- `p3` (*vec3*) : Fin de l'arc
- `clr` (*table|nil*) : Couleur (violet par défaut)
- `alpha` (*number|nil*) : Opacité (0,7 par défaut)
- `prefix` (*string|nil*) : Préfixe du texte
- `fitQuality` (*number|nil*) : Qualité d'ajustement (RMSE normalisé)
- `arcDegrees` (*number|nil*) : Angle de l'arc en degrés

#### `gameplay_rally_snaproad_geoPacenotes.measurePartition(pn, focusPoints, skipAuto)`

Mesure le virage d'un pacenote à partir des points focus de la partition : construit le chemin, ajuste les cercles des trois variantes, annote intensité, sens et épingle à cheveux, et renseigne pn.measurements (voir notes).

- `pn` (*table*) : Pacenote avec waypoints de début et de fin
- `focusPoints` (*table[]*) : Points focus de la partition (au moins 3)
- `skipAuto` (*boolean|nil*) : Non utilisé

#### `gameplay_rally_snaproad_geoPacenotes.measurementTypeOptions()`

Liste ordonnée des définitions de types de mesure (pour une liste déroulante).

- **renvoie** : table[] Éléments {id, label, segmentCount}

#### `gameplay_rally_snaproad_geoPacenotes.normalizeMeasurementType(measurementType)`

Renvoie le type s'il existe, sinon le type par défaut ('single').

- `measurementType` (*string|nil*) : Type de mesure
- **renvoie** : string Type valide

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultMeasurementType` | string | Type de mesure par défaut : 'single'. |
| `measurementTypeOrder` | string[] | Ordre des types : 'single', 'split2', 'split3'. |
| `measurementTypes` | table<string, table> | Description de chaque type : {id, label ('Single fit', 'Two-part fit', 'Three-part fit'), segmentCount (1, 2, 3)}. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua`.*
