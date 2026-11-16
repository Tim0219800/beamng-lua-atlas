# `editor_vehicleEditor_staticEditor_veStaticRenderView`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua` · VM : Game Engine (GE) · 822 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_veStaticRenderView` : `extensions.load("editor_vehicleEditor_staticEditor_veStaticRenderView")`, puis la globale `editor_vehicleEditor_staticEditor_veStaticRenderView`

Vues de rendu du Static Editor de l'éditeur de véhicule. Chaque fenêtre « Static Render View##N » possède deux RenderViews (la vue principale et un petit gizmo d'axes), en mode 3D ou orthographique (Left -X, Right +X, Back -Y, Front +Y, Bottom -Z, Top +Z). Le fichier gère la caméra (déplacement clavier, souris), la grille dessinée au debugDrawer, les flèches d'axes cliquables, le menu contextuel et la sauvegarde des vues dans settings/vehicleEditorStatic/staticRenderView.json. D'autres extensions (vePartTree) s'en servent pour obtenir le rayon de la souris dans la vue principale.

## Remarques

- Constantes de caméra : vitesse de base 5 en perspective et 2 en orthographique, multiplicateur « rapide » 2,5 ; la grille fait 10 m avec des cases de 0,25 m.
- Les fonctions moveLeft/moveRight/moveForward/moveBackward(val) et setCameraSpeed(s) sont prévues pour être appelées par des actions de clavier (keybindings) : val est la valeur de l'axe ou de la touche (0 relâché, 1 appuyé). setCameraSpeed(s) fixe camSpeedMult = s * (2.5 - 1) + 1.
- Les vues n'existent que tant que leur fenêtre est ouverte : une fenêtre fermée détruit ses RenderViews (« hacky way » d'après le code) ; à la sortie de l'éditeur statique (onEditorHeadlessChange avec enabled = false) les réglages sont sauvegardés et toutes les vues détruites.
- Le mode « headless » concerné est vEditor.EDITOR_NAMES[vEditor.EDITOR_MODE_STATIC].
- Bug : l'extension exporte onDeserialize (sans « d ») alors que le moteur appelle onDeserialized ; ce hook est donc ignoré (il est vide de toute façon). onSerialize sauvegarde les réglages et renvoie nil.
- Le texte « Mode: ... » est dessiné en haut à gauche de chaque vue par onPreRender via debugDrawer:drawTextAdvanced.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veStaticRenderView.createRenderViewUI()` | Crée une nouvelle vue de rendu (fenêtre + RenderViews) : réutilise la première entrée dont la fenêtre est masquée ou supprimée, sinon crée une nouvelle entrée, enregistre la fenêtre (400x600, outil vehicleEditor) si besoin, l'affiche et sauvegarde les réglages. Appelée par le menu View > Add View de veToolbar. | 191 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.destroyAllRenderViews()` | Détruit tous les objets RenderView (principal et gizmo) de toutes les vues, sans fermer les fenêtres ImGui. Appelée à la sortie de l'éditeur. *(interne)* | 757 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.getMainRenderViewMouseRay()` | Renvoie le rayon de la souris dans la vue principale de la fenêtre survolée (rv:getUnprojectedRayPosDir sur les coordonnées de la souris converties dans le viewport), ou nil si aucune fenêtre n'est survolée ou si la souris n'est pas sur l'image. | 748 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveBackward(val)` | Définit l'intensité du déplacement caméra vers l'arrière (camMove.backward). Pensé pour une action de clavier. | 801 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveForward(val)` | Définit l'intensité du déplacement caméra vers l'avant (camMove.forward). | 800 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveLeft(val)` | Définit l'intensité du déplacement caméra vers la gauche (camMove.left). | 798 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveRight(val)` | Définit l'intensité du déplacement caméra vers la droite (camMove.right). | 799 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onDeserialize(data)` | Fonction vide exportée sous le nom onDeserialize (probable faute de frappe pour onDeserialized, donc jamais appelée par le moteur). *(interne)* *(hook)* | 793 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorGui(dt)` | Hook de l'éditeur appelé à chaque frame : lit les entrées caméra, puis pour chaque vue ouvre la fenêtre, crée les RenderViews au besoin (getOrCreateView, enterFocusObjectsMode) et dessine le contenu ; détruit les RenderViews d'une fenêtre fermée. *(interne)* *(hook)* | 686 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorHeadlessChange(enabled, toolName)` | Hook de l'éditeur appelé quand un outil headless est activé ou désactivé. Pour l'éditeur statique, à la sortie : sauvegarde les réglages et détruit les RenderViews. *(interne)* *(hook)* | 765 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorInitialized()` | Hook de l'éditeur appelé à l'initialisation : recharge les vues sauvegardées depuis settings/vehicleEditorStatic/staticRenderView.json. *(interne)* *(hook)* | 779 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onPreRender()` | Hook appelé chaque frame avant le rendu : dessine la grille (debugDrawer), le texte du mode de vue et les flèches d'axes de chaque vue ouverte. *(interne)* *(hook)* | 434 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onSerialize()` | Hook appelé avant un rechargement Lua : sauvegarde les réglages des vues dans le fichier de settings et renvoie nil. *(interne)* *(hook)* | 787 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.setCameraSpeed(s)` | Fixe le multiplicateur de vitesse de la caméra : camSpeedMult = s * (camFastSpeedMult - 1) + 1, avec camFastSpeedMult = 2.5. | 802 |

### Détail des paramètres

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.getMainRenderViewMouseRay()`

Renvoie le rayon de la souris dans la vue principale de la fenêtre survolée (rv:getUnprojectedRayPosDir sur les coordonnées de la souris converties dans le viewport), ou nil si aucune fenêtre n'est survolée ou si la souris n'est pas sur l'image.

- **renvoie** : any résultat de RenderView:getUnprojectedRayPosDir(x, y), utilisé par vePartTree comme (ok, position, direction) ; nil si hors vue

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.moveBackward(val)`

Définit l'intensité du déplacement caméra vers l'arrière (camMove.backward). Pensé pour une action de clavier.

- `val` (*number*) : valeur de l'entrée (0 relâché, positif appuyé)

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.moveForward(val)`

Définit l'intensité du déplacement caméra vers l'avant (camMove.forward).

- `val` (*number*) : valeur de l'entrée

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.moveLeft(val)`

Définit l'intensité du déplacement caméra vers la gauche (camMove.left).

- `val` (*number*) : valeur de l'entrée

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.moveRight(val)`

Définit l'intensité du déplacement caméra vers la droite (camMove.right).

- `val` (*number*) : valeur de l'entrée

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.onDeserialize(data)`

Fonction vide exportée sous le nom onDeserialize (probable faute de frappe pour onDeserialized, donc jamais appelée par le moteur).

- `data` (*any*) : non utilisé

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorGui(dt)`

Hook de l'éditeur appelé à chaque frame : lit les entrées caméra, puis pour chaque vue ouvre la fenêtre, crée les RenderViews au besoin (getOrCreateView, enterFocusObjectsMode) et dessine le contenu ; détruit les RenderViews d'une fenêtre fermée.

- `dt` (*number*) : delta de temps (s) utilisé pour le déplacement de la caméra

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorHeadlessChange(enabled, toolName)`

Hook de l'éditeur appelé quand un outil headless est activé ou désactivé. Pour l'éditeur statique, à la sortie : sauvegarde les réglages et détruit les RenderViews.

- `enabled` (*boolean*) : true à l'entrée dans l'outil, false à la sortie
- `toolName` (*string*) : nom de l'outil concerné

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.onSerialize()`

Hook appelé avant un rechargement Lua : sauvegarde les réglages des vues dans le fichier de settings et renvoie nil.

- **renvoie** : nil rien à restaurer

#### `editor_vehicleEditor_staticEditor_veStaticRenderView.setCameraSpeed(s)`

Fixe le multiplicateur de vitesse de la caméra : camSpeedMult = s * (camFastSpeedMult - 1) + 1, avec camFastSpeedMult = 2.5.

- `s` (*number*) : 0 pour la vitesse normale, 1 pour la vitesse rapide (2,5x)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawLine`, `drawText`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua`.*
