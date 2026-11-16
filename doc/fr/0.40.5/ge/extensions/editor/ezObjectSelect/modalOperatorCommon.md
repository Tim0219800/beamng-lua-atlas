# `editor_ezObjectSelect_modalOperatorCommon`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua` · VM : Game Engine (GE) · 317 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_modalOperatorCommon` : `extensions.load("editor_ezObjectSelect_modalOperatorCommon")`, puis la globale `editor_ezObjectSelect_modalOperatorCommon`

Fonctions communes aux opérateurs modaux (rotate, scale, translate) de l'outil Easy Select : démarrage d'une session de transformation sur la sélection, gestion des contraintes d'axe X/Y/Z (monde/local, exclusion avec Shift), saisie numérique, validation/annulation (Entrée ou clic gauche dans le viewport = confirm ; Échap ou clic droit = cancel), projection monde vers écran, et dessin du HUD et des indicateurs près de la souris.

## Remarques

- L'ancre de la session est le dernier objet de editor.selection.object ; le pivot est le centre de editor.objectSelectionBBox s'il est valide, sinon la position de l'ancre.
- Appuyer deux fois sur la même touche d'axe (même état d'exclusion) bascule espace local/monde ; un autre axe recrée la contrainte avec l'espace par défaut.
- L'objet « state » renvoyé par begin contient pivot, camera, startRay, startMouse, worldAxes, localAxes, constraint, defaultLocal, numeric ; les opérateurs y ajoutent leurs propres champs.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_modalOperatorCommon.activeAxis(state)` | Vecteur de l'axe contraint, ou nil sans contrainte. | 117 |
| `editor_ezObjectSelect_modalOperatorCommon.axes(state)` | Jeu d'axes courant (localAxes si la contrainte est en espace local, sinon worldAxes). | 112 |
| `editor_ezObjectSelect_modalOperatorCommon.begin(options)` | Ouvre la session de transformation sur la sélection et crée l'état de l'opérateur. Renvoie nil si pas d'ancre, pas de caméra/rayon, ou si transformSession.begin échoue. | 45 |
| `editor_ezObjectSelect_modalOperatorCommon.currentRay()` | Rayon caméra-souris courant (getCameraMouseRay). | 28 |
| `editor_ezObjectSelect_modalOperatorCommon.drawHud(prefix, details, help, border)` | Dessine un panneau à deux lignes près de la souris (ligne 1 : préfixe + détails ; ligne 2 : aide), gardé dans le viewport. | 269 |
| `editor_ezObjectSelect_modalOperatorCommon.drawInteractionHint(kind, pivotScreen)` | Cache le curseur système et dessine au curseur un point avec des chevrons (rotate : tangents ; scale : radiaux ; translate : 4 directions) et, hors translate, une ligne pointillée du pivot à la souris. | 206 |
| `editor_ezObjectSelect_modalOperatorCommon.finish(result)` | Termine la session : confirm appelle transformSession.finish (si rien n'est validé, renvoie "cancel"), sinon transformSession.cancel ; rétablit le curseur. | 137 |
| `editor_ezObjectSelect_modalOperatorCommon.finishRequested()` | Teste les touches de fin. | 128 |
| `editor_ezObjectSelect_modalOperatorCommon.normalized(vector, fallback)` | Normalise un vecteur ; renvoie fallback si sa longueur est <= 0.0001. | 22 |
| `editor_ezObjectSelect_modalOperatorCommon.projectToScreen(camera, point)` | Projette un point monde en coordonnées écran. nil si le point est derrière la caméra ou quasi dans son plan (profondeur <= 0.0001). | 153 |
| `editor_ezObjectSelect_modalOperatorCommon.rayPlanePoint(ray, planePoint, planeNormal)` | Intersection d'un rayon avec un plan. | 37 |
| `editor_ezObjectSelect_modalOperatorCommon.setInteractionCursorHidden(hidden)` | Masque ou ré-affiche le curseur via l'objet Canvas (setCursorVisible). | 261 |
| `editor_ezObjectSelect_modalOperatorCommon.setLocalSpace(state, localSpace)` | Définit l'espace local/monde par défaut et l'applique à la contrainte active ; ignore ensuite la touche 4 de la rangée du haut pour la saisie numérique à la prochaine mise à jour. | 104 |
| `editor_ezObjectSelect_modalOperatorCommon.updateConstraint(state, allowExclude)` | Lit les touches X/Y/Z et met à jour state.constraint = {axis, exclude, localSpace}. | 83 |
| `editor_ezObjectSelect_modalOperatorCommon.updateNumeric(state)` | Met à jour la saisie numérique (transformNumericInput) et renvoie la valeur saisie. | 122 |

### Détail des paramètres

#### `editor_ezObjectSelect_modalOperatorCommon.activeAxis(state)`

Vecteur de l'axe contraint, ou nil sans contrainte.

- `state` (*table*) : État
- **renvoie** : vec3|nil 

#### `editor_ezObjectSelect_modalOperatorCommon.axes(state)`

Jeu d'axes courant (localAxes si la contrainte est en espace local, sinon worldAxes).

- `state` (*table*) : État
- **renvoie** : table {x, y, z} de vec3

#### `editor_ezObjectSelect_modalOperatorCommon.begin(options)`

Ouvre la session de transformation sur la sélection et crée l'état de l'opérateur. Renvoie nil si pas d'ancre, pas de caméra/rayon, ou si transformSession.begin échoue.

- `options` (*table|nil*) : {historyName = nom de la transaction d'historique, defaultLocal = boolean}
- **renvoie** : table|nil état de l'opérateur

#### `editor_ezObjectSelect_modalOperatorCommon.currentRay()`

Rayon caméra-souris courant (getCameraMouseRay).

- **renvoie** : table|nil {origin = vec3, direction = vec3 normalisé} ou nil

#### `editor_ezObjectSelect_modalOperatorCommon.drawHud(prefix, details, help, border)`

Dessine un panneau à deux lignes près de la souris (ligne 1 : préfixe + détails ; ligne 2 : aide), gardé dans le viewport.

- `prefix` (*string*) : Lettre/titre (ex. "R", "S")
- `details` (*string*) : Contrainte, espace et valeur
- `help` (*string*) : Texte d'aide des touches
- `border` (*integer*) : Couleur U32 imgui de la bordure

#### `editor_ezObjectSelect_modalOperatorCommon.drawInteractionHint(kind, pivotScreen)`

Cache le curseur système et dessine au curseur un point avec des chevrons (rotate : tangents ; scale : radiaux ; translate : 4 directions) et, hors translate, une ligne pointillée du pivot à la souris.

- `kind` (*string*) : "rotate", "scale" ou "translate"
- `pivotScreen` (*ImVec2|nil*) : Pivot en coordonnées écran (rien n'est dessiné si nil)

#### `editor_ezObjectSelect_modalOperatorCommon.finish(result)`

Termine la session : confirm appelle transformSession.finish (si rien n'est validé, renvoie "cancel"), sinon transformSession.cancel ; rétablit le curseur.

- `result` (*string*) : "confirm" ou "cancel"
- **renvoie** : string résultat effectif
- **renvoie** : any informations de complétion renvoyées par transformSession.finish

#### `editor_ezObjectSelect_modalOperatorCommon.finishRequested()`

Teste les touches de fin.

- **renvoie** : string|nil "cancel" (Échap/clic droit), "confirm" (Entrée, Entrée pavé, clic gauche dans le viewport) ou nil

#### `editor_ezObjectSelect_modalOperatorCommon.normalized(vector, fallback)`

Normalise un vecteur ; renvoie fallback si sa longueur est <= 0.0001.

- `vector` (*vec3*) : Vecteur à normaliser
- `fallback` (*vec3*) : Valeur de repli
- **renvoie** : vec3 

#### `editor_ezObjectSelect_modalOperatorCommon.projectToScreen(camera, point)`

Projette un point monde en coordonnées écran. nil si le point est derrière la caméra ou quasi dans son plan (profondeur <= 0.0001).

- `camera` (*table*) : Contexte caméra (pos, forward, right, up, halfTan, aspect, viewportX/Y, width, height)
- `point` (*vec3*) : Point monde
- **renvoie** : ImVec2|nil 

#### `editor_ezObjectSelect_modalOperatorCommon.rayPlanePoint(ray, planePoint, planeNormal)`

Intersection d'un rayon avec un plan.

- `ray` (*table|nil*) : {origin, direction}
- `planePoint` (*vec3*) : Point du plan
- `planeNormal` (*vec3*) : Normale du plan
- **renvoie** : vec3|nil Point d'intersection, nil si rayon parallèle (|denominateur| <= 0.0001) ou sans rayon

#### `editor_ezObjectSelect_modalOperatorCommon.setInteractionCursorHidden(hidden)`

Masque ou ré-affiche le curseur via l'objet Canvas (setCursorVisible).

- `hidden` (*boolean*) : true pour masquer

#### `editor_ezObjectSelect_modalOperatorCommon.setLocalSpace(state, localSpace)`

Définit l'espace local/monde par défaut et l'applique à la contrainte active ; ignore ensuite la touche 4 de la rangée du haut pour la saisie numérique à la prochaine mise à jour.

- `state` (*table|nil*) : État
- `localSpace` (*boolean*) : true = local
- **renvoie** : boolean false si state est nil

#### `editor_ezObjectSelect_modalOperatorCommon.updateConstraint(state, allowExclude)`

Lit les touches X/Y/Z et met à jour state.constraint = {axis, exclude, localSpace}.

- `state` (*table*) : État de l'opérateur
- `allowExclude` (*boolean*) : Si true, Shift maintenu signifie « exclure cet axe »
- **renvoie** : boolean true si la contrainte a changé cette frame

#### `editor_ezObjectSelect_modalOperatorCommon.updateNumeric(state)`

Met à jour la saisie numérique (transformNumericInput) et renvoie la valeur saisie.

- `state` (*table*) : État
- **renvoie** : number|nil valeur saisie ou nil

## Appels vers le moteur (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/modalOperatorCommon.lua`.*
