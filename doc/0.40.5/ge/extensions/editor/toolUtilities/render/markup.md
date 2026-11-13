# `editor_toolUtilities_render_markup`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/markup.lua` · VM : Game Engine (GE) · 150 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_markup` : `extensions.load("editor_toolUtilities_render_markup")`, puis la globale `editor_toolUtilities_render_markup`

Étiquettes de texte en 3D pour les outils d'édition de splines (issu de l'ancien render.lua). Fournit les primitives de texte (filtré ou non par distance, couleurs normales ou inversées, via debugDraw.drawTextAdvanced) et toutes les étiquettes prêtes à l'emploi : invites du curseur (« Click To Add Node »), noms, longueurs, largeurs, élévations, vitesses, distances d'obstacle. Les textes sont en anglais dans le code.

## Remarques

- Les étiquettes répétitives (noms, longueurs, valeurs par nœud) sont filtrées à 250 m de la caméra ; les invites du curseur et quelques étiquettes importantes (élévation, nom sélectionné) ne le sont pas pour rester lisibles de loin.
- drawMarkupCulledAlwaysShow est identique à drawMarkupCulled dans le code (même seuil de 250 m) : le nom ne reflète pas un comportement différent.
- Toutes les fonctions prennent pos (vec3) comme position monde du texte.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_markup.drawMarkupCulled(pos, text)` | Texte à pos, affiché seulement à moins de 250 m de la caméra. | 22 |
| `editor_toolUtilities_render_markup.drawMarkupCulledAlwaysShow(pos, text)` | Même comportement que drawMarkupCulled (filtre 250 m). | 27 |
| `editor_toolUtilities_render_markup.drawMarkupCulledInvertedCols(pos, text)` | Texte filtré à 250 m avec couleurs de texte et de fond inversées. | 36 |
| `editor_toolUtilities_render_markup.drawMarkupUnculled(pos, text)` | Texte sans filtre de distance, pour les étiquettes à garder lisibles à n'importe quelle distance. | 33 |
| `editor_toolUtilities_render_markup.markupActiveSurf(pos)` | Étiquette « [Active Surface (2D)] ». | 79 |
| `editor_toolUtilities_render_markup.markupAddNode(pos)` | Invite « [Click To Add Node] ». | 59 |
| `editor_toolUtilities_render_markup.markupAddPairLeft(pos)` | Invite « [Add Pair: Click 1st Node] ». | 70 |
| `editor_toolUtilities_render_markup.markupAddPolygonNode(pos)` | Invite « [Click To Add Node. Double-Click To Finish] ». | 67 |
| `editor_toolUtilities_render_markup.markupAdjustBar(pos)` | Invite de réglage de hauteur (glisser, SHIFT pour la précision). | 63 |
| `editor_toolUtilities_render_markup.markupAdjustDepth(pos)` | Invite de réglage de profondeur (glisser, SHIFT pour la précision). | 64 |
| `editor_toolUtilities_render_markup.markupAdjustWidth(pos)` | Invite de réglage de largeur (glisser, SHIFT pour la précision). | 62 |
| `editor_toolUtilities_render_markup.markupAngleAndDistance(pos, dist, angleRad)` | Affiche distance (m) et angle (converti de radians en degrés). | 96 |
| `editor_toolUtilities_render_markup.markupAngleDistanceWithElevation(pos, dist, angleRad, elevDiff)` | Affiche distance, angle (degrés) et écart d'altitude dZ. | 97 |
| `editor_toolUtilities_render_markup.markupDepthDisplay(pos, d)` | Affiche « [d = x.xx m] ». | 66 |
| `editor_toolUtilities_render_markup.markupDrag(pos)` | Invite « [Click To Select, Drag To Move] ». | 54 |
| `editor_toolUtilities_render_markup.markupElevation(pos, elev)` | Affiche « [Elevation = x.xx m] » sans filtre de distance (une seule, sur le nœud sélectionné). | 82 |
| `editor_toolUtilities_render_markup.markupEnd(pos)` | Étiquette « [End] » en couleurs inversées. | 69 |
| `editor_toolUtilities_render_markup.markupGraphFreeSpace(pos)` | Invite « [Click NavGraph Node To Add To Path] ». | 86 |
| `editor_toolUtilities_render_markup.markupGraphNodeHover(pos)` | Invite « [Click To Add/Remove From Path] ». | 85 |
| `editor_toolUtilities_render_markup.markupInsertNode(pos)` | Invite « [Click To Insert Node] ». | 60 |
| `editor_toolUtilities_render_markup.markupJoin(pos)` | Invite « [Hold CTRL + Drop To Join] ». | 91 |
| `editor_toolUtilities_render_markup.markupLines(pos, lines)` | Plusieurs lignes jointes par saut de ligne en une seule étiquette filtrée. Sans effet si la liste est vide. | 44 |
| `editor_toolUtilities_render_markup.markupLinkedSplineCannotAdd(pos)` | Message « [Linked Spline - Cannot Add Nodes] ». | 92 |
| `editor_toolUtilities_render_markup.markupLinkedTip(pos)` | Invite « [Linked — Drag Away Or Use Detach Button] ». | 55 |
| `editor_toolUtilities_render_markup.markupLoop(pos)` | Invite « [Hold CTRL + Drop To Form Loop] ». La suite masterSpline conditionne jonctions et boucles à CTRL : l'aperçu s'affiche dès qu'un candidat existe, mais le relâchement ne valide que CTRL enfoncé. | 90 |
| `editor_toolUtilities_render_markup.markupLoopedSplineCannotAdd(pos)` | Message « [Looped Spline - Cannot Add Here] ». | 93 |
| `editor_toolUtilities_render_markup.markupNode1(pos)` | Étiquette « Node [1] ». | 73 |
| `editor_toolUtilities_render_markup.markupNode2(pos)` | Étiquette « Node [2] ». | 74 |
| `editor_toolUtilities_render_markup.markupNode3(pos)` | Étiquette « Node [3] ». | 75 |
| `editor_toolUtilities_render_markup.markupObstacleDistance(pos, dist)` | Affiche « [Obstacle: x.x m] ». | 94 |
| `editor_toolUtilities_render_markup.markupObstacleDistanceWithElevation(pos, dist, elevDiff)` | Affiche la distance à l'obstacle et l'écart d'altitude dZ. | 95 |
| `editor_toolUtilities_render_markup.markupPairFirstNode(pos)` | Étiquette « [Pair: First Node] ». | 71 |
| `editor_toolUtilities_render_markup.markupPairSecondNode(pos)` | Invite : clic gauche ajoute le 2e nœud, clic droit annule la paire. | 72 |
| `editor_toolUtilities_render_markup.markupPathNode(pos, i)` | Étiquette « Path Node [i] ». | 87 |
| `editor_toolUtilities_render_markup.markupPrompt(pos, text)` | Invite du curseur : texte non filtré. | 43 |
| `editor_toolUtilities_render_markup.markupRoadLength(pos, l)` | Étiquette « [Length = x.xx m] » en couleurs inversées. | 61 |
| `editor_toolUtilities_render_markup.markupSelectOrAdd(pos)` | Invite « [Select A Spline Or Click 'Add'] ». | 58 |
| `editor_toolUtilities_render_markup.markupSelectSpline(pos)` | Invite « [Click To Select Spline] ». | 56 |
| `editor_toolUtilities_render_markup.markupSelectedName(pos, str)` | Même étiquette pour l'élément en cours d'édition, non filtrée. | 78 |
| `editor_toolUtilities_render_markup.markupSelectedSplineDisabled(pos)` | Invite « [Spline Disabled. Cannot Edit] ». | 57 |
| `editor_toolUtilities_render_markup.markupSplineName(pos, str)` | Nom de spline entre crochets, filtré à 250 m. | 76 |
| `editor_toolUtilities_render_markup.markupStack(pos, lines)` | Dessine chaque ligne comme une étiquette séparée à la même position (elles se superposent). | 48 |
| `editor_toolUtilities_render_markup.markupStart(pos)` | Étiquette « [Start] » en couleurs inversées. | 68 |
| `editor_toolUtilities_render_markup.markupText(pos, text)` | Texte simple filtré. | 42 |
| `editor_toolUtilities_render_markup.markupTwistAngle(pos, angleDeg)` | Affiche « [Twist Angle = x.xx deg] ». | 83 |
| `editor_toolUtilities_render_markup.markupVelocity(pos, vel, isBarsLimit, unitsStr)` | Affiche « [Limit\|Velocity = x.xx unité] ». | 84 |
| `editor_toolUtilities_render_markup.markupVolume(pos)` | Étiquette « [Active Volume (3D)] ». | 80 |
| `editor_toolUtilities_render_markup.markupWidthDisplay(pos, w)` | Affiche « [Width = x.xx m] ». | 65 |

### Détail des paramètres

#### `editor_toolUtilities_render_markup.drawMarkupCulled(pos, text)`

Texte à pos, affiché seulement à moins de 250 m de la caméra.

- `pos` (*vec3*) : Position.
- `text` (*string*) : Texte.

#### `editor_toolUtilities_render_markup.drawMarkupCulledAlwaysShow(pos, text)`

Même comportement que drawMarkupCulled (filtre 250 m).

- `pos` (*vec3*) : Position.
- `text` (*string*) : Texte.

#### `editor_toolUtilities_render_markup.drawMarkupCulledInvertedCols(pos, text)`

Texte filtré à 250 m avec couleurs de texte et de fond inversées.

- `pos` (*vec3*) : Position.
- `text` (*string*) : Texte.

#### `editor_toolUtilities_render_markup.drawMarkupUnculled(pos, text)`

Texte sans filtre de distance, pour les étiquettes à garder lisibles à n'importe quelle distance.

- `pos` (*vec3*) : Position.
- `text` (*string*) : Texte.

#### `editor_toolUtilities_render_markup.markupActiveSurf(pos)`

Étiquette « [Active Surface (2D)] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAddNode(pos)`

Invite « [Click To Add Node] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAddPairLeft(pos)`

Invite « [Add Pair: Click 1st Node] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAddPolygonNode(pos)`

Invite « [Click To Add Node. Double-Click To Finish] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAdjustBar(pos)`

Invite de réglage de hauteur (glisser, SHIFT pour la précision).

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAdjustDepth(pos)`

Invite de réglage de profondeur (glisser, SHIFT pour la précision).

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAdjustWidth(pos)`

Invite de réglage de largeur (glisser, SHIFT pour la précision).

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupAngleAndDistance(pos, dist, angleRad)`

Affiche distance (m) et angle (converti de radians en degrés).

- `pos` (*vec3*) : Position.
- `dist` (*number*) : Distance en mètres.
- `angleRad` (*number*) : Angle en radians.

#### `editor_toolUtilities_render_markup.markupAngleDistanceWithElevation(pos, dist, angleRad, elevDiff)`

Affiche distance, angle (degrés) et écart d'altitude dZ.

- `pos` (*vec3*) : Position.
- `dist` (*number*) : Distance en mètres.
- `angleRad` (*number*) : Angle en radians.
- `elevDiff` (*number*) : Écart d'altitude en mètres.

#### `editor_toolUtilities_render_markup.markupDepthDisplay(pos, d)`

Affiche « [d = x.xx m] ».

- `pos` (*vec3*) : Position.
- `d` (*number*) : Profondeur en mètres.

#### `editor_toolUtilities_render_markup.markupDrag(pos)`

Invite « [Click To Select, Drag To Move] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupElevation(pos, elev)`

Affiche « [Elevation = x.xx m] » sans filtre de distance (une seule, sur le nœud sélectionné).

- `pos` (*vec3*) : Position.
- `elev` (*number*) : Élévation en mètres.

#### `editor_toolUtilities_render_markup.markupEnd(pos)`

Étiquette « [End] » en couleurs inversées.

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupGraphFreeSpace(pos)`

Invite « [Click NavGraph Node To Add To Path] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupGraphNodeHover(pos)`

Invite « [Click To Add/Remove From Path] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupInsertNode(pos)`

Invite « [Click To Insert Node] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupJoin(pos)`

Invite « [Hold CTRL + Drop To Join] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupLines(pos, lines)`

Plusieurs lignes jointes par saut de ligne en une seule étiquette filtrée. Sans effet si la liste est vide.

- `pos` (*vec3*) : Position.
- `lines` (*string[]*) : Lignes de texte.

#### `editor_toolUtilities_render_markup.markupLinkedSplineCannotAdd(pos)`

Message « [Linked Spline - Cannot Add Nodes] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupLinkedTip(pos)`

Invite « [Linked — Drag Away Or Use Detach Button] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupLoop(pos)`

Invite « [Hold CTRL + Drop To Form Loop] ». La suite masterSpline conditionne jonctions et boucles à CTRL : l'aperçu s'affiche dès qu'un candidat existe, mais le relâchement ne valide que CTRL enfoncé.

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupLoopedSplineCannotAdd(pos)`

Message « [Looped Spline - Cannot Add Here] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupNode1(pos)`

Étiquette « Node [1] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupNode2(pos)`

Étiquette « Node [2] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupNode3(pos)`

Étiquette « Node [3] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupObstacleDistance(pos, dist)`

Affiche « [Obstacle: x.x m] ».

- `pos` (*vec3*) : Position.
- `dist` (*number*) : Distance en mètres.

#### `editor_toolUtilities_render_markup.markupObstacleDistanceWithElevation(pos, dist, elevDiff)`

Affiche la distance à l'obstacle et l'écart d'altitude dZ.

- `pos` (*vec3*) : Position.
- `dist` (*number*) : Distance en mètres.
- `elevDiff` (*number*) : Écart d'altitude en mètres.

#### `editor_toolUtilities_render_markup.markupPairFirstNode(pos)`

Étiquette « [Pair: First Node] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupPairSecondNode(pos)`

Invite : clic gauche ajoute le 2e nœud, clic droit annule la paire.

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupPathNode(pos, i)`

Étiquette « Path Node [i] ».

- `pos` (*vec3*) : Position.
- `i` (*integer*) : Numéro du nœud.

#### `editor_toolUtilities_render_markup.markupPrompt(pos, text)`

Invite du curseur : texte non filtré.

- `pos` (*vec3*) : Position.
- `text` (*string*) : Texte.

#### `editor_toolUtilities_render_markup.markupRoadLength(pos, l)`

Étiquette « [Length = x.xx m] » en couleurs inversées.

- `pos` (*vec3*) : Position.
- `l` (*number*) : Longueur en mètres.

#### `editor_toolUtilities_render_markup.markupSelectOrAdd(pos)`

Invite « [Select A Spline Or Click 'Add'] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupSelectSpline(pos)`

Invite « [Click To Select Spline] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupSelectedName(pos, str)`

Même étiquette pour l'élément en cours d'édition, non filtrée.

- `pos` (*vec3*) : Position.
- `str` (*string*) : Nom.

#### `editor_toolUtilities_render_markup.markupSelectedSplineDisabled(pos)`

Invite « [Spline Disabled. Cannot Edit] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupSplineName(pos, str)`

Nom de spline entre crochets, filtré à 250 m.

- `pos` (*vec3*) : Position.
- `str` (*string*) : Nom.

#### `editor_toolUtilities_render_markup.markupStack(pos, lines)`

Dessine chaque ligne comme une étiquette séparée à la même position (elles se superposent).

- `pos` (*vec3*) : Position.
- `lines` (*string[]*) : Lignes de texte.

#### `editor_toolUtilities_render_markup.markupStart(pos)`

Étiquette « [Start] » en couleurs inversées.

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupText(pos, text)`

Texte simple filtré.

- `pos` (*vec3*) : Position.
- `text` (*string*) : Texte.

#### `editor_toolUtilities_render_markup.markupTwistAngle(pos, angleDeg)`

Affiche « [Twist Angle = x.xx deg] ».

- `pos` (*vec3*) : Position.
- `angleDeg` (*number*) : Angle en degrés.

#### `editor_toolUtilities_render_markup.markupVelocity(pos, vel, isBarsLimit, unitsStr)`

Affiche « [Limit|Velocity = x.xx unité] ».

- `pos` (*vec3*) : Position.
- `vel` (*number*) : Valeur.
- `isBarsLimit` (*boolean*) : true : libellé Limit, false : Velocity.
- `unitsStr` (*string*) : Unité affichée.

#### `editor_toolUtilities_render_markup.markupVolume(pos)`

Étiquette « [Active Volume (3D)] ».

- `pos` (*vec3*) : Position.

#### `editor_toolUtilities_render_markup.markupWidthDisplay(pos, w)`

Affiche « [Width = x.xx m] ».

- `pos` (*vec3*) : Position.
- `w` (*number*) : Largeur en mètres.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/markup.lua`.*
