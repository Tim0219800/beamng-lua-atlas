# `editor_cameraV2_orbit`

*Fichier : `lua/ge/extensions/editor/cameraV2/orbit.lua` · VM : Game Engine (GE) · 590 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraV2_orbit` : `extensions.load("editor_cameraV2_orbit")`, puis la globale `editor_cameraV2_orbit`

Regard à la souris de Camera V2, de type éditeur : soit rotation sur place depuis la position actuelle de la caméra (mode 0), soit orbite autour de la surface au centre de la vue (mode 1). L'orbite est contrainte pour ne pas faire passer la caméra sous le terrain (recherche dichotomique sur le pitch) et dispose d'une inertie à la relâche du bouton. Utilisé par editor/cameraV2/controller qui lui transmet les entrées souris relatives et appelle update() à chaque frame.

## Remarques

- Mode : 1 = orbite autour du pivot (préférence orbitAroundViewCenter vraie), tout autre valeur = rotation sur place.
- Pivot d'orbite : point touché par Engine.castRay au centre de la vue (source « center hit »), sinon point virtuel à lastOrbitDistance devant la caméra (source « virtual », 50 m au départ, borné à zoomMinDistance..zoomMaxDistance). Une source « focus » est posée par setPivot après une focalisation par double clic.
- Pitch limité à ±85° ; vitesse angulaire limitée à 900°/s ; les deltas de souris > 250 sont ignorés (saut de curseur). Sensibilité : fov * value / 4500, puis x10 en degrés.
- Lissage vers la cible : amount = 1 - exp(-zoomResponse * dt). Inertie : la vitesse décroît de 95 % en inertiaDuration secondes (préférence, bornée à 0,05..2 s).
- Une orbite est abandonnée si la pose caméra ne correspond plus à celle attendue (reconcileOrbitTranslation) ; si seule la rotation a changé, le pivot est recalculé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraV2_orbit.cancel()` | Arrête le glisser et l'inertie d'orbite et abandonne la rotation sur place, en conservant la pose d'orbite. | 576 |
| `editor_cameraV2_orbit.getDebugState()` | État de debug de l'orbite pour la fenêtre Camera V2 Debug. | 563 |
| `editor_cameraV2_orbit.getPivot()` | Renvoie une copie du pivot d'orbite courant. | 528 |
| `editor_cameraV2_orbit.getZoomPivot()` | Renvoie le pivot s'il est réel (source différente de « virtual »), pour que le zoom l'utilise comme point focal fixe. | 532 |
| `editor_cameraV2_orbit.hasPose()` | Vrai si une pose d'orbite (pivot, distance) est mémorisée. | 524 |
| `editor_cameraV2_orbit.isActive()` | Vrai si une orbite est en cours (glisser ou inertie) ou si une rotation sur place est en cours. | 515 |
| `editor_cameraV2_orbit.isOrbitActive()` | Vrai seulement si une orbite autour d'un pivot est en cours (glisser ou inertie). | 520 |
| `editor_cameraV2_orbit.markForReacquire()` | Marque l'orbite pour qu'un nouveau pivot soit recalculé au prochain début de glisser (après un déplacement WASD combiné). | 572 |
| `editor_cameraV2_orbit.onMouseInput(axis, value, mode, mouseButton)` | Reçoit un mouvement de souris relatif pendant qu'un bouton d'orbite est enfoncé. Au clic initial, démarre l'orbite (mode 1) ou la rotation sur place ; ensuite accumule l'entrée yaw ou pitch, appliquée par update(). *(hook)* | 278 |
| `editor_cameraV2_orbit.reset()` | Oublie complètement la pose d'orbite et la rotation sur place. | 584 |
| `editor_cameraV2_orbit.setPivot(pivot, source)` | Définit le pivot d'orbite et recalcule yaw, pitch et distance à partir de la position de la caméra. Annule glisser et inertie. | 536 |
| `editor_cameraV2_orbit.syncDistanceFromCamera()` | Recalcule la géométrie d'orbite (distance, yaw, pitch) depuis la position actuelle de la caméra en gardant le pivot et la source ; utilisé après un zoom vers le pivot. | 553 |
| `editor_cameraV2_orbit.update(mode, mouseButton, deltaTime)` | Fait avancer la rotation sur place ou l'orbite d'une frame (lissage, inertie, contrainte terrain) et applique la pose à core_camera (setRotation ou setPosRot). *(interne)* | 495 |

### Détail des paramètres

#### `editor_cameraV2_orbit.getDebugState()`

État de debug de l'orbite pour la fenêtre Camera V2 Debug.

- **renvoie** : table|nil {source, distance, pivot = vec3, moving = boolean}, ou nil sans pose

#### `editor_cameraV2_orbit.getPivot()`

Renvoie une copie du pivot d'orbite courant.

- **renvoie** : vec3|nil pivot, ou nil sans pose

#### `editor_cameraV2_orbit.getZoomPivot()`

Renvoie le pivot s'il est réel (source différente de « virtual »), pour que le zoom l'utilise comme point focal fixe.

- **renvoie** : vec3|nil pivot réel ou nil

#### `editor_cameraV2_orbit.hasPose()`

Vrai si une pose d'orbite (pivot, distance) est mémorisée.

- **renvoie** : boolean true si orbit existe

#### `editor_cameraV2_orbit.isActive()`

Vrai si une orbite est en cours (glisser ou inertie) ou si une rotation sur place est en cours.

- **renvoie** : boolean état d'activité

#### `editor_cameraV2_orbit.isOrbitActive()`

Vrai seulement si une orbite autour d'un pivot est en cours (glisser ou inertie).

- **renvoie** : boolean état d'orbite

#### `editor_cameraV2_orbit.onMouseInput(axis, value, mode, mouseButton)`

Reçoit un mouvement de souris relatif pendant qu'un bouton d'orbite est enfoncé. Au clic initial, démarre l'orbite (mode 1) ou la rotation sur place ; ensuite accumule l'entrée yaw ou pitch, appliquée par update().

- `axis` (*string*) : « yaw » pour l'axe horizontal ; toute autre valeur est traitée comme pitch
- `value` (*number*) : Mouvement de souris ; non fini = refusé ; |value| > 250 = ignoré (mais consommé)
- `mode` (*integer*) : 1 = orbite, sinon rotation sur place
- `mouseButton` (*integer*) : Bouton imgui maintenu (1 droit, 2 milieu)
- **renvoie** : boolean true si l'entrée est consommée, false si le bouton n'est pas actif/viewport non survolé

#### `editor_cameraV2_orbit.setPivot(pivot, source)`

Définit le pivot d'orbite et recalcule yaw, pitch et distance à partir de la position de la caméra. Annule glisser et inertie.

- `pivot` (*vec3*) : Nouveau pivot ; doit être un point raisonnable
- `source` (*string|nil*) : Étiquette de source (défaut « focus »)
- **renvoie** : boolean true si appliqué, false si pivot/caméra invalide ou distance nulle

#### `editor_cameraV2_orbit.syncDistanceFromCamera()`

Recalcule la géométrie d'orbite (distance, yaw, pitch) depuis la position actuelle de la caméra en gardant le pivot et la source ; utilisé après un zoom vers le pivot.

- **renvoie** : boolean false sans pose d'orbite ou en cas de position invalide

#### `editor_cameraV2_orbit.update(mode, mouseButton, deltaTime)`

Fait avancer la rotation sur place ou l'orbite d'une frame (lissage, inertie, contrainte terrain) et applique la pose à core_camera (setRotation ou setPosRot).

- `mode` (*integer*) : 1 = orbite, sinon rotation sur place
- `mouseButton` (*integer*) : Bouton imgui de l'orbite
- `deltaTime` (*number|nil*) : Secondes, bornées à [0 ; 0,05]

## Appels vers le moteur (C++)

- `Engine.` `castRay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraV2/orbit.lua`.*
