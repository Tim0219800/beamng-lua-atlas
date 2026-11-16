# `editor_cameraV2_controller`

*Fichier : `lua/ge/extensions/editor/cameraV2/controller.lua` · VM : Game Engine (GE) · 530 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraV2_controller` : `extensions.load("editor_cameraV2_controller")`, puis la globale `editor_cameraV2_controller`

Contrôleur de Camera V2 : traite l'entrée souris routée vers Camera V2 et l'applique à la caméra libre existante (core_camera, caméra globale « free »). Il gère le panoramique à la souris (clic droit ou milieu selon la préférence swapPanOrbitButtons), délègue l'orbite à editor/cameraV2/orbit et le zoom à editor/cameraV2/zoom, anime la focalisation par double clic gauche (centrage sur le point visé avec un easing à dépassement), et règle la translation planaire WASD de la caméra libre. Il s'appuie sur core/cameraControllerRegistry (acquire/release/isOwner avec l'id « editor.cameraV2 ») pour qu'un geste ne soit traité que par un seul chemin d'entrée.

## Remarques

- Le contrôleur n'est disponible que si : il est activé (activate()), l'éditeur est actif, la caméra d'éditeur est de type Free et la caméra globale active est « free », la vue est survolée et imgui ne capte pas la souris (cameraAvailable).
- Boutons : par défaut (swapPanOrbitButtons = true) pan = bouton droit (1), orbite = bouton milieu (2) ; sinon pan = milieu, orbite = droit. Le curseur est caché pendant une orbite au bouton milieu.
- Le panoramique à la souris est borné à 4000 unités/s de vitesse, ignore les deltas de souris > 250 px (saut de curseur), et met à l'échelle les pixels selon la distance au point touché (distance bornée à [1 ; 5000]) et le FOV.
- La focalisation (double clic gauche sans Ctrl/Shift/Alt, sans item imgui actif) dure entre 0,35 et 1 s selon la distance latérale à parcourir ; la caméra reste à sa profondeur, elle se translate latéralement, puis le pivot d'orbite est fixé sur le point visé (source « focus »).
- Pour la translation planaire WASD, le contrôleur écrit sur la caméra libre : planarTranslation, planarTranslationScale, planarTranslationDrag, planarTranslationResponse, planarTranslationSpeedMultiplier, planarTranslationFastSpeedMultiplier. Traînée = -ln(0,05) / inertiaDuration.
- Dans le code, onEditorMouseWheel est un hook de l'éditeur (valeur de molette) ; update() lit aussi im.GetIO().MouseWheel et le cumul pendingWheel, et ignore la molette si l'action « editorCameraZoom » est bloquée ou si editor.disableCameraZoom est vrai (ou Ctrl+Alt).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraV2_controller.activate()` | Active le contrôleur et annule tout mouvement en cours. Appelé par cameraV2 à l'enregistrement. *(interne)* | 458 |
| `editor_cameraV2_controller.cancel()` | Annule pan, zoom, orbite et focalisation en cours, remet à zéro la molette en attente, ré-affiche le curseur si besoin et libère la propriété du registre de contrôleurs. | 463 |
| `editor_cameraV2_controller.consumeFocusDoubleClick()` | Détecte (une seule fois par frame, résultat mis en cache) un double clic gauche valide et, si le raycast touche un point raisonnable devant la caméra, démarre la transition de focalisation. Appelé aussi depuis cameraV2.consumeFocusDoubleClick pour que l'éditeur ne traite pas ce clic comme une sélection. | 291 |
| `editor_cameraV2_controller.deactivate()` | Désactive le contrôleur, annule tout et réinitialise l'orbite. *(interne)* | 477 |
| `editor_cameraV2_controller.lastZoomUsedTerrainOnly()` | Relaie zoom.lastZoomUsedTerrainOnly() (debug). | 483 |
| `editor_cameraV2_controller.onEditorMouseWheel(value)` | Hook de molette de l'éditeur : si Camera V2 est actif, que la caméra libre est active et que la vue est survolée, annule pan/orbite/focalisation, prend la main sur le registre et accumule la valeur dans pendingWheel pour update(). *(hook)* | 346 |
| `editor_cameraV2_controller.onRelativeInput(axis, value, player)` | Hook d'entrée relative (mouvement souris) : si le bouton de pan est enfoncé, acquiert le registre ; si le bouton d'orbite est enfoncé, passe les axes à orbit.onMouseInput ; sinon bloque ou laisse passer l'entrée selon l'état. Ne traite que le joueur 0. *(hook)* | 358 |
| `editor_cameraV2_controller.orbitDebugState()` | Relaie orbit.getDebugState() (pivot d'orbite, distance, source, mouvement en cours) pour la fenêtre de debug. | 487 |
| `editor_cameraV2_controller.panDebugState()` | État de debug du pan : point touché et distance au point, soit du geste en cours, soit du dernier calcul d'échelle planaire. | 491 |
| `editor_cameraV2_controller.setPlanarTranslation(planar)` | Active ou désactive la translation WASD dans le plan XY sur la caméra libre (mode WASD « pan »). Efface les mouvements et entrées planaires résiduels et remet à zéro les paramètres planarTranslation* de la caméra libre. | 504 |
| `editor_cameraV2_controller.update(deltaTime)` | Boucle principale appelée à chaque frame par cameraV2.onUpdate : met à jour l'échelle de translation planaire, traite le double clic de focalisation, la molette (zoom), l'acquisition du contrôleur, le zoom lissé, le pan, l'orbite et la focalisation, puis libère le registre quand plus rien ne bouge. *(interne)* | 397 |

### Détail des paramètres

#### `editor_cameraV2_controller.consumeFocusDoubleClick()`

Détecte (une seule fois par frame, résultat mis en cache) un double clic gauche valide et, si le raycast touche un point raisonnable devant la caméra, démarre la transition de focalisation. Appelé aussi depuis cameraV2.consumeFocusDoubleClick pour que l'éditeur ne traite pas ce clic comme une sélection.

- **renvoie** : boolean true si le double clic a été consommé et la focalisation lancée

#### `editor_cameraV2_controller.lastZoomUsedTerrainOnly()`

Relaie zoom.lastZoomUsedTerrainOnly() (debug).

- **renvoie** : boolean voir zoom

#### `editor_cameraV2_controller.onEditorMouseWheel(value)`

Hook de molette de l'éditeur : si Camera V2 est actif, que la caméra libre est active et que la vue est survolée, annule pan/orbite/focalisation, prend la main sur le registre et accumule la valeur dans pendingWheel pour update().

- `value` (*number*) : Crans de molette
- **renvoie** : boolean true si l'événement est consommé ; false si le contrôleur est inactif ou non acquis

#### `editor_cameraV2_controller.onRelativeInput(axis, value, player)`

Hook d'entrée relative (mouvement souris) : si le bouton de pan est enfoncé, acquiert le registre ; si le bouton d'orbite est enfoncé, passe les axes à orbit.onMouseInput ; sinon bloque ou laisse passer l'entrée selon l'état. Ne traite que le joueur 0.

- `axis` (*string|integer*) : Axe d'entrée relatif (transmis tel quel à orbit.onMouseInput)
- `value` (*number*) : Valeur du mouvement
- `player` (*integer|nil*) : Indice du joueur (nil = 0)
- **renvoie** : boolean true si Camera V2 consomme l'entrée

#### `editor_cameraV2_controller.orbitDebugState()`

Relaie orbit.getDebugState() (pivot d'orbite, distance, source, mouvement en cours) pour la fenêtre de debug.

- **renvoie** : table|nil État de debug d'orbite

#### `editor_cameraV2_controller.panDebugState()`

État de debug du pan : point touché et distance au point, soit du geste en cours, soit du dernier calcul d'échelle planaire.

- **renvoie** : table|nil {point = vec3, distance = number|nil}, ou nil

#### `editor_cameraV2_controller.setPlanarTranslation(planar)`

Active ou désactive la translation WASD dans le plan XY sur la caméra libre (mode WASD « pan »). Efface les mouvements et entrées planaires résiduels et remet à zéro les paramètres planarTranslation* de la caméra libre.

- `planar` (*boolean*) : true pour le mode planaire (tout le reste vaut false)

#### `editor_cameraV2_controller.update(deltaTime)`

Boucle principale appelée à chaque frame par cameraV2.onUpdate : met à jour l'échelle de translation planaire, traite le double clic de focalisation, la molette (zoom), l'acquisition du contrôleur, le zoom lissé, le pan, l'orbite et la focalisation, puis libère le registre quand plus rien ne bouge.

- `deltaTime` (*number|nil*) : Secondes ; limité à [0 ; 0,05]

## Appels vers le moteur (C++)

- `Engine.` `castRay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraV2/controller.lua`.*
