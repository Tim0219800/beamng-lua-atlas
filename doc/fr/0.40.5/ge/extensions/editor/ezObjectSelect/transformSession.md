# `editor_ezObjectSelect_transformSession`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/transformSession.lua` · VM : Game Engine (GE) · 565 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_transformSession` : `extensions.load("editor_ezObjectSelect_transformSession")`, puis la globale `editor_ezObjectSelect_transformSession`

Session de transformation (déplacement, rotation, échelle) des objets sélectionnés pour Easy Object Select. begin() mémorise la transformation et l'échelle initiales de chaque objet sélectionné ; les fonctions update* repositionnent les objets à partir de l'état initial (pas cumulatif) ; finish() enregistre le résultat dans l'historique de l'éditeur (SetObjectTransform / SetObjectScale, annulables, dans une transaction) ; cancel() restaure tout. Gère aussi la mise à jour des offsets de prefab et la remise à la verticale.

## Remarques

- Une seule session à la fois (upvalue local). begin échoue si l'ancre n'est pas sélectionnée ou si un objet n'est pas manipulable (editor.canManipulateObject).
- Échelle limitée à [0.01, 1000] par composante ; le facteur est identique pour tous les axes édités et borné pour que tous les objets restent dans cet intervalle.
- finish() ne crée aucune action d'historique s'il n'y a aucun changement net : les objets sont alors restaurés.
- Le hook onEditorObjectSelectionTransformChanged n'est émis que lors d'un undo/redo des actions (applyHistoryTransform/Scale), pas pendant la session.
- finish() renvoie false sans session, nil si la transaction d'historique n'a pas pu s'ouvrir, sinon hasNetChange (boolean) puis completion.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_transformSession.begin(anchorObject, options)` | Ouvre une session sur tous les objets de editor.selection.object. Renvoie false si une session existe déjà, si l'ancre n'est pas sélectionnée ou si un objet ne peut pas être manipulé. | 133 |
| `editor_ezObjectSelect_transformSession.cancel()` | Annule la session et remet transformation et échelle initiales de chaque objet. | 458 |
| `editor_ezObjectSelect_transformSession.finish()` | Termine la session : s'il y a un changement net, ouvre une transaction d'historique et enregistre une action SetObjectTransform et/ou SetObjectScale par objet ; sinon restaure l'état initial. | 364 |
| `editor_ezObjectSelect_transformSession.getDesiredAnchorPosition(surfacePosition, options)` | Calcule la position voulue de l'ancre pour un point de surface (surface - grabOffset), avec accrochage à la grille éventuel. | 191 |
| `editor_ezObjectSelect_transformSession.getObjectIds()` | IDs des objets de la session. | 557 |
| `editor_ezObjectSelect_transformSession.isActive()` | Indique si une session est ouverte. | 539 |
| `editor_ezObjectSelect_transformSession.resetRotation(objectIds)` | Remet les objets à la verticale (axe Z monde) en conservant leur cap, dans une transaction d'historique « ResetObjectRotation ». Refuse si une session est active. | 497 |
| `editor_ezObjectSelect_transformSession.selectionMatches()` | Vérifie que la sélection de l'éditeur est toujours exactement celle de la session et que les objets restent manipulables. | 543 |
| `editor_ezObjectSelect_transformSession.setGrabSurface(surfacePosition, maintainRelativeZ, verticalOffset)` | Définit le décalage entre le point de surface saisi et la position de l'ancre. | 162 |
| `editor_ezObjectSelect_transformSession.update(surfacePosition, surfaceNormal, options)` | Déplace la sélection pour que l'ancre suive un point de surface ; peut aligner chaque objet sur la normale de surface et utiliser un fournisseur de position/normale individuels. | 331 |
| `editor_ezObjectSelect_transformSession.updateDelta(delta, options)` | Translate tous les objets de delta par rapport à leur position initiale, avec accrochage à la grille optionnel (masque par axe, absolu ou relatif). | 198 |
| `editor_ezObjectSelect_transformSession.updateRotation(pivot, axis, angle)` | Fait tourner tous les objets (orientation et position) autour du pivot, à partir de l'état initial. | 245 |
| `editor_ezObjectSelect_transformSession.updateScale(pivot, axes, factors)` | Met à l'échelle les objets autour du pivot le long des axes donnés ; les positions sont étirées par rapport au pivot. | 268 |

### Détail des paramètres

#### `editor_ezObjectSelect_transformSession.begin(anchorObject, options)`

Ouvre une session sur tous les objets de editor.selection.object. Renvoie false si une session existe déjà, si l'ancre n'est pas sélectionnée ou si un objet ne peut pas être manipulé.

- `anchorObject` (*userdata*) : Objet ancre (dont la position sert de référence pour la saisie de surface et la distance).
- `options` (*table|nil*) : historyName (string, nom de la transaction d'historique, défaut "EasySelectDrag").
- **renvoie** : boolean true si la session est ouverte.

#### `editor_ezObjectSelect_transformSession.cancel()`

Annule la session et remet transformation et échelle initiales de chaque objet.

- **renvoie** : boolean true si une session était active.

#### `editor_ezObjectSelect_transformSession.finish()`

Termine la session : s'il y a un changement net, ouvre une transaction d'historique et enregistre une action SetObjectTransform et/ou SetObjectScale par objet ; sinon restaure l'état initial.

- **renvoie** : boolean|nil true si changement validé, false si aucun changement (ou pas de session), nil si la transaction n'a pas pu s'ouvrir.
- **renvoie** : table|nil {anchorDistance} (m) lorsqu'il y a un changement.

#### `editor_ezObjectSelect_transformSession.getDesiredAnchorPosition(surfacePosition, options)`

Calcule la position voulue de l'ancre pour un point de surface (surface - grabOffset), avec accrochage à la grille éventuel.

- `surfacePosition` (*vec3*) : Point de surface sous le curseur.
- `options` (*table|nil*) : gridSize (m), gridRelative (boolean), snapZ (boolean).
- **renvoie** : vec3|boolean Position de l'ancre, ou false si pas de session / pas de grabOffset / pas de point.

#### `editor_ezObjectSelect_transformSession.getObjectIds()`

IDs des objets de la session.

- **renvoie** : integer[] Liste d'IDs (vide sans session).

#### `editor_ezObjectSelect_transformSession.isActive()`

Indique si une session est ouverte.

- **renvoie** : boolean true si active.

#### `editor_ezObjectSelect_transformSession.resetRotation(objectIds)`

Remet les objets à la verticale (axe Z monde) en conservant leur cap, dans une transaction d'historique « ResetObjectRotation ». Refuse si une session est active.

- `objectIds` (*integer[]*) : IDs des objets à redresser.
- **renvoie** : boolean true si au moins un objet a changé.

#### `editor_ezObjectSelect_transformSession.selectionMatches()`

Vérifie que la sélection de l'éditeur est toujours exactement celle de la session et que les objets restent manipulables.

- **renvoie** : boolean true sans session ou si la sélection correspond.

#### `editor_ezObjectSelect_transformSession.setGrabSurface(surfacePosition, maintainRelativeZ, verticalOffset)`

Définit le décalage entre le point de surface saisi et la position de l'ancre.

- `surfacePosition` (*vec3*) : Point de surface saisi.
- `maintainRelativeZ` (*boolean|nil*) : Si false, le décalage vertical est mis à 0.
- `verticalOffset` (*number|nil*) : Si fourni, impose le décalage vertical (prioritaire sur maintainRelativeZ).
- **renvoie** : boolean false sans session ou sans surfacePosition.

#### `editor_ezObjectSelect_transformSession.update(surfacePosition, surfaceNormal, options)`

Déplace la sélection pour que l'ancre suive un point de surface ; peut aligner chaque objet sur la normale de surface et utiliser un fournisseur de position/normale individuels.

- `surfacePosition` (*vec3*) : Point de surface sous le curseur.
- `surfaceNormal` (*vec3|nil*) : Normale de la surface.
- `options` (*table*) : gridSize, gridRelative, snapZ, followRotation (boolean), rotateSnapSize (degrés), rotateRelative (boolean), individualProvider (function(entry, position) -> {position, normal}|nil). Le paramètre doit être une table (déduit du code : options.followRotation est lu sans garde).
- **renvoie** : boolean false si pas de session ou de grabOffset.

#### `editor_ezObjectSelect_transformSession.updateDelta(delta, options)`

Translate tous les objets de delta par rapport à leur position initiale, avec accrochage à la grille optionnel (masque par axe, absolu ou relatif).

- `delta` (*vec3*) : Déplacement en mètres, monde.
- `options` (*table|nil*) : gridSize (m), gridPivot (vec3), gridMask ({x,y,z} booléens), gridRelative (boolean), snapZ (boolean).
- **renvoie** : boolean false sans session ou sans delta.

#### `editor_ezObjectSelect_transformSession.updateRotation(pivot, axis, angle)`

Fait tourner tous les objets (orientation et position) autour du pivot, à partir de l'état initial.

- `pivot` (*vec3*) : Centre de rotation.
- `axis` (*vec3*) : Axe (normalisé en interne ; longueur nulle refusée).
- `angle` (*number*) : Angle en radians.
- **renvoie** : boolean true si appliqué.

#### `editor_ezObjectSelect_transformSession.updateScale(pivot, axes, factors)`

Met à l'échelle les objets autour du pivot le long des axes donnés ; les positions sont étirées par rapport au pivot.

- `pivot` (*vec3*) : Centre de l'échelle.
- `axes` (*table<string, vec3>*) : Axes x, y, z utilisés pour étirer les positions.
- `factors` (*table<string, number>*) : Facteurs {x, y, z} ; un axe est « édité » si son facteur diffère de 1.
- **renvoie** : boolean true si appliqué.
- **renvoie** : number Facteur effectif après bornage.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectSelectionTransformChanged`

## Appels vers le moteur (C++)

- `Sim.` `findObjectById`, `upcast`
- `obj:` `getScale`, `getTransform`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/transformSession.lua`.*
